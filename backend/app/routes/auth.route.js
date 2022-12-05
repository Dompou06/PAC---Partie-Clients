const express = require('express')
const router = express.Router()

const { limiter, verifyAccessToken, authJwt } = require('../middlewares')
const authController = require('../controllers/auth.controller')
const userController = require('../controllers/user.controller')

router.post('/signup', 
    authController.signup)
router.post('/signin',
    limiter,
    authController.signin
)
router.post('/listpassword', 
    authController.listPassword,
    authController.sendMail
)
router.post('/newpassword', 
    authController.verifInListPassword,
    authController.newPassword
)
router.get('/me',
    [ 
        verifyAccessToken.checkAccessToken,
        authJwt.verifyTokens,
    ],
    authController.userMe
)
router.get('/profile',
    [ 
        verifyAccessToken.checkAccessToken,
        authJwt.verifyTokens,
    ],
    userController.profile
)
router.post('/update/profile',
    [ 
        verifyAccessToken.checkAccessToken,
        authJwt.verifyTokens,
    ],
    userController.updateProfile
)
router.get('/delete/profile',
    [
        verifyAccessToken.checkAccessToken,
        authJwt.verifyTokens
    ],
    userController.deleteProfile
)
router.get('/delete/user',
    [
        verifyAccessToken.checkAccessToken,
        authJwt.verifyTokens
    ],
    userController.deleteUser
)
router.get('/logout',
    [ 
        verifyAccessToken.checkAccessToken,
    ],
    authController.deleteToken
)

module.exports = router