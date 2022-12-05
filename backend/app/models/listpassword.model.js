module.exports = (sequelize1, Sequelize) => {
    const listPassword = sequelize1.define('listpassword', {
        id: {
            allowNull: false,
            autoIncrement: true,
            primaryKey: true,
            type: Sequelize.INTEGER
        },
        email: {
            type: Sequelize.STRING,
            allowNull: false
        }       
    })

    return listPassword
}