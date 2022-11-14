module.exports = (sequelize2, Sequelize) => {
    const Stock = sequelize2.define('stocks', {
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
        user_id: {
            type: Sequelize.STRING,
            allowNull: false,
        },
        id_prod: {
            type: Sequelize.STRING || Sequelize.JSONB,
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
        description: {
            type: Sequelize.STRING,
            allowNull: true
        },
        image: {
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
        marge: {
            type: Sequelize.STRING,
            defaultValue: '15',
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
        clone: {
            type: Sequelize.STRING,
            allowNull: true
        },
    })

    return Stock
}