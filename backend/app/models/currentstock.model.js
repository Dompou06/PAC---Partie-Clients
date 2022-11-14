module.exports = (sequelize1, Sequelize) => {
    const CuurentStock = sequelize1.define('currentstock', {
        id: {
            allowNull: false,
            autoIncrement: true,
            primaryKey: true,
            type: Sequelize.INTEGER
        },
        week: {
            type: Sequelize.STRING,
            allowNull: false,
        },
        departement: {
            type: Sequelize.STRING,
            allowNull: false,
        },
        id_prod: {
            type: Sequelize.STRING,
            allowNull: false
        },
        name: {
            type: Sequelize.STRING,
            allowNull: false
        },
        variety: {
            type: Sequelize.STRING,
            allowNull: true
        },
        agr: {
            type: Sequelize.STRING,
            allowNull: false
        },
        loc: {
            type: Sequelize.STRING,
            allowNull: false
        },
        four: {
            type: Sequelize.STRING,
            allowNull: false
        },
        mes: {
            type: Sequelize.STRING,
            allowNull: false
        },
        cond: {
            type: Sequelize.STRING,
            allowNull: true
        },
        pf: {
            type: Sequelize.STRING,
            allowNull: false,
        },
        quantity: {
            type: Sequelize.STRING,
            allowNull: true,
        },
        arrival: {
            type: Sequelize.DATE,
            allowNull: false
        },
        commande: {
            type: Sequelize.DATE,
            allowNull: true
        },
        stock_arrival: {
            type: Sequelize.STRING,
            allowNull: false
        },
        stock_current: {
            type: Sequelize.STRING,
            allowNull: false
        },
    })

    return CuurentStock
}