module.exports = (sequelize2, Sequelize) => {
    const Rayon = sequelize2.define('rayons', {
        id: {
            allowNull: false,
            autoIncrement: true,
            primaryKey: true,
            type: Sequelize.INTEGER
        },
        cat: {
            type: Sequelize.STRING,
            allowNull: false,
            unique: true
        },
        category_description: {
            type: Sequelize.STRING,
            allowNull: false
        },
        cat_description: {
            type: Sequelize.STRING,
            allowNull: false
        },
        products: {
            type: Sequelize.STRING,
            allowNull: false
        },
        family_abbreviation: {
            type: Sequelize.INTEGER,
            allowNull: false
        },
        category_abbreviation: {
            type: Sequelize.INTEGER,
            allowNull: false
        },
        family_sass: {
            type: Sequelize.STRING,
            allowNull: false
        },
        category_text: {
            type: Sequelize.STRING,
            allowNull: true
        }
    })

    return Rayon
}