module.exports = (sequelize1, Sequelize) => {
    const UserRole = sequelize1.define('user_roles', {
        id: {
            allowNull: false,
            autoIncrement: true,
            primaryKey: true,
            type: Sequelize.INTEGER
        },
        roleId: {
            type: Sequelize.STRING,
            allowNull: false
        },
        userId: {
            type: Sequelize.INTEGER,
            allowNull: false
        },
    })

    return UserRole
}