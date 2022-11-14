const checkAccessToken = (req, res, next) => {
    res.header(
        'Access-Control-Allow-Headers',
        'x-access-token, Origin, Content-Type, Accept'
    )
    next()
}

const verifyAccessToken = {
    checkAccessToken: checkAccessToken
}

module.exports = verifyAccessToken