module.exports = (sequelize2, Sequelize) => {
    const Provider = sequelize2.define('fournisseurs', {
        id: {
            allowNull: false,
            autoIncrement: true,
            primaryKey: true,
            type: Sequelize.INTEGER
        },
        rayon: {
            type: Sequelize.STRING,
            allowNull: false,
        },
        societe: {
            type: Sequelize.STRING,
            allowNull: true,
        },
        tel: {
            type: Sequelize.STRING,
            allowNull: true
        },
        mobile: {
            type: Sequelize.STRING,
            allowNull: true
        },
        fax: {
            type: Sequelize.STRING,
            allowNull: true
        },
        email: {
            type: Sequelize.STRING,
            allowNull: true
        },
        site: {
            type: Sequelize.STRING,
            allowNull: true
        },
        adresse: {
            type: Sequelize.STRING,
            allowNull: true
        },
        cp: {
            type: Sequelize.STRING,
            allowNull: true
        },
        ville: {
            type: Sequelize.STRING,
            allowNull: true
        },
        pays: {
            type: Sequelize.STRING,
            allowNull: true
        },
        activite: {
            type: Sequelize.STRING,
            allowNull: true
        },
        fjuridique: {
            type: Sequelize.STRING,
            allowNull: true
        },
        siret: {
            type: Sequelize.STRING,
            allowNull: true
        },
        nexterne: {
            type: Sequelize.STRING,
            allowNull: true
        },
        tva: {
            type: Sequelize.STRING,
            allowNull: true
        },
        ape: {
            type: Sequelize.STRING,
            allowNull: true
        },
        banque: {
            type: Sequelize.STRING,
            allowNull: true
        },
        guichet: {
            type: Sequelize.STRING,
            allowNull: true
        },
        compte: {
            type: Sequelize.STRING,
            allowNull: true
        },
        rib: {
            type: Sequelize.STRING,
            allowNull: true
        },
        iban: {
            type: Sequelize.STRING,
            allowNull: true
        },
        domiciliation: {
            type: Sequelize.STRING,
            allowNull: true
        },
        bic: {
            type: Sequelize.STRING,
            allowNull: true
        },
        autre: {
            type: Sequelize.STRING,
            allowNull: true
        },
        nom_rc: {
            type: Sequelize.STRING,
            allowNull: true
        },
        nom_cc: {
            type: Sequelize.STRING,
            allowNull: true
        },
        nom_ccom: {
            type: Sequelize.STRING,
            allowNull: true
        },
        nom_ac: {
            type: Sequelize.STRING,
            allowNull: true
        },
        prenom_rc: {
            type: Sequelize.STRING,
            allowNull: true
        },
        prenom_cc: {
            type: Sequelize.STRING,
            allowNull: true
        },
        prenom_ccom: {
            type: Sequelize.STRING,
            allowNull: true
        },
        prenom_ac: {
            type: Sequelize.STRING,
            allowNull: true
        },
        tel_rc: {
            type: Sequelize.STRING,
            allowNull: true
        },
        tel_cc: {
            type: Sequelize.STRING,
            allowNull: true
        },
        tel_ccom: {
            type: Sequelize.STRING,
            allowNull: true
        },
        tel_ac: {
            type: Sequelize.STRING,
            allowNull: true
        },
        mobile_rc: {
            type: Sequelize.STRING,
            allowNull: true
        },
        mobile_cc: {
            type: Sequelize.STRING,
            allowNull: true
        },
        mobile_ccom: {
            type: Sequelize.STRING,
            allowNull: true
        },
        mobile_ac: {
            type: Sequelize.STRING,
            allowNull: true
        },
        email_rc: {
            type: Sequelize.STRING,
            allowNull: true
        },
        email_cc: {
            type: Sequelize.STRING,
            allowNull: true
        },
        email_ccom: {
            type: Sequelize.STRING,
            allowNull: true
        },
        email_ac: {
            type: Sequelize.STRING,
            allowNull: true
        },
        fax_rc: {
            type: Sequelize.STRING,
            allowNull: true
        },
        fax_cc: {
            type: Sequelize.STRING,
            allowNull: true
        },
        fax_ccom: {
            type: Sequelize.STRING,
            allowNull: true
        },
        fax_ac: {
            type: Sequelize.STRING,
            allowNull: true
        },
        etat: {
            type: Sequelize.STRING,
            allowNull: true
        }
    })

    return Provider
}