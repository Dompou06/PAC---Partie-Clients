module.exports = (sequelize2, Sequelize) => {
    const Mesure = sequelize2.define('mesures', {
        id: {
            allowNull: false,
            autoIncrement: true,
            primaryKey: true,
            type: Sequelize.INTEGER
        },
        unit: {
            type: Sequelize.STRING,
            allowNull: false,
            unique: true
        },
        rayon: {
            type: Sequelize.STRING,
            allowNull: true
        },
        type: {
            type: Sequelize.STRING,
            allowNull: true
        },
    })

    return Mesure
}