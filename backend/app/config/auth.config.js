require('dotenv').config()

module.exports = {
    secret: process.env.TOKEN,
    //En test
    //jwtExpiration: 60,          // 1 minute
    //jwtRefreshExpiration: 120,  // 2 minutes
    // jwtRefreshRemenber: 180,   // 3 minutes
    //En production
    jwtExpiration: 3600,           // 1 hour
    jwtRefreshExpiration: 86400,   // 24 hours
    jwtRefreshRemenber: 604800,   // 7 jours
}