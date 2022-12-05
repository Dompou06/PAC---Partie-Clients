module.exports = (sequelize2, Sequelize) => {
    const Product = sequelize2.define('produits', {
        id_prod: {
            allowNull: false,
            autoIncrement: true,
            primaryKey: true,
            type: Sequelize.INTEGER
        },
        name_prod: {
            type: Sequelize.STRING,
            allowNull: false,
            unique: true
        },
        variety: {
            type: Sequelize.STRING,
            allowNull: false
        },
        id_family: {
            type: Sequelize.INTEGER,
            allowNull: false,
        },
        id_category: {
            type: Sequelize.INTEGER,
            allowNull: true,
        },
        cat_prod: {
            type: Sequelize.STRING,
            allowNull: false,
        },
        stock: {
            type: Sequelize.INTEGER,
            allowNull: false
        },
    })

    return Product
}