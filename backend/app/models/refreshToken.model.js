const { v4: uuidv4 } = require('uuid')
const config = require('../config/auth.config')

module.exports = (sequelize1, Sequelize) => {
    const RefreshToken = sequelize1.define('refreshToken', {
        token: {
            type: Sequelize.STRING,
        },
        userId: {
            type: Sequelize.STRING,
            unique: true
        },
        expiryDate: {
            type: Sequelize.DATE,
        },
    })
    //Création d'un refreshToken
    RefreshToken.createToken = async function (user) {
        // console.log('user', user)
        let expiredAt = new Date()
        //Si l'utilisateur a demadé de se souvenir de lui, on utilise l'expiration Rememberme pour le refreshToken
        if(user.remenberMe) {
            //  console.log('expire')
            expiredAt.setSeconds(expiredAt.getSeconds() + config.jwtRefreshRemenber)
        } else {
            //Sinon, on utilise l'expiration normale du refreshTokenn
            expiredAt.setSeconds(expiredAt.getSeconds() + config.jwtRefreshExpiration)
        }
        let _token = uuidv4()
        //On crée le refreshToken
        let refreshToken = await this.create({
            token: _token,
            userId: user.user,
            expiryDate: expiredAt.getTime(),
        })
        return refreshToken.token
    }
    
    //Vérification de l'expiration du refreshToken
    RefreshToken.verifyExpiration = (token) => {
        return token.expiryDate.getTime() < new Date().getTime()
    }
    return RefreshToken
}