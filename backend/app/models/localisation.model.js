module.exports = (sequelize2, Sequelize) => {
    const Localisation = sequelize2.define('localisations', {
        id: {
            allowNull: false,
            autoIncrement: true,
            primaryKey: true,
            type: Sequelize.INTEGER
        },
        name: {
            type: Sequelize.STRING,
            allowNull: false
        },
        departement: {
            type: Sequelize.STRING,
            allowNull: true
        },
        situation: {
            type: Sequelize.INTEGER,
            allowNull: false
        },
    })

    return Localisation
}