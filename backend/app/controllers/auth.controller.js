require('dotenv').config()
//const mysqldump = require('mysqldump')
const httpStatus = require('http-status')
const Sequelize = require('sequelize')
const Op = Sequelize.Op

const jwt = require('jsonwebtoken')
const bcrypt = require('bcrypt')
const nodemailer = require('nodemailer')
//const fs = require('fs')

const crypted = require('../utils/crypt')
const db = require('../models')
const config = require('../config/auth.config')

const User = db.user
const Contact = db.contact
const Role = db.role
const RefreshToken = db.refreshToken
const ListPassword = db.listpassword

exports.signup = (req, res) => {
    // console.log('req.body', req.body)
    const saltRounds = 10
    const newUser = {
        firstname: crypted.encrypt(req.body.firstname),
        lastname: crypted.encrypt(req.body.lastname),
        email: crypted.encrypt(req.body.email),
        password: bcrypt.hashSync(req.body.password, saltRounds)
    }
    User.create(newUser)
        .then(user => { 
            const accessToken = jwt.sign({ id: user.id }, config.secret, {
                expiresIn: config.jwtExpiration
            })
            const remenberMe = false
            const dataRefresh = {
                user: user.id,
                remenberMe: remenberMe
            }
            RefreshToken.createToken(dataRefresh)
                .then(refreshToken => {
                    const token = `${refreshToken}${accessToken}`
                    //L'utilisateur est un customer à l'enregistrement
                    user.setRoles([1]).then(() => {
                        res.status(httpStatus.OK).send({ 
                            token: token,
                            firstname: req.body.firstname,
                            lastname: req.body.lastname,
                            roles: [1],
                            message: 'Utilisateur enregistré'
                        })
                    })        
                    if(req.body.society != '') {
                        const newUserSociety = {
                            id_user: user.id,
                            society: crypted.encrypted(req.body.society)
                        }
                        Contact.create(newUserSociety)
                    }
                })
                .catch(err => {
                    res.status(httpStatus.INTERNAL_SERVER_ERROR).send({ message: 'Inscription impossible' || err.message })
                })
        })
        .catch(err => {
            res.status(httpStatus.INTERNAL_SERVER_ERROR).send({ message: err.message })
        })

}
exports.signin = (req, res) => {
    // console.log('req', req.body)
    const remenberMe = req.body.rememberme
    //console.log('reqremember', remenberMe)
    const email = crypted.encrypt(req.body.email)
    User.findOne({
        where: {
            email: email
        },
        attributes: ['id', 'password', 'firstname', 'lastname']
    })
        .then(user => {
            if(!user) {
                return res.status(httpStatus.NOT_FOUND).send({ message: 'Utilisateur inconnu' }) 
            }
            const passwordIsValid = bcrypt.compare(req.body.password, user.password)
            if(!passwordIsValid) {
                return res.status(httpStatus.UNAUTHORIZED).send({ message: 'Mot de passe invalide' })
            }
            const accessToken = jwt.sign({ id: user.id }, config.secret, {
                expiresIn: config.jwtExpiration
            })
            const dataRefresh = {
                user: user.id,
                remenberMe: remenberMe
            }
            RefreshToken.createToken(dataRefresh)
                .then(refreshToken => {
                    const token = `${refreshToken}${accessToken}`
                    const authorities = []
                    user.getRoles()
                        .then(roles => {
                            //console.log('roles', roles[1])
                            for (let i = 0; i < roles.length; i++) {
                                authorities.push(roles[i].name) 
                            }
                            //console.log('roles', authorities)
                            res.status(httpStatus.OK).send({
                                firstname: crypted.decrypt(user.firstname),
                                lastname: crypted.decrypt(user.lastname),
                                roles: authorities,
                                token: token
                            })
                        })
                        .catch(err => {
                            res.status(httpStatus.INTERNAL_SERVER_ERROR).send({ message: err.message })
                        })
                })
                .catch(err => {
                    res.status(httpStatus.INTERNAL_SERVER_ERROR).send({ message: err.message })
                })
        })
        .catch(err => {
            res.status(httpStatus.INTERNAL_SERVER_ERROR).send({ message: err.message })
        })
}
exports.userMe = (req, res) => {
    // console.log ('req', req.token.token)
    const token = req.token.token
    const accessToken = token.substring(36)
    const decoded = jwt.verify(accessToken, config.secret)
    const userid = decoded.id
    //console.log('userid', userid)
    User.findByPk(userid, {
        include: Role       
    })
        .then(response => {
            const firstname = crypted.decrypt(response.firstname)
            const lastname = crypted.decrypt(response.lastname)  
            const email = crypted.decrypt(response.email)  
            const authorities = []
            for (let i = 0; i < response.roles.length; i++) {
                authorities.push(response.roles[i].name) 
            }           
            //console.log('user', firstname + lastname + authorities)
            res.status(httpStatus.OK).send({
                firstname: firstname,
                lastname: lastname,
                email: email,
                roles: authorities,
                token: token
            })
        })
        .catch(err => {
            res.status(httpStatus.INTERNAL_SERVER_ERROR).send({ message: err.message })
        })
}
exports.listPassword = (req, res, next) => {
    const email = crypted.encrypt(req.body.email)
    //console.log('email', req.body)
    User.findOne({
        where: {
            email: email
        }
    })
        .then(response => {
            if(response) {
                const newRequestPassword = {
                    email: email
                }   
                ListPassword.create(newRequestPassword)
                    .then(result => {
                        if(!result) {
                            return res.status(httpStatus.UNAUTHORIZED).json({ message: 'Requête refusée' }) 
                        }
                        next()
                    })
                    .catch(err => {
                        res.status(httpStatus.NOT_FOUND).send({
                            message: err.message || 'Requête erronnée'
                        })
                    })
            } else {
                return res.status(httpStatus.UNAUTHORIZED).json({ message: 'Email erronné' }) 
            }
        })
}
exports.verifInListPassword = (req, res, next) => {
    const email = crypted.encrypt(req.body.email)
    // console.log('email', req.body.email)
    const yesterday = new Date(new Date().setDate(new Date().getDate()-1))
    // console.log('yesterday', yesterday.toISOString().substr(0, 19).replace('T', ' '))
    const remove = yesterday.toISOString().substr(0, 19).replace('T', ' ')
    ListPassword.destroy({
        where: {
            createdAt: {
                [Op.lte]: remove,
            },
        }
    })
        .then(() => {
            ListPassword.findOne({
                where: {
                    email: email
                },
                attributes: ['id']
            }).then(response => {
                if(response) {
                    // console.log('response', response.id)
                    ListPassword.destroy({
                        where: {
                            email: email
                        }
                    })
                        .then(() => {
                            next()
                        })
                } else {
                    // console.log('noresponse')
                    return res.status(httpStatus.UNAUTHORIZED).send({ message: 'Requête refusée' })
                }
            })
                .catch(() => {

                })
        })
}
exports.newPassword = (req, res) => {
    //console.log('email', req.body.email)
    // console.log('password', req.body.password)
    const saltRounds = 10
    const email = crypted.encrypt(req.body.email)
    const password = bcrypt.hashSync(req.body.password, saltRounds)
    User.update({ password : password }, {
        where: {
            email: email
        },
    }).then(() => {
        res.status(httpStatus.OK).send({ message: 'SignIn' })
    })
        .catch(err => {
            res.status(httpStatus.INTERNAL_SERVER_ERROR).send({ message: err.message })
        })
}
exports.sendMail = (req, res) => {
    //console.log('to', req.body)
    const to = req.body.email
    const subject = req.body.subject
    const text = req.body.text
    const html = req.body.html
    const attachments = req.body.attachments
    let transporter = nodemailer.createTransport({
        host: process.env.MAILHOST,
        port: process.env.MAILPORT,
        auth: {
            user: process.env.USER,
            pass: process.env.SECRET
        }
    })
    async function run() {
        await transporter.sendMail({
            from: `${process.env.NAME} <${process.env.USER}`,
            to: to,
            subject: subject,
            text: text,
            html: html,
            attachments: attachments
        })
        // console.log('sendResult', sendResult)
    }
    run()
        // eslint-disable-next-line no-unused-vars
        .then(result => {
            // console.log('result', result)
            res.status(httpStatus.OK).send({
                response: 'Un email vous a été envoyé'
            })
        })
        .catch(err => {
            res.status(httpStatus.NOT_FOUND).send({
                message: err.message || 'Envoi annulé'})
        })
}
exports.deleteToken = (req, res) => {
    const token = req.headers['x-access-token']
    //console.log('token', token)
    const refreshToken = token.substring(0, 36)
    RefreshToken.destroy({ where: { token: refreshToken } })
    res.status(httpStatus.OK).json({
        message: 'destroy',
    })
    return 
}