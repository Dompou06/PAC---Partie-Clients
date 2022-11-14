module.exports = (sequelize1, Sequelize) => {
    const Contact = sequelize1.define('contact', {
        id: {
            allowNull: false,
            autoIncrement: true,
            primaryKey: true,
            type: Sequelize.INTEGER
        },
        id_user: {
            type: Sequelize.INTEGER,
            allowNull: false
        },
        mobile: {
            type: Sequelize.STRING,
            allowNull: true
        },
        phone: {
            type: Sequelize.STRING,
            allowNull: true
        },
        fax: {
            type: Sequelize.STRING,
            allowNull: true
        },
        address: {
            type: Sequelize.STRING,
            allowNull: true
        },
        cp: {
            type: Sequelize.STRING,
            allowNull: true
        },
        city: {
            type: Sequelize.STRING,
            allowNull: true
        },
        state: {
            type: Sequelize.STRING,
            allowNull: true
        },
        society: {
            type: Sequelize.STRING,
            allowNull: true
        },
        billing_address: {
            type: Sequelize.STRING,
            allowNull: true
        },
        delivery_address: {
            type: Sequelize.STRING,
            allowNull: true
        }
    })

    return Contact
}