module.exports = (sequelize2, Sequelize) => {
    const Varieties = sequelize2.define('varietes', {
        id: {
            allowNull: false,
            autoIncrement: true,
            primaryKey: true,
            type: Sequelize.INTEGER
        },
        id_article: {
            type: Sequelize.STRING,
            allowNull: false
        },
        variete: {
            type: Sequelize.STRING,
            allowNull: false
        },
    })

    return Varieties
}