const jwt = require('jsonwebtoken')
const httpStatus = require('http-status')

const config = require('../config/auth.config.js')
const db = require('../models')
const User = db.user
const RefreshToken = db.refreshToken

const verifyTokens = (req, res, next) => {   
    //console.log('tokenis', req.headers['x-access-token'])
    //console.log('token', req.body.headers['x-access-token'])
    let token = ''
    if(req.headers['x-access-token']) {
        token = req.headers['x-access-token']
    } else if(req.body.headers['x-access-token']) {
        token = req.body.headers['x-access-token']
    }
    else {     
        return res.status(httpStatus.FORBIDDEN).send({
            message: 'Accès interdit'
        })
        
    }
    const refreshToken = token.substring(0, 36)
    const accessToken = token.substring(36)

    jwt.verify(accessToken, config.secret, (err, result) => {
        if(!result) {
            // console.log('noresult')
            if(err.name === 'TokenExpiredError') {
                //Si l'accessToken a expiré 
                RefreshToken.findOne({ 
                    where: { 
                        token: refreshToken
                    }, 
                    attributes: ['userId', 'expiryDate'] 
                })
                    .then(response => {
                        //console.log('response', response)
                        //On cherche l'expiration du refreshToken
                        if(response.expiryDate < new Date()) {
                            //Si expiré, on le supprime
                            RefreshToken.destroy({ where: { userId: response.userId } })
                                .then(() => {
                                    return res.status(httpStatus.UNAUTHORIZED).json({
                                        message: 'Merci de vous reconnecter'
                                    })
                                })
                                .catch(err => {    
                                    return res.status(httpStatus.INTERNAL_SERVER_ERROR).json({
                                        message: 'Connection invalide' || err
                                    })
                                })
                        } else {
                            //Le refreshToken n'a pas expiré
                            //On crée un nouvel accessToken
                            const accessToken = jwt.sign({ id: response.userId }, config.secret, {
                                expiresIn: config.jwtExpiration
                            })
                            //On crée un nouveau token
                            const newtoken = `${refreshToken}${accessToken}`
                            req.token = {
                                token: newtoken,
                                //accessToken: accessToken
                            }
                            next()
                        }                    
                    })
                    .catch(err => {
                    //Le refreshToken n'existe pas ou plus dans la bd
                    //console.log('err', err.name)
                        return res.status(httpStatus.FORBIDDEN).json({
                            message: 'Connection invalide' || err
                        })
                    })

            } else {
                //Si ce n'est pas une erreur expiration de l'accessToken
                return res.status(httpStatus.INTERNAL_SERVER_ERROR).json({
                    message: 'Connection invalide' || err
                })                
            }
        } else {
            // console.log('result', result)

            //L'accessToken est valide
            req.token = {
                token: token
            }
            next()
        }
    })
}

const isManager = (req, res, next) => {
    //console.log('tokenis', req.body.headers['x-access-token'])
    const token = req.body.headers['x-access-token']
    const refreshToken = token.substring(0, 36)
    const accessToken = token.substring(36)
    jwt.verify(accessToken, config.secret, (err, result) => {
        if(!result) {
            // console.log('noresult')
            if(err.name === 'TokenExpiredError') {
            //Si l'accessToken a expiré
                RefreshToken.findOne({ 
                    where: { 
                        token: refreshToken
                    }, 
                    attributes: ['userId', 'expiryDate'] 
                }).then(response => {
                    // console.log('response', response)
                    //On cherche l'expiration du refreshToken
                    if(response.expiryDate < new Date()) {
                    //Si expiré, on le supprime
                        RefreshToken.destroy({ where: { userId: response.userId } })
                            .then(() => {
                                return res.status(httpStatus.UNAUTHORIZED).json({
                                    message: 'Merci de vous reconnecter'
                                })
                            })
                            .catch(err => {    
                                return res.status(httpStatus.INTERNAL_SERVER_ERROR).json({
                                    message: 'Connection invalide' || err
                                })
                            })
                    } else {
                    //Le refreshToken n'a pas expiré
                    //On crée un nouvel accessToken
                        const accessToken = jwt.sign({ id: response.userId }, config.secret, {
                            expiresIn: config.jwtExpiration
                        })
                        //On crée un nouveau token
                        const newtoken = `${refreshToken}${accessToken}`
                        req.token = {
                            token: newtoken,
                        //accessToken: accessToken
                        }
                        //On vérifie que c'est bien un manager
                        User.findByPk(response.userId).then(user => {
                            user.getRoles().then(roles => {
                                //console.log('roles', roles.length)
                                let right = ''
                                for (let i = 0; i < roles.length; i++) {
                                    //  console.log('roles', roles[i].name)
                                    if (roles[i].name === 'Manager') {
                                        //  console.log('roles', roles[i].name)
                                        right = 'true'
                                        //  
                                        //return
                                    } 
                                    else {
                                        // console.log('noroles')
                                        right = 'false'
                                        /* */
                                    }
                                }
                                // console.log('right', right)
                                if(right === 'true') {
                                    next()
                                } else {
                                    return res.status(httpStatus.UNAUTHORIZED).json({
                                        message: 'Vous semblez ne pas avoir les droits pour cette action'
                                    })
                                }

                            })
                                .catch(err => {
                                    console.log('err', err)
                                })
                        })
                    }                    
                })
                    .catch(err => {
                        //Le refreshToken n'existe pas ou plus dans la bd
                        //console.log('err', err.name)
                        return res.status(httpStatus.FORBIDDEN).json({
                            message: 'Connection invalide' || err
                        })
                    })
            }
        } else {
            //  console.log('result', result)
            //On vérifie que c'est bien un manager
            User.findByPk(result.id).then(user => {
                user.getRoles().then(roles => {
                    //console.log('roles', roles)
                    let right = ''
                    for (let i = 0; i < roles.length; i++) {
                        if (roles[i].name === 'Manager') {
                            //console.log('roles', roles[i].name)
                            right = 'true'
                            //  
                            //return
                        } 
                        else {
                            // console.log('noroles')
                            right = 'false'
                        }
                    }
                                
                    if(right === 'true') {
                        next()
                    } else {
                        return res.status(httpStatus.UNAUTHORIZED).json({
                            message: 'Vous semblez ne pas avoir les droits pour cette action'
                        })
                    }
                })
                    .catch(err => {
                        console.log('err', err)
                    })
            })
        }
    })
    /*  const decoded = jwt.verify(accessToken, config.secret)
   // console.log('decoded', decoded)
    const userid = decoded.id
    //console.log('userid', userid)
    User.findByPk(userid).then(user => {
        user.getRoles().then(roles => {
            //console.log('roles', roles)
            for (let i = 0; i < roles.length; i++) {
                if (roles[i].name === 'Manager') {
                    //console.log('roles', roles[i].name)
                    next()
                    //return
                }
            }
        })
            .catch(err => {
                console.log('err', err)
            })
    })*/
}

const isAdmin = (req, res, next) => {
    User.findByPk(req.userId).then(user => {
        user.getRoles().then(roles => {
            for (let i = 0; i < roles.length; i++) {
                if (roles[i].name === 'Administrateur') {
                    next()
                    return
                }
            }
            res.status(httpStatus.UNAUTHORIZED).send({
                message: 'Votre autorisation n\'est pas valide'
            })
            return
        })
    })
}
const isModerator = (req, res, next) => {
    User.findByPk(req.userId).then(user => {
        user.getRoles().then(roles => {
            for (let i = 0; i < roles.length; i++) {
                if (roles[i].name === 'Modérateur') {
                    next()
                    return
                }
            }
            res.status(httpStatus.UNAUTHORIZED).send({
                message: 'Votre autorisation n\'est pas valide'
            })
        })
    })
}
const isModeratorOrAdmin = (req, res, next) => {
    User.findByPk(req.userId).then(user => {
        user.getRoles().then(roles => {
            for (let i = 0; i < roles.length; i++) {
                if (roles[i].name === 'Modérateur') {
                    next()
                    return
                }
                if (roles[i].name === 'Administrateur') {
                    next()
                    return
                }
            }
            res.status(httpStatus.UNAUTHORIZED).send({
                message: 'Votre autorisation n\'est pas valide'
            })
        })
    })
}

const authJwt = {
    verifyTokens: verifyTokens,
    isManager: isManager,
    isAdmin: isAdmin,
    isModerator: isModerator,
    isModeratorOrAdmin: isModeratorOrAdmin
}

module.exports = authJwt