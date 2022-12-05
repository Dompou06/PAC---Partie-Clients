const Sequelize = require('sequelize')
const dbConfig = require('../config/db.config.js')

const sequelize1 = new Sequelize(dbConfig.DB1, dbConfig.USER, dbConfig.PASSWORD, {
    host: dbConfig.HOST,
    dialect: dbConfig.dialect,
    operatorsAliases: 0,
    pool: {
        max: dbConfig.pool.max,
        min: dbConfig.pool.min,
        acquire: dbConfig.pool.acquire,
        idle: dbConfig.pool.idle
    },
    //Non affichage des requêtes SQL dans le terminal
    logging: false
})

const sequelize2 = new Sequelize(dbConfig.DB2, dbConfig.USER, dbConfig.PASSWORD, {
    host: dbConfig.HOST,
    dialect: dbConfig.dialect,
    operatorsAliases: 0,
    pool: {
        max: dbConfig.pool.max,
        min: dbConfig.pool.min,
        acquire: dbConfig.pool.acquire,
        idle: dbConfig.pool.idle
    },
    //Non affichage des requêtes SQL dans le terminal
    logging: false
})

const db = {}

db.Sequelize = Sequelize
db.sequelize1 = sequelize1
db.sequelize2 = sequelize2

db.user = require('./user.model.js')(sequelize1, Sequelize)
db.contact = require('./contact.model.js')(sequelize1, Sequelize)
db.role = require('./role.model.js')(sequelize1, Sequelize)
db.userRole = require('./userrole.model.js')(sequelize1, Sequelize)
db.refreshToken = require('./refreshToken.model.js')(sequelize1, Sequelize)
db.listpassword = require('./listpassword.model.js')(sequelize1, Sequelize)
db.product = require('./product.model.js')(sequelize2, Sequelize)
db.currentStock = require('./currentstock.model.js')(sequelize1, Sequelize)
db.stock = require('./stock.model.js')(sequelize2, Sequelize)
db.rayon = require('./rayons.model.js')(sequelize2, Sequelize)
db.family = require('./families.model.js')(sequelize2, Sequelize)
db.varieties = require('./varieties.model.js')(sequelize2, Sequelize)
db.localisation = require('./localisation.model.js')(sequelize2, Sequelize)
db.Mesure = require('./mesure.model.js')(sequelize2, Sequelize)
db.Provider = require('./provider.model.js')(sequelize2, Sequelize)

db.role.belongsToMany(db.user, {
    through: 'user_roles',
    foreignKey: 'roleId',
    otherKey: 'userId'
})
db.user.belongsToMany(db.role, {
    through: 'user_roles',
    foreignKey: 'userId',
    otherKey: 'roleId'
})

db.contact.belongsTo(db.user, {
    foreignKey: 'id_user', 
    targetKey: 'id'
})
db.user.hasOne(db.contact, {
    foreignKey: 'id_user', 
    targetKey: 'id'
})

db.refreshToken.belongsTo(db.user, {
    foreignKey: 'userId', 
    targetKey: 'id'
})
db.user.hasOne(db.refreshToken, {
    foreignKey: 'userId', 
    targetKey: 'id'
})
module.exports = db

