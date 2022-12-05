const express = require('express')
const router = express.Router()

const { verifyAccessToken, authJwt } = require('../middlewares')
const userController = require('../controllers/user.controller')

router.get('/profile',
    [
        verifyAccessToken.checkAccessToken,
        authJwt.verifyTokens
    ],
    userController.profile
)
router.get('/user',
    [
        verifyAccessToken.checkAccessToken,
        authJwt.verifyTokens
    ],
    userController.userBoard
)
/*router.get('/mod',
    [
        verifyAccessToken.checkAccessToken,
        authJwt.verifyTokens,
        authJwt.isModerator
    ],
    userController.moderatorBoard
)
router.get('/admin',
    [
        verifyAccessToken.checkAccessToken,
        authJwt.verifyTokens,
        authJwt.isAdmin
    ],
    userController.adminBoard
)*/

module.exports = router