require('dotenv').config()
const httpStatus = require('http-status')
const jwt = require('jsonwebtoken')

const crypted = require('../utils/crypt')
const config = require('../config/auth.config')
const db = require('../models')

const User = db.user
const Contact = db.contact
const RefreshToken = db.refreshToken

exports.profile = (req, res) => {
    // console.log('req', req)
    //console.log('req.token', req.token)
    const token = req.token.token
    const accessToken = token.substring(36)
    const decoded = jwt.verify(accessToken, config.secret)
    const userid = decoded.id

    Contact.findOne({ where: { id_user: userid }})
        .then(profile => {
            if(profile) {
                const userObject = {
                    //mobile: '0613505113',
                    mobile: crypted.decrypted(profile.mobile),
                    phone: crypted.decrypted(profile.phone),
                    fax: crypted.decrypted(profile.fax),
                    address: crypted.decrypted(profile.address),
                    cp: crypted.decrypted(profile.cp),
                    city: crypted.decrypted(profile.city),
                    state: crypted.decrypted(profile.state),
                    society: crypted.decrypted(profile.society),
                    billing_address: crypted.decrypted(profile.billing_address),
                    delivery_address: crypted.decrypted(profile.delivery_address),
                    token: token
                }
                //console.log('userObject', userObject)
                res.status(httpStatus.OK).send({
                    userObject: userObject
                })
            }
        })
        .catch(err => {
            res.status(httpStatus.INTERNAL_SERVER_ERROR).send({ message: err.message })
        })  
}
exports.updateProfile = (req, res) => {
    const data = req.body.credentials
    let userId = ''
    if(req.token) {
        //L'accesstoken a expiré mais pas le refreshtoken
        //On reçoit un nouveau token
        const token = req.token.token
        // console.log('token', req.token.token)
        const accessToken = token.substring(36)
        const decoded = jwt.verify(accessToken, config.secret)
        userId = decoded.id
    } else {
        const token = req.body.headers['x-access-token']
        const accessToken = token.substring(36)
        const decoded = jwt.verify(accessToken, config.secret)
        userId = decoded.id
    }
    if(data.check) {
        //console.log('check')
        //La partie User a été modifiée
        const user = data.user
        User.update({
            firstname: crypted.encrypt(user.firstname),
            lastname: crypted.encrypt(user.lastname),
            email: crypted.encrypt(user.email)
        }, 
        { where: { id: userId }})
    }
    //On vérifie que le contact existe
    Contact.findOne({ where: { id_user: userId }})
        .then(profile => {
            //Si ce n'est pas le cas, on le crée
            if(!profile) {
                const newContatct = {
                    id_user: userId
                }
                Contact.create(newContatct)
            }         
            // On modifie le contact
            const contact = data.contact
            Contact.update({
                mobile: crypted.encrypted(contact.mobile),
                phone: crypted.encrypted(contact.phone),
                fax: crypted.encrypted(contact.fax),
                address: crypted.encrypted(contact.address),
                cp: crypted.encrypted(contact.cp),
                city: crypted.encrypted(contact.city),
                state: crypted.encrypted(contact.state),
                society: crypted.encrypted(contact.society),
                billing_address: crypted.encrypted(contact.billing_address),
                delivery_address: crypted.encrypted(contact.delivery_address)
            }, 
            { where: { id_user: userId }})
                .then(() => {
                    User.findByPk(userId, {
                        include: Contact       
                    })
                        .then(user => {
                            //console.log('user', user.contact.mobile)
                            const newProfile = {
                                firstname: crypted.decrypt(user.firstname),
                                lastname: crypted.decrypt(user.lastname),
                                email: crypted.decrypt(user.email),
                                mobile: crypted.decrypted(user.contact.mobile),
                                phone: crypted.decrypted(user.contact.phone),
                                fax: crypted.decrypted(user.contact.fax),
                                address: crypted.decrypted(user.contact.address),
                                cp: crypted.decrypted(user.contact.cp),
                                city: crypted.decrypted(user.contact.city),
                                state: crypted.decrypted(user.contact.state),
                                society: crypted.decrypted(user.contact.society),
                                billing_address: crypted.decrypted(user.contact.billing_address),
                                delivery_address: crypted.decrypted(user.contact.delivery_address),
                                token: req.token.token
                            }
                            //console.log('profile', newProfile)
                            res.status(httpStatus.OK).send({
                                newProfile
                            })
                        })
                        .catch(err => {
                            res.status(httpStatus.INTERNAL_SERVER_ERROR).send({ message: err.message })
                        })
                })
        })
}
exports.deleteProfile = (req, res) => {
    let userId = ''
    if(req.token) {
        //L'accesstoken a expiré mais pas le refreshtoken
        //On reçoit un nouveau token
        const token = req.token.token
        //console.log('token', req.token.token)
        const accessToken = token.substring(36)
        const decoded = jwt.verify(accessToken, config.secret)
        userId = decoded.id
    } else {
        const token = req.body.headers['x-access-token']
        const accessToken = token.substring(36)
        const decoded = jwt.verify(accessToken, config.secret)
        userId = decoded.id
    }
    Contact.destroy({ where: { id_user: userId } })
        .then(() => {
            if(req.token) {
                //L'accesstoken a expiré mais pas le refreshtoken
                //On reçoit un nouveau token
                const token = req.token.token
                res.status(httpStatus.OK).send({
                    token
                })
            } else {
                const token = req.body.headers['x-access-token']
                res.status(httpStatus.OK).send({
                    token
                })
            }
        })
        .catch(err => {
            res.status(httpStatus.INTERNAL_SERVER_ERROR).send({ message: err.message })
        })
}
exports.deleteUser = (req, res) => {
    let userId = ''
    let token = ''
    if(req.token) {
        //L'accesstoken a expiré mais pas le refreshtoken
        //On reçoit un nouveau token
        token = req.token.token
        // console.log('token', req.token.token)
        const accessToken = token.substring(36)
        const decoded = jwt.verify(accessToken, config.secret)
        userId = decoded.id
    } else {
        token = req.body.headers['x-access-token']
        const accessToken = token.substring(36)
        const decoded = jwt.verify(accessToken, config.secret)
        userId = decoded.id
    }
    Contact.destroy({ where: { id_user: userId } })
        .then(() => {
            User.destroy({ where: { id: userId } })
                .then(() => {
                    const refreshToken = token.substring(0, 36)
                    RefreshToken.destroy({ where: { token: refreshToken } })
                        .then(() => {
                            res.status(httpStatus.OK).send({
                                message: 'Utilisateur supprimé'
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
exports.userBoard = (req, res) => { 
    res.status(httpStatus.OK).send('Contenu Customer')
}
exports.adminBoard = (req, res) => {
    res.status(httpStatus.OK).send('Contenu Admin')
}
exports.moderatorBoard = (req, res) => {
    res.status(httpStatus.ok).send('Contenu Modérateur')
}