module.exports = (sequelize2, Sequelize) => {
    const Family = sequelize2.define('families', {
        id: {
            allowNull: false,
            autoIncrement: true,
            primaryKey: true,
            type: Sequelize.INTEGER
        },
        family_description: {
            type: Sequelize.STRING,
            allowNull: false,
            unique: true
        },
        family_abbreviation: {
            type: Sequelize.STRING,
            allowNull: false,
            unique: true
        },
        family_sass: {
            type: Sequelize.STRING,
            allowNull: false,
            unique: true
        },
        family_text: {
            type: Sequelize.STRING,
            allowNull: true,
        },
    })

    return Family
}