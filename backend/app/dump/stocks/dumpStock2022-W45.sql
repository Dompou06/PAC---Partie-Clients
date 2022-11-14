/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: cultures
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `cultures` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type_culture` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE = MyISAM AUTO_INCREMENT = 6 DEFAULT CHARSET = utf8 COLLATE = utf8_unicode_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: departements
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `departements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name_departement` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `initial` varchar(2) COLLATE utf8_unicode_ci NOT NULL,
  `departement_created_at` date NOT NULL DEFAULT current_timestamp(),
  `departement_updated_at` date DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 7 DEFAULT CHARSET = utf8 COLLATE = utf8_unicode_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: families
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `families` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `family_description` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `family_abbreviation` varchar(3) COLLATE utf8_unicode_ci NOT NULL,
  `family_sass` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `family_text` text COLLATE utf8_unicode_ci NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE = MyISAM AUTO_INCREMENT = 4 DEFAULT CHARSET = utf8 COLLATE = utf8_unicode_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: fournisseurs
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `fournisseurs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rayon` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `societe` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tel` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mobile` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fax` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `site` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `adresse` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `cp` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ville` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pays` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `activite` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fjuridique` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `siret` varchar(14) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nexterne` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tva` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ape` varchar(6) COLLATE utf8_unicode_ci DEFAULT NULL,
  `banque` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL,
  `guichet` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL,
  `compte` varchar(11) COLLATE utf8_unicode_ci DEFAULT NULL,
  `rib` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL,
  `iban` varchar(27) COLLATE utf8_unicode_ci DEFAULT NULL,
  `domiciliation` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bic` varchar(11) COLLATE utf8_unicode_ci DEFAULT NULL,
  `autre` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nom_rc` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nom_cc` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nom_ccom` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nom_ac` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `prenom_rc` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `prenom_cc` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `prenom_ccom` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `prenom_ac` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tel_rc` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tel_cc` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tel_ccom` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tel_ac` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mobile_rc` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mobile_cc` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mobile_ccom` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mobile_ac` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email_rc` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email_cc` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email_ccom` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email_ac` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fax_rc` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fax_cc` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fax_ccom` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fax_ac` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `etat` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE = MyISAM AUTO_INCREMENT = 36 DEFAULT CHARSET = utf8 COLLATE = utf8_unicode_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: localisations
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `localisations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `departement` varchar(11) COLLATE utf8_unicode_ci DEFAULT NULL,
  `situation` int(11) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE = MyISAM AUTO_INCREMENT = 339 DEFAULT CHARSET = utf8 COLLATE = utf8_unicode_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: marges
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `marges` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `taux` decimal(5, 2) NOT NULL,
  `designation` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE = MyISAM AUTO_INCREMENT = 5 DEFAULT CHARSET = utf8 COLLATE = utf8_unicode_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: mesures
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `mesures` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `unit` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `rayon` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `createdAt` datetime NOT NULL DEFAULT current_timestamp(),
  `updatedAt` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE = MyISAM AUTO_INCREMENT = 34 DEFAULT CHARSET = utf8 COLLATE = utf8_unicode_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: produits
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `produits` (
  `id_prod` int(11) NOT NULL AUTO_INCREMENT,
  `name_prod` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `variety` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0,',
  `id_family` int(11) NOT NULL,
  `id_category` int(11) NOT NULL,
  `cat_prod` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `order_prod` int(11) NOT NULL,
  `stock` tinyint(1) NOT NULL DEFAULT 1,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id_prod`)
) ENGINE = MyISAM AUTO_INCREMENT = 806 DEFAULT CHARSET = utf8 COLLATE = utf8_unicode_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: promotions
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `promotions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code_promo` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `taux_promo` decimal(7, 2) DEFAULT NULL,
  `euro_promo` decimal(7, 2) DEFAULT NULL,
  `debut_promo` date DEFAULT NULL,
  `fin_promo` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE = MyISAM DEFAULT CHARSET = utf8 COLLATE = utf8_unicode_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: rayons
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `rayons` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cat` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `category_description` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `cat_description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `products` varchar(5) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'true',
  `family_abbreviation` int(11) NOT NULL,
  `category_abbreviation` int(11) NOT NULL,
  `family_sass` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `category_text` text COLLATE utf8_unicode_ci NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE = MyISAM AUTO_INCREMENT = 11 DEFAULT CHARSET = utf8 COLLATE = utf8_unicode_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: stocks
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `stocks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `week` varchar(8) NOT NULL,
  `departement` varchar(5) NOT NULL,
  `user_id` int(11) NOT NULL,
  `id_prod` varchar(255) NOT NULL,
  `name` varchar(150) NOT NULL,
  `variety` varchar(150) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `image` varchar(15) DEFAULT NULL,
  `agr` varchar(20) NOT NULL,
  `loc` varchar(150) NOT NULL,
  `four` varchar(200) NOT NULL,
  `mes` varchar(100) NOT NULL,
  `cond` varchar(100) DEFAULT NULL,
  `pf` varchar(10) NOT NULL,
  `marge` varchar(9) NOT NULL DEFAULT '15',
  `quantity` varchar(10) NOT NULL,
  `arrival` date NOT NULL,
  `commande` date DEFAULT NULL,
  `stock_arrival` varchar(10) NOT NULL,
  `stock_current` varchar(10) NOT NULL,
  `clone` varchar(8) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 423 DEFAULT CHARSET = utf8mb4;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: taxes
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `taxes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `taux` decimal(5, 2) NOT NULL,
  `designation` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE = MyISAM AUTO_INCREMENT = 6 DEFAULT CHARSET = utf8 COLLATE = utf8_unicode_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: varietes
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `varietes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_article` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `variete` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `createdAt` datetime NOT NULL DEFAULT current_timestamp(),
  `updatedAt` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE = MyISAM AUTO_INCREMENT = 21 DEFAULT CHARSET = utf8 COLLATE = utf8_unicode_ci;

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: cultures
# ------------------------------------------------------------

INSERT INTO
  `cultures` (`id`, `type_culture`)
VALUES
  (1, 'Traditionnelle');
INSERT INTO
  `cultures` (`id`, `type_culture`)
VALUES
  (2, 'Raisonnée');
INSERT INTO
  `cultures` (`id`, `type_culture`)
VALUES
  (3, 'Ecologique');
INSERT INTO
  `cultures` (`id`, `type_culture`)
VALUES
  (4, 'Bio');

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: departements
# ------------------------------------------------------------

INSERT INTO
  `departements` (
    `id`,
    `name_departement`,
    `initial`,
    `departement_created_at`,
    `departement_updated_at`
  )
VALUES
  (1, 'Ressources humaines', 'RH', '2021-03-30', NULL);
INSERT INTO
  `departements` (
    `id`,
    `name_departement`,
    `initial`,
    `departement_created_at`,
    `departement_updated_at`
  )
VALUES
  (2, 'Administration', 'A', '2021-03-30', NULL);
INSERT INTO
  `departements` (
    `id`,
    `name_departement`,
    `initial`,
    `departement_created_at`,
    `departement_updated_at`
  )
VALUES
  (3, 'Gestion', 'G', '2021-03-30', NULL);
INSERT INTO
  `departements` (
    `id`,
    `name_departement`,
    `initial`,
    `departement_created_at`,
    `departement_updated_at`
  )
VALUES
  (4, 'Informatique', 'I', '2021-03-30', NULL);
INSERT INTO
  `departements` (
    `id`,
    `name_departement`,
    `initial`,
    `departement_created_at`,
    `departement_updated_at`
  )
VALUES
  (5, 'Juridique', 'J', '2021-03-30', NULL);
INSERT INTO
  `departements` (
    `id`,
    `name_departement`,
    `initial`,
    `departement_created_at`,
    `departement_updated_at`
  )
VALUES
  (6, 'Projets stratégiques', 'PS', '2021-03-30', NULL);

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: families
# ------------------------------------------------------------

INSERT INTO
  `families` (
    `id`,
    `family_description`,
    `family_abbreviation`,
    `family_sass`,
    `family_text`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    1,
    'Légumes',
    'l',
    'leg',
    'Lorem ipsum dolor sit amet consectetur adipisicing elit. Expedita explicabo reiciendis, saepe quas fuga quam. Quaerat dicta iure quod vitae est atque porro, natus mollitia, eaque rem quas cumque repudiandae!',
    '2022-05-12 10:48:00',
    '2022-05-12 10:48:00'
  );
INSERT INTO
  `families` (
    `id`,
    `family_description`,
    `family_abbreviation`,
    `family_sass`,
    `family_text`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    2,
    'Fruits',
    'f',
    'fruit',
    'Lorem ipsum dolor sit amet consectetur adipisicing elit. Expedita explicabo reiciendis, saepe quas fuga quam. Quaerat dicta iure quod vitae est atque porro, natus mollitia, eaque rem quas cumque repudiandae!',
    '2022-05-12 10:48:00',
    '2022-05-12 10:48:00'
  );
INSERT INTO
  `families` (
    `id`,
    `family_description`,
    `family_abbreviation`,
    `family_sass`,
    `family_text`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    3,
    'Produits',
    'p',
    'prod',
    'Lorem ipsum dolor sit amet consectetur adipisicing elit. Expedita explicabo reiciendis, saepe quas fuga quam. Quaerat dicta iure quod vitae est atque porro, natus mollitia, eaque rem quas cumque repudiandae!',
    '2022-05-12 10:48:00',
    '2022-05-12 10:48:00'
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: fournisseurs
# ------------------------------------------------------------

INSERT INTO
  `fournisseurs` (
    `id`,
    `rayon`,
    `societe`,
    `tel`,
    `mobile`,
    `fax`,
    `email`,
    `site`,
    `adresse`,
    `cp`,
    `ville`,
    `pays`,
    `activite`,
    `fjuridique`,
    `siret`,
    `nexterne`,
    `tva`,
    `ape`,
    `banque`,
    `guichet`,
    `compte`,
    `rib`,
    `iban`,
    `domiciliation`,
    `bic`,
    `autre`,
    `nom_rc`,
    `nom_cc`,
    `nom_ccom`,
    `nom_ac`,
    `prenom_rc`,
    `prenom_cc`,
    `prenom_ccom`,
    `prenom_ac`,
    `tel_rc`,
    `tel_cc`,
    `tel_ccom`,
    `tel_ac`,
    `mobile_rc`,
    `mobile_cc`,
    `mobile_ccom`,
    `mobile_ac`,
    `email_rc`,
    `email_cc`,
    `email_ccom`,
    `email_ac`,
    `fax_rc`,
    `fax_cc`,
    `fax_ccom`,
    `fax_ac`,
    `etat`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    24,
    '1_1,2_4,',
    'Test',
    '0493426275',
    '0613505114',
    '0493426275',
    'dpourriere@outlook.fr',
    'dpstudio.fr',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    'A completer',
    '0000-00-00 00:00:00',
    '2022-08-29 11:33:09'
  );
INSERT INTO
  `fournisseurs` (
    `id`,
    `rayon`,
    `societe`,
    `tel`,
    `mobile`,
    `fax`,
    `email`,
    `site`,
    `adresse`,
    `cp`,
    `ville`,
    `pays`,
    `activite`,
    `fjuridique`,
    `siret`,
    `nexterne`,
    `tva`,
    `ape`,
    `banque`,
    `guichet`,
    `compte`,
    `rib`,
    `iban`,
    `domiciliation`,
    `bic`,
    `autre`,
    `nom_rc`,
    `nom_cc`,
    `nom_ccom`,
    `nom_ac`,
    `prenom_rc`,
    `prenom_cc`,
    `prenom_ccom`,
    `prenom_ac`,
    `tel_rc`,
    `tel_cc`,
    `tel_ccom`,
    `tel_ac`,
    `mobile_rc`,
    `mobile_cc`,
    `mobile_ccom`,
    `mobile_ac`,
    `email_rc`,
    `email_cc`,
    `email_ccom`,
    `email_ac`,
    `fax_rc`,
    `fax_cc`,
    `fax_ccom`,
    `fax_ac`,
    `etat`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    25,
    '1_1,',
    'Essai',
    '',
    '06135025',
    NULL,
    'pgerard@mail.pg',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    'Paul',
    NULL,
    NULL,
    NULL,
    'Gérard',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    '2022-08-29 11:49:47',
    '2022-08-29 11:49:47'
  );
INSERT INTO
  `fournisseurs` (
    `id`,
    `rayon`,
    `societe`,
    `tel`,
    `mobile`,
    `fax`,
    `email`,
    `site`,
    `adresse`,
    `cp`,
    `ville`,
    `pays`,
    `activite`,
    `fjuridique`,
    `siret`,
    `nexterne`,
    `tva`,
    `ape`,
    `banque`,
    `guichet`,
    `compte`,
    `rib`,
    `iban`,
    `domiciliation`,
    `bic`,
    `autre`,
    `nom_rc`,
    `nom_cc`,
    `nom_ccom`,
    `nom_ac`,
    `prenom_rc`,
    `prenom_cc`,
    `prenom_ccom`,
    `prenom_ac`,
    `tel_rc`,
    `tel_cc`,
    `tel_ccom`,
    `tel_ac`,
    `mobile_rc`,
    `mobile_cc`,
    `mobile_ccom`,
    `mobile_ac`,
    `email_rc`,
    `email_cc`,
    `email_ccom`,
    `email_ac`,
    `fax_rc`,
    `fax_cc`,
    `fax_ccom`,
    `fax_ac`,
    `etat`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    26,
    '1_3,1_1,',
    'AndCgris',
    '',
    '0612546843',
    NULL,
    'andchrus@ghjk.ac',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    'Astier',
    NULL,
    NULL,
    NULL,
    'André',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    '2022-08-29 13:18:22',
    '2022-08-29 13:25:45'
  );
INSERT INTO
  `fournisseurs` (
    `id`,
    `rayon`,
    `societe`,
    `tel`,
    `mobile`,
    `fax`,
    `email`,
    `site`,
    `adresse`,
    `cp`,
    `ville`,
    `pays`,
    `activite`,
    `fjuridique`,
    `siret`,
    `nexterne`,
    `tva`,
    `ape`,
    `banque`,
    `guichet`,
    `compte`,
    `rib`,
    `iban`,
    `domiciliation`,
    `bic`,
    `autre`,
    `nom_rc`,
    `nom_cc`,
    `nom_ccom`,
    `nom_ac`,
    `prenom_rc`,
    `prenom_cc`,
    `prenom_ccom`,
    `prenom_ac`,
    `tel_rc`,
    `tel_cc`,
    `tel_ccom`,
    `tel_ac`,
    `mobile_rc`,
    `mobile_cc`,
    `mobile_ccom`,
    `mobile_ac`,
    `email_rc`,
    `email_cc`,
    `email_ccom`,
    `email_ac`,
    `fax_rc`,
    `fax_cc`,
    `fax_ccom`,
    `fax_ac`,
    `etat`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    27,
    '3_7,',
    'GD',
    '',
    '0612354862',
    NULL,
    'gd@ghj.gd',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    'Gérard',
    NULL,
    NULL,
    NULL,
    'Destoumieux',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    '2022-08-29 13:22:16',
    '2022-08-29 13:30:12'
  );
INSERT INTO
  `fournisseurs` (
    `id`,
    `rayon`,
    `societe`,
    `tel`,
    `mobile`,
    `fax`,
    `email`,
    `site`,
    `adresse`,
    `cp`,
    `ville`,
    `pays`,
    `activite`,
    `fjuridique`,
    `siret`,
    `nexterne`,
    `tva`,
    `ape`,
    `banque`,
    `guichet`,
    `compte`,
    `rib`,
    `iban`,
    `domiciliation`,
    `bic`,
    `autre`,
    `nom_rc`,
    `nom_cc`,
    `nom_ccom`,
    `nom_ac`,
    `prenom_rc`,
    `prenom_cc`,
    `prenom_ccom`,
    `prenom_ac`,
    `tel_rc`,
    `tel_cc`,
    `tel_ccom`,
    `tel_ac`,
    `mobile_rc`,
    `mobile_cc`,
    `mobile_ccom`,
    `mobile_ac`,
    `email_rc`,
    `email_cc`,
    `email_ccom`,
    `email_ac`,
    `fax_rc`,
    `fax_cc`,
    `fax_ccom`,
    `fax_ac`,
    `etat`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    28,
    '3_7,',
    'ONyons',
    '',
    '0365245635',
    NULL,
    'onyons@pn.fr',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    'Olivier',
    NULL,
    NULL,
    NULL,
    'Nyons',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    '2022-09-01 15:17:50',
    '2022-09-01 15:17:50'
  );
INSERT INTO
  `fournisseurs` (
    `id`,
    `rayon`,
    `societe`,
    `tel`,
    `mobile`,
    `fax`,
    `email`,
    `site`,
    `adresse`,
    `cp`,
    `ville`,
    `pays`,
    `activite`,
    `fjuridique`,
    `siret`,
    `nexterne`,
    `tva`,
    `ape`,
    `banque`,
    `guichet`,
    `compte`,
    `rib`,
    `iban`,
    `domiciliation`,
    `bic`,
    `autre`,
    `nom_rc`,
    `nom_cc`,
    `nom_ccom`,
    `nom_ac`,
    `prenom_rc`,
    `prenom_cc`,
    `prenom_ccom`,
    `prenom_ac`,
    `tel_rc`,
    `tel_cc`,
    `tel_ccom`,
    `tel_ac`,
    `mobile_rc`,
    `mobile_cc`,
    `mobile_ccom`,
    `mobile_ac`,
    `email_rc`,
    `email_cc`,
    `email_ccom`,
    `email_ac`,
    `fax_rc`,
    `fax_cc`,
    `fax_ccom`,
    `fax_ac`,
    `etat`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    29,
    '3_7,',
    'PitchNice',
    '',
    '0654859763',
    NULL,
    'contact@pitchnice.fr',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    'Brun',
    NULL,
    NULL,
    NULL,
    'Marius',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    '2022-09-02 10:22:37',
    '2022-09-02 10:22:37'
  );
INSERT INTO
  `fournisseurs` (
    `id`,
    `rayon`,
    `societe`,
    `tel`,
    `mobile`,
    `fax`,
    `email`,
    `site`,
    `adresse`,
    `cp`,
    `ville`,
    `pays`,
    `activite`,
    `fjuridique`,
    `siret`,
    `nexterne`,
    `tva`,
    `ape`,
    `banque`,
    `guichet`,
    `compte`,
    `rib`,
    `iban`,
    `domiciliation`,
    `bic`,
    `autre`,
    `nom_rc`,
    `nom_cc`,
    `nom_ccom`,
    `nom_ac`,
    `prenom_rc`,
    `prenom_cc`,
    `prenom_ccom`,
    `prenom_ac`,
    `tel_rc`,
    `tel_cc`,
    `tel_ccom`,
    `tel_ac`,
    `mobile_rc`,
    `mobile_cc`,
    `mobile_ccom`,
    `mobile_ac`,
    `email_rc`,
    `email_cc`,
    `email_ccom`,
    `email_ac`,
    `fax_rc`,
    `fax_cc`,
    `fax_ccom`,
    `fax_ac`,
    `etat`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    32,
    '3_7,',
    'Bet',
    '0293565854',
    '',
    NULL,
    'contact@bet.fr',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    'Bet',
    NULL,
    NULL,
    NULL,
    'Patrick',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    '2022-09-05 09:45:14',
    '2022-09-05 09:45:14'
  );
INSERT INTO
  `fournisseurs` (
    `id`,
    `rayon`,
    `societe`,
    `tel`,
    `mobile`,
    `fax`,
    `email`,
    `site`,
    `adresse`,
    `cp`,
    `ville`,
    `pays`,
    `activite`,
    `fjuridique`,
    `siret`,
    `nexterne`,
    `tva`,
    `ape`,
    `banque`,
    `guichet`,
    `compte`,
    `rib`,
    `iban`,
    `domiciliation`,
    `bic`,
    `autre`,
    `nom_rc`,
    `nom_cc`,
    `nom_ccom`,
    `nom_ac`,
    `prenom_rc`,
    `prenom_cc`,
    `prenom_ccom`,
    `prenom_ac`,
    `tel_rc`,
    `tel_cc`,
    `tel_ccom`,
    `tel_ac`,
    `mobile_rc`,
    `mobile_cc`,
    `mobile_ccom`,
    `mobile_ac`,
    `email_rc`,
    `email_cc`,
    `email_ccom`,
    `email_ac`,
    `fax_rc`,
    `fax_cc`,
    `fax_ccom`,
    `fax_ac`,
    `etat`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    35,
    '1_1',
    'Lambert',
    '',
    '06589545',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    'Lambert',
    NULL,
    NULL,
    NULL,
    'Paul',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    '2022-09-16 09:36:47',
    '2022-09-16 09:36:47'
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: localisations
# ------------------------------------------------------------

INSERT INTO
  `localisations` (
    `id`,
    `name`,
    `departement`,
    `situation`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    1,
    ' Ain',
    '01',
    3,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `localisations` (
    `id`,
    `name`,
    `departement`,
    `situation`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    2,
    'Aisne',
    '02',
    3,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `localisations` (
    `id`,
    `name`,
    `departement`,
    `situation`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    3,
    'Allier',
    '03',
    3,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `localisations` (
    `id`,
    `name`,
    `departement`,
    `situation`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    4,
    'Alpes-de-Haute-Provence',
    '04',
    2,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `localisations` (
    `id`,
    `name`,
    `departement`,
    `situation`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    5,
    'Hautes-Alpes',
    '05',
    2,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `localisations` (
    `id`,
    `name`,
    `departement`,
    `situation`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    6,
    'Alpes-Maritimes',
    '06',
    2,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `localisations` (
    `id`,
    `name`,
    `departement`,
    `situation`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    7,
    'Ardennes',
    '08',
    3,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `localisations` (
    `id`,
    `name`,
    `departement`,
    `situation`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    8,
    'Aube',
    '10',
    3,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `localisations` (
    `id`,
    `name`,
    `departement`,
    `situation`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    9,
    'Aude',
    '11',
    3,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `localisations` (
    `id`,
    `name`,
    `departement`,
    `situation`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    10,
    'Aveyron',
    '12',
    3,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `localisations` (
    `id`,
    `name`,
    `departement`,
    `situation`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    11,
    'Calvados',
    '14',
    3,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `localisations` (
    `id`,
    `name`,
    `departement`,
    `situation`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    12,
    'Cantal',
    '15',
    3,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `localisations` (
    `id`,
    `name`,
    `departement`,
    `situation`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    13,
    'Charente',
    '16',
    3,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `localisations` (
    `id`,
    `name`,
    `departement`,
    `situation`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    14,
    'Charente-Maritime',
    '17',
    3,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `localisations` (
    `id`,
    `name`,
    `departement`,
    `situation`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    15,
    'Cher',
    '18',
    3,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `localisations` (
    `id`,
    `name`,
    `departement`,
    `situation`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    16,
    'Corse-du-Sud',
    '2A',
    2,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `localisations` (
    `id`,
    `name`,
    `departement`,
    `situation`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    17,
    'Haute-Corse',
    '2B',
    2,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `localisations` (
    `id`,
    `name`,
    `departement`,
    `situation`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    18,
    'Creuse',
    '23',
    3,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `localisations` (
    `id`,
    `name`,
    `departement`,
    `situation`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    19,
    'Dordogne',
    '24',
    3,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `localisations` (
    `id`,
    `name`,
    `departement`,
    `situation`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    20,
    'Doubs',
    '25',
    3,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `localisations` (
    `id`,
    `name`,
    `departement`,
    `situation`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    21,
    'Eure',
    '27',
    3,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `localisations` (
    `id`,
    `name`,
    `departement`,
    `situation`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    22,
    'Eure-et-Loir',
    '28',
    3,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `localisations` (
    `id`,
    `name`,
    `departement`,
    `situation`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    23,
    'Gard',
    '30',
    3,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `localisations` (
    `id`,
    `name`,
    `departement`,
    `situation`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    24,
    'Haute-Garonne',
    '31',
    3,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `localisations` (
    `id`,
    `name`,
    `departement`,
    `situation`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    25,
    'Gers',
    '32',
    3,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `localisations` (
    `id`,
    `name`,
    `departement`,
    `situation`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    26,
    'Gironde',
    '33',
    3,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `localisations` (
    `id`,
    `name`,
    `departement`,
    `situation`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    27,
    'Ille-et-Vilaine',
    '35',
    3,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `localisations` (
    `id`,
    `name`,
    `departement`,
    `situation`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    28,
    'Indre',
    '36',
    3,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `localisations` (
    `id`,
    `name`,
    `departement`,
    `situation`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    29,
    'Indre-et-Loire',
    '37',
    3,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `localisations` (
    `id`,
    `name`,
    `departement`,
    `situation`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    30,
    'Jura',
    '39',
    3,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `localisations` (
    `id`,
    `name`,
    `departement`,
    `situation`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    31,
    'Landes',
    '40',
    3,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `localisations` (
    `id`,
    `name`,
    `departement`,
    `situation`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    32,
    'Loir-et-Cher',
    '41',
    3,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `localisations` (
    `id`,
    `name`,
    `departement`,
    `situation`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    33,
    'Loire',
    '42',
    3,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `localisations` (
    `id`,
    `name`,
    `departement`,
    `situation`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    34,
    'Haute-Loire',
    '43',
    3,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `localisations` (
    `id`,
    `name`,
    `departement`,
    `situation`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    35,
    'Loire-Atlantique',
    '44',
    3,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `localisations` (
    `id`,
    `name`,
    `departement`,
    `situation`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    36,
    'Loiret',
    '45',
    3,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `localisations` (
    `id`,
    `name`,
    `departement`,
    `situation`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    37,
    'Lot',
    '46',
    3,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `localisations` (
    `id`,
    `name`,
    `departement`,
    `situation`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    38,
    'Lot-et-Garonne',
    '47',
    3,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `localisations` (
    `id`,
    `name`,
    `departement`,
    `situation`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    39,
    'Maine-et-Loire',
    '49',
    3,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `localisations` (
    `id`,
    `name`,
    `departement`,
    `situation`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    40,
    'Manche',
    '50',
    3,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `localisations` (
    `id`,
    `name`,
    `departement`,
    `situation`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    41,
    'Marne',
    '51',
    3,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `localisations` (
    `id`,
    `name`,
    `departement`,
    `situation`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    42,
    'Haute-Marne',
    '52',
    3,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `localisations` (
    `id`,
    `name`,
    `departement`,
    `situation`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    43,
    'Mayenne',
    '53',
    3,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `localisations` (
    `id`,
    `name`,
    `departement`,
    `situation`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    44,
    'Meurthe-et-Moselle',
    '54',
    3,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `localisations` (
    `id`,
    `name`,
    `departement`,
    `situation`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    45,
    'Meuse',
    '55',
    3,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `localisations` (
    `id`,
    `name`,
    `departement`,
    `situation`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    46,
    'Morbihan',
    '56',
    3,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `localisations` (
    `id`,
    `name`,
    `departement`,
    `situation`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    47,
    'Moselle',
    '57',
    3,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `localisations` (
    `id`,
    `name`,
    `departement`,
    `situation`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    48,
    'Nord',
    '59',
    3,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `localisations` (
    `id`,
    `name`,
    `departement`,
    `situation`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    49,
    'Oise',
    '60',
    3,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `localisations` (
    `id`,
    `name`,
    `departement`,
    `situation`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    50,
    'Orne',
    '61',
    3,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `localisations` (
    `id`,
    `name`,
    `departement`,
    `situation`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    51,
    'Pas-de-Calais',
    '62',
    3,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `localisations` (
    `id`,
    `name`,
    `departement`,
    `situation`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    52,
    'Bas-Rhin',
    '67',
    3,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `localisations` (
    `id`,
    `name`,
    `departement`,
    `situation`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    53,
    'Haut-Rhin',
    '68',
    3,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `localisations` (
    `id`,
    `name`,
    `departement`,
    `situation`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    54,
    'Sarthe',
    '72',
    3,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `localisations` (
    `id`,
    `name`,
    `departement`,
    `situation`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    55,
    'Savoie',
    '73',
    3,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `localisations` (
    `id`,
    `name`,
    `departement`,
    `situation`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    56,
    'Haute-Savoie',
    '74',
    3,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `localisations` (
    `id`,
    `name`,
    `departement`,
    `situation`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    57,
    'Paris',
    '75',
    3,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `localisations` (
    `id`,
    `name`,
    `departement`,
    `situation`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    58,
    'Seine-Maritime',
    '76',
    3,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `localisations` (
    `id`,
    `name`,
    `departement`,
    `situation`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    59,
    'Seine-et-Marne',
    '77',
    3,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `localisations` (
    `id`,
    `name`,
    `departement`,
    `situation`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    60,
    'Yvelines',
    '78',
    3,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `localisations` (
    `id`,
    `name`,
    `departement`,
    `situation`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    61,
    'Somme',
    '80',
    3,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `localisations` (
    `id`,
    `name`,
    `departement`,
    `situation`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    62,
    'Tarn',
    '81',
    3,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `localisations` (
    `id`,
    `name`,
    `departement`,
    `situation`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    63,
    'Tarn-et-Garonne',
    '82',
    3,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `localisations` (
    `id`,
    `name`,
    `departement`,
    `situation`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    64,
    'Var',
    '83',
    2,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `localisations` (
    `id`,
    `name`,
    `departement`,
    `situation`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    65,
    'Vaucluse',
    '84',
    2,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `localisations` (
    `id`,
    `name`,
    `departement`,
    `situation`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    66,
    'Vienne',
    '86',
    3,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `localisations` (
    `id`,
    `name`,
    `departement`,
    `situation`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    67,
    'Haute-Vienne',
    '87',
    3,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `localisations` (
    `id`,
    `name`,
    `departement`,
    `situation`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    68,
    'Vosges',
    '88',
    3,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `localisations` (
    `id`,
    `name`,
    `departement`,
    `situation`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    69,
    'Yonne',
    '89',
    3,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `localisations` (
    `id`,
    `name`,
    `departement`,
    `situation`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    70,
    'Territoire de Belfort',
    '90',
    3,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `localisations` (
    `id`,
    `name`,
    `departement`,
    `situation`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    71,
    'Essonne',
    '91',
    3,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `localisations` (
    `id`,
    `name`,
    `departement`,
    `situation`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    72,
    'Hauts-de-Seine',
    '92',
    3,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `localisations` (
    `id`,
    `name`,
    `departement`,
    `situation`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    73,
    'Seine-Saint-Denis',
    '93',
    3,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `localisations` (
    `id`,
    `name`,
    `departement`,
    `situation`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    74,
    'Val-de-Marne',
    '94',
    3,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `localisations` (
    `id`,
    `name`,
    `departement`,
    `situation`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    75,
    'Val-d\'Oise',
    '95',
    3,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `localisations` (
    `id`,
    `name`,
    `departement`,
    `situation`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    76,
    'Guadeloupe',
    '971',
    3,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `localisations` (
    `id`,
    `name`,
    `departement`,
    `situation`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    77,
    'Martinique',
    '972',
    3,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `localisations` (
    `id`,
    `name`,
    `departement`,
    `situation`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    78,
    'Guyane',
    '973',
    3,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `localisations` (
    `id`,
    `name`,
    `departement`,
    `situation`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    79,
    'Saint-Pierre-et-Miquelon',
    '975',
    3,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `localisations` (
    `id`,
    `name`,
    `departement`,
    `situation`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    80,
    'Mayotte',
    '976',
    3,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `localisations` (
    `id`,
    `name`,
    `departement`,
    `situation`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    81,
    'Saint-Martin',
    '978',
    3,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `localisations` (
    `id`,
    `name`,
    `departement`,
    `situation`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    82,
    'Wallis-et-Futuna',
    '986',
    3,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `localisations` (
    `id`,
    `name`,
    `departement`,
    `situation`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    83,
    'Afghanistan',
    NULL,
    5,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `localisations` (
    `id`,
    `name`,
    `departement`,
    `situation`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    84,
    'Angola',
    NULL,
    5,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `localisations` (
    `id`,
    `name`,
    `departement`,
    `situation`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    85,
    'Autriche',
    NULL,
    4,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `localisations` (
    `id`,
    `name`,
    `departement`,
    `situation`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    86,
    'Belgique',
    NULL,
    4,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `localisations` (
    `id`,
    `name`,
    `departement`,
    `situation`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    87,
    'Bermudes',
    NULL,
    5,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `localisations` (
    `id`,
    `name`,
    `departement`,
    `situation`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    88,
    'Birmanie (Myanmar)',
    NULL,
    5,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `localisations` (
    `id`,
    `name`,
    `departement`,
    `situation`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    89,
    'Botswana',
    NULL,
    5,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `localisations` (
    `id`,
    `name`,
    `departement`,
    `situation`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    90,
    'Bulgarie',
    NULL,
    4,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `localisations` (
    `id`,
    `name`,
    `departement`,
    `situation`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    91,
    'Cambodge',
    NULL,
    5,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `localisations` (
    `id`,
    `name`,
    `departement`,
    `situation`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    92,
    'Cap-vert',
    NULL,
    5,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `localisations` (
    `id`,
    `name`,
    `departement`,
    `situation`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    93,
    'Chypre',
    NULL,
    4,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `localisations` (
    `id`,
    `name`,
    `departement`,
    `situation`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    94,
    'Danemark',
    NULL,
    4,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `localisations` (
    `id`,
    `name`,
    `departement`,
    `situation`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    95,
    'Fidji',
    NULL,
    5,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `localisations` (
    `id`,
    `name`,
    `departement`,
    `situation`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    96,
    'Gabon',
    NULL,
    5,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `localisations` (
    `id`,
    `name`,
    `departement`,
    `situation`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    241,
    'Grasse',
    NULL,
    1,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `localisations` (
    `id`,
    `name`,
    `departement`,
    `situation`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    98,
    'Guyana',
    NULL,
    5,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `localisations` (
    `id`,
    `name`,
    `departement`,
    `situation`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    99,
    'Honduras',
    NULL,
    5,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `localisations` (
    `id`,
    `name`,
    `departement`,
    `situation`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    100,
    'Iran',
    NULL,
    5,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `localisations` (
    `id`,
    `name`,
    `departement`,
    `situation`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    101,
    'Islande',
    NULL,
    5,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `localisations` (
    `id`,
    `name`,
    `departement`,
    `situation`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    102,
    'Kazakhstan',
    NULL,
    5,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `localisations` (
    `id`,
    `name`,
    `departement`,
    `situation`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    103,
    'Kiribati',
    NULL,
    5,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `localisations` (
    `id`,
    `name`,
    `departement`,
    `situation`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    104,
    'Le Vatican',
    NULL,
    5,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `localisations` (
    `id`,
    `name`,
    `departement`,
    `situation`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    105,
    'Liban',
    NULL,
    5,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `localisations` (
    `id`,
    `name`,
    `departement`,
    `situation`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    106,
    'Liechtenstein',
    NULL,
    5,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `localisations` (
    `id`,
    `name`,
    `departement`,
    `situation`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    107,
    'Macao',
    NULL,
    5,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `localisations` (
    `id`,
    `name`,
    `departement`,
    `situation`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    108,
    'Malawi',
    NULL,
    5,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `localisations` (
    `id`,
    `name`,
    `departement`,
    `situation`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    109,
    'Malte',
    NULL,
    4,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `localisations` (
    `id`,
    `name`,
    `departement`,
    `situation`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    110,
    'Maurice',
    NULL,
    5,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `localisations` (
    `id`,
    `name`,
    `departement`,
    `situation`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    111,
    'Mexique',
    NULL,
    5,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `localisations` (
    `id`,
    `name`,
    `departement`,
    `situation`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    112,
    'Mongolie',
    NULL,
    5,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `localisations` (
    `id`,
    `name`,
    `departement`,
    `situation`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    113,
    'Mozambique',
    NULL,
    5,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `localisations` (
    `id`,
    `name`,
    `departement`,
    `situation`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    114,
    'Ouganda',
    NULL,
    5,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `localisations` (
    `id`,
    `name`,
    `departement`,
    `situation`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    115,
    'Palaos',
    NULL,
    5,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `localisations` (
    `id`,
    `name`,
    `departement`,
    `situation`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    116,
    'Paraguay',
    NULL,
    5,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `localisations` (
    `id`,
    `name`,
    `departement`,
    `situation`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    117,
    'Philippines',
    NULL,
    5,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `localisations` (
    `id`,
    `name`,
    `departement`,
    `situation`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    118,
    'Porto Rico',
    NULL,
    5,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `localisations` (
    `id`,
    `name`,
    `departement`,
    `situation`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    119,
    'Russie',
    NULL,
    5,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `localisations` (
    `id`,
    `name`,
    `departement`,
    `situation`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    120,
    'Saint-Kitts-et-Nevis',
    NULL,
    5,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `localisations` (
    `id`,
    `name`,
    `departement`,
    `situation`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    121,
    'Saint-Vincent-et-les Grenadines',
    NULL,
    5,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `localisations` (
    `id`,
    `name`,
    `departement`,
    `situation`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    122,
    'Salvador',
    NULL,
    5,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `localisations` (
    `id`,
    `name`,
    `departement`,
    `situation`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    123,
    'Seychelles',
    NULL,
    5,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `localisations` (
    `id`,
    `name`,
    `departement`,
    `situation`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    124,
    'Slovaquie',
    NULL,
    4,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `localisations` (
    `id`,
    `name`,
    `departement`,
    `situation`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    125,
    'Soudan',
    NULL,
    5,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `localisations` (
    `id`,
    `name`,
    `departement`,
    `situation`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    126,
    'Suisse',
    NULL,
    5,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `localisations` (
    `id`,
    `name`,
    `departement`,
    `situation`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    127,
    'Swaziland',
    NULL,
    5,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `localisations` (
    `id`,
    `name`,
    `departement`,
    `situation`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    128,
    'Togo',
    NULL,
    5,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `localisations` (
    `id`,
    `name`,
    `departement`,
    `situation`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    129,
    'Tunisie',
    NULL,
    5,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `localisations` (
    `id`,
    `name`,
    `departement`,
    `situation`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    130,
    'Tuvalu',
    NULL,
    5,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `localisations` (
    `id`,
    `name`,
    `departement`,
    `situation`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    131,
    'Vanuatu',
    NULL,
    5,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `localisations` (
    `id`,
    `name`,
    `departement`,
    `situation`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    243,
    'Bourgogne-Franche-Comté',
    NULL,
    3,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `localisations` (
    `id`,
    `name`,
    `departement`,
    `situation`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    133,
    'Zimbabwe',
    NULL,
    5,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `localisations` (
    `id`,
    `name`,
    `departement`,
    `situation`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    134,
    'Afrique du Sud',
    NULL,
    5,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `localisations` (
    `id`,
    `name`,
    `departement`,
    `situation`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    135,
    'Allemagne',
    NULL,
    4,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `localisations` (
    `id`,
    `name`,
    `departement`,
    `situation`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    136,
    'Anguilla',
    NULL,
    5,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `localisations` (
    `id`,
    `name`,
    `departement`,
    `situation`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    137,
    'Arabie saoudite',
    NULL,
    5,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `localisations` (
    `id`,
    `name`,
    `departement`,
    `situation`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    138,
    'Aruba',
    NULL,
    5,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `localisations` (
    `id`,
    `name`,
    `departement`,
    `situation`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    139,
    'Bangladesh',
    NULL,
    5,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `localisations` (
    `id`,
    `name`,
    `departement`,
    `situation`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    140,
    'Belize',
    NULL,
    5,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `localisations` (
    `id`,
    `name`,
    `departement`,
    `situation`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    141,
    'Bhoutan',
    NULL,
    5,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `localisations` (
    `id`,
    `name`,
    `departement`,
    `situation`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    142,
    'Bolivie',
    NULL,
    5,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `localisations` (
    `id`,
    `name`,
    `departement`,
    `situation`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    143,
    'Burkina Faso',
    NULL,
    5,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `localisations` (
    `id`,
    `name`,
    `departement`,
    `situation`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    144,
    'Cameroun',
    NULL,
    5,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `localisations` (
    `id`,
    `name`,
    `departement`,
    `situation`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    145,
    'Chili',
    NULL,
    5,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `localisations` (
    `id`,
    `name`,
    `departement`,
    `situation`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    146,
    'Colombie',
    NULL,
    5,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `localisations` (
    `id`,
    `name`,
    `departement`,
    `situation`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    147,
    'Croatie',
    NULL,
    4,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `localisations` (
    `id`,
    `name`,
    `departement`,
    `situation`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    148,
    'Djibouti',
    NULL,
    5,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `localisations` (
    `id`,
    `name`,
    `departement`,
    `situation`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    149,
    'Espagne',
    NULL,
    4,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `localisations` (
    `id`,
    `name`,
    `departement`,
    `situation`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    150,
    'Finlande',
    NULL,
    4,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `localisations` (
    `id`,
    `name`,
    `departement`,
    `situation`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    151,
    'Gambie',
    NULL,
    5,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `localisations` (
    `id`,
    `name`,
    `departement`,
    `situation`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    152,
    'Ghana',
    NULL,
    5,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `localisations` (
    `id`,
    `name`,
    `departement`,
    `situation`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    153,
    'Grenade',
    NULL,
    5,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `localisations` (
    `id`,
    `name`,
    `departement`,
    `situation`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    154,
    'Guam',
    NULL,
    5,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `localisations` (
    `id`,
    `name`,
    `departement`,
    `situation`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    155,
    'Hong-Kong',
    NULL,
    5,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `localisations` (
    `id`,
    `name`,
    `departement`,
    `situation`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    156,
    'Inde',
    NULL,
    5,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `localisations` (
    `id`,
    `name`,
    `departement`,
    `situation`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    157,
    'Iraq',
    NULL,
    5,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `localisations` (
    `id`,
    `name`,
    `departement`,
    `situation`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    158,
    'Japon',
    NULL,
    5,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `localisations` (
    `id`,
    `name`,
    `departement`,
    `situation`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    159,
    'Kenya',
    NULL,
    5,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `localisations` (
    `id`,
    `name`,
    `departement`,
    `situation`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    160,
    'Lesotho',
    NULL,
    5,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `localisations` (
    `id`,
    `name`,
    `departement`,
    `situation`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    161,
    'Lituanie',
    NULL,
    4,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `localisations` (
    `id`,
    `name`,
    `departement`,
    `situation`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    162,
    'Madagascar',
    NULL,
    5,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `localisations` (
    `id`,
    `name`,
    `departement`,
    `situation`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    163,
    'Maldives',
    NULL,
    5,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `localisations` (
    `id`,
    `name`,
    `departement`,
    `situation`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    164,
    'Maroc',
    NULL,
    5,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `localisations` (
    `id`,
    `name`,
    `departement`,
    `situation`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    165,
    'Mauritanie',
    NULL,
    5,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `localisations` (
    `id`,
    `name`,
    `departement`,
    `situation`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    166,
    'Moldavie',
    NULL,
    5,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `localisations` (
    `id`,
    `name`,
    `departement`,
    `situation`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    167,
    'Namibie',
    NULL,
    5,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `localisations` (
    `id`,
    `name`,
    `departement`,
    `situation`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    168,
    'Nicaragua',
    NULL,
    5,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `localisations` (
    `id`,
    `name`,
    `departement`,
    `situation`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    169,
    'Panama',
    NULL,
    5,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `localisations` (
    `id`,
    `name`,
    `departement`,
    `situation`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    170,
    'Pays-Bas',
    NULL,
    4,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `localisations` (
    `id`,
    `name`,
    `departement`,
    `situation`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    171,
    'Pologne',
    NULL,
    4,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `localisations` (
    `id`,
    `name`,
    `departement`,
    `situation`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    172,
    'Portugal',
    NULL,
    4,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `localisations` (
    `id`,
    `name`,
    `departement`,
    `situation`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    173,
    'Roumanie',
    NULL,
    4,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `localisations` (
    `id`,
    `name`,
    `departement`,
    `situation`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    174,
    'Rwanda',
    NULL,
    5,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `localisations` (
    `id`,
    `name`,
    `departement`,
    `situation`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    175,
    'Saint-Marin',
    NULL,
    5,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `localisations` (
    `id`,
    `name`,
    `departement`,
    `situation`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    176,
    'Samoa',
    NULL,
    5,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `localisations` (
    `id`,
    `name`,
    `departement`,
    `situation`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    177,
    'Sierra Leone',
    NULL,
    5,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `localisations` (
    `id`,
    `name`,
    `departement`,
    `situation`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    178,
    'Sri Lanka',
    NULL,
    5,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `localisations` (
    `id`,
    `name`,
    `departement`,
    `situation`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    179,
    'Suriname',
    NULL,
    5,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `localisations` (
    `id`,
    `name`,
    `departement`,
    `situation`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    180,
    'Syrie',
    NULL,
    5,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `localisations` (
    `id`,
    `name`,
    `departement`,
    `situation`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    181,
    'Tanzanie',
    NULL,
    5,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `localisations` (
    `id`,
    `name`,
    `departement`,
    `situation`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    182,
    'Tonga',
    NULL,
    5,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `localisations` (
    `id`,
    `name`,
    `departement`,
    `situation`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    183,
    'Ukraine',
    NULL,
    5,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `localisations` (
    `id`,
    `name`,
    `departement`,
    `situation`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    184,
    'Venezuela',
    NULL,
    5,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `localisations` (
    `id`,
    `name`,
    `departement`,
    `situation`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    185,
    'Albanie',
    NULL,
    5,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `localisations` (
    `id`,
    `name`,
    `departement`,
    `situation`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    186,
    'Andorre',
    NULL,
    5,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `localisations` (
    `id`,
    `name`,
    `departement`,
    `situation`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    187,
    'Antigua-et-Barbuda',
    NULL,
    5,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `localisations` (
    `id`,
    `name`,
    `departement`,
    `situation`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    188,
    'Argentine',
    NULL,
    5,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `localisations` (
    `id`,
    `name`,
    `departement`,
    `situation`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    189,
    'Australie',
    NULL,
    5,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `localisations` (
    `id`,
    `name`,
    `departement`,
    `situation`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    190,
    'Bahamas',
    NULL,
    5,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `localisations` (
    `id`,
    `name`,
    `departement`,
    `situation`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    191,
    'Barbade',
    NULL,
    5,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `localisations` (
    `id`,
    `name`,
    `departement`,
    `situation`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    192,
    'Brunei',
    NULL,
    5,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `localisations` (
    `id`,
    `name`,
    `departement`,
    `situation`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    193,
    'Burundi',
    NULL,
    5,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `localisations` (
    `id`,
    `name`,
    `departement`,
    `situation`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    194,
    'Canada',
    NULL,
    5,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `localisations` (
    `id`,
    `name`,
    `departement`,
    `situation`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    195,
    'Chine',
    NULL,
    5,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `localisations` (
    `id`,
    `name`,
    `departement`,
    `situation`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    196,
    'Comores',
    NULL,
    5,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `localisations` (
    `id`,
    `name`,
    `departement`,
    `situation`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    197,
    'Costa Rica',
    NULL,
    5,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `localisations` (
    `id`,
    `name`,
    `departement`,
    `situation`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    198,
    'Cuba',
    NULL,
    5,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `localisations` (
    `id`,
    `name`,
    `departement`,
    `situation`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    199,
    'Dominique',
    NULL,
    5,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `localisations` (
    `id`,
    `name`,
    `departement`,
    `situation`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    200,
    'Estonie',
    NULL,
    4,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `localisations` (
    `id`,
    `name`,
    `departement`,
    `situation`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    201,
    'France',
    NULL,
    3,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `localisations` (
    `id`,
    `name`,
    `departement`,
    `situation`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    202,
    'Gibraltar',
    NULL,
    5,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `localisations` (
    `id`,
    `name`,
    `departement`,
    `situation`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    203,
    'Groenland',
    NULL,
    5,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `localisations` (
    `id`,
    `name`,
    `departement`,
    `situation`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    204,
    'Guatemala',
    NULL,
    5,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `localisations` (
    `id`,
    `name`,
    `departement`,
    `situation`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    205,
    'Hongrie',
    NULL,
    4,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `localisations` (
    `id`,
    `name`,
    `departement`,
    `situation`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    206,
    'Irlande',
    NULL,
    4,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `localisations` (
    `id`,
    `name`,
    `departement`,
    `situation`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    207,
    'Italie',
    NULL,
    4,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `localisations` (
    `id`,
    `name`,
    `departement`,
    `situation`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    208,
    'Jordanie',
    NULL,
    5,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `localisations` (
    `id`,
    `name`,
    `departement`,
    `situation`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    209,
    'Kirghizistan',
    NULL,
    5,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `localisations` (
    `id`,
    `name`,
    `departement`,
    `situation`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    210,
    'Laos',
    NULL,
    5,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `localisations` (
    `id`,
    `name`,
    `departement`,
    `situation`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    211,
    'Lettonie',
    NULL,
    4,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `localisations` (
    `id`,
    `name`,
    `departement`,
    `situation`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    212,
    'Libye',
    NULL,
    5,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `localisations` (
    `id`,
    `name`,
    `departement`,
    `situation`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    213,
    'Luxembourg',
    NULL,
    4,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `localisations` (
    `id`,
    `name`,
    `departement`,
    `situation`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    214,
    'Malaisie',
    NULL,
    5,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `localisations` (
    `id`,
    `name`,
    `departement`,
    `situation`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    215,
    'Mali',
    NULL,
    5,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `localisations` (
    `id`,
    `name`,
    `departement`,
    `situation`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    218,
    'Monaco',
    NULL,
    1,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `localisations` (
    `id`,
    `name`,
    `departement`,
    `situation`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    219,
    'Montserrat',
    NULL,
    5,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `localisations` (
    `id`,
    `name`,
    `departement`,
    `situation`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    220,
    'Nauru',
    NULL,
    5,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `localisations` (
    `id`,
    `name`,
    `departement`,
    `situation`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    221,
    'Niger',
    NULL,
    5,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `localisations` (
    `id`,
    `name`,
    `departement`,
    `situation`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    222,
    'Oman',
    NULL,
    5,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `localisations` (
    `id`,
    `name`,
    `departement`,
    `situation`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    223,
    'Pakistan',
    NULL,
    5,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `localisations` (
    `id`,
    `name`,
    `departement`,
    `situation`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    224,
    'Qatar',
    NULL,
    5,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `localisations` (
    `id`,
    `name`,
    `departement`,
    `situation`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    225,
    'Royaume-Uni',
    NULL,
    5,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `localisations` (
    `id`,
    `name`,
    `departement`,
    `situation`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    226,
    'Sahara occidental',
    NULL,
    5,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `localisations` (
    `id`,
    `name`,
    `departement`,
    `situation`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    242,
    'Auvergne-Rhône-Alpes',
    NULL,
    3,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `localisations` (
    `id`,
    `name`,
    `departement`,
    `situation`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    228,
    'Sainte-Lucie',
    NULL,
    5,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `localisations` (
    `id`,
    `name`,
    `departement`,
    `situation`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    229,
    'Serbie',
    NULL,
    5,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `localisations` (
    `id`,
    `name`,
    `departement`,
    `situation`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    230,
    'Singapour',
    NULL,
    5,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `localisations` (
    `id`,
    `name`,
    `departement`,
    `situation`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    231,
    'Somalie',
    NULL,
    5,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `localisations` (
    `id`,
    `name`,
    `departement`,
    `situation`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    232,
    'Svalbard et Jan Mayen',
    NULL,
    5,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `localisations` (
    `id`,
    `name`,
    `departement`,
    `situation`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    233,
    'Tadjikistan',
    NULL,
    5,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `localisations` (
    `id`,
    `name`,
    `departement`,
    `situation`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    234,
    'Tchad',
    NULL,
    5,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `localisations` (
    `id`,
    `name`,
    `departement`,
    `situation`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    235,
    'Timor oriental',
    NULL,
    5,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `localisations` (
    `id`,
    `name`,
    `departement`,
    `situation`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    236,
    'Turquie',
    NULL,
    5,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `localisations` (
    `id`,
    `name`,
    `departement`,
    `situation`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    237,
    'Uruguay',
    NULL,
    5,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `localisations` (
    `id`,
    `name`,
    `departement`,
    `situation`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    238,
    'Viet-Nam',
    NULL,
    5,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `localisations` (
    `id`,
    `name`,
    `departement`,
    `situation`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    239,
    'Zambie',
    NULL,
    5,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `localisations` (
    `id`,
    `name`,
    `departement`,
    `situation`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    240,
    'PACA',
    NULL,
    2,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `localisations` (
    `id`,
    `name`,
    `departement`,
    `situation`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    244,
    'Bretagne',
    NULL,
    3,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `localisations` (
    `id`,
    `name`,
    `departement`,
    `situation`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    245,
    'Centre-Val-de-Loire',
    NULL,
    3,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `localisations` (
    `id`,
    `name`,
    `departement`,
    `situation`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    281,
    'Corrèze',
    '19',
    3,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `localisations` (
    `id`,
    `name`,
    `departement`,
    `situation`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    247,
    'Grand Est',
    NULL,
    3,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `localisations` (
    `id`,
    `name`,
    `departement`,
    `situation`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    248,
    'Hauts-de-France',
    NULL,
    3,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `localisations` (
    `id`,
    `name`,
    `departement`,
    `situation`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    249,
    'Ile-de-France',
    NULL,
    3,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `localisations` (
    `id`,
    `name`,
    `departement`,
    `situation`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    250,
    'Normandie',
    NULL,
    3,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `localisations` (
    `id`,
    `name`,
    `departement`,
    `situation`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    251,
    'Nouvelle-Aquitaine',
    NULL,
    3,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `localisations` (
    `id`,
    `name`,
    `departement`,
    `situation`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    252,
    'Occitanie',
    NULL,
    3,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `localisations` (
    `id`,
    `name`,
    `departement`,
    `situation`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    253,
    'Pays de la Loire',
    NULL,
    3,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `localisations` (
    `id`,
    `name`,
    `departement`,
    `situation`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    273,
    'Suède',
    NULL,
    4,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `localisations` (
    `id`,
    `name`,
    `departement`,
    `situation`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    325,
    'Nice',
    NULL,
    1,
    '2022-09-02 10:22:37',
    '2022-09-02 10:22:37'
  );
INSERT INTO
  `localisations` (
    `id`,
    `name`,
    `departement`,
    `situation`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    271,
    'Slovénie',
    NULL,
    4,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `localisations` (
    `id`,
    `name`,
    `departement`,
    `situation`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    326,
    'Puget',
    NULL,
    1,
    '2022-09-02 15:30:12',
    '2022-09-02 15:30:12'
  );
INSERT INTO
  `localisations` (
    `id`,
    `name`,
    `departement`,
    `situation`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    269,
    'République tchèque',
    NULL,
    4,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `localisations` (
    `id`,
    `name`,
    `departement`,
    `situation`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    267,
    'Grèce',
    NULL,
    4,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `localisations` (
    `id`,
    `name`,
    `departement`,
    `situation`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    266,
    'Bouches-du-Rhône',
    '13',
    2,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `localisations` (
    `id`,
    `name`,
    `departement`,
    `situation`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    274,
    'Peymeinade',
    NULL,
    1,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `localisations` (
    `id`,
    `name`,
    `departement`,
    `situation`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    276,
    'Mouans-Sartoux',
    NULL,
    1,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `localisations` (
    `id`,
    `name`,
    `departement`,
    `situation`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    278,
    'Drôme',
    '26',
    3,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `localisations` (
    `id`,
    `name`,
    `departement`,
    `situation`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    279,
    'Ardèche',
    '07',
    3,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `localisations` (
    `id`,
    `name`,
    `departement`,
    `situation`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    280,
    'Ariège',
    '09',
    3,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `localisations` (
    `id`,
    `name`,
    `departement`,
    `situation`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    282,
    'Côte-d\'Or',
    '21',
    3,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `localisations` (
    `id`,
    `name`,
    `departement`,
    `situation`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    283,
    'Côtes-d\'Armor',
    '22',
    3,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `localisations` (
    `id`,
    `name`,
    `departement`,
    `situation`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    284,
    'Finistère',
    '29',
    3,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `localisations` (
    `id`,
    `name`,
    `departement`,
    `situation`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    286,
    'Hérault',
    '34',
    3,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `localisations` (
    `id`,
    `name`,
    `departement`,
    `situation`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    288,
    'Isère',
    '38',
    3,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `localisations` (
    `id`,
    `name`,
    `departement`,
    `situation`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    290,
    'Lozère',
    '48',
    3,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `localisations` (
    `id`,
    `name`,
    `departement`,
    `situation`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    292,
    'Nièvre',
    '58',
    3,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `localisations` (
    `id`,
    `name`,
    `departement`,
    `situation`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    294,
    'Puy-de-Dôme',
    '63',
    3,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `localisations` (
    `id`,
    `name`,
    `departement`,
    `situation`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    296,
    'Pyrénées-Atlantiques',
    '64',
    3,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `localisations` (
    `id`,
    `name`,
    `departement`,
    `situation`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    297,
    'Hautes-Pyrénées',
    '65',
    3,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `localisations` (
    `id`,
    `name`,
    `departement`,
    `situation`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    298,
    'Pyrénées-Orientales',
    '66',
    3,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `localisations` (
    `id`,
    `name`,
    `departement`,
    `situation`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    302,
    'Rhône',
    '69',
    3,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `localisations` (
    `id`,
    `name`,
    `departement`,
    `situation`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    338,
    'Escragnoles',
    NULL,
    1,
    '2022-09-15 13:30:57',
    '2022-09-15 13:30:57'
  );
INSERT INTO
  `localisations` (
    `id`,
    `name`,
    `departement`,
    `situation`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    304,
    'Haute-Saône',
    '70',
    3,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `localisations` (
    `id`,
    `name`,
    `departement`,
    `situation`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    305,
    'Saône-et-Loire',
    '71',
    3,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `localisations` (
    `id`,
    `name`,
    `departement`,
    `situation`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    308,
    'Deux-Sèvres',
    '79',
    3,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `localisations` (
    `id`,
    `name`,
    `departement`,
    `situation`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    310,
    'Vendée',
    '85',
    3,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `localisations` (
    `id`,
    `name`,
    `departement`,
    `situation`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    324,
    'Caussoles',
    NULL,
    1,
    '2022-08-29 15:50:00',
    '2022-08-29 15:50:00'
  );
INSERT INTO
  `localisations` (
    `id`,
    `name`,
    `departement`,
    `situation`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    312,
    'La Réunion',
    '974',
    3,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `localisations` (
    `id`,
    `name`,
    `departement`,
    `situation`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    314,
    'Saint-Barthélemy',
    '977',
    3,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `localisations` (
    `id`,
    `name`,
    `departement`,
    `situation`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    316,
    'Polynésie française',
    '987',
    3,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `localisations` (
    `id`,
    `name`,
    `departement`,
    `situation`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    317,
    'Terres australes et antarctiques françaises',
    '984',
    3,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `localisations` (
    `id`,
    `name`,
    `departement`,
    `situation`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    318,
    'Nouvelle-Calédonie',
    '988',
    3,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `localisations` (
    `id`,
    `name`,
    `departement`,
    `situation`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    319,
    'Ile de Clipperton',
    '989',
    3,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `localisations` (
    `id`,
    `name`,
    `departement`,
    `situation`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    327,
    'Menton',
    NULL,
    1,
    '2022-09-02 15:40:12',
    '2022-09-02 15:40:12'
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: marges
# ------------------------------------------------------------

INSERT INTO
  `marges` (`id`, `taux`, `designation`)
VALUES
  (
    1,
    21.00,
    'Commerce de détail en magasin non spécialisé'
  );
INSERT INTO
  `marges` (`id`, `taux`, `designation`)
VALUES
  (
    2,
    37.20,
    'Commerce de détail alimentaire en magasin spécialisé'
  );
INSERT INTO
  `marges` (`id`, `taux`, `designation`)
VALUES
  (
    3,
    39.00,
    'Commerce de détail sur éventaires et marchés'
  );
INSERT INTO
  `marges` (`id`, `taux`, `designation`)
VALUES
  (
    4,
    41.90,
    'Commerce de détail hors magasin, éventaires ou marchés'
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: mesures
# ------------------------------------------------------------

INSERT INTO
  `mesures` (
    `id`,
    `unit`,
    `rayon`,
    `type`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    1,
    'kg',
    '1_1, 1_2, 1_3, 2_4, 2_5, 2_6, 3_7, 3_8, 3_9',
    'mesure',
    '2022-08-22 11:25:22',
    '2022-08-22 11:25:22'
  );
INSERT INTO
  `mesures` (
    `id`,
    `unit`,
    `rayon`,
    `type`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    2,
    'g',
    '1_1, 1_2, 1_3, 2_4, 2_5, 2_6, 3_7, 3_8, 3_9',
    'mesure',
    '2022-08-22 11:25:22',
    '2022-08-22 11:25:22'
  );
INSERT INTO
  `mesures` (
    `id`,
    `unit`,
    `rayon`,
    `type`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    3,
    'ml',
    '3_7, 3_8, 3_9',
    'mesure',
    '2022-08-22 11:25:22',
    '2022-08-22 11:25:22'
  );
INSERT INTO
  `mesures` (
    `id`,
    `unit`,
    `rayon`,
    `type`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    4,
    'l',
    '3_7, 3_8, 3_9',
    'mesure',
    '2022-08-22 11:25:22',
    '2022-08-22 11:25:22'
  );
INSERT INTO
  `mesures` (
    `id`,
    `unit`,
    `rayon`,
    `type`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    5,
    'pièce',
    '1_1, 1_2, 1_3, 2_4, 2_5, 2_63_7,',
    'mesure',
    '2022-08-22 11:25:22',
    '2022-09-01 13:24:01'
  );
INSERT INTO
  `mesures` (
    `id`,
    `unit`,
    `rayon`,
    `type`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    8,
    'bouquet',
    '1_1, 1_2, 1_3, 2_4, 2_5, 2_6',
    'mesure',
    '2022-08-22 11:25:22',
    '2022-08-22 11:25:22'
  );
INSERT INTO
  `mesures` (
    `id`,
    `unit`,
    `rayon`,
    `type`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    11,
    'cl',
    '3_7, 3_8, 3_9',
    'mesure',
    '2022-08-22 11:25:22',
    '2022-08-22 11:25:22'
  );
INSERT INTO
  `mesures` (
    `id`,
    `unit`,
    `rayon`,
    `type`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    15,
    'barquette',
    '1_1, 1_2, 1_3, 2_4, 2_5, 2_6',
    'conditionnement',
    '2022-08-22 12:06:38',
    '2022-08-22 12:06:38'
  );
INSERT INTO
  `mesures` (
    `id`,
    `unit`,
    `rayon`,
    `type`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    16,
    'bouteille',
    '3_7, 3_8, 3_9',
    'conditionnement',
    '2022-08-22 12:06:38',
    '2022-08-22 12:06:38'
  );
INSERT INTO
  `mesures` (
    `id`,
    `unit`,
    `rayon`,
    `type`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    17,
    'sachet',
    '1_1, 1_2, 1_3, 2_4, 2_5, 2_6, 3_7, 3_8, 3_9',
    'conditionnement',
    '2022-08-22 12:08:42',
    '2022-08-22 12:08:42'
  );
INSERT INTO
  `mesures` (
    `id`,
    `unit`,
    `rayon`,
    `type`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    18,
    'bocal',
    '3_7, 3_8',
    'conditionnement',
    '2022-08-22 12:10:42',
    '2022-08-22 12:10:42'
  );
INSERT INTO
  `mesures` (
    `id`,
    `unit`,
    `rayon`,
    `type`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    19,
    'palette',
    '1_1, 1_2, 1_3, 2_4, 2_5, 2_6, 3_7, 3_8, 3_9',
    'conditionnement',
    '2022-08-22 12:15:23',
    '2022-08-22 12:15:23'
  );
INSERT INTO
  `mesures` (
    `id`,
    `unit`,
    `rayon`,
    `type`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    20,
    'cagette',
    '1_1, 1_2, 1_3, 2_4, 2_5, 2_6, 3_7, 3_8',
    'conditionnement',
    '2022-08-22 12:15:23',
    '2022-08-22 12:15:23'
  );
INSERT INTO
  `mesures` (
    `id`,
    `unit`,
    `rayon`,
    `type`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    22,
    'carton',
    '1_1, 1_2, 1_3, 2_4, 2_5, 2_6, 3_7, 3_8, 3_9',
    'conditionnement',
    '2022-08-22 12:15:23',
    '2022-08-22 12:15:23'
  );
INSERT INTO
  `mesures` (
    `id`,
    `unit`,
    `rayon`,
    `type`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    23,
    'sac',
    '1_1, 1_2, 1_3, 2_4, 2_5, 2_6, 3_7, 3_8, 3_9',
    'conditionnement',
    '2022-08-22 12:15:23',
    '2022-08-22 12:15:23'
  );
INSERT INTO
  `mesures` (
    `id`,
    `unit`,
    `rayon`,
    `type`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    25,
    'vrac',
    '1_1,2_4,',
    'conditionnement',
    '2022-08-30 09:44:19',
    '2022-09-01 12:37:17'
  );
INSERT INTO
  `mesures` (
    `id`,
    `unit`,
    `rayon`,
    `type`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    24,
    'grappe',
    '1_1,',
    'mesure',
    '2022-08-29 16:30:19',
    '2022-08-29 16:30:19'
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: produits
# ------------------------------------------------------------

INSERT INTO
  `produits` (
    `id_prod`,
    `name_prod`,
    `variety`,
    `id_family`,
    `id_category`,
    `cat_prod`,
    `order_prod`,
    `stock`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    1,
    'Artichauts',
    '3,4,',
    1,
    1,
    'lfrais',
    0,
    1,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `produits` (
    `id_prod`,
    `name_prod`,
    `variety`,
    `id_family`,
    `id_category`,
    `cat_prod`,
    `order_prod`,
    `stock`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    2,
    'Asperges',
    '7,8,9,',
    1,
    1,
    'lfrais',
    0,
    0,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `produits` (
    `id_prod`,
    `name_prod`,
    `variety`,
    `id_family`,
    `id_category`,
    `cat_prod`,
    `order_prod`,
    `stock`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    3,
    'Aubergines',
    '9,10,11',
    1,
    1,
    'lfrais',
    0,
    1,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `produits` (
    `id_prod`,
    `name_prod`,
    `variety`,
    `id_family`,
    `id_category`,
    `cat_prod`,
    `order_prod`,
    `stock`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    4,
    'Blettes',
    '0,7',
    1,
    1,
    'lfrais',
    0,
    1,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `produits` (
    `id_prod`,
    `name_prod`,
    `variety`,
    `id_family`,
    `id_category`,
    `cat_prod`,
    `order_prod`,
    `stock`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    5,
    'Brocolis',
    '0,',
    1,
    1,
    'lfrais',
    0,
    1,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `produits` (
    `id_prod`,
    `name_prod`,
    `variety`,
    `id_family`,
    `id_category`,
    `cat_prod`,
    `order_prod`,
    `stock`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    6,
    'Celeri branches',
    '0,',
    1,
    1,
    'lfrais',
    0,
    1,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `produits` (
    `id_prod`,
    `name_prod`,
    `variety`,
    `id_family`,
    `id_category`,
    `cat_prod`,
    `order_prod`,
    `stock`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    7,
    'Céleri raves',
    '0,',
    1,
    1,
    'lfrais',
    0,
    1,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `produits` (
    `id_prod`,
    `name_prod`,
    `variety`,
    `id_family`,
    `id_category`,
    `cat_prod`,
    `order_prod`,
    `stock`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    8,
    'Cèpes',
    '0,',
    1,
    1,
    'lfrais',
    0,
    1,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `produits` (
    `id_prod`,
    `name_prod`,
    `variety`,
    `id_family`,
    `id_category`,
    `cat_prod`,
    `order_prod`,
    `stock`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    9,
    'Champignons de Paris',
    '12,13',
    1,
    1,
    'lfrais',
    0,
    1,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `produits` (
    `id_prod`,
    `name_prod`,
    `variety`,
    `id_family`,
    `id_category`,
    `cat_prod`,
    `order_prod`,
    `stock`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    10,
    'Champignons cultivés',
    '0,',
    1,
    1,
    'lfrais',
    0,
    1,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `produits` (
    `id_prod`,
    `name_prod`,
    `variety`,
    `id_family`,
    `id_category`,
    `cat_prod`,
    `order_prod`,
    `stock`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    11,
    'Chicorées',
    '0,',
    1,
    1,
    'lfrais',
    0,
    1,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `produits` (
    `id_prod`,
    `name_prod`,
    `variety`,
    `id_family`,
    `id_category`,
    `cat_prod`,
    `order_prod`,
    `stock`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    12,
    'Choux kales',
    '0,',
    1,
    1,
    'lfrais',
    0,
    1,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `produits` (
    `id_prod`,
    `name_prod`,
    `variety`,
    `id_family`,
    `id_category`,
    `cat_prod`,
    `order_prod`,
    `stock`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    13,
    'Choux pommés',
    '0,',
    1,
    1,
    'lfrais',
    0,
    1,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `produits` (
    `id_prod`,
    `name_prod`,
    `variety`,
    `id_family`,
    `id_category`,
    `cat_prod`,
    `order_prod`,
    `stock`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    14,
    'Choux de Bruxelles',
    '0,',
    1,
    1,
    'lfrais',
    0,
    1,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `produits` (
    `id_prod`,
    `name_prod`,
    `variety`,
    `id_family`,
    `id_category`,
    `cat_prod`,
    `order_prod`,
    `stock`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    15,
    'Concombres',
    '0,',
    1,
    1,
    'lfrais',
    0,
    1,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `produits` (
    `id_prod`,
    `name_prod`,
    `variety`,
    `id_family`,
    `id_category`,
    `cat_prod`,
    `order_prod`,
    `stock`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    16,
    'Courges',
    '0,14,15',
    1,
    1,
    'lfrais',
    0,
    1,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `produits` (
    `id_prod`,
    `name_prod`,
    `variety`,
    `id_family`,
    `id_category`,
    `cat_prod`,
    `order_prod`,
    `stock`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    17,
    'Courgettes',
    '0,9,16,17',
    1,
    1,
    'lfrais',
    0,
    1,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `produits` (
    `id_prod`,
    `name_prod`,
    `variety`,
    `id_family`,
    `id_category`,
    `cat_prod`,
    `order_prod`,
    `stock`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    18,
    'Cressons',
    '0,',
    1,
    1,
    'lfrais',
    0,
    1,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `produits` (
    `id_prod`,
    `name_prod`,
    `variety`,
    `id_family`,
    `id_category`,
    `cat_prod`,
    `order_prod`,
    `stock`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    19,
    'Epinards',
    '0,',
    1,
    1,
    'lfrais',
    0,
    1,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `produits` (
    `id_prod`,
    `name_prod`,
    `variety`,
    `id_family`,
    `id_category`,
    `cat_prod`,
    `order_prod`,
    `stock`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    20,
    'Fenouils',
    '0,',
    1,
    1,
    'lfrais',
    0,
    1,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `produits` (
    `id_prod`,
    `name_prod`,
    `variety`,
    `id_family`,
    `id_category`,
    `cat_prod`,
    `order_prod`,
    `stock`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    21,
    'Fèves',
    '0,',
    1,
    1,
    'lfrais',
    0,
    0,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `produits` (
    `id_prod`,
    `name_prod`,
    `variety`,
    `id_family`,
    `id_category`,
    `cat_prod`,
    `order_prod`,
    `stock`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    22,
    'Germes de haricot mungo Soja vert',
    '0,',
    1,
    1,
    'lfrais',
    0,
    1,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `produits` (
    `id_prod`,
    `name_prod`,
    `variety`,
    `id_family`,
    `id_category`,
    `cat_prod`,
    `order_prod`,
    `stock`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    23,
    'Haricots verts',
    '0,',
    1,
    1,
    'lfrais',
    0,
    1,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `produits` (
    `id_prod`,
    `name_prod`,
    `variety`,
    `id_family`,
    `id_category`,
    `cat_prod`,
    `order_prod`,
    `stock`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    24,
    'Herbes aromatiques fraîches',
    '0,',
    1,
    1,
    'lfrais',
    0,
    1,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `produits` (
    `id_prod`,
    `name_prod`,
    `variety`,
    `id_family`,
    `id_category`,
    `cat_prod`,
    `order_prod`,
    `stock`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    25,
    'Mâches',
    '0,',
    1,
    1,
    'lfrais',
    0,
    1,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `produits` (
    `id_prod`,
    `name_prod`,
    `variety`,
    `id_family`,
    `id_category`,
    `cat_prod`,
    `order_prod`,
    `stock`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    26,
    'Morilles',
    '0,',
    1,
    1,
    'lfrais',
    0,
    1,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `produits` (
    `id_prod`,
    `name_prod`,
    `variety`,
    `id_family`,
    `id_category`,
    `cat_prod`,
    `order_prod`,
    `stock`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    27,
    'Oseilles',
    '0,',
    1,
    1,
    'lfrais',
    0,
    1,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `produits` (
    `id_prod`,
    `name_prod`,
    `variety`,
    `id_family`,
    `id_category`,
    `cat_prod`,
    `order_prod`,
    `stock`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    28,
    'Panais',
    '0,',
    1,
    1,
    'lfrais',
    0,
    1,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `produits` (
    `id_prod`,
    `name_prod`,
    `variety`,
    `id_family`,
    `id_category`,
    `cat_prod`,
    `order_prod`,
    `stock`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    29,
    'Petits pois',
    '0,',
    1,
    1,
    'lfrais',
    0,
    1,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `produits` (
    `id_prod`,
    `name_prod`,
    `variety`,
    `id_family`,
    `id_category`,
    `cat_prod`,
    `order_prod`,
    `stock`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    30,
    'Pois gourmands',
    '0,',
    1,
    1,
    'lfrais',
    0,
    1,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `produits` (
    `id_prod`,
    `name_prod`,
    `variety`,
    `id_family`,
    `id_category`,
    `cat_prod`,
    `order_prod`,
    `stock`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    31,
    'Poivrons',
    '0,',
    1,
    1,
    'lfrais',
    0,
    1,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `produits` (
    `id_prod`,
    `name_prod`,
    `variety`,
    `id_family`,
    `id_category`,
    `cat_prod`,
    `order_prod`,
    `stock`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    32,
    'Potirons',
    '0,',
    1,
    1,
    'lfrais',
    0,
    1,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `produits` (
    `id_prod`,
    `name_prod`,
    `variety`,
    `id_family`,
    `id_category`,
    `cat_prod`,
    `order_prod`,
    `stock`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    33,
    'Pourpiers',
    '0,',
    1,
    1,
    'lfrais',
    0,
    1,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `produits` (
    `id_prod`,
    `name_prod`,
    `variety`,
    `id_family`,
    `id_category`,
    `cat_prod`,
    `order_prod`,
    `stock`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    34,
    'Radis',
    '0,',
    1,
    1,
    'lfrais',
    0,
    1,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `produits` (
    `id_prod`,
    `name_prod`,
    `variety`,
    `id_family`,
    `id_category`,
    `cat_prod`,
    `order_prod`,
    `stock`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    35,
    'Rutabagas',
    '0,',
    1,
    1,
    'lfrais',
    0,
    1,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `produits` (
    `id_prod`,
    `name_prod`,
    `variety`,
    `id_family`,
    `id_category`,
    `cat_prod`,
    `order_prod`,
    `stock`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    36,
    'Salades',
    '0,',
    1,
    1,
    'lfrais',
    0,
    1,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `produits` (
    `id_prod`,
    `name_prod`,
    `variety`,
    `id_family`,
    `id_category`,
    `cat_prod`,
    `order_prod`,
    `stock`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    37,
    'Tomates',
    '0,',
    1,
    1,
    'lfrais',
    0,
    1,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `produits` (
    `id_prod`,
    `name_prod`,
    `variety`,
    `id_family`,
    `id_category`,
    `cat_prod`,
    `order_prod`,
    `stock`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    38,
    'Topinambours',
    '0,',
    1,
    1,
    'lfrais',
    0,
    1,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `produits` (
    `id_prod`,
    `name_prod`,
    `variety`,
    `id_family`,
    `id_category`,
    `cat_prod`,
    `order_prod`,
    `stock`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    39,
    'Truffes',
    '0,',
    1,
    1,
    'lfrais',
    0,
    1,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `produits` (
    `id_prod`,
    `name_prod`,
    `variety`,
    `id_family`,
    `id_category`,
    `cat_prod`,
    `order_prod`,
    `stock`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    40,
    'Lentilles',
    '5,6,',
    1,
    2,
    'lsecs',
    1,
    1,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `produits` (
    `id_prod`,
    `name_prod`,
    `variety`,
    `id_family`,
    `id_category`,
    `cat_prod`,
    `order_prod`,
    `stock`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    41,
    'Pois chiches',
    '0,',
    1,
    2,
    'lsecs',
    1,
    1,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `produits` (
    `id_prod`,
    `name_prod`,
    `variety`,
    `id_family`,
    `id_category`,
    `cat_prod`,
    `order_prod`,
    `stock`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    42,
    'Ail',
    '0,',
    1,
    3,
    'ltts',
    2,
    1,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `produits` (
    `id_prod`,
    `name_prod`,
    `variety`,
    `id_family`,
    `id_category`,
    `cat_prod`,
    `order_prod`,
    `stock`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    43,
    'Carottes',
    '0,',
    1,
    3,
    'ltts',
    2,
    1,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `produits` (
    `id_prod`,
    `name_prod`,
    `variety`,
    `id_family`,
    `id_category`,
    `cat_prod`,
    `order_prod`,
    `stock`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    44,
    'Chou-fleurs',
    '0,',
    1,
    3,
    'ltts',
    2,
    1,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `produits` (
    `id_prod`,
    `name_prod`,
    `variety`,
    `id_family`,
    `id_category`,
    `cat_prod`,
    `order_prod`,
    `stock`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    45,
    'Echalotes',
    '0,',
    1,
    3,
    'ltts',
    2,
    1,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `produits` (
    `id_prod`,
    `name_prod`,
    `variety`,
    `id_family`,
    `id_category`,
    `cat_prod`,
    `order_prod`,
    `stock`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    46,
    'Endives',
    '0,',
    1,
    3,
    'ltts',
    2,
    1,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `produits` (
    `id_prod`,
    `name_prod`,
    `variety`,
    `id_family`,
    `id_category`,
    `cat_prod`,
    `order_prod`,
    `stock`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    48,
    'Navets',
    '0,',
    1,
    3,
    'ltts',
    2,
    1,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `produits` (
    `id_prod`,
    `name_prod`,
    `variety`,
    `id_family`,
    `id_category`,
    `cat_prod`,
    `order_prod`,
    `stock`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    49,
    'Oignons',
    '0,',
    1,
    3,
    'ltts',
    2,
    1,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `produits` (
    `id_prod`,
    `name_prod`,
    `variety`,
    `id_family`,
    `id_category`,
    `cat_prod`,
    `order_prod`,
    `stock`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    50,
    'Patates douces',
    '0,',
    1,
    3,
    'ltts',
    2,
    1,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `produits` (
    `id_prod`,
    `name_prod`,
    `variety`,
    `id_family`,
    `id_category`,
    `cat_prod`,
    `order_prod`,
    `stock`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    51,
    'Persil',
    '0,',
    1,
    3,
    'ltts',
    2,
    1,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `produits` (
    `id_prod`,
    `name_prod`,
    `variety`,
    `id_family`,
    `id_category`,
    `cat_prod`,
    `order_prod`,
    `stock`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    52,
    'Poireaux',
    '0,',
    1,
    3,
    'ltts',
    2,
    1,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `produits` (
    `id_prod`,
    `name_prod`,
    `variety`,
    `id_family`,
    `id_category`,
    `cat_prod`,
    `order_prod`,
    `stock`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    53,
    'Pommes de terre',
    '0,',
    1,
    3,
    'ltts',
    2,
    1,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `produits` (
    `id_prod`,
    `name_prod`,
    `variety`,
    `id_family`,
    `id_category`,
    `cat_prod`,
    `order_prod`,
    `stock`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    54,
    'Abricots',
    '0,',
    2,
    4,
    'ffrais',
    0,
    1,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `produits` (
    `id_prod`,
    `name_prod`,
    `variety`,
    `id_family`,
    `id_category`,
    `cat_prod`,
    `order_prod`,
    `stock`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    55,
    'Cassis',
    '0,',
    2,
    4,
    'ffrais',
    0,
    1,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `produits` (
    `id_prod`,
    `name_prod`,
    `variety`,
    `id_family`,
    `id_category`,
    `cat_prod`,
    `order_prod`,
    `stock`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    56,
    'Cerises',
    '0,',
    2,
    4,
    'ffrais',
    0,
    1,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `produits` (
    `id_prod`,
    `name_prod`,
    `variety`,
    `id_family`,
    `id_category`,
    `cat_prod`,
    `order_prod`,
    `stock`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    57,
    'Châtaignes',
    '0,',
    2,
    4,
    'ffrais',
    0,
    1,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `produits` (
    `id_prod`,
    `name_prod`,
    `variety`,
    `id_family`,
    `id_category`,
    `cat_prod`,
    `order_prod`,
    `stock`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    803,
    'Citrons',
    '0,',
    2,
    4,
    'ffrais',
    0,
    1,
    '2022-06-02 16:30:54',
    '2022-06-02 16:30:54'
  );
INSERT INTO
  `produits` (
    `id_prod`,
    `name_prod`,
    `variety`,
    `id_family`,
    `id_category`,
    `cat_prod`,
    `order_prod`,
    `stock`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    59,
    'Clémentines',
    '0,',
    2,
    4,
    'ffrais',
    0,
    1,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `produits` (
    `id_prod`,
    `name_prod`,
    `variety`,
    `id_family`,
    `id_category`,
    `cat_prod`,
    `order_prod`,
    `stock`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    60,
    'Coings',
    '0,',
    2,
    4,
    'ffrais',
    0,
    1,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `produits` (
    `id_prod`,
    `name_prod`,
    `variety`,
    `id_family`,
    `id_category`,
    `cat_prod`,
    `order_prod`,
    `stock`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    61,
    'Figues',
    '0,',
    2,
    4,
    'ffrais',
    0,
    1,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `produits` (
    `id_prod`,
    `name_prod`,
    `variety`,
    `id_family`,
    `id_category`,
    `cat_prod`,
    `order_prod`,
    `stock`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    62,
    'Figues de Barbarie',
    '0,',
    2,
    4,
    'ffrais',
    0,
    1,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `produits` (
    `id_prod`,
    `name_prod`,
    `variety`,
    `id_family`,
    `id_category`,
    `cat_prod`,
    `order_prod`,
    `stock`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    63,
    'Fleurs comestibles',
    '0,',
    2,
    4,
    'ffrais',
    0,
    1,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `produits` (
    `id_prod`,
    `name_prod`,
    `variety`,
    `id_family`,
    `id_category`,
    `cat_prod`,
    `order_prod`,
    `stock`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    64,
    'Fraisse',
    '0,',
    2,
    4,
    'ffrais',
    0,
    1,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `produits` (
    `id_prod`,
    `name_prod`,
    `variety`,
    `id_family`,
    `id_category`,
    `cat_prod`,
    `order_prod`,
    `stock`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    65,
    'Framboises',
    '0,',
    2,
    4,
    'ffrais',
    0,
    1,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `produits` (
    `id_prod`,
    `name_prod`,
    `variety`,
    `id_family`,
    `id_category`,
    `cat_prod`,
    `order_prod`,
    `stock`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    66,
    'Groseilles',
    '0,',
    2,
    4,
    'ffrais',
    0,
    1,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `produits` (
    `id_prod`,
    `name_prod`,
    `variety`,
    `id_family`,
    `id_category`,
    `cat_prod`,
    `order_prod`,
    `stock`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    67,
    'Kakis',
    '0,',
    2,
    4,
    'ffrais',
    0,
    1,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `produits` (
    `id_prod`,
    `name_prod`,
    `variety`,
    `id_family`,
    `id_category`,
    `cat_prod`,
    `order_prod`,
    `stock`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    68,
    'Mandarines',
    '0,',
    2,
    4,
    'ffrais',
    0,
    1,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `produits` (
    `id_prod`,
    `name_prod`,
    `variety`,
    `id_family`,
    `id_category`,
    `cat_prod`,
    `order_prod`,
    `stock`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    69,
    'Melons',
    '0,',
    2,
    4,
    'ffrais',
    0,
    1,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `produits` (
    `id_prod`,
    `name_prod`,
    `variety`,
    `id_family`,
    `id_category`,
    `cat_prod`,
    `order_prod`,
    `stock`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    70,
    'Mirabelles',
    '0,',
    2,
    4,
    'ffrais',
    0,
    1,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `produits` (
    `id_prod`,
    `name_prod`,
    `variety`,
    `id_family`,
    `id_category`,
    `cat_prod`,
    `order_prod`,
    `stock`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    71,
    'Mûres',
    '0,',
    2,
    4,
    'ffrais',
    0,
    1,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `produits` (
    `id_prod`,
    `name_prod`,
    `variety`,
    `id_family`,
    `id_category`,
    `cat_prod`,
    `order_prod`,
    `stock`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    72,
    'Myrtilles',
    '0,',
    2,
    4,
    'ffrais',
    0,
    1,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `produits` (
    `id_prod`,
    `name_prod`,
    `variety`,
    `id_family`,
    `id_category`,
    `cat_prod`,
    `order_prod`,
    `stock`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    73,
    'Nectarines',
    '0,',
    2,
    4,
    'ffrais',
    0,
    1,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `produits` (
    `id_prod`,
    `name_prod`,
    `variety`,
    `id_family`,
    `id_category`,
    `cat_prod`,
    `order_prod`,
    `stock`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    74,
    'Oranges',
    '0,',
    2,
    4,
    'ffrais',
    0,
    1,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `produits` (
    `id_prod`,
    `name_prod`,
    `variety`,
    `id_family`,
    `id_category`,
    `cat_prod`,
    `order_prod`,
    `stock`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    75,
    'Pastèque',
    '0,',
    2,
    4,
    'ffrais',
    0,
    1,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `produits` (
    `id_prod`,
    `name_prod`,
    `variety`,
    `id_family`,
    `id_category`,
    `cat_prod`,
    `order_prod`,
    `stock`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    76,
    'Pêches',
    '0,',
    2,
    4,
    'ffrais',
    0,
    1,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `produits` (
    `id_prod`,
    `name_prod`,
    `variety`,
    `id_family`,
    `id_category`,
    `cat_prod`,
    `order_prod`,
    `stock`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    77,
    'Poires',
    '0,',
    2,
    4,
    'ffrais',
    0,
    1,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `produits` (
    `id_prod`,
    `name_prod`,
    `variety`,
    `id_family`,
    `id_category`,
    `cat_prod`,
    `order_prod`,
    `stock`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    78,
    'Pomelos',
    '0,',
    2,
    4,
    'ffrais',
    0,
    1,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `produits` (
    `id_prod`,
    `name_prod`,
    `variety`,
    `id_family`,
    `id_category`,
    `cat_prod`,
    `order_prod`,
    `stock`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    79,
    'Pommes',
    '0,',
    2,
    4,
    'ffrais',
    0,
    1,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `produits` (
    `id_prod`,
    `name_prod`,
    `variety`,
    `id_family`,
    `id_category`,
    `cat_prod`,
    `order_prod`,
    `stock`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    80,
    'Prunes',
    '0,',
    2,
    4,
    'ffrais',
    0,
    1,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `produits` (
    `id_prod`,
    `name_prod`,
    `variety`,
    `id_family`,
    `id_category`,
    `cat_prod`,
    `order_prod`,
    `stock`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    81,
    'Raisins',
    '0,',
    2,
    4,
    'ffrais',
    0,
    1,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `produits` (
    `id_prod`,
    `name_prod`,
    `variety`,
    `id_family`,
    `id_category`,
    `cat_prod`,
    `order_prod`,
    `stock`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    82,
    'Rhubarbe',
    '0,',
    2,
    4,
    'ffrais',
    0,
    1,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `produits` (
    `id_prod`,
    `name_prod`,
    `variety`,
    `id_family`,
    `id_category`,
    `cat_prod`,
    `order_prod`,
    `stock`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    83,
    'Amandes',
    '0,',
    2,
    5,
    'fsecs',
    1,
    1,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `produits` (
    `id_prod`,
    `name_prod`,
    `variety`,
    `id_family`,
    `id_category`,
    `cat_prod`,
    `order_prod`,
    `stock`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    84,
    'Dattes',
    '0,',
    2,
    5,
    'fsecs',
    1,
    1,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `produits` (
    `id_prod`,
    `name_prod`,
    `variety`,
    `id_family`,
    `id_category`,
    `cat_prod`,
    `order_prod`,
    `stock`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    85,
    'Noisettes',
    '0,',
    2,
    5,
    'fsecs',
    1,
    1,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `produits` (
    `id_prod`,
    `name_prod`,
    `variety`,
    `id_family`,
    `id_category`,
    `cat_prod`,
    `order_prod`,
    `stock`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    86,
    'Noix',
    '0,',
    2,
    5,
    'fsecs',
    1,
    1,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `produits` (
    `id_prod`,
    `name_prod`,
    `variety`,
    `id_family`,
    `id_category`,
    `cat_prod`,
    `order_prod`,
    `stock`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    87,
    'Pignons de pin',
    '0,',
    2,
    5,
    'fsecs',
    1,
    1,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `produits` (
    `id_prod`,
    `name_prod`,
    `variety`,
    `id_family`,
    `id_category`,
    `cat_prod`,
    `order_prod`,
    `stock`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    88,
    'Ananas',
    '0,18',
    2,
    6,
    'fexotiques',
    2,
    1,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `produits` (
    `id_prod`,
    `name_prod`,
    `variety`,
    `id_family`,
    `id_category`,
    `cat_prod`,
    `order_prod`,
    `stock`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    89,
    'Anones',
    '0,',
    2,
    6,
    'fexotiques',
    2,
    1,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `produits` (
    `id_prod`,
    `name_prod`,
    `variety`,
    `id_family`,
    `id_category`,
    `cat_prod`,
    `order_prod`,
    `stock`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    90,
    'Avocats',
    '0,',
    2,
    6,
    'fexotiques',
    2,
    1,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `produits` (
    `id_prod`,
    `name_prod`,
    `variety`,
    `id_family`,
    `id_category`,
    `cat_prod`,
    `order_prod`,
    `stock`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    91,
    'Bananes',
    '0,19,20',
    2,
    6,
    'fexotiques',
    2,
    1,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `produits` (
    `id_prod`,
    `name_prod`,
    `variety`,
    `id_family`,
    `id_category`,
    `cat_prod`,
    `order_prod`,
    `stock`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    92,
    'Caramboles',
    '0,',
    2,
    6,
    'fexotiques',
    2,
    1,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `produits` (
    `id_prod`,
    `name_prod`,
    `variety`,
    `id_family`,
    `id_category`,
    `cat_prod`,
    `order_prod`,
    `stock`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    93,
    'Citrons verts',
    '0,',
    2,
    6,
    'fexotiques',
    2,
    1,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `produits` (
    `id_prod`,
    `name_prod`,
    `variety`,
    `id_family`,
    `id_category`,
    `cat_prod`,
    `order_prod`,
    `stock`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    94,
    'Fruits de la passion',
    '0,',
    2,
    6,
    'fexotiques',
    2,
    1,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `produits` (
    `id_prod`,
    `name_prod`,
    `variety`,
    `id_family`,
    `id_category`,
    `cat_prod`,
    `order_prod`,
    `stock`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    95,
    'Goyaves',
    '0,',
    2,
    6,
    'fexotiques',
    2,
    1,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `produits` (
    `id_prod`,
    `name_prod`,
    `variety`,
    `id_family`,
    `id_category`,
    `cat_prod`,
    `order_prod`,
    `stock`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    96,
    'Grenades',
    '0,',
    2,
    6,
    'fexotiques',
    2,
    1,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `produits` (
    `id_prod`,
    `name_prod`,
    `variety`,
    `id_family`,
    `id_category`,
    `cat_prod`,
    `order_prod`,
    `stock`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    97,
    'Kiwis',
    '0,',
    2,
    6,
    'fexotiques',
    2,
    1,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `produits` (
    `id_prod`,
    `name_prod`,
    `variety`,
    `id_family`,
    `id_category`,
    `cat_prod`,
    `order_prod`,
    `stock`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    98,
    'Litchis',
    '0,',
    2,
    6,
    'fexotiques',
    2,
    1,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `produits` (
    `id_prod`,
    `name_prod`,
    `variety`,
    `id_family`,
    `id_category`,
    `cat_prod`,
    `order_prod`,
    `stock`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    99,
    'Mangoustans',
    '0,',
    2,
    6,
    'fexotiques',
    2,
    1,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `produits` (
    `id_prod`,
    `name_prod`,
    `variety`,
    `id_family`,
    `id_category`,
    `cat_prod`,
    `order_prod`,
    `stock`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    100,
    'Mangues',
    '0,',
    2,
    6,
    'fexotiques',
    2,
    1,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `produits` (
    `id_prod`,
    `name_prod`,
    `variety`,
    `id_family`,
    `id_category`,
    `cat_prod`,
    `order_prod`,
    `stock`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    101,
    'Noix de coco',
    '0,',
    2,
    6,
    'fexotiques',
    2,
    1,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `produits` (
    `id_prod`,
    `name_prod`,
    `variety`,
    `id_family`,
    `id_category`,
    `cat_prod`,
    `order_prod`,
    `stock`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    102,
    'Papayes',
    '0,',
    2,
    6,
    'fexotiques',
    2,
    1,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `produits` (
    `id_prod`,
    `name_prod`,
    `variety`,
    `id_family`,
    `id_category`,
    `cat_prod`,
    `order_prod`,
    `stock`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    103,
    'Physalis',
    '0,',
    2,
    6,
    'fexotiques',
    2,
    1,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `produits` (
    `id_prod`,
    `name_prod`,
    `variety`,
    `id_family`,
    `id_category`,
    `cat_prod`,
    `order_prod`,
    `stock`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    104,
    'Pitayas',
    '0,',
    2,
    6,
    'fexotiques',
    2,
    1,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `produits` (
    `id_prod`,
    `name_prod`,
    `variety`,
    `id_family`,
    `id_category`,
    `cat_prod`,
    `order_prod`,
    `stock`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    105,
    'Sapotilles',
    '0,',
    2,
    6,
    'fexotiques',
    2,
    1,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `produits` (
    `id_prod`,
    `name_prod`,
    `variety`,
    `id_family`,
    `id_category`,
    `cat_prod`,
    `order_prod`,
    `stock`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    106,
    'Betteraves',
    '0,',
    3,
    7,
    'pprepa',
    0,
    1,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `produits` (
    `id_prod`,
    `name_prod`,
    `variety`,
    `id_family`,
    `id_category`,
    `cat_prod`,
    `order_prod`,
    `stock`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    107,
    'Olives vertes',
    '0,',
    3,
    7,
    'pprepa',
    0,
    1,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `produits` (
    `id_prod`,
    `name_prod`,
    `variety`,
    `id_family`,
    `id_category`,
    `cat_prod`,
    `order_prod`,
    `stock`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    108,
    'Olives noires',
    '1,2,',
    3,
    7,
    'pprepa',
    0,
    1,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `produits` (
    `id_prod`,
    `name_prod`,
    `variety`,
    `id_family`,
    `id_category`,
    `cat_prod`,
    `order_prod`,
    `stock`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    109,
    'Haricots blancs',
    '0,',
    3,
    8,
    'pmanu',
    1,
    1,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `produits` (
    `id_prod`,
    `name_prod`,
    `variety`,
    `id_family`,
    `id_category`,
    `cat_prod`,
    `order_prod`,
    `stock`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    799,
    'Potimarron',
    '0,',
    1,
    1,
    'lfrais',
    0,
    1,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `produits` (
    `id_prod`,
    `name_prod`,
    `variety`,
    `id_family`,
    `id_category`,
    `cat_prod`,
    `order_prod`,
    `stock`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    805,
    'Sorbet ananas',
    '0,18',
    3,
    9,
    'pcong',
    3,
    1,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: promotions
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: rayons
# ------------------------------------------------------------

INSERT INTO
  `rayons` (
    `id`,
    `cat`,
    `category_description`,
    `cat_description`,
    `products`,
    `family_abbreviation`,
    `category_abbreviation`,
    `family_sass`,
    `category_text`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    1,
    'lfrais',
    'frais',
    'Légumes frais',
    'true',
    1,
    1,
    'leg',
    'Lorem ipsum dolor sit amet consectetur adipisicing elit. Expedita explicabo reiciendis, saepe quas fuga quam. Quaerat dicta iure quod vitae est atque porro, natus mollitia, eaque rem quas cumque repudiandae!',
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `rayons` (
    `id`,
    `cat`,
    `category_description`,
    `cat_description`,
    `products`,
    `family_abbreviation`,
    `category_abbreviation`,
    `family_sass`,
    `category_text`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    2,
    'lsecs',
    'secs',
    'Légumes secs',
    'true',
    1,
    2,
    'leg',
    'Lorem ipsum dolor sit amet consectetur adipisicing elit. Expedita explicabo reiciendis, saepe quas fuga quam. Quaerat dicta iure quod vitae est atque porro, natus mollitia, eaque rem quas cumque repudiandae!',
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `rayons` (
    `id`,
    `cat`,
    `category_description`,
    `cat_description`,
    `products`,
    `family_abbreviation`,
    `category_abbreviation`,
    `family_sass`,
    `category_text`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    3,
    'ltts',
    'toutes saisons',
    'Légumes toutes saisons',
    'true',
    1,
    3,
    'leg',
    'Lorem ipsum dolor sit amet consectetur adipisicing elit. Expedita explicabo reiciendis, saepe quas fuga quam. Quaerat dicta iure quod vitae est atque porro, natus mollitia, eaque rem quas cumque repudiandae!',
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `rayons` (
    `id`,
    `cat`,
    `category_description`,
    `cat_description`,
    `products`,
    `family_abbreviation`,
    `category_abbreviation`,
    `family_sass`,
    `category_text`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    4,
    'ffrais',
    'frais',
    'Fruits frais',
    'true',
    2,
    1,
    'fruit',
    'Lorem ipsum dolor sit amet consectetur adipisicing elit. Expedita explicabo reiciendis, saepe quas fuga quam. Quaerat dicta iure quod vitae est atque porro, natus mollitia, eaque rem quas cumque repudiandae!',
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `rayons` (
    `id`,
    `cat`,
    `category_description`,
    `cat_description`,
    `products`,
    `family_abbreviation`,
    `category_abbreviation`,
    `family_sass`,
    `category_text`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    5,
    'fsecs',
    'secs',
    'Fruits secs',
    'true',
    2,
    2,
    'fruit',
    'Lorem ipsum dolor sit amet consectetur adipisicing elit. Expedita explicabo reiciendis, saepe quas fuga quam. Quaerat dicta iure quod vitae est atque porro, natus mollitia, eaque rem quas cumque repudiandae!',
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `rayons` (
    `id`,
    `cat`,
    `category_description`,
    `cat_description`,
    `products`,
    `family_abbreviation`,
    `category_abbreviation`,
    `family_sass`,
    `category_text`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    6,
    'fexotiques',
    'exotiques',
    'Fruits exotiques',
    'true',
    2,
    3,
    'fruit',
    'Lorem ipsum dolor sit amet consectetur adipisicing elit. Expedita explicabo reiciendis, saepe quas fuga quam. Quaerat dicta iure quod vitae est atque porro, natus mollitia, eaque rem quas cumque repudiandae!',
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `rayons` (
    `id`,
    `cat`,
    `category_description`,
    `cat_description`,
    `products`,
    `family_abbreviation`,
    `category_abbreviation`,
    `family_sass`,
    `category_text`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    7,
    'pprepa',
    'préparés',
    'Produits préparés',
    'true',
    3,
    1,
    'prod',
    'Lorem ipsum dolor sit amet consectetur adipisicing elit. Expedita explicabo reiciendis, saepe quas fuga quam. Quaerat dicta iure quod vitae est atque porro, natus mollitia, eaque rem quas cumque repudiandae!',
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `rayons` (
    `id`,
    `cat`,
    `category_description`,
    `cat_description`,
    `products`,
    `family_abbreviation`,
    `category_abbreviation`,
    `family_sass`,
    `category_text`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    8,
    'pmanu',
    'manufacturés',
    'Produits manufacturés',
    'true',
    3,
    2,
    'prod',
    'Lorem ipsum dolor sit amet consectetur adipisicing elit. Expedita explicabo reiciendis, saepe quas fuga quam. Quaerat dicta iure quod vitae est atque porro, natus mollitia, eaque rem quas cumque repudiandae!',
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `rayons` (
    `id`,
    `cat`,
    `category_description`,
    `cat_description`,
    `products`,
    `family_abbreviation`,
    `category_abbreviation`,
    `family_sass`,
    `category_text`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    9,
    'pcong',
    'congelés',
    'Produits congelés',
    'true',
    3,
    3,
    'prod',
    'Lorem ipsum dolor sit amet consectetur adipisicing elit. Expedita explicabo reiciendis, saepe quas fuga quam. Quaerat dicta iure quod vitae est atque porro, natus mollitia, eaque rem quas cumque repudiandae!',
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `rayons` (
    `id`,
    `cat`,
    `category_description`,
    `cat_description`,
    `products`,
    `family_abbreviation`,
    `category_abbreviation`,
    `family_sass`,
    `category_text`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    10,
    'tools',
    'outils',
    'Outils',
    'true',
    0,
    0,
    'tools',
    'Lorem ipsum dolor sit amet consectetur adipisicing elit. Expedita explicabo reiciendis, saepe quas fuga quam. Quaerat dicta iure quod vitae est atque porro, natus mollitia, eaque rem quas cumque repudiandae!',
    '2022-08-08 12:01:34',
    '2022-08-08 12:01:34'
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: stocks
# ------------------------------------------------------------

INSERT INTO
  `stocks` (
    `id`,
    `week`,
    `departement`,
    `user_id`,
    `id_prod`,
    `name`,
    `variety`,
    `description`,
    `image`,
    `agr`,
    `loc`,
    `four`,
    `mes`,
    `cond`,
    `pf`,
    `marge`,
    `quantity`,
    `arrival`,
    `commande`,
    `stock_arrival`,
    `stock_current`,
    `clone`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    16,
    '2022-W35',
    '1_1',
    0,
    '1_1_2_9_1_241_24_8_',
    'Asperges',
    'blanches',
    NULL,
    NULL,
    'Bio',
    'Grasse',
    'Test',
    'bouquet',
    '',
    '1.00',
    '',
    '1.00',
    '2022-08-26',
    NULL,
    '15.00',
    '15.00',
    '2022-W34',
    '2022-08-31 15:54:23',
    '2022-08-31 15:54:23'
  );
INSERT INTO
  `stocks` (
    `id`,
    `week`,
    `departement`,
    `user_id`,
    `id_prod`,
    `name`,
    `variety`,
    `description`,
    `image`,
    `agr`,
    `loc`,
    `four`,
    `mes`,
    `cond`,
    `pf`,
    `marge`,
    `quantity`,
    `arrival`,
    `commande`,
    `stock_arrival`,
    `stock_current`,
    `clone`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    17,
    '2022-W35',
    '1_1',
    0,
    '1_1_5__1_276_24_5_',
    'Brocolis',
    '',
    NULL,
    NULL,
    'Bio',
    'Mouans-Sartoux',
    'Test',
    'pièce',
    '',
    '0.50',
    '',
    '1.00',
    '2022-08-26',
    NULL,
    '60.00',
    '60.00',
    '2022-W34',
    '2022-08-31 15:54:23',
    '2022-08-31 15:54:23'
  );
INSERT INTO
  `stocks` (
    `id`,
    `week`,
    `departement`,
    `user_id`,
    `id_prod`,
    `name`,
    `variety`,
    `description`,
    `image`,
    `agr`,
    `loc`,
    `four`,
    `mes`,
    `cond`,
    `pf`,
    `marge`,
    `quantity`,
    `arrival`,
    `commande`,
    `stock_arrival`,
    `stock_current`,
    `clone`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    18,
    '2022-W35',
    '1_1',
    0,
    '1_1_3_11_3_4_24_1_',
    'Aubergines',
    'tigrées',
    NULL,
    NULL,
    'Traditionnelle',
    'Alpes-de-Haute-Provence',
    'Test',
    'kg',
    '',
    '5.00',
    '',
    '1.00',
    '2022-08-26',
    NULL,
    '5.00',
    '5.00',
    '2022-W34',
    '2022-08-31 15:54:23',
    '2022-08-31 15:54:23'
  );
INSERT INTO
  `stocks` (
    `id`,
    `week`,
    `departement`,
    `user_id`,
    `id_prod`,
    `name`,
    `variety`,
    `description`,
    `image`,
    `agr`,
    `loc`,
    `four`,
    `mes`,
    `cond`,
    `pf`,
    `marge`,
    `quantity`,
    `arrival`,
    `commande`,
    `stock_arrival`,
    `stock_current`,
    `clone`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    19,
    '2022-W35',
    '1_1',
    0,
    '1_1_1_3_1_274_24_8_',
    'Artichauts',
    'poivrades',
    NULL,
    NULL,
    'Bio',
    'Peymeinade',
    'Test',
    'bouquet',
    '',
    '2.00',
    '',
    '1.00',
    '2022-08-26',
    NULL,
    '30.00',
    '30.00',
    '2022-W34',
    '2022-08-31 15:54:23',
    '2022-08-31 15:54:23'
  );
INSERT INTO
  `stocks` (
    `id`,
    `week`,
    `departement`,
    `user_id`,
    `id_prod`,
    `name`,
    `variety`,
    `description`,
    `image`,
    `agr`,
    `loc`,
    `four`,
    `mes`,
    `cond`,
    `pf`,
    `marge`,
    `quantity`,
    `arrival`,
    `commande`,
    `stock_arrival`,
    `stock_current`,
    `clone`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    20,
    '2022-W35',
    '1_1',
    0,
    '1_1_2_8_2_218_24_2_',
    'Asperges',
    'vertes',
    NULL,
    NULL,
    'Raisonnée',
    'Monaco',
    'Test',
    'g',
    '',
    '3.00',
    '',
    '100.00',
    '2022-08-26',
    NULL,
    '40.00',
    '40.00',
    '2022-W34',
    '2022-08-31 15:54:23',
    '2022-08-31 15:54:23'
  );
INSERT INTO
  `stocks` (
    `id`,
    `week`,
    `departement`,
    `user_id`,
    `id_prod`,
    `name`,
    `variety`,
    `description`,
    `image`,
    `agr`,
    `loc`,
    `four`,
    `mes`,
    `cond`,
    `pf`,
    `marge`,
    `quantity`,
    `arrival`,
    `commande`,
    `stock_arrival`,
    `stock_current`,
    `clone`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    31,
    '2022-W35',
    '2_4',
    0,
    '2_4_55__1_324_24_1_25',
    'Cassis',
    '',
    NULL,
    NULL,
    'Bio',
    'Caussoles',
    'Test',
    'kg',
    'vrac',
    '2.00',
    '',
    '1.00',
    '2022-09-01',
    NULL,
    '5.00',
    '5.00',
    '',
    '2022-09-01 13:15:05',
    '2022-09-01 13:15:05'
  );
INSERT INTO
  `stocks` (
    `id`,
    `week`,
    `departement`,
    `user_id`,
    `id_prod`,
    `name`,
    `variety`,
    `description`,
    `image`,
    `agr`,
    `loc`,
    `four`,
    `mes`,
    `cond`,
    `pf`,
    `marge`,
    `quantity`,
    `arrival`,
    `commande`,
    `stock_arrival`,
    `stock_current`,
    `clone`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    32,
    '2022-W35',
    '2_4',
    0,
    '2_4_54__1_324_24_1_20',
    'Abricots',
    '',
    NULL,
    NULL,
    'Bio',
    'Caussoles',
    'Test',
    'kg',
    'cagette',
    '3.00',
    '',
    '1.00',
    '2022-09-01',
    NULL,
    '2.00',
    '2.00',
    '',
    '2022-09-01 13:18:12',
    '2022-09-01 13:18:12'
  );
INSERT INTO
  `stocks` (
    `id`,
    `week`,
    `departement`,
    `user_id`,
    `id_prod`,
    `name`,
    `variety`,
    `description`,
    `image`,
    `agr`,
    `loc`,
    `four`,
    `mes`,
    `cond`,
    `pf`,
    `marge`,
    `quantity`,
    `arrival`,
    `commande`,
    `stock_arrival`,
    `stock_current`,
    `clone`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    34,
    '2022-W35',
    '3_7',
    0,
    '3_7_108_1_1_278_28__18',
    'Olives noires',
    'de Nyons',
    NULL,
    NULL,
    'Bio',
    'Drôme',
    'ONyons',
    '',
    'bocal',
    '7.00',
    '',
    '1.00',
    '2022-09-02',
    NULL,
    '50.00',
    '50.00',
    '',
    '2022-09-02 09:07:07',
    '2022-09-02 09:07:07'
  );
INSERT INTO
  `stocks` (
    `id`,
    `week`,
    `departement`,
    `user_id`,
    `id_prod`,
    `name`,
    `variety`,
    `description`,
    `image`,
    `agr`,
    `loc`,
    `four`,
    `mes`,
    `cond`,
    `pf`,
    `marge`,
    `quantity`,
    `arrival`,
    `commande`,
    `stock_arrival`,
    `stock_current`,
    `clone`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    283,
    '2022-W37',
    '1_1',
    133,
    '1_1_2_9_1_241_24_8_',
    'Asperges',
    'blanches',
    NULL,
    NULL,
    'Bio',
    'Grasse',
    'Test',
    'bouquet',
    '',
    '1.00',
    '',
    '1.00',
    '2022-08-26',
    NULL,
    '15.00',
    '15.00',
    '2022-W35',
    '2022-09-14 08:01:45',
    '2022-09-14 08:01:45'
  );
INSERT INTO
  `stocks` (
    `id`,
    `week`,
    `departement`,
    `user_id`,
    `id_prod`,
    `name`,
    `variety`,
    `description`,
    `image`,
    `agr`,
    `loc`,
    `four`,
    `mes`,
    `cond`,
    `pf`,
    `marge`,
    `quantity`,
    `arrival`,
    `commande`,
    `stock_arrival`,
    `stock_current`,
    `clone`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    284,
    '2022-W37',
    '1_1',
    133,
    '1_1_5__1_276_24_5_',
    'Brocolis',
    '',
    NULL,
    NULL,
    'Bio',
    'Mouans-Sartoux',
    'Test',
    'pièce',
    '',
    '0.50',
    '',
    '1.00',
    '2022-08-26',
    NULL,
    '60.00',
    '60.00',
    '2022-W35',
    '2022-09-14 08:01:45',
    '2022-09-14 08:01:45'
  );
INSERT INTO
  `stocks` (
    `id`,
    `week`,
    `departement`,
    `user_id`,
    `id_prod`,
    `name`,
    `variety`,
    `description`,
    `image`,
    `agr`,
    `loc`,
    `four`,
    `mes`,
    `cond`,
    `pf`,
    `marge`,
    `quantity`,
    `arrival`,
    `commande`,
    `stock_arrival`,
    `stock_current`,
    `clone`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    285,
    '2022-W37',
    '1_1',
    133,
    '1_1_3_11_3_4_24_1_',
    'Aubergines',
    'tigrées',
    NULL,
    NULL,
    'Traditionnelle',
    'Alpes-de-Haute-Provence',
    'Test',
    'kg',
    '',
    '5.00',
    '',
    '1.00',
    '2022-08-26',
    NULL,
    '5.00',
    '5.00',
    '2022-W35',
    '2022-09-14 08:01:45',
    '2022-09-14 08:01:45'
  );
INSERT INTO
  `stocks` (
    `id`,
    `week`,
    `departement`,
    `user_id`,
    `id_prod`,
    `name`,
    `variety`,
    `description`,
    `image`,
    `agr`,
    `loc`,
    `four`,
    `mes`,
    `cond`,
    `pf`,
    `marge`,
    `quantity`,
    `arrival`,
    `commande`,
    `stock_arrival`,
    `stock_current`,
    `clone`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    286,
    '2022-W37',
    '2_4',
    133,
    '2_4_54__1_324_24_1_20',
    'Abricots',
    '',
    NULL,
    NULL,
    'Bio',
    'Caussoles',
    'Test',
    'kg',
    'cagette',
    '3.00',
    '',
    '1.00',
    '2022-09-01',
    NULL,
    '2.00',
    '2.00',
    '2022-W35',
    '2022-09-14 08:01:45',
    '2022-09-14 08:01:45'
  );
INSERT INTO
  `stocks` (
    `id`,
    `week`,
    `departement`,
    `user_id`,
    `id_prod`,
    `name`,
    `variety`,
    `description`,
    `image`,
    `agr`,
    `loc`,
    `four`,
    `mes`,
    `cond`,
    `pf`,
    `marge`,
    `quantity`,
    `arrival`,
    `commande`,
    `stock_arrival`,
    `stock_current`,
    `clone`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    287,
    '2022-W37',
    '1_1',
    133,
    '1_1_1_3_1_274_24_8_',
    'Artichauts',
    'poivrades',
    NULL,
    NULL,
    'Bio',
    'Peymeinade',
    'Test',
    'bouquet',
    '',
    '2.00',
    '',
    '1.00',
    '2022-08-26',
    NULL,
    '30.00',
    '30.00',
    '2022-W35',
    '2022-09-14 08:01:45',
    '2022-09-14 08:01:45'
  );
INSERT INTO
  `stocks` (
    `id`,
    `week`,
    `departement`,
    `user_id`,
    `id_prod`,
    `name`,
    `variety`,
    `description`,
    `image`,
    `agr`,
    `loc`,
    `four`,
    `mes`,
    `cond`,
    `pf`,
    `marge`,
    `quantity`,
    `arrival`,
    `commande`,
    `stock_arrival`,
    `stock_current`,
    `clone`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    288,
    '2022-W37',
    '1_1',
    133,
    '1_1_2_8_2_218_24_2_',
    'Asperges',
    'vertes',
    NULL,
    NULL,
    'Raisonnée',
    'Monaco',
    'Test',
    'g',
    '',
    '3.00',
    '',
    '100.00',
    '2022-08-26',
    NULL,
    '40.00',
    '40.00',
    '2022-W35',
    '2022-09-14 08:01:45',
    '2022-09-14 08:01:45'
  );
INSERT INTO
  `stocks` (
    `id`,
    `week`,
    `departement`,
    `user_id`,
    `id_prod`,
    `name`,
    `variety`,
    `description`,
    `image`,
    `agr`,
    `loc`,
    `four`,
    `mes`,
    `cond`,
    `pf`,
    `marge`,
    `quantity`,
    `arrival`,
    `commande`,
    `stock_arrival`,
    `stock_current`,
    `clone`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    289,
    '2022-W37',
    '2_4',
    133,
    '2_4_55__1_324_24_1_25',
    'Cassis',
    '',
    NULL,
    NULL,
    'Bio',
    'Caussoles',
    'Test',
    'kg',
    'vrac',
    '2.00',
    '',
    '1.00',
    '2022-09-01',
    NULL,
    '5.00',
    '5.00',
    '2022-W35',
    '2022-09-14 08:01:45',
    '2022-09-14 08:01:45'
  );
INSERT INTO
  `stocks` (
    `id`,
    `week`,
    `departement`,
    `user_id`,
    `id_prod`,
    `name`,
    `variety`,
    `description`,
    `image`,
    `agr`,
    `loc`,
    `four`,
    `mes`,
    `cond`,
    `pf`,
    `marge`,
    `quantity`,
    `arrival`,
    `commande`,
    `stock_arrival`,
    `stock_current`,
    `clone`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    290,
    '2022-W37',
    '3_7',
    133,
    '3_7_108_1_1_278_28__18',
    'Olives noires',
    'de Nyons',
    NULL,
    NULL,
    'Bio',
    'Drôme',
    'ONyons',
    '',
    'bocal',
    '7.00',
    '',
    '1.00',
    '2022-09-02',
    NULL,
    '50.00',
    '50.00',
    '2022-W35',
    '2022-09-14 08:01:45',
    '2022-09-14 08:01:45'
  );
INSERT INTO
  `stocks` (
    `id`,
    `week`,
    `departement`,
    `user_id`,
    `id_prod`,
    `name`,
    `variety`,
    `description`,
    `image`,
    `agr`,
    `loc`,
    `four`,
    `mes`,
    `cond`,
    `pf`,
    `marge`,
    `quantity`,
    `arrival`,
    `commande`,
    `stock_arrival`,
    `stock_current`,
    `clone`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    291,
    '2022-W38',
    '1_1',
    133,
    '1_1_2_9_1_241_24_8_',
    'Asperges',
    'blanches',
    NULL,
    NULL,
    'Bio',
    'Grasse',
    'Test',
    'bouquet',
    '',
    '1.00',
    '',
    '1.00',
    '2022-08-26',
    NULL,
    '15.00',
    '15.00',
    '2022-W35',
    '2022-09-14 09:11:26',
    '2022-09-14 09:11:26'
  );
INSERT INTO
  `stocks` (
    `id`,
    `week`,
    `departement`,
    `user_id`,
    `id_prod`,
    `name`,
    `variety`,
    `description`,
    `image`,
    `agr`,
    `loc`,
    `four`,
    `mes`,
    `cond`,
    `pf`,
    `marge`,
    `quantity`,
    `arrival`,
    `commande`,
    `stock_arrival`,
    `stock_current`,
    `clone`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    292,
    '2022-W38',
    '1_1',
    133,
    '1_1_5__1_276_24_5_',
    'Brocolis',
    '',
    NULL,
    NULL,
    'Bio',
    'Mouans-Sartoux',
    'Test',
    'pièce',
    '',
    '0.50',
    '',
    '1.00',
    '2022-08-26',
    NULL,
    '60.00',
    '60.00',
    '2022-W35',
    '2022-09-14 09:11:26',
    '2022-09-14 09:11:26'
  );
INSERT INTO
  `stocks` (
    `id`,
    `week`,
    `departement`,
    `user_id`,
    `id_prod`,
    `name`,
    `variety`,
    `description`,
    `image`,
    `agr`,
    `loc`,
    `four`,
    `mes`,
    `cond`,
    `pf`,
    `marge`,
    `quantity`,
    `arrival`,
    `commande`,
    `stock_arrival`,
    `stock_current`,
    `clone`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    293,
    '2022-W38',
    '1_1',
    133,
    '1_1_3_11_3_4_24_1_',
    'Aubergines',
    'tigrées',
    NULL,
    NULL,
    'Traditionnelle',
    'Alpes-de-Haute-Provence',
    'Test',
    'kg',
    '',
    '5.00',
    '',
    '1.00',
    '2022-08-26',
    NULL,
    '5.00',
    '5.00',
    '2022-W35',
    '2022-09-14 09:11:26',
    '2022-09-14 09:11:26'
  );
INSERT INTO
  `stocks` (
    `id`,
    `week`,
    `departement`,
    `user_id`,
    `id_prod`,
    `name`,
    `variety`,
    `description`,
    `image`,
    `agr`,
    `loc`,
    `four`,
    `mes`,
    `cond`,
    `pf`,
    `marge`,
    `quantity`,
    `arrival`,
    `commande`,
    `stock_arrival`,
    `stock_current`,
    `clone`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    294,
    '2022-W38',
    '1_1',
    133,
    '1_1_1_3_1_274_24_8_',
    'Artichauts',
    'poivrades',
    NULL,
    NULL,
    'Bio',
    'Peymeinade',
    'Test',
    'bouquet',
    '',
    '2.00',
    '',
    '1.00',
    '2022-08-26',
    NULL,
    '30.00',
    '30.00',
    '2022-W35',
    '2022-09-14 09:11:26',
    '2022-09-14 09:11:26'
  );
INSERT INTO
  `stocks` (
    `id`,
    `week`,
    `departement`,
    `user_id`,
    `id_prod`,
    `name`,
    `variety`,
    `description`,
    `image`,
    `agr`,
    `loc`,
    `four`,
    `mes`,
    `cond`,
    `pf`,
    `marge`,
    `quantity`,
    `arrival`,
    `commande`,
    `stock_arrival`,
    `stock_current`,
    `clone`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    295,
    '2022-W38',
    '1_1',
    133,
    '1_1_2_8_2_218_24_2_',
    'Asperges',
    'vertes',
    NULL,
    NULL,
    'Raisonnée',
    'Monaco',
    'Test',
    'g',
    '',
    '3.00',
    '',
    '100.00',
    '2022-08-26',
    NULL,
    '40.00',
    '40.00',
    '2022-W35',
    '2022-09-14 09:11:26',
    '2022-09-14 09:11:26'
  );
INSERT INTO
  `stocks` (
    `id`,
    `week`,
    `departement`,
    `user_id`,
    `id_prod`,
    `name`,
    `variety`,
    `description`,
    `image`,
    `agr`,
    `loc`,
    `four`,
    `mes`,
    `cond`,
    `pf`,
    `marge`,
    `quantity`,
    `arrival`,
    `commande`,
    `stock_arrival`,
    `stock_current`,
    `clone`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    296,
    '2022-W38',
    '2_4',
    133,
    '2_4_55__1_324_24_1_25',
    'Cassis',
    '',
    NULL,
    NULL,
    'Bio',
    'Caussoles',
    'Test',
    'kg',
    'vrac',
    '2.00',
    '',
    '1.00',
    '2022-09-01',
    NULL,
    '5.00',
    '5.00',
    '2022-W35',
    '2022-09-14 09:11:26',
    '2022-09-14 09:11:26'
  );
INSERT INTO
  `stocks` (
    `id`,
    `week`,
    `departement`,
    `user_id`,
    `id_prod`,
    `name`,
    `variety`,
    `description`,
    `image`,
    `agr`,
    `loc`,
    `four`,
    `mes`,
    `cond`,
    `pf`,
    `marge`,
    `quantity`,
    `arrival`,
    `commande`,
    `stock_arrival`,
    `stock_current`,
    `clone`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    297,
    '2022-W38',
    '2_4',
    133,
    '2_4_54__1_324_24_1_20',
    'Abricots',
    '',
    NULL,
    NULL,
    'Bio',
    'Caussoles',
    'Test',
    'kg',
    'cagette',
    '3.00',
    '',
    '1.00',
    '2022-09-01',
    NULL,
    '2.00',
    '2.00',
    '2022-W35',
    '2022-09-14 09:11:26',
    '2022-09-14 09:11:26'
  );
INSERT INTO
  `stocks` (
    `id`,
    `week`,
    `departement`,
    `user_id`,
    `id_prod`,
    `name`,
    `variety`,
    `description`,
    `image`,
    `agr`,
    `loc`,
    `four`,
    `mes`,
    `cond`,
    `pf`,
    `marge`,
    `quantity`,
    `arrival`,
    `commande`,
    `stock_arrival`,
    `stock_current`,
    `clone`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    298,
    '2022-W38',
    '3_7',
    133,
    '3_7_108_1_1_278_28__18',
    'Olives noires',
    'de Nyons',
    NULL,
    NULL,
    'Bio',
    'Drôme',
    'ONyons',
    '',
    'bocal',
    '7.00',
    '',
    '1.00',
    '2022-09-02',
    NULL,
    '50.00',
    '50.00',
    '2022-W35',
    '2022-09-14 09:11:26',
    '2022-09-14 09:11:26'
  );
INSERT INTO
  `stocks` (
    `id`,
    `week`,
    `departement`,
    `user_id`,
    `id_prod`,
    `name`,
    `variety`,
    `description`,
    `image`,
    `agr`,
    `loc`,
    `four`,
    `mes`,
    `cond`,
    `pf`,
    `marge`,
    `quantity`,
    `arrival`,
    `commande`,
    `stock_arrival`,
    `stock_current`,
    `clone`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    299,
    '2022-W39',
    '1_1',
    133,
    '1_1_2_9_1_241_24_8_',
    'Asperges',
    'blanches',
    NULL,
    NULL,
    'Bio',
    'Grasse',
    'Test',
    'bouquet',
    '',
    '1.00',
    '',
    '1.00',
    '2022-08-26',
    NULL,
    '15.00',
    '15.00',
    '2022-W35',
    '2022-09-14 09:11:26',
    '2022-09-14 09:11:26'
  );
INSERT INTO
  `stocks` (
    `id`,
    `week`,
    `departement`,
    `user_id`,
    `id_prod`,
    `name`,
    `variety`,
    `description`,
    `image`,
    `agr`,
    `loc`,
    `four`,
    `mes`,
    `cond`,
    `pf`,
    `marge`,
    `quantity`,
    `arrival`,
    `commande`,
    `stock_arrival`,
    `stock_current`,
    `clone`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    300,
    '2022-W39',
    '1_1',
    133,
    '1_1_5__1_276_24_5_',
    'Brocolis',
    '',
    NULL,
    NULL,
    'Bio',
    'Mouans-Sartoux',
    'Test',
    'pièce',
    '',
    '0.50',
    '',
    '1.00',
    '2022-08-26',
    NULL,
    '60.00',
    '60.00',
    '2022-W35',
    '2022-09-14 09:11:26',
    '2022-09-14 09:11:26'
  );
INSERT INTO
  `stocks` (
    `id`,
    `week`,
    `departement`,
    `user_id`,
    `id_prod`,
    `name`,
    `variety`,
    `description`,
    `image`,
    `agr`,
    `loc`,
    `four`,
    `mes`,
    `cond`,
    `pf`,
    `marge`,
    `quantity`,
    `arrival`,
    `commande`,
    `stock_arrival`,
    `stock_current`,
    `clone`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    301,
    '2022-W39',
    '1_1',
    133,
    '1_1_3_11_3_4_24_1_',
    'Aubergines',
    'tigrées',
    NULL,
    NULL,
    'Traditionnelle',
    'Alpes-de-Haute-Provence',
    'Test',
    'kg',
    '',
    '5.00',
    '',
    '1.00',
    '2022-08-26',
    NULL,
    '5.00',
    '5.00',
    '2022-W35',
    '2022-09-14 09:11:26',
    '2022-09-14 09:11:26'
  );
INSERT INTO
  `stocks` (
    `id`,
    `week`,
    `departement`,
    `user_id`,
    `id_prod`,
    `name`,
    `variety`,
    `description`,
    `image`,
    `agr`,
    `loc`,
    `four`,
    `mes`,
    `cond`,
    `pf`,
    `marge`,
    `quantity`,
    `arrival`,
    `commande`,
    `stock_arrival`,
    `stock_current`,
    `clone`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    302,
    '2022-W39',
    '1_1',
    133,
    '1_1_1_3_1_274_24_8_',
    'Artichauts',
    'poivrades',
    NULL,
    NULL,
    'Bio',
    'Peymeinade',
    'Test',
    'bouquet',
    '',
    '2.00',
    '',
    '1.00',
    '2022-08-26',
    NULL,
    '30.00',
    '30.00',
    '2022-W35',
    '2022-09-14 09:11:26',
    '2022-09-14 09:11:26'
  );
INSERT INTO
  `stocks` (
    `id`,
    `week`,
    `departement`,
    `user_id`,
    `id_prod`,
    `name`,
    `variety`,
    `description`,
    `image`,
    `agr`,
    `loc`,
    `four`,
    `mes`,
    `cond`,
    `pf`,
    `marge`,
    `quantity`,
    `arrival`,
    `commande`,
    `stock_arrival`,
    `stock_current`,
    `clone`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    303,
    '2022-W39',
    '1_1',
    133,
    '1_1_2_8_2_218_24_2_',
    'Asperges',
    'vertes',
    NULL,
    NULL,
    'Raisonnée',
    'Monaco',
    'Test',
    'g',
    '',
    '3.00',
    '',
    '100.00',
    '2022-08-26',
    NULL,
    '40.00',
    '40.00',
    '2022-W35',
    '2022-09-14 09:11:26',
    '2022-09-14 09:11:26'
  );
INSERT INTO
  `stocks` (
    `id`,
    `week`,
    `departement`,
    `user_id`,
    `id_prod`,
    `name`,
    `variety`,
    `description`,
    `image`,
    `agr`,
    `loc`,
    `four`,
    `mes`,
    `cond`,
    `pf`,
    `marge`,
    `quantity`,
    `arrival`,
    `commande`,
    `stock_arrival`,
    `stock_current`,
    `clone`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    304,
    '2022-W39',
    '2_4',
    133,
    '2_4_55__1_324_24_1_25',
    'Cassis',
    '',
    NULL,
    NULL,
    'Bio',
    'Caussoles',
    'Test',
    'kg',
    'vrac',
    '2.00',
    '',
    '1.00',
    '2022-09-01',
    NULL,
    '5.00',
    '5.00',
    '2022-W35',
    '2022-09-14 09:11:26',
    '2022-09-14 09:11:26'
  );
INSERT INTO
  `stocks` (
    `id`,
    `week`,
    `departement`,
    `user_id`,
    `id_prod`,
    `name`,
    `variety`,
    `description`,
    `image`,
    `agr`,
    `loc`,
    `four`,
    `mes`,
    `cond`,
    `pf`,
    `marge`,
    `quantity`,
    `arrival`,
    `commande`,
    `stock_arrival`,
    `stock_current`,
    `clone`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    305,
    '2022-W39',
    '2_4',
    133,
    '2_4_54__1_324_24_1_20',
    'Abricots',
    '',
    NULL,
    NULL,
    'Bio',
    'Caussoles',
    'Test',
    'kg',
    'cagette',
    '3.00',
    '',
    '1.00',
    '2022-09-01',
    NULL,
    '2.00',
    '2.00',
    '2022-W35',
    '2022-09-14 09:11:26',
    '2022-09-14 09:11:26'
  );
INSERT INTO
  `stocks` (
    `id`,
    `week`,
    `departement`,
    `user_id`,
    `id_prod`,
    `name`,
    `variety`,
    `description`,
    `image`,
    `agr`,
    `loc`,
    `four`,
    `mes`,
    `cond`,
    `pf`,
    `marge`,
    `quantity`,
    `arrival`,
    `commande`,
    `stock_arrival`,
    `stock_current`,
    `clone`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    306,
    '2022-W39',
    '3_7',
    133,
    '3_7_108_1_1_278_28__18',
    'Olives noires',
    'de Nyons',
    'Lorem ipsum dolor sit amet consectetur adipisicing elit. Expedita explicabo reiciendis, saepe quas fuga quam. Quaerat dicta iure quod vitae est atque porro, natus mollitia, eaque rem quas cumque repudiandae!',
    '3_7_108_1.png',
    'Bio',
    'Drôme',
    'ONyons',
    '',
    'bocal',
    '7.00',
    '',
    '1.00',
    '2022-09-02',
    NULL,
    '50.00',
    '50.00',
    '2022-W35',
    '2022-09-14 09:11:26',
    '2022-09-14 09:11:26'
  );
INSERT INTO
  `stocks` (
    `id`,
    `week`,
    `departement`,
    `user_id`,
    `id_prod`,
    `name`,
    `variety`,
    `description`,
    `image`,
    `agr`,
    `loc`,
    `four`,
    `mes`,
    `cond`,
    `pf`,
    `marge`,
    `quantity`,
    `arrival`,
    `commande`,
    `stock_arrival`,
    `stock_current`,
    `clone`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    307,
    '2022-W39',
    '1_2',
    133,
    '1_2_41__1_241_24_8_',
    'Pois chiches',
    '',
    NULL,
    NULL,
    'Bio',
    'Grasse',
    'Test',
    'bouquet',
    '',
    '1.00',
    '',
    '1.00',
    '2022-08-26',
    NULL,
    '15.00',
    '15.00',
    '2022-W35',
    '2022-09-14 09:11:26',
    '2022-09-14 09:11:26'
  );
INSERT INTO
  `stocks` (
    `id`,
    `week`,
    `departement`,
    `user_id`,
    `id_prod`,
    `name`,
    `variety`,
    `description`,
    `image`,
    `agr`,
    `loc`,
    `four`,
    `mes`,
    `cond`,
    `pf`,
    `marge`,
    `quantity`,
    `arrival`,
    `commande`,
    `stock_arrival`,
    `stock_current`,
    `clone`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    308,
    '2022-W40',
    '3_7',
    133,
    '3_7_108_1_1_278_28__18',
    'Olives noires',
    'de Nyons',
    'Lorem ipsum dolor sit amet consectetur adipisicing elit. Expedita explicabo reiciendis, saepe quas fuga quam. Quaerat dicta iure quod vitae est atque porro, natus mollitia, eaque rem quas cumque repudiandae!',
    '3_7_108_1.png',
    'Bio',
    'Drôme',
    'ONyons',
    '',
    'bocal',
    '7.00',
    '',
    '1.00',
    '2022-09-02',
    NULL,
    '50.00',
    '50.00',
    '2022-W35',
    '2022-09-14 09:11:26',
    '2022-09-14 09:11:26'
  );
INSERT INTO
  `stocks` (
    `id`,
    `week`,
    `departement`,
    `user_id`,
    `id_prod`,
    `name`,
    `variety`,
    `description`,
    `image`,
    `agr`,
    `loc`,
    `four`,
    `mes`,
    `cond`,
    `pf`,
    `marge`,
    `quantity`,
    `arrival`,
    `commande`,
    `stock_arrival`,
    `stock_current`,
    `clone`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    309,
    '2022-W40',
    '1_1',
    133,
    '1_1_5__1_276_24_5_',
    'Brocolis',
    '',
    NULL,
    NULL,
    'Bio',
    'Mouans-Sartoux',
    'Test',
    'pièce',
    '',
    '0.50',
    '',
    '1.00',
    '2022-08-26',
    NULL,
    '60.00',
    '60.00',
    '2022-W35',
    '2022-09-14 09:11:26',
    '2022-09-14 09:11:26'
  );
INSERT INTO
  `stocks` (
    `id`,
    `week`,
    `departement`,
    `user_id`,
    `id_prod`,
    `name`,
    `variety`,
    `description`,
    `image`,
    `agr`,
    `loc`,
    `four`,
    `mes`,
    `cond`,
    `pf`,
    `marge`,
    `quantity`,
    `arrival`,
    `commande`,
    `stock_arrival`,
    `stock_current`,
    `clone`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    310,
    '2022-W40',
    '1_1',
    133,
    '1_1_3_11_3_4_24_1_',
    'Aubergines',
    'tigrées',
    NULL,
    NULL,
    'Traditionnelle',
    'Alpes-de-Haute-Provence',
    'Test',
    'kg',
    '',
    '5.00',
    '',
    '1.00',
    '2022-08-26',
    NULL,
    '5.00',
    '5.00',
    '2022-W35',
    '2022-09-14 09:11:26',
    '2022-09-14 09:11:26'
  );
INSERT INTO
  `stocks` (
    `id`,
    `week`,
    `departement`,
    `user_id`,
    `id_prod`,
    `name`,
    `variety`,
    `description`,
    `image`,
    `agr`,
    `loc`,
    `four`,
    `mes`,
    `cond`,
    `pf`,
    `marge`,
    `quantity`,
    `arrival`,
    `commande`,
    `stock_arrival`,
    `stock_current`,
    `clone`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    311,
    '2022-W40',
    '1_1',
    133,
    '1_1_1_3_1_274_24_8_',
    'Artichauts',
    'poivrades',
    NULL,
    NULL,
    'Bio',
    'Peymeinade',
    'Test',
    'bouquet',
    '',
    '2.00',
    '',
    '1.00',
    '2022-08-26',
    NULL,
    '30.00',
    '30.00',
    '2022-W35',
    '2022-09-14 09:11:26',
    '2022-09-14 09:11:26'
  );
INSERT INTO
  `stocks` (
    `id`,
    `week`,
    `departement`,
    `user_id`,
    `id_prod`,
    `name`,
    `variety`,
    `description`,
    `image`,
    `agr`,
    `loc`,
    `four`,
    `mes`,
    `cond`,
    `pf`,
    `marge`,
    `quantity`,
    `arrival`,
    `commande`,
    `stock_arrival`,
    `stock_current`,
    `clone`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    312,
    '2022-W40',
    '1_1',
    133,
    '1_1_2_8_2_218_24_2_',
    'Asperges',
    'vertes',
    NULL,
    NULL,
    'Raisonnée',
    'Monaco',
    'Test',
    'g',
    '',
    '3.00',
    '',
    '100.00',
    '2022-08-26',
    NULL,
    '40.00',
    '40.00',
    '2022-W35',
    '2022-09-14 09:11:26',
    '2022-09-14 09:11:26'
  );
INSERT INTO
  `stocks` (
    `id`,
    `week`,
    `departement`,
    `user_id`,
    `id_prod`,
    `name`,
    `variety`,
    `description`,
    `image`,
    `agr`,
    `loc`,
    `four`,
    `mes`,
    `cond`,
    `pf`,
    `marge`,
    `quantity`,
    `arrival`,
    `commande`,
    `stock_arrival`,
    `stock_current`,
    `clone`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    313,
    '2022-W40',
    '2_4',
    133,
    '2_4_55__1_324_24_1_25',
    'Cassis',
    '',
    NULL,
    NULL,
    'Bio',
    'Caussoles',
    'Test',
    'kg',
    'vrac',
    '2.00',
    '',
    '1.00',
    '2022-09-01',
    NULL,
    '5.00',
    '5.00',
    '2022-W35',
    '2022-09-14 09:11:26',
    '2022-09-14 09:11:26'
  );
INSERT INTO
  `stocks` (
    `id`,
    `week`,
    `departement`,
    `user_id`,
    `id_prod`,
    `name`,
    `variety`,
    `description`,
    `image`,
    `agr`,
    `loc`,
    `four`,
    `mes`,
    `cond`,
    `pf`,
    `marge`,
    `quantity`,
    `arrival`,
    `commande`,
    `stock_arrival`,
    `stock_current`,
    `clone`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    314,
    '2022-W40',
    '2_4',
    133,
    '2_4_54__1_324_24_1_20',
    'Abricots',
    '',
    NULL,
    NULL,
    'Bio',
    'Caussoles',
    'Test',
    'kg',
    'cagette',
    '3.00',
    '',
    '1.00',
    '2022-09-01',
    NULL,
    '2.00',
    '2.00',
    '2022-W35',
    '2022-09-14 09:11:26',
    '2022-09-14 09:11:26'
  );
INSERT INTO
  `stocks` (
    `id`,
    `week`,
    `departement`,
    `user_id`,
    `id_prod`,
    `name`,
    `variety`,
    `description`,
    `image`,
    `agr`,
    `loc`,
    `four`,
    `mes`,
    `cond`,
    `pf`,
    `marge`,
    `quantity`,
    `arrival`,
    `commande`,
    `stock_arrival`,
    `stock_current`,
    `clone`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    316,
    '2022-W40',
    '1_2',
    133,
    '1_2_41__1_241_24_8_',
    'Pois chiches',
    '',
    NULL,
    NULL,
    'Bio',
    'Grasse',
    'Test',
    'bouquet',
    '',
    '1.00',
    '',
    '1.00',
    '2022-08-26',
    NULL,
    '15.00',
    '15.00',
    '2022-W35',
    '2022-09-14 09:11:26',
    '2022-09-14 09:11:26'
  );
INSERT INTO
  `stocks` (
    `id`,
    `week`,
    `departement`,
    `user_id`,
    `id_prod`,
    `name`,
    `variety`,
    `description`,
    `image`,
    `agr`,
    `loc`,
    `four`,
    `mes`,
    `cond`,
    `pf`,
    `marge`,
    `quantity`,
    `arrival`,
    `commande`,
    `stock_arrival`,
    `stock_current`,
    `clone`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    317,
    '2022-W40',
    '3_7',
    133,
    '3_7_108_1_1_278_28__18',
    'Olives noires',
    'de Nyons',
    'Lorem ipsum dolor sit amet consectetur adipisicing elit. Expedita explicabo reiciendis, saepe quas fuga quam. Quaerat dicta iure quod vitae est atque porro, natus mollitia, eaque rem quas cumque repudiandae!',
    '3_7_108_1.png',
    'Bio',
    'Drôme',
    'ONyons',
    '',
    'bocal',
    '7.00',
    '',
    '1.00',
    '2022-09-02',
    NULL,
    '50.00',
    '50.00',
    '2022-W35',
    '2022-09-14 09:11:26',
    '2022-09-14 09:11:26'
  );
INSERT INTO
  `stocks` (
    `id`,
    `week`,
    `departement`,
    `user_id`,
    `id_prod`,
    `name`,
    `variety`,
    `description`,
    `image`,
    `agr`,
    `loc`,
    `four`,
    `mes`,
    `cond`,
    `pf`,
    `marge`,
    `quantity`,
    `arrival`,
    `commande`,
    `stock_arrival`,
    `stock_current`,
    `clone`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    319,
    '2022-W41',
    '3_7',
    133,
    '3_7_108_1_1_278_28__18',
    'Olives noires',
    'de Nyons',
    'Lorem ipsum dolor sit amet consectetur adipisicing elit. Expedita explicabo reiciendis, saepe quas fuga quam. Quaerat dicta iure quod vitae est atque porro, natus mollitia, eaque rem quas cumque repudiandae!',
    '3_7_108_1.png',
    'Bio',
    'Drôme',
    'ONyons',
    '',
    'bocal',
    '7.00',
    '15.00',
    '1.00',
    '2022-09-02',
    NULL,
    '50.00',
    '50.00',
    '2022-W35',
    '2022-09-14 09:11:26',
    '2022-09-14 09:11:26'
  );
INSERT INTO
  `stocks` (
    `id`,
    `week`,
    `departement`,
    `user_id`,
    `id_prod`,
    `name`,
    `variety`,
    `description`,
    `image`,
    `agr`,
    `loc`,
    `four`,
    `mes`,
    `cond`,
    `pf`,
    `marge`,
    `quantity`,
    `arrival`,
    `commande`,
    `stock_arrival`,
    `stock_current`,
    `clone`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    320,
    '2022-W41',
    '1_1',
    133,
    '1_1_5__1_276_24_5_',
    'Brocolis',
    '',
    'Lorem ipsum dolor sit amet consectetur adipisicing elit. Expedita explicabo reiciendis, saepe quas fuga quam. Quaerat dicta iure quod vitae est atque porro, natus mollitia, eaque rem quas cumque repudiandae!',
    NULL,
    'Bio',
    'Mouans-Sartoux',
    'Test',
    'pièce',
    '',
    '0.50',
    '15.00',
    '1.00',
    '2022-08-26',
    NULL,
    '60.00',
    '60.00',
    '2022-W35',
    '2022-09-14 09:11:26',
    '2022-09-14 09:11:26'
  );
INSERT INTO
  `stocks` (
    `id`,
    `week`,
    `departement`,
    `user_id`,
    `id_prod`,
    `name`,
    `variety`,
    `description`,
    `image`,
    `agr`,
    `loc`,
    `four`,
    `mes`,
    `cond`,
    `pf`,
    `marge`,
    `quantity`,
    `arrival`,
    `commande`,
    `stock_arrival`,
    `stock_current`,
    `clone`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    321,
    '2022-W41',
    '1_1',
    133,
    '1_1_3_11_3_4_24_1_',
    'Aubergines',
    'tigrées',
    'Lorem ipsum dolor sit amet consectetur adipisicing elit. Expedita explicabo reiciendis, saepe quas fuga quam. Quaerat dicta iure quod vitae est atque porro, natus mollitia, eaque rem quas cumque repudiandae!',
    NULL,
    'Traditionnelle',
    'Alpes-de-Haute-Provence',
    'Test',
    'kg',
    '',
    '5.00',
    '15.00',
    '1.00',
    '2022-08-26',
    NULL,
    '5.00',
    '5.00',
    '2022-W35',
    '2022-09-14 09:11:26',
    '2022-09-14 09:11:26'
  );
INSERT INTO
  `stocks` (
    `id`,
    `week`,
    `departement`,
    `user_id`,
    `id_prod`,
    `name`,
    `variety`,
    `description`,
    `image`,
    `agr`,
    `loc`,
    `four`,
    `mes`,
    `cond`,
    `pf`,
    `marge`,
    `quantity`,
    `arrival`,
    `commande`,
    `stock_arrival`,
    `stock_current`,
    `clone`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    322,
    '2022-W41',
    '1_1',
    133,
    '1_1_1_3_1_274_24_8_',
    'Artichauts',
    'poivrades',
    'Lorem ipsum dolor sit amet consectetur adipisicing elit. Expedita explicabo reiciendis, saepe quas fuga quam. Quaerat dicta iure quod vitae est atque porro, natus mollitia, eaque rem quas cumque repudiandae!',
    NULL,
    'Bio',
    'Peymeinade',
    'Test',
    'bouquet',
    '',
    '2.00',
    '15.00',
    '1.00',
    '2022-08-26',
    NULL,
    '30.00',
    '30.00',
    '2022-W35',
    '2022-09-14 09:11:26',
    '2022-09-14 09:11:26'
  );
INSERT INTO
  `stocks` (
    `id`,
    `week`,
    `departement`,
    `user_id`,
    `id_prod`,
    `name`,
    `variety`,
    `description`,
    `image`,
    `agr`,
    `loc`,
    `four`,
    `mes`,
    `cond`,
    `pf`,
    `marge`,
    `quantity`,
    `arrival`,
    `commande`,
    `stock_arrival`,
    `stock_current`,
    `clone`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    323,
    '2022-W40',
    '1_1',
    133,
    '1_1_2_8_2_218_24_2_',
    'Asperges',
    'vertes',
    'Lorem ipsum dolor sit amet consectetur adipisicing elit. Expedita explicabo reiciendis, saepe quas fuga quam. Quaerat dicta iure quod vitae est atque porro, natus mollitia, eaque rem quas cumque repudiandae!',
    NULL,
    'Raisonnée',
    'Monaco',
    'Test',
    'g',
    '',
    '3.00',
    '',
    '100.00',
    '2022-08-26',
    NULL,
    '40.00',
    '40.00',
    '2022-W35',
    '2022-09-14 09:11:26',
    '2022-09-14 09:11:26'
  );
INSERT INTO
  `stocks` (
    `id`,
    `week`,
    `departement`,
    `user_id`,
    `id_prod`,
    `name`,
    `variety`,
    `description`,
    `image`,
    `agr`,
    `loc`,
    `four`,
    `mes`,
    `cond`,
    `pf`,
    `marge`,
    `quantity`,
    `arrival`,
    `commande`,
    `stock_arrival`,
    `stock_current`,
    `clone`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    324,
    '2022-W41',
    '2_4',
    133,
    '2_4_55__1_324_24_1_25',
    'Cassis',
    '',
    'Lorem ipsum dolor sit amet consectetur adipisicing elit. Expedita explicabo reiciendis, saepe quas fuga quam. Quaerat dicta iure quod vitae est atque porro, natus mollitia, eaque rem quas cumque repudiandae!',
    NULL,
    'Bio',
    'Caussoles',
    'Test',
    'kg',
    'vrac',
    '2.00',
    '15.00',
    '1.00',
    '2022-09-01',
    NULL,
    '5.00',
    '5.00',
    '2022-W35',
    '2022-09-14 09:11:26',
    '2022-09-14 09:11:26'
  );
INSERT INTO
  `stocks` (
    `id`,
    `week`,
    `departement`,
    `user_id`,
    `id_prod`,
    `name`,
    `variety`,
    `description`,
    `image`,
    `agr`,
    `loc`,
    `four`,
    `mes`,
    `cond`,
    `pf`,
    `marge`,
    `quantity`,
    `arrival`,
    `commande`,
    `stock_arrival`,
    `stock_current`,
    `clone`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    326,
    '2022-W41',
    '1_2',
    133,
    '1_2_41__1_241_24_8_',
    'Pois chiches',
    '',
    'Lorem ipsum dolor sit amet consectetur adipisicing elit. Expedita explicabo reiciendis, saepe quas fuga quam. Quaerat dicta iure quod vitae est atque porro, natus mollitia, eaque rem quas cumque repudiandae!',
    NULL,
    'Bio',
    'Grasse',
    'Test',
    'bouquet',
    '',
    '1.00',
    '15.00',
    '1.00',
    '2022-08-26',
    NULL,
    '15.00',
    '15.00',
    '2022-W35',
    '2022-09-14 09:11:26',
    '2022-09-14 09:11:26'
  );
INSERT INTO
  `stocks` (
    `id`,
    `week`,
    `departement`,
    `user_id`,
    `id_prod`,
    `name`,
    `variety`,
    `description`,
    `image`,
    `agr`,
    `loc`,
    `four`,
    `mes`,
    `cond`,
    `pf`,
    `marge`,
    `quantity`,
    `arrival`,
    `commande`,
    `stock_arrival`,
    `stock_current`,
    `clone`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    346,
    '2022-W41',
    '1_2',
    0,
    '1_2_40_5_1_241_24_8_',
    'Lentilles',
    'du Puy',
    NULL,
    NULL,
    'Bio',
    'Grasse',
    'Test',
    'sachet',
    '',
    '0.50',
    '15',
    '1.00',
    '2022-08-26',
    NULL,
    '150.00',
    '150.00',
    NULL,
    '2022-10-17 14:18:16',
    '2022-10-17 14:18:16'
  );
INSERT INTO
  `stocks` (
    `id`,
    `week`,
    `departement`,
    `user_id`,
    `id_prod`,
    `name`,
    `variety`,
    `description`,
    `image`,
    `agr`,
    `loc`,
    `four`,
    `mes`,
    `cond`,
    `pf`,
    `marge`,
    `quantity`,
    `arrival`,
    `commande`,
    `stock_arrival`,
    `stock_current`,
    `clone`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    347,
    '2022-W42',
    '3_7',
    0,
    '3_7_108_1_1_278_28__18',
    'Olives noires',
    'de Nyons',
    'Lorem ipsum dolor sit amet consectetur adipisicing elit. Harum molestiae blanditiis modi. Repellendus reiciendis hic veritatis minima sed incidunt dolore alias perspiciatis, voluptatem repellat veniam reprehenderit nihil aliquid aut iste!\r\n',
    NULL,
    'Bio',
    'Drôme',
    'ONyons',
    '',
    'bocal',
    '7.00',
    '15',
    '1.00',
    '2022-09-02',
    NULL,
    '50.00',
    '50.00',
    NULL,
    '2022-10-17 14:33:00',
    '2022-10-17 14:33:00'
  );
INSERT INTO
  `stocks` (
    `id`,
    `week`,
    `departement`,
    `user_id`,
    `id_prod`,
    `name`,
    `variety`,
    `description`,
    `image`,
    `agr`,
    `loc`,
    `four`,
    `mes`,
    `cond`,
    `pf`,
    `marge`,
    `quantity`,
    `arrival`,
    `commande`,
    `stock_arrival`,
    `stock_current`,
    `clone`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    348,
    '2022-W42',
    '1_1',
    0,
    '1_1_5__1_276_24_5_',
    'Brocolis',
    '',
    'Lorem ipsum dolor sit amet consectetur adipisicing elit. Harum molestiae blanditiis modi. Repellendus reiciendis hic veritatis minima sed incidunt dolore alias perspiciatis, voluptatem repellat veniam reprehenderit nihil aliquid aut iste!',
    NULL,
    'Bio',
    'Mouans-Sartoux',
    'Test',
    'pièce',
    '',
    '0.50',
    '15',
    '1.00',
    '2022-08-26',
    NULL,
    '60.00',
    '60.00',
    NULL,
    '2022-10-17 14:33:00',
    '2022-10-17 14:33:00'
  );
INSERT INTO
  `stocks` (
    `id`,
    `week`,
    `departement`,
    `user_id`,
    `id_prod`,
    `name`,
    `variety`,
    `description`,
    `image`,
    `agr`,
    `loc`,
    `four`,
    `mes`,
    `cond`,
    `pf`,
    `marge`,
    `quantity`,
    `arrival`,
    `commande`,
    `stock_arrival`,
    `stock_current`,
    `clone`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    349,
    '2022-W42',
    '1_1',
    0,
    '1_1_3_11_3_4_24_1_',
    'Aubergines',
    'tigrées',
    'Lorem ipsum dolor sit amet consectetur adipisicing elit. Harum molestiae blanditiis modi. Repellendus reiciendis hic veritatis minima sed incidunt dolore alias perspiciatis, voluptatem repellat veniam reprehenderit nihil aliquid aut iste!',
    NULL,
    'Traditionnelle',
    'Alpes-de-Haute-Provence',
    'Test',
    'kg',
    '',
    '5.00',
    '15',
    '1.00',
    '2022-08-26',
    NULL,
    '5.00',
    '5.00',
    NULL,
    '2022-10-17 14:33:00',
    '2022-10-17 14:33:00'
  );
INSERT INTO
  `stocks` (
    `id`,
    `week`,
    `departement`,
    `user_id`,
    `id_prod`,
    `name`,
    `variety`,
    `description`,
    `image`,
    `agr`,
    `loc`,
    `four`,
    `mes`,
    `cond`,
    `pf`,
    `marge`,
    `quantity`,
    `arrival`,
    `commande`,
    `stock_arrival`,
    `stock_current`,
    `clone`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    350,
    '2022-W42',
    '1_1',
    0,
    '1_1_1_3_1_274_24_8_',
    'Artichauts',
    'poivrades',
    'Lorem ipsum dolor sit amet consectetur adipisicing elit. Harum molestiae blanditiis modi. Repellendus reiciendis hic veritatis minima sed incidunt dolore alias perspiciatis, voluptatem repellat veniam reprehenderit nihil aliquid aut iste!',
    NULL,
    'Bio',
    'Peymeinade',
    'Test',
    'bouquet',
    '',
    '2.00',
    '15',
    '1.00',
    '2022-08-26',
    NULL,
    '30.00',
    '30.00',
    NULL,
    '2022-10-17 14:33:00',
    '2022-10-17 14:33:00'
  );
INSERT INTO
  `stocks` (
    `id`,
    `week`,
    `departement`,
    `user_id`,
    `id_prod`,
    `name`,
    `variety`,
    `description`,
    `image`,
    `agr`,
    `loc`,
    `four`,
    `mes`,
    `cond`,
    `pf`,
    `marge`,
    `quantity`,
    `arrival`,
    `commande`,
    `stock_arrival`,
    `stock_current`,
    `clone`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    351,
    '2022-W42',
    '2_4',
    0,
    '2_4_55__1_324_24_1_25',
    'Cassis',
    '',
    'Lorem ipsum dolor sit amet consectetur adipisicing elit. Harum molestiae blanditiis modi. Repellendus reiciendis hic veritatis minima sed incidunt dolore alias perspiciatis, voluptatem repellat veniam reprehenderit nihil aliquid aut iste!',
    NULL,
    'Bio',
    'Caussoles',
    'Test',
    'kg',
    'vrac',
    '2.00',
    '15',
    '1.00',
    '2022-09-01',
    NULL,
    '5.00',
    '5.00',
    NULL,
    '2022-10-17 14:33:00',
    '2022-10-17 14:33:00'
  );
INSERT INTO
  `stocks` (
    `id`,
    `week`,
    `departement`,
    `user_id`,
    `id_prod`,
    `name`,
    `variety`,
    `description`,
    `image`,
    `agr`,
    `loc`,
    `four`,
    `mes`,
    `cond`,
    `pf`,
    `marge`,
    `quantity`,
    `arrival`,
    `commande`,
    `stock_arrival`,
    `stock_current`,
    `clone`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    352,
    '2022-W42',
    '1_2',
    0,
    '1_2_41__1_241_24_8_',
    'Pois chiches',
    '',
    'Lorem ipsum dolor sit amet consectetur adipisicing elit. Harum molestiae blanditiis modi. Repellendus reiciendis hic veritatis minima sed incidunt dolore alias perspiciatis, voluptatem repellat veniam reprehenderit nihil aliquid aut iste!',
    NULL,
    'Bio',
    'Grasse',
    'Test',
    'bouquet',
    '',
    '1.00',
    '15',
    '1.00',
    '2022-08-26',
    NULL,
    '15.00',
    '15.00',
    NULL,
    '2022-10-17 14:33:00',
    '2022-10-17 14:33:00'
  );
INSERT INTO
  `stocks` (
    `id`,
    `week`,
    `departement`,
    `user_id`,
    `id_prod`,
    `name`,
    `variety`,
    `description`,
    `image`,
    `agr`,
    `loc`,
    `four`,
    `mes`,
    `cond`,
    `pf`,
    `marge`,
    `quantity`,
    `arrival`,
    `commande`,
    `stock_arrival`,
    `stock_current`,
    `clone`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    353,
    '2022-W42',
    '1_2',
    0,
    '1_2_40_5_1_241_24_8_',
    'Lentilles',
    'du Puy',
    'Lorem ipsum dolor sit amet consectetur adipisicing elit. Harum molestiae blanditiis modi. Repellendus reiciendis hic veritatis minima sed incidunt dolore alias perspiciatis, voluptatem repellat veniam reprehenderit nihil aliquid aut iste!',
    NULL,
    'Bio',
    'Grasse',
    'Test',
    'sachet',
    '',
    '0.50',
    '15',
    '1.00',
    '2022-08-26',
    NULL,
    '150.00',
    '150.00',
    NULL,
    '2022-10-17 14:33:00',
    '2022-10-17 14:33:00'
  );
INSERT INTO
  `stocks` (
    `id`,
    `week`,
    `departement`,
    `user_id`,
    `id_prod`,
    `name`,
    `variety`,
    `description`,
    `image`,
    `agr`,
    `loc`,
    `four`,
    `mes`,
    `cond`,
    `pf`,
    `marge`,
    `quantity`,
    `arrival`,
    `commande`,
    `stock_arrival`,
    `stock_current`,
    `clone`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    354,
    '2022-W42',
    '1_3',
    0,
    '1_3_42__1_241_24_8_',
    'Ail',
    '',
    'Lorem ipsum dolor sit amet consectetur adipisicing elit. Harum molestiae blanditiis modi. Repellendus reiciendis hic veritatis minima sed incidunt dolore alias perspiciatis, voluptatem repellat veniam reprehenderit nihil aliquid aut iste!',
    NULL,
    'Bio',
    'Grasse',
    'Test',
    'pièce',
    '',
    '0.10',
    '15',
    '1.00',
    '2022-08-26',
    NULL,
    '15.00',
    '15.00',
    NULL,
    '2022-10-17 14:33:00',
    '2022-10-17 14:33:00'
  );
INSERT INTO
  `stocks` (
    `id`,
    `week`,
    `departement`,
    `user_id`,
    `id_prod`,
    `name`,
    `variety`,
    `description`,
    `image`,
    `agr`,
    `loc`,
    `four`,
    `mes`,
    `cond`,
    `pf`,
    `marge`,
    `quantity`,
    `arrival`,
    `commande`,
    `stock_arrival`,
    `stock_current`,
    `clone`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    355,
    '2022-W42',
    '1_3',
    0,
    '1_3_48__1_241_24_8_',
    'Navets',
    '',
    'Lorem ipsum dolor sit amet consectetur adipisicing elit. Harum molestiae blanditiis modi. Repellendus reiciendis hic veritatis minima sed incidunt dolore alias perspiciatis, voluptatem repellat veniam reprehenderit nihil aliquid aut iste!',
    NULL,
    'Bio',
    'Grasse',
    'Test',
    'vrac',
    '',
    '0.20',
    '15',
    '1.00',
    '2022-08-26',
    NULL,
    '15.00',
    '15.00',
    NULL,
    '2022-10-17 14:33:00',
    '2022-10-17 14:33:00'
  );
INSERT INTO
  `stocks` (
    `id`,
    `week`,
    `departement`,
    `user_id`,
    `id_prod`,
    `name`,
    `variety`,
    `description`,
    `image`,
    `agr`,
    `loc`,
    `four`,
    `mes`,
    `cond`,
    `pf`,
    `marge`,
    `quantity`,
    `arrival`,
    `commande`,
    `stock_arrival`,
    `stock_current`,
    `clone`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    356,
    '2022-W42',
    '2_4',
    0,
    '2_4_61__2_241_24_8_',
    'Figues',
    '',
    'Lorem ipsum dolor sit amet consectetur adipisicing elit. Harum molestiae blanditiis modi. Repellendus reiciendis hic veritatis minima sed incidunt dolore alias perspiciatis, voluptatem repellat veniam reprehenderit nihil aliquid aut iste!',
    NULL,
    'Raisonnée',
    'Grasse',
    'Test',
    'vrac',
    '',
    '0.80',
    '15',
    '1.00',
    '2022-08-26',
    NULL,
    '5.00',
    '5.00',
    NULL,
    '2022-10-17 14:33:00',
    '2022-10-17 14:33:00'
  );
INSERT INTO
  `stocks` (
    `id`,
    `week`,
    `departement`,
    `user_id`,
    `id_prod`,
    `name`,
    `variety`,
    `description`,
    `image`,
    `agr`,
    `loc`,
    `four`,
    `mes`,
    `cond`,
    `pf`,
    `marge`,
    `quantity`,
    `arrival`,
    `commande`,
    `stock_arrival`,
    `stock_current`,
    `clone`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    357,
    '2022-W42',
    '2_5',
    0,
    '2_5_87__3_241_24_8_',
    'Pignons de pin',
    '',
    'Lorem ipsum dolor sit amet consectetur adipisicing elit. Harum molestiae blanditiis modi. Repellendus reiciendis hic veritatis minima sed incidunt dolore alias perspiciatis, voluptatem repellat veniam reprehenderit nihil aliquid aut iste!',
    NULL,
    'Traditionnelle',
    'Grasse',
    'Test',
    'g',
    'sachet',
    '1.80',
    '15',
    '100.00',
    '2022-08-26',
    NULL,
    '5.00',
    '5.00',
    NULL,
    '2022-10-17 14:33:00',
    '2022-10-17 14:33:00'
  );
INSERT INTO
  `stocks` (
    `id`,
    `week`,
    `departement`,
    `user_id`,
    `id_prod`,
    `name`,
    `variety`,
    `description`,
    `image`,
    `agr`,
    `loc`,
    `four`,
    `mes`,
    `cond`,
    `pf`,
    `marge`,
    `quantity`,
    `arrival`,
    `commande`,
    `stock_arrival`,
    `stock_current`,
    `clone`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    358,
    '2022-W42',
    '2_5',
    0,
    '2_5_86__1_241_24_8_',
    'Noix',
    '',
    'Lorem ipsum dolor sit amet consectetur adipisicing elit. Harum molestiae blanditiis modi. Repellendus reiciendis hic veritatis minima sed incidunt dolore alias perspiciatis, voluptatem repellat veniam reprehenderit nihil aliquid aut iste!',
    NULL,
    'Bio',
    'Grasse',
    'Test',
    'g',
    'sachet',
    '1.00',
    '15',
    '100.00',
    '2022-08-26',
    NULL,
    '5.00',
    '5.00',
    NULL,
    '2022-10-17 14:33:00',
    '2022-10-17 14:33:00'
  );
INSERT INTO
  `stocks` (
    `id`,
    `week`,
    `departement`,
    `user_id`,
    `id_prod`,
    `name`,
    `variety`,
    `description`,
    `image`,
    `agr`,
    `loc`,
    `four`,
    `mes`,
    `cond`,
    `pf`,
    `marge`,
    `quantity`,
    `arrival`,
    `commande`,
    `stock_arrival`,
    `stock_current`,
    `clone`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    359,
    '2022-W42',
    '2_6',
    0,
    '2_6_88_18_1_241_24_8_',
    'Ananas',
    'Victoria',
    'Lorem ipsum dolor sit amet consectetur adipisicing elit. Harum molestiae blanditiis modi. Repellendus reiciendis hic veritatis minima sed incidunt dolore alias perspiciatis, voluptatem repellat veniam reprehenderit nihil aliquid aut iste!',
    NULL,
    'Bio',
    'Grasse',
    'Test',
    'pièce',
    '',
    '3.00',
    '15',
    '1.00',
    '2022-08-26',
    NULL,
    '25.00',
    '25.00',
    NULL,
    '2022-10-17 14:33:00',
    '2022-10-17 14:33:00'
  );
INSERT INTO
  `stocks` (
    `id`,
    `week`,
    `departement`,
    `user_id`,
    `id_prod`,
    `name`,
    `variety`,
    `description`,
    `image`,
    `agr`,
    `loc`,
    `four`,
    `mes`,
    `cond`,
    `pf`,
    `marge`,
    `quantity`,
    `arrival`,
    `commande`,
    `stock_arrival`,
    `stock_current`,
    `clone`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    360,
    '2022-W42',
    '2_6',
    0,
    '2_6_100__1_241_24_8_',
    'Mangues',
    '',
    'Lorem ipsum dolor sit amet consectetur adipisicing elit. Harum molestiae blanditiis modi. Repellendus reiciendis hic veritatis minima sed incidunt dolore alias perspiciatis, voluptatem repellat veniam reprehenderit nihil aliquid aut iste!',
    NULL,
    'Bio',
    'Grasse',
    'Test',
    'pièce',
    '',
    '2.00',
    '15',
    '1.00',
    '2022-08-26',
    NULL,
    '25.00',
    '25.00',
    NULL,
    '2022-10-17 14:33:00',
    '2022-10-17 14:33:00'
  );
INSERT INTO
  `stocks` (
    `id`,
    `week`,
    `departement`,
    `user_id`,
    `id_prod`,
    `name`,
    `variety`,
    `description`,
    `image`,
    `agr`,
    `loc`,
    `four`,
    `mes`,
    `cond`,
    `pf`,
    `marge`,
    `quantity`,
    `arrival`,
    `commande`,
    `stock_arrival`,
    `stock_current`,
    `clone`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    361,
    '2022-W42',
    '2_6',
    0,
    '2_6_101__3_241_24_8_',
    'Noix de coco',
    '',
    'Lorem ipsum dolor sit amet consectetur adipisicing elit. Harum molestiae blanditiis modi. Repellendus reiciendis hic veritatis minima sed incidunt dolore alias perspiciatis, voluptatem repellat veniam reprehenderit nihil aliquid aut iste!',
    NULL,
    'Traditionnelle',
    'Grasse',
    'Test',
    'pièce',
    '',
    '1.30',
    '15',
    '1.00',
    '2022-08-26',
    NULL,
    '25.00',
    '25.00',
    NULL,
    '2022-10-17 14:33:00',
    '2022-10-17 14:33:00'
  );
INSERT INTO
  `stocks` (
    `id`,
    `week`,
    `departement`,
    `user_id`,
    `id_prod`,
    `name`,
    `variety`,
    `description`,
    `image`,
    `agr`,
    `loc`,
    `four`,
    `mes`,
    `cond`,
    `pf`,
    `marge`,
    `quantity`,
    `arrival`,
    `commande`,
    `stock_arrival`,
    `stock_current`,
    `clone`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    362,
    '2022-W42',
    '3_7',
    0,
    '3_7_106__2_241_24_8_',
    'Betteraves',
    '',
    'Lorem ipsum dolor sit amet consectetur adipisicing elit. Harum molestiae blanditiis modi. Repellendus reiciendis hic veritatis minima sed incidunt dolore alias perspiciatis, voluptatem repellat veniam reprehenderit nihil aliquid aut iste!',
    NULL,
    'Raisonnée',
    'Grasse',
    'Test',
    'pièce',
    '',
    '0.50',
    '15',
    '1.00',
    '2022-08-26',
    NULL,
    '25.00',
    '25.00',
    NULL,
    '2022-10-17 14:33:00',
    '2022-10-17 14:33:00'
  );
INSERT INTO
  `stocks` (
    `id`,
    `week`,
    `departement`,
    `user_id`,
    `id_prod`,
    `name`,
    `variety`,
    `description`,
    `image`,
    `agr`,
    `loc`,
    `four`,
    `mes`,
    `cond`,
    `pf`,
    `marge`,
    `quantity`,
    `arrival`,
    `commande`,
    `stock_arrival`,
    `stock_current`,
    `clone`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    363,
    '2022-W42',
    '3_7',
    0,
    '3_7_108_2_1_241_24_8',
    'Olives noires',
    'picholines',
    'Lorem ipsum dolor sit amet consectetur adipisicing elit. Harum molestiae blanditiis modi. Repellendus reiciendis hic veritatis minima sed incidunt dolore alias perspiciatis, voluptatem repellat veniam reprehenderit nihil aliquid aut iste!',
    NULL,
    'Raisonnée',
    'Grasse',
    'Test',
    'g',
    'bocal',
    '2.50',
    '15',
    '150.00',
    '2022-08-26',
    NULL,
    '25.00',
    '25.00',
    NULL,
    '2022-10-17 14:33:00',
    '2022-10-17 14:33:00'
  );
INSERT INTO
  `stocks` (
    `id`,
    `week`,
    `departement`,
    `user_id`,
    `id_prod`,
    `name`,
    `variety`,
    `description`,
    `image`,
    `agr`,
    `loc`,
    `four`,
    `mes`,
    `cond`,
    `pf`,
    `marge`,
    `quantity`,
    `arrival`,
    `commande`,
    `stock_arrival`,
    `stock_current`,
    `clone`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    364,
    '2022-W42',
    '3_8',
    0,
    '3_8_109__2_241_24_8_',
    'Haricots blancs',
    '',
    'Lorem ipsum dolor sit amet consectetur adipisicing elit. Harum molestiae blanditiis modi. Repellendus reiciendis hic veritatis minima sed incidunt dolore alias perspiciatis, voluptatem repellat veniam reprehenderit nihil aliquid aut iste!',
    NULL,
    'Raisonnée',
    'Grasse',
    'Test',
    'g',
    'bocal',
    '1.50',
    '15',
    '150.00',
    '2022-08-26',
    NULL,
    '25.00',
    '25.00',
    NULL,
    '2022-10-17 14:33:00',
    '2022-10-17 14:33:00'
  );
INSERT INTO
  `stocks` (
    `id`,
    `week`,
    `departement`,
    `user_id`,
    `id_prod`,
    `name`,
    `variety`,
    `description`,
    `image`,
    `agr`,
    `loc`,
    `four`,
    `mes`,
    `cond`,
    `pf`,
    `marge`,
    `quantity`,
    `arrival`,
    `commande`,
    `stock_arrival`,
    `stock_current`,
    `clone`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    365,
    '2022-W42',
    '3_9',
    0,
    '3_9_805__2_241_24_8_',
    'Sorbet ananas',
    '',
    'Lorem ipsum dolor sit amet consectetur adipisicing elit. Harum molestiae blanditiis modi. Repellendus reiciendis hic veritatis minima sed incidunt dolore alias perspiciatis, voluptatem repellat veniam reprehenderit nihil aliquid aut iste!',
    NULL,
    'Raisonnée',
    'Grasse',
    'Test',
    'l',
    'barquette',
    '2.50',
    '15',
    '1.00',
    '2022-08-26',
    NULL,
    '25.00',
    '25.00',
    NULL,
    '2022-10-17 14:33:00',
    '2022-10-17 14:33:00'
  );
INSERT INTO
  `stocks` (
    `id`,
    `week`,
    `departement`,
    `user_id`,
    `id_prod`,
    `name`,
    `variety`,
    `description`,
    `image`,
    `agr`,
    `loc`,
    `four`,
    `mes`,
    `cond`,
    `pf`,
    `marge`,
    `quantity`,
    `arrival`,
    `commande`,
    `stock_arrival`,
    `stock_current`,
    `clone`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    366,
    '2022-W43',
    '3_7',
    0,
    '3_7_108_1_1_278_28__18',
    'Olives noires',
    'de Nyons',
    'Lorem ipsum dolor sit amet consectetur adipisicing elit. Harum molestiae blanditiis modi. Repellendus reiciendis hic veritatis minima sed incidunt dolore alias perspiciatis, voluptatem repellat veniam reprehenderit nihil aliquid aut iste!\r\n',
    NULL,
    'Bio',
    'Drôme',
    'ONyons',
    '',
    'bocal',
    '7.00',
    '15',
    '1.00',
    '2022-09-02',
    NULL,
    '50.00',
    '50.00',
    NULL,
    '2022-10-24 07:35:43',
    '2022-10-24 07:35:43'
  );
INSERT INTO
  `stocks` (
    `id`,
    `week`,
    `departement`,
    `user_id`,
    `id_prod`,
    `name`,
    `variety`,
    `description`,
    `image`,
    `agr`,
    `loc`,
    `four`,
    `mes`,
    `cond`,
    `pf`,
    `marge`,
    `quantity`,
    `arrival`,
    `commande`,
    `stock_arrival`,
    `stock_current`,
    `clone`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    367,
    '2022-W43',
    '1_1',
    0,
    '1_1_5__1_276_24_5_',
    'Brocolis',
    '',
    'Lorem ipsum dolor sit amet consectetur adipisicing elit. Harum molestiae blanditiis modi. Repellendus reiciendis hic veritatis minima sed incidunt dolore alias perspiciatis, voluptatem repellat veniam reprehenderit nihil aliquid aut iste!\r\n',
    NULL,
    'Bio',
    'Mouans-Sartoux',
    'Test',
    'pièce',
    '',
    '0.50',
    '15',
    '1.00',
    '2022-08-26',
    NULL,
    '60.00',
    '60.00',
    NULL,
    '2022-10-24 07:35:43',
    '2022-10-24 07:35:43'
  );
INSERT INTO
  `stocks` (
    `id`,
    `week`,
    `departement`,
    `user_id`,
    `id_prod`,
    `name`,
    `variety`,
    `description`,
    `image`,
    `agr`,
    `loc`,
    `four`,
    `mes`,
    `cond`,
    `pf`,
    `marge`,
    `quantity`,
    `arrival`,
    `commande`,
    `stock_arrival`,
    `stock_current`,
    `clone`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    368,
    '2022-W43',
    '1_1',
    0,
    '1_1_3_11_3_4_24_1_',
    'Aubergines',
    'tigrées',
    'Lorem ipsum dolor sit amet consectetur adipisicing elit. Harum molestiae blanditiis modi. Repellendus reiciendis hic veritatis minima sed incidunt dolore alias perspiciatis, voluptatem repellat veniam reprehenderit nihil aliquid aut iste!\r\n',
    NULL,
    'Traditionnelle',
    'Alpes-de-Haute-Provence',
    'Test',
    'kg',
    '',
    '5.00',
    '15',
    '1.00',
    '2022-08-26',
    NULL,
    '5.00',
    '5.00',
    NULL,
    '2022-10-24 07:35:43',
    '2022-10-24 07:35:43'
  );
INSERT INTO
  `stocks` (
    `id`,
    `week`,
    `departement`,
    `user_id`,
    `id_prod`,
    `name`,
    `variety`,
    `description`,
    `image`,
    `agr`,
    `loc`,
    `four`,
    `mes`,
    `cond`,
    `pf`,
    `marge`,
    `quantity`,
    `arrival`,
    `commande`,
    `stock_arrival`,
    `stock_current`,
    `clone`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    369,
    '2022-W43',
    '1_1',
    0,
    '1_1_1_3_1_274_24_8_',
    'Artichauts',
    'poivrades',
    'Lorem ipsum dolor sit amet consectetur adipisicing elit. Harum molestiae blanditiis modi. Repellendus reiciendis hic veritatis minima sed incidunt dolore alias perspiciatis, voluptatem repellat veniam reprehenderit nihil aliquid aut iste!\r\n',
    NULL,
    'Bio',
    'Peymeinade',
    'Test',
    'bouquet',
    '',
    '2.00',
    '15',
    '1.00',
    '2022-08-26',
    NULL,
    '30.00',
    '30.00',
    NULL,
    '2022-10-24 07:35:43',
    '2022-10-24 07:35:43'
  );
INSERT INTO
  `stocks` (
    `id`,
    `week`,
    `departement`,
    `user_id`,
    `id_prod`,
    `name`,
    `variety`,
    `description`,
    `image`,
    `agr`,
    `loc`,
    `four`,
    `mes`,
    `cond`,
    `pf`,
    `marge`,
    `quantity`,
    `arrival`,
    `commande`,
    `stock_arrival`,
    `stock_current`,
    `clone`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    370,
    '2022-W43',
    '2_4',
    0,
    '2_4_55__1_324_24_1_25',
    'Cassis',
    '',
    'Lorem ipsum dolor sit amet consectetur adipisicing elit. Harum molestiae blanditiis modi. Repellendus reiciendis hic veritatis minima sed incidunt dolore alias perspiciatis, voluptatem repellat veniam reprehenderit nihil aliquid aut iste!\r\n',
    NULL,
    'Bio',
    'Caussoles',
    'Test',
    'kg',
    'vrac',
    '2.00',
    '15',
    '1.00',
    '2022-09-01',
    NULL,
    '5.00',
    '5.00',
    NULL,
    '2022-10-24 07:35:43',
    '2022-10-24 07:35:43'
  );
INSERT INTO
  `stocks` (
    `id`,
    `week`,
    `departement`,
    `user_id`,
    `id_prod`,
    `name`,
    `variety`,
    `description`,
    `image`,
    `agr`,
    `loc`,
    `four`,
    `mes`,
    `cond`,
    `pf`,
    `marge`,
    `quantity`,
    `arrival`,
    `commande`,
    `stock_arrival`,
    `stock_current`,
    `clone`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    371,
    '2022-W43',
    '1_2',
    0,
    '1_2_41__1_241_24_8_',
    'Pois chiches',
    '',
    'Lorem ipsum dolor sit amet consectetur adipisicing elit. Harum molestiae blanditiis modi. Repellendus reiciendis hic veritatis minima sed incidunt dolore alias perspiciatis, voluptatem repellat veniam reprehenderit nihil aliquid aut iste!\r\n',
    NULL,
    'Bio',
    'Grasse',
    'Test',
    'bouquet',
    '',
    '1.00',
    '15',
    '1.00',
    '2022-08-26',
    NULL,
    '15.00',
    '15.00',
    NULL,
    '2022-10-24 07:35:43',
    '2022-10-24 07:35:43'
  );
INSERT INTO
  `stocks` (
    `id`,
    `week`,
    `departement`,
    `user_id`,
    `id_prod`,
    `name`,
    `variety`,
    `description`,
    `image`,
    `agr`,
    `loc`,
    `four`,
    `mes`,
    `cond`,
    `pf`,
    `marge`,
    `quantity`,
    `arrival`,
    `commande`,
    `stock_arrival`,
    `stock_current`,
    `clone`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    372,
    '2022-W43',
    '1_2',
    0,
    '1_2_40_5_1_241_24_8_',
    'Lentilles',
    'du Puy',
    'Lorem ipsum dolor sit amet consectetur adipisicing elit. Harum molestiae blanditiis modi. Repellendus reiciendis hic veritatis minima sed incidunt dolore alias perspiciatis, voluptatem repellat veniam reprehenderit nihil aliquid aut iste!\r\n',
    NULL,
    'Bio',
    'Grasse',
    'Test',
    'sachet',
    '',
    '0.50',
    '15',
    '1.00',
    '2022-08-26',
    NULL,
    '150.00',
    '150.00',
    NULL,
    '2022-10-24 07:35:43',
    '2022-10-24 07:35:43'
  );
INSERT INTO
  `stocks` (
    `id`,
    `week`,
    `departement`,
    `user_id`,
    `id_prod`,
    `name`,
    `variety`,
    `description`,
    `image`,
    `agr`,
    `loc`,
    `four`,
    `mes`,
    `cond`,
    `pf`,
    `marge`,
    `quantity`,
    `arrival`,
    `commande`,
    `stock_arrival`,
    `stock_current`,
    `clone`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    373,
    '2022-W43',
    '1_3',
    0,
    '1_3_42__1_241_24_8_',
    'Ail',
    '',
    'Lorem ipsum dolor sit amet consectetur adipisicing elit. Harum molestiae blanditiis modi. Repellendus reiciendis hic veritatis minima sed incidunt dolore alias perspiciatis, voluptatem repellat veniam reprehenderit nihil aliquid aut iste!\r\n',
    NULL,
    'Bio',
    'Grasse',
    'Test',
    'pièce',
    '',
    '0.10',
    '15',
    '1.00',
    '2022-08-26',
    NULL,
    '15.00',
    '15.00',
    NULL,
    '2022-10-24 07:35:43',
    '2022-10-24 07:35:43'
  );
INSERT INTO
  `stocks` (
    `id`,
    `week`,
    `departement`,
    `user_id`,
    `id_prod`,
    `name`,
    `variety`,
    `description`,
    `image`,
    `agr`,
    `loc`,
    `four`,
    `mes`,
    `cond`,
    `pf`,
    `marge`,
    `quantity`,
    `arrival`,
    `commande`,
    `stock_arrival`,
    `stock_current`,
    `clone`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    374,
    '2022-W43',
    '1_3',
    0,
    '1_3_48__1_241_24_8_',
    'Navets',
    '',
    'Lorem ipsum dolor sit amet consectetur adipisicing elit. Harum molestiae blanditiis modi. Repellendus reiciendis hic veritatis minima sed incidunt dolore alias perspiciatis, voluptatem repellat veniam reprehenderit nihil aliquid aut iste!\r\n',
    NULL,
    'Bio',
    'Grasse',
    'Test',
    'vrac',
    '',
    '0.20',
    '15',
    '1.00',
    '2022-08-26',
    NULL,
    '15.00',
    '15.00',
    NULL,
    '2022-10-24 07:35:43',
    '2022-10-24 07:35:43'
  );
INSERT INTO
  `stocks` (
    `id`,
    `week`,
    `departement`,
    `user_id`,
    `id_prod`,
    `name`,
    `variety`,
    `description`,
    `image`,
    `agr`,
    `loc`,
    `four`,
    `mes`,
    `cond`,
    `pf`,
    `marge`,
    `quantity`,
    `arrival`,
    `commande`,
    `stock_arrival`,
    `stock_current`,
    `clone`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    375,
    '2022-W43',
    '2_4',
    0,
    '2_4_61__2_241_24_8_',
    'Figues',
    '',
    'Lorem ipsum dolor sit amet consectetur adipisicing elit. Harum molestiae blanditiis modi. Repellendus reiciendis hic veritatis minima sed incidunt dolore alias perspiciatis, voluptatem repellat veniam reprehenderit nihil aliquid aut iste!\r\n',
    NULL,
    'Raisonnée',
    'Grasse',
    'Test',
    'vrac',
    '',
    '0.80',
    '15',
    '1.00',
    '2022-08-26',
    NULL,
    '5.00',
    '5.00',
    NULL,
    '2022-10-24 07:35:43',
    '2022-10-24 07:35:43'
  );
INSERT INTO
  `stocks` (
    `id`,
    `week`,
    `departement`,
    `user_id`,
    `id_prod`,
    `name`,
    `variety`,
    `description`,
    `image`,
    `agr`,
    `loc`,
    `four`,
    `mes`,
    `cond`,
    `pf`,
    `marge`,
    `quantity`,
    `arrival`,
    `commande`,
    `stock_arrival`,
    `stock_current`,
    `clone`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    376,
    '2022-W43',
    '2_6',
    0,
    '2_6_88_18_1_241_24_8_',
    'Ananas',
    'Victoria',
    'Lorem ipsum dolor sit amet consectetur adipisicing elit. Harum molestiae blanditiis modi. Repellendus reiciendis hic veritatis minima sed incidunt dolore alias perspiciatis, voluptatem repellat veniam reprehenderit nihil aliquid aut iste!\r\n',
    NULL,
    'Bio',
    'Grasse',
    'Test',
    'pièce',
    '',
    '3.00',
    '15',
    '1.00',
    '2022-08-26',
    NULL,
    '25.00',
    '25.00',
    NULL,
    '2022-10-24 07:35:43',
    '2022-10-24 07:35:43'
  );
INSERT INTO
  `stocks` (
    `id`,
    `week`,
    `departement`,
    `user_id`,
    `id_prod`,
    `name`,
    `variety`,
    `description`,
    `image`,
    `agr`,
    `loc`,
    `four`,
    `mes`,
    `cond`,
    `pf`,
    `marge`,
    `quantity`,
    `arrival`,
    `commande`,
    `stock_arrival`,
    `stock_current`,
    `clone`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    377,
    '2022-W43',
    '2_6',
    0,
    '2_6_100__1_241_24_8_',
    'Mangues',
    '',
    'Lorem ipsum dolor sit amet consectetur adipisicing elit. Harum molestiae blanditiis modi. Repellendus reiciendis hic veritatis minima sed incidunt dolore alias perspiciatis, voluptatem repellat veniam reprehenderit nihil aliquid aut iste!\r\n',
    NULL,
    'Bio',
    'Grasse',
    'Test',
    'pièce',
    '',
    '2.00',
    '15',
    '1.00',
    '2022-08-26',
    NULL,
    '25.00',
    '25.00',
    NULL,
    '2022-10-24 07:35:43',
    '2022-10-24 07:35:43'
  );
INSERT INTO
  `stocks` (
    `id`,
    `week`,
    `departement`,
    `user_id`,
    `id_prod`,
    `name`,
    `variety`,
    `description`,
    `image`,
    `agr`,
    `loc`,
    `four`,
    `mes`,
    `cond`,
    `pf`,
    `marge`,
    `quantity`,
    `arrival`,
    `commande`,
    `stock_arrival`,
    `stock_current`,
    `clone`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    378,
    '2022-W43',
    '2_6',
    0,
    '2_6_101__3_241_24_8_',
    'Noix de coco',
    '',
    'Lorem ipsum dolor sit amet consectetur adipisicing elit. Harum molestiae blanditiis modi. Repellendus reiciendis hic veritatis minima sed incidunt dolore alias perspiciatis, voluptatem repellat veniam reprehenderit nihil aliquid aut iste!\r\n',
    NULL,
    'Traditionnelle',
    'Grasse',
    'Test',
    'pièce',
    '',
    '1.30',
    '15',
    '1.00',
    '2022-08-26',
    NULL,
    '25.00',
    '25.00',
    NULL,
    '2022-10-24 07:35:43',
    '2022-10-24 07:35:43'
  );
INSERT INTO
  `stocks` (
    `id`,
    `week`,
    `departement`,
    `user_id`,
    `id_prod`,
    `name`,
    `variety`,
    `description`,
    `image`,
    `agr`,
    `loc`,
    `four`,
    `mes`,
    `cond`,
    `pf`,
    `marge`,
    `quantity`,
    `arrival`,
    `commande`,
    `stock_arrival`,
    `stock_current`,
    `clone`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    379,
    '2022-W43',
    '2_5',
    0,
    '2_5_87__3_241_24_8_',
    'Pignons de pin',
    '',
    'Lorem ipsum dolor sit amet consectetur adipisicing elit. Harum molestiae blanditiis modi. Repellendus reiciendis hic veritatis minima sed incidunt dolore alias perspiciatis, voluptatem repellat veniam reprehenderit nihil aliquid aut iste!\r\n',
    NULL,
    'Traditionnelle',
    'Grasse',
    'Test',
    'g',
    'sachet',
    '1.80',
    '15',
    '100.00',
    '2022-08-26',
    NULL,
    '5.00',
    '5.00',
    NULL,
    '2022-10-24 07:35:43',
    '2022-10-24 07:35:43'
  );
INSERT INTO
  `stocks` (
    `id`,
    `week`,
    `departement`,
    `user_id`,
    `id_prod`,
    `name`,
    `variety`,
    `description`,
    `image`,
    `agr`,
    `loc`,
    `four`,
    `mes`,
    `cond`,
    `pf`,
    `marge`,
    `quantity`,
    `arrival`,
    `commande`,
    `stock_arrival`,
    `stock_current`,
    `clone`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    380,
    '2022-W43',
    '2_5',
    0,
    '2_5_86__1_241_24_8_',
    'Noix',
    '',
    'Lorem ipsum dolor sit amet consectetur adipisicing elit. Harum molestiae blanditiis modi. Repellendus reiciendis hic veritatis minima sed incidunt dolore alias perspiciatis, voluptatem repellat veniam reprehenderit nihil aliquid aut iste!\r\n',
    NULL,
    'Bio',
    'Grasse',
    'Test',
    'g',
    'sachet',
    '1.00',
    '15',
    '100.00',
    '2022-08-26',
    NULL,
    '5.00',
    '5.00',
    NULL,
    '2022-10-24 07:35:43',
    '2022-10-24 07:35:43'
  );
INSERT INTO
  `stocks` (
    `id`,
    `week`,
    `departement`,
    `user_id`,
    `id_prod`,
    `name`,
    `variety`,
    `description`,
    `image`,
    `agr`,
    `loc`,
    `four`,
    `mes`,
    `cond`,
    `pf`,
    `marge`,
    `quantity`,
    `arrival`,
    `commande`,
    `stock_arrival`,
    `stock_current`,
    `clone`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    381,
    '2022-W43',
    '3_7',
    0,
    '3_7_106__2_241_24_8_',
    'Betteraves',
    '',
    'Lorem ipsum dolor sit amet consectetur adipisicing elit. Harum molestiae blanditiis modi. Repellendus reiciendis hic veritatis minima sed incidunt dolore alias perspiciatis, voluptatem repellat veniam reprehenderit nihil aliquid aut iste!\r\n',
    NULL,
    'Raisonnée',
    'Grasse',
    'Test',
    'pièce',
    '',
    '0.50',
    '15',
    '1.00',
    '2022-08-26',
    NULL,
    '25.00',
    '25.00',
    NULL,
    '2022-10-24 07:35:43',
    '2022-10-24 07:35:43'
  );
INSERT INTO
  `stocks` (
    `id`,
    `week`,
    `departement`,
    `user_id`,
    `id_prod`,
    `name`,
    `variety`,
    `description`,
    `image`,
    `agr`,
    `loc`,
    `four`,
    `mes`,
    `cond`,
    `pf`,
    `marge`,
    `quantity`,
    `arrival`,
    `commande`,
    `stock_arrival`,
    `stock_current`,
    `clone`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    382,
    '2022-W43',
    '3_7',
    0,
    '3_7_108_2_1_241_24_8',
    'Olives noires',
    'picholines',
    'Lorem ipsum dolor sit amet consectetur adipisicing elit. Harum molestiae blanditiis modi. Repellendus reiciendis hic veritatis minima sed incidunt dolore alias perspiciatis, voluptatem repellat veniam reprehenderit nihil aliquid aut iste!\r\n',
    NULL,
    'Raisonnée',
    'Grasse',
    'Test',
    'g',
    'bocal',
    '2.50',
    '15',
    '150.00',
    '2022-08-26',
    NULL,
    '25.00',
    '25.00',
    NULL,
    '2022-10-24 07:35:43',
    '2022-10-24 07:35:43'
  );
INSERT INTO
  `stocks` (
    `id`,
    `week`,
    `departement`,
    `user_id`,
    `id_prod`,
    `name`,
    `variety`,
    `description`,
    `image`,
    `agr`,
    `loc`,
    `four`,
    `mes`,
    `cond`,
    `pf`,
    `marge`,
    `quantity`,
    `arrival`,
    `commande`,
    `stock_arrival`,
    `stock_current`,
    `clone`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    383,
    '2022-W43',
    '3_8',
    0,
    '3_8_109__2_241_24_8_',
    'Haricots blancs',
    '',
    'Lorem ipsum dolor sit amet consectetur adipisicing elit. Harum molestiae blanditiis modi. Repellendus reiciendis hic veritatis minima sed incidunt dolore alias perspiciatis, voluptatem repellat veniam reprehenderit nihil aliquid aut iste!\r\n',
    NULL,
    'Raisonnée',
    'Grasse',
    'Test',
    'g',
    'bocal',
    '1.50',
    '15',
    '150.00',
    '2022-08-26',
    NULL,
    '25.00',
    '25.00',
    NULL,
    '2022-10-24 07:35:43',
    '2022-10-24 07:35:43'
  );
INSERT INTO
  `stocks` (
    `id`,
    `week`,
    `departement`,
    `user_id`,
    `id_prod`,
    `name`,
    `variety`,
    `description`,
    `image`,
    `agr`,
    `loc`,
    `four`,
    `mes`,
    `cond`,
    `pf`,
    `marge`,
    `quantity`,
    `arrival`,
    `commande`,
    `stock_arrival`,
    `stock_current`,
    `clone`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    384,
    '2022-W43',
    '3_9',
    0,
    '3_9_805__2_241_24_8_',
    'Sorbet ananas',
    '',
    'Lorem ipsum dolor sit amet consectetur adipisicing elit. Harum molestiae blanditiis modi. Repellendus reiciendis hic veritatis minima sed incidunt dolore alias perspiciatis, voluptatem repellat veniam reprehenderit nihil aliquid aut iste!\r\n',
    NULL,
    'Raisonnée',
    'Grasse',
    'Test',
    'l',
    'barquette',
    '2.50',
    '15',
    '1.00',
    '2022-08-26',
    NULL,
    '25.00',
    '25.00',
    NULL,
    '2022-10-24 07:35:43',
    '2022-10-24 07:35:43'
  );
INSERT INTO
  `stocks` (
    `id`,
    `week`,
    `departement`,
    `user_id`,
    `id_prod`,
    `name`,
    `variety`,
    `description`,
    `image`,
    `agr`,
    `loc`,
    `four`,
    `mes`,
    `cond`,
    `pf`,
    `marge`,
    `quantity`,
    `arrival`,
    `commande`,
    `stock_arrival`,
    `stock_current`,
    `clone`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    385,
    '2022-W44',
    '3_7',
    0,
    '3_7_108_1_1_278_28__18',
    'Olives noires',
    'de Nyons',
    'Lorem ipsum dolor sit amet consectetur adipisicing elit. Harum molestiae blanditiis modi. Repellendus reiciendis hic veritatis minima sed incidunt dolore alias perspiciatis, voluptatem repellat veniam reprehenderit nihil aliquid aut iste!',
    NULL,
    'Bio',
    'Drôme',
    'ONyons',
    '',
    'bocal',
    '7.00',
    '15',
    '1.00',
    '2022-09-02',
    NULL,
    '50.00',
    '50.00',
    NULL,
    '2022-10-31 13:21:35',
    '2022-10-31 13:21:35'
  );
INSERT INTO
  `stocks` (
    `id`,
    `week`,
    `departement`,
    `user_id`,
    `id_prod`,
    `name`,
    `variety`,
    `description`,
    `image`,
    `agr`,
    `loc`,
    `four`,
    `mes`,
    `cond`,
    `pf`,
    `marge`,
    `quantity`,
    `arrival`,
    `commande`,
    `stock_arrival`,
    `stock_current`,
    `clone`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    386,
    '2022-W44',
    '1_1',
    0,
    '1_1_5__1_276_24_5_',
    'Brocolis',
    '',
    'Lorem ipsum dolor sit amet consectetur adipisicing elit. Harum molestiae blanditiis modi. Repellendus reiciendis hic veritatis minima sed incidunt dolore alias perspiciatis, voluptatem repellat veniam reprehenderit nihil aliquid aut iste!',
    NULL,
    'Bio',
    'Mouans-Sartoux',
    'Test',
    'pièce',
    '',
    '0.50',
    '15',
    '1.00',
    '2022-08-26',
    NULL,
    '60.00',
    '60.00',
    NULL,
    '2022-10-31 13:21:35',
    '2022-10-31 13:21:35'
  );
INSERT INTO
  `stocks` (
    `id`,
    `week`,
    `departement`,
    `user_id`,
    `id_prod`,
    `name`,
    `variety`,
    `description`,
    `image`,
    `agr`,
    `loc`,
    `four`,
    `mes`,
    `cond`,
    `pf`,
    `marge`,
    `quantity`,
    `arrival`,
    `commande`,
    `stock_arrival`,
    `stock_current`,
    `clone`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    387,
    '2022-W44',
    '1_1',
    0,
    '1_1_3_11_3_4_24_1_',
    'Aubergines',
    'tigrées',
    'Lorem ipsum dolor sit amet consectetur adipisicing elit. Harum molestiae blanditiis modi. Repellendus reiciendis hic veritatis minima sed incidunt dolore alias perspiciatis, voluptatem repellat veniam reprehenderit nihil aliquid aut iste!',
    NULL,
    'Traditionnelle',
    'Alpes-de-Haute-Provence',
    'Test',
    'kg',
    '',
    '5.00',
    '15',
    '1.00',
    '2022-08-26',
    NULL,
    '5.00',
    '5.00',
    NULL,
    '2022-10-31 13:21:35',
    '2022-10-31 13:21:35'
  );
INSERT INTO
  `stocks` (
    `id`,
    `week`,
    `departement`,
    `user_id`,
    `id_prod`,
    `name`,
    `variety`,
    `description`,
    `image`,
    `agr`,
    `loc`,
    `four`,
    `mes`,
    `cond`,
    `pf`,
    `marge`,
    `quantity`,
    `arrival`,
    `commande`,
    `stock_arrival`,
    `stock_current`,
    `clone`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    388,
    '2022-W44',
    '1_1',
    0,
    '1_1_1_3_1_274_24_8_',
    'Artichauts',
    'poivrades',
    'Lorem ipsum dolor sit amet consectetur adipisicing elit. Harum molestiae blanditiis modi. Repellendus reiciendis hic veritatis minima sed incidunt dolore alias perspiciatis, voluptatem repellat veniam reprehenderit nihil aliquid aut iste!',
    NULL,
    'Bio',
    'Peymeinade',
    'Test',
    'bouquet',
    '',
    '2.00',
    '15',
    '1.00',
    '2022-08-26',
    NULL,
    '30.00',
    '30.00',
    NULL,
    '2022-10-31 13:21:35',
    '2022-10-31 13:21:35'
  );
INSERT INTO
  `stocks` (
    `id`,
    `week`,
    `departement`,
    `user_id`,
    `id_prod`,
    `name`,
    `variety`,
    `description`,
    `image`,
    `agr`,
    `loc`,
    `four`,
    `mes`,
    `cond`,
    `pf`,
    `marge`,
    `quantity`,
    `arrival`,
    `commande`,
    `stock_arrival`,
    `stock_current`,
    `clone`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    389,
    '2022-W44',
    '2_4',
    0,
    '2_4_55__1_324_24_1_25',
    'Cassis',
    '',
    'Lorem ipsum dolor sit amet consectetur adipisicing elit. Harum molestiae blanditiis modi. Repellendus reiciendis hic veritatis minima sed incidunt dolore alias perspiciatis, voluptatem repellat veniam reprehenderit nihil aliquid aut iste!',
    NULL,
    'Bio',
    'Caussoles',
    'Test',
    'kg',
    'vrac',
    '2.00',
    '15',
    '1.00',
    '2022-09-01',
    NULL,
    '5.00',
    '5.00',
    NULL,
    '2022-10-31 13:21:35',
    '2022-10-31 13:21:35'
  );
INSERT INTO
  `stocks` (
    `id`,
    `week`,
    `departement`,
    `user_id`,
    `id_prod`,
    `name`,
    `variety`,
    `description`,
    `image`,
    `agr`,
    `loc`,
    `four`,
    `mes`,
    `cond`,
    `pf`,
    `marge`,
    `quantity`,
    `arrival`,
    `commande`,
    `stock_arrival`,
    `stock_current`,
    `clone`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    390,
    '2022-W44',
    '1_2',
    0,
    '1_2_41__1_241_24_8_',
    'Pois chiches',
    '',
    'Lorem ipsum dolor sit amet consectetur adipisicing elit. Harum molestiae blanditiis modi. Repellendus reiciendis hic veritatis minima sed incidunt dolore alias perspiciatis, voluptatem repellat veniam reprehenderit nihil aliquid aut iste!',
    NULL,
    'Bio',
    'Grasse',
    'Test',
    'bouquet',
    '',
    '1.00',
    '15',
    '1.00',
    '2022-08-26',
    NULL,
    '15.00',
    '15.00',
    NULL,
    '2022-10-31 13:21:35',
    '2022-10-31 13:21:35'
  );
INSERT INTO
  `stocks` (
    `id`,
    `week`,
    `departement`,
    `user_id`,
    `id_prod`,
    `name`,
    `variety`,
    `description`,
    `image`,
    `agr`,
    `loc`,
    `four`,
    `mes`,
    `cond`,
    `pf`,
    `marge`,
    `quantity`,
    `arrival`,
    `commande`,
    `stock_arrival`,
    `stock_current`,
    `clone`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    391,
    '2022-W44',
    '1_2',
    0,
    '1_2_40_5_1_241_24_8_',
    'Lentilles',
    'du Puy',
    'Lorem ipsum dolor sit amet consectetur adipisicing elit. Harum molestiae blanditiis modi. Repellendus reiciendis hic veritatis minima sed incidunt dolore alias perspiciatis, voluptatem repellat veniam reprehenderit nihil aliquid aut iste!',
    NULL,
    'Bio',
    'Grasse',
    'Test',
    'sachet',
    '',
    '0.50',
    '15',
    '1.00',
    '2022-08-26',
    NULL,
    '150.00',
    '150.00',
    NULL,
    '2022-10-31 13:21:35',
    '2022-10-31 13:21:35'
  );
INSERT INTO
  `stocks` (
    `id`,
    `week`,
    `departement`,
    `user_id`,
    `id_prod`,
    `name`,
    `variety`,
    `description`,
    `image`,
    `agr`,
    `loc`,
    `four`,
    `mes`,
    `cond`,
    `pf`,
    `marge`,
    `quantity`,
    `arrival`,
    `commande`,
    `stock_arrival`,
    `stock_current`,
    `clone`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    392,
    '2022-W44',
    '1_3',
    0,
    '1_3_42__1_241_24_8_',
    'Ail',
    '',
    'Lorem ipsum dolor sit amet consectetur adipisicing elit. Harum molestiae blanditiis modi. Repellendus reiciendis hic veritatis minima sed incidunt dolore alias perspiciatis, voluptatem repellat veniam reprehenderit nihil aliquid aut iste!',
    NULL,
    'Bio',
    'Grasse',
    'Test',
    'pièce',
    '',
    '0.10',
    '15',
    '1.00',
    '2022-08-26',
    NULL,
    '15.00',
    '15.00',
    NULL,
    '2022-10-31 13:21:35',
    '2022-10-31 13:21:35'
  );
INSERT INTO
  `stocks` (
    `id`,
    `week`,
    `departement`,
    `user_id`,
    `id_prod`,
    `name`,
    `variety`,
    `description`,
    `image`,
    `agr`,
    `loc`,
    `four`,
    `mes`,
    `cond`,
    `pf`,
    `marge`,
    `quantity`,
    `arrival`,
    `commande`,
    `stock_arrival`,
    `stock_current`,
    `clone`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    393,
    '2022-W44',
    '1_3',
    0,
    '1_3_48__1_241_24_8_',
    'Navets',
    '',
    'Lorem ipsum dolor sit amet consectetur adipisicing elit. Harum molestiae blanditiis modi. Repellendus reiciendis hic veritatis minima sed incidunt dolore alias perspiciatis, voluptatem repellat veniam reprehenderit nihil aliquid aut iste!',
    NULL,
    'Bio',
    'Grasse',
    'Test',
    'vrac',
    '',
    '0.20',
    '15',
    '1.00',
    '2022-08-26',
    NULL,
    '15.00',
    '15.00',
    NULL,
    '2022-10-31 13:21:35',
    '2022-10-31 13:21:35'
  );
INSERT INTO
  `stocks` (
    `id`,
    `week`,
    `departement`,
    `user_id`,
    `id_prod`,
    `name`,
    `variety`,
    `description`,
    `image`,
    `agr`,
    `loc`,
    `four`,
    `mes`,
    `cond`,
    `pf`,
    `marge`,
    `quantity`,
    `arrival`,
    `commande`,
    `stock_arrival`,
    `stock_current`,
    `clone`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    394,
    '2022-W44',
    '2_6',
    0,
    '2_6_100__1_241_24_8_',
    'Mangues',
    '',
    'Lorem ipsum dolor sit amet consectetur adipisicing elit. Harum molestiae blanditiis modi. Repellendus reiciendis hic veritatis minima sed incidunt dolore alias perspiciatis, voluptatem repellat veniam reprehenderit nihil aliquid aut iste!',
    NULL,
    'Bio',
    'Grasse',
    'Test',
    'pièce',
    '',
    '2.00',
    '15',
    '1.00',
    '2022-08-26',
    NULL,
    '25.00',
    '25.00',
    NULL,
    '2022-10-31 13:21:35',
    '2022-10-31 13:21:35'
  );
INSERT INTO
  `stocks` (
    `id`,
    `week`,
    `departement`,
    `user_id`,
    `id_prod`,
    `name`,
    `variety`,
    `description`,
    `image`,
    `agr`,
    `loc`,
    `four`,
    `mes`,
    `cond`,
    `pf`,
    `marge`,
    `quantity`,
    `arrival`,
    `commande`,
    `stock_arrival`,
    `stock_current`,
    `clone`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    395,
    '2022-W44',
    '2_6',
    0,
    '2_6_101__3_241_24_8_',
    'Noix de coco',
    '',
    'Lorem ipsum dolor sit amet consectetur adipisicing elit. Harum molestiae blanditiis modi. Repellendus reiciendis hic veritatis minima sed incidunt dolore alias perspiciatis, voluptatem repellat veniam reprehenderit nihil aliquid aut iste!',
    NULL,
    'Traditionnelle',
    'Grasse',
    'Test',
    'pièce',
    '',
    '1.30',
    '15',
    '1.00',
    '2022-08-26',
    NULL,
    '25.00',
    '25.00',
    NULL,
    '2022-10-31 13:21:35',
    '2022-10-31 13:21:35'
  );
INSERT INTO
  `stocks` (
    `id`,
    `week`,
    `departement`,
    `user_id`,
    `id_prod`,
    `name`,
    `variety`,
    `description`,
    `image`,
    `agr`,
    `loc`,
    `four`,
    `mes`,
    `cond`,
    `pf`,
    `marge`,
    `quantity`,
    `arrival`,
    `commande`,
    `stock_arrival`,
    `stock_current`,
    `clone`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    396,
    '2022-W44',
    '2_5',
    0,
    '2_5_87__3_241_24_8_',
    'Pignons de pin',
    '',
    'Lorem ipsum dolor sit amet consectetur adipisicing elit. Harum molestiae blanditiis modi. Repellendus reiciendis hic veritatis minima sed incidunt dolore alias perspiciatis, voluptatem repellat veniam reprehenderit nihil aliquid aut iste!',
    NULL,
    'Traditionnelle',
    'Grasse',
    'Test',
    'g',
    'sachet',
    '1.80',
    '15',
    '100.00',
    '2022-08-26',
    NULL,
    '5.00',
    '5.00',
    NULL,
    '2022-10-31 13:21:35',
    '2022-10-31 13:21:35'
  );
INSERT INTO
  `stocks` (
    `id`,
    `week`,
    `departement`,
    `user_id`,
    `id_prod`,
    `name`,
    `variety`,
    `description`,
    `image`,
    `agr`,
    `loc`,
    `four`,
    `mes`,
    `cond`,
    `pf`,
    `marge`,
    `quantity`,
    `arrival`,
    `commande`,
    `stock_arrival`,
    `stock_current`,
    `clone`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    397,
    '2022-W44',
    '2_4',
    0,
    '2_4_61__2_241_24_8_',
    'Figues',
    '',
    'Lorem ipsum dolor sit amet consectetur adipisicing elit. Harum molestiae blanditiis modi. Repellendus reiciendis hic veritatis minima sed incidunt dolore alias perspiciatis, voluptatem repellat veniam reprehenderit nihil aliquid aut iste!',
    NULL,
    'Raisonnée',
    'Grasse',
    'Test',
    'vrac',
    '',
    '0.80',
    '15',
    '1.00',
    '2022-08-26',
    NULL,
    '5.00',
    '5.00',
    NULL,
    '2022-10-31 13:21:35',
    '2022-10-31 13:21:35'
  );
INSERT INTO
  `stocks` (
    `id`,
    `week`,
    `departement`,
    `user_id`,
    `id_prod`,
    `name`,
    `variety`,
    `description`,
    `image`,
    `agr`,
    `loc`,
    `four`,
    `mes`,
    `cond`,
    `pf`,
    `marge`,
    `quantity`,
    `arrival`,
    `commande`,
    `stock_arrival`,
    `stock_current`,
    `clone`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    398,
    '2022-W44',
    '2_6',
    0,
    '2_6_88_18_1_241_24_8_',
    'Ananas',
    'Victoria',
    'Lorem ipsum dolor sit amet consectetur adipisicing elit. Harum molestiae blanditiis modi. Repellendus reiciendis hic veritatis minima sed incidunt dolore alias perspiciatis, voluptatem repellat veniam reprehenderit nihil aliquid aut iste!',
    NULL,
    'Bio',
    'Grasse',
    'Test',
    'pièce',
    '',
    '3.00',
    '15',
    '1.00',
    '2022-08-26',
    NULL,
    '25.00',
    '25.00',
    NULL,
    '2022-10-31 13:21:35',
    '2022-10-31 13:21:35'
  );
INSERT INTO
  `stocks` (
    `id`,
    `week`,
    `departement`,
    `user_id`,
    `id_prod`,
    `name`,
    `variety`,
    `description`,
    `image`,
    `agr`,
    `loc`,
    `four`,
    `mes`,
    `cond`,
    `pf`,
    `marge`,
    `quantity`,
    `arrival`,
    `commande`,
    `stock_arrival`,
    `stock_current`,
    `clone`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    399,
    '2022-W44',
    '2_5',
    0,
    '2_5_86__1_241_24_8_',
    'Noix',
    '',
    'Lorem ipsum dolor sit amet consectetur adipisicing elit. Harum molestiae blanditiis modi. Repellendus reiciendis hic veritatis minima sed incidunt dolore alias perspiciatis, voluptatem repellat veniam reprehenderit nihil aliquid aut iste!',
    NULL,
    'Bio',
    'Grasse',
    'Test',
    'g',
    'sachet',
    '1.00',
    '15',
    '100.00',
    '2022-08-26',
    NULL,
    '5.00',
    '5.00',
    NULL,
    '2022-10-31 13:21:35',
    '2022-10-31 13:21:35'
  );
INSERT INTO
  `stocks` (
    `id`,
    `week`,
    `departement`,
    `user_id`,
    `id_prod`,
    `name`,
    `variety`,
    `description`,
    `image`,
    `agr`,
    `loc`,
    `four`,
    `mes`,
    `cond`,
    `pf`,
    `marge`,
    `quantity`,
    `arrival`,
    `commande`,
    `stock_arrival`,
    `stock_current`,
    `clone`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    400,
    '2022-W44',
    '3_7',
    0,
    '3_7_106__2_241_24_8_',
    'Betteraves',
    '',
    'Lorem ipsum dolor sit amet consectetur adipisicing elit. Harum molestiae blanditiis modi. Repellendus reiciendis hic veritatis minima sed incidunt dolore alias perspiciatis, voluptatem repellat veniam reprehenderit nihil aliquid aut iste!',
    NULL,
    'Raisonnée',
    'Grasse',
    'Test',
    'pièce',
    '',
    '0.50',
    '15',
    '1.00',
    '2022-08-26',
    NULL,
    '25.00',
    '25.00',
    NULL,
    '2022-10-31 13:21:35',
    '2022-10-31 13:21:35'
  );
INSERT INTO
  `stocks` (
    `id`,
    `week`,
    `departement`,
    `user_id`,
    `id_prod`,
    `name`,
    `variety`,
    `description`,
    `image`,
    `agr`,
    `loc`,
    `four`,
    `mes`,
    `cond`,
    `pf`,
    `marge`,
    `quantity`,
    `arrival`,
    `commande`,
    `stock_arrival`,
    `stock_current`,
    `clone`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    401,
    '2022-W44',
    '3_7',
    0,
    '3_7_108_2_1_241_24_8',
    'Olives noires',
    'picholines',
    'Lorem ipsum dolor sit amet consectetur adipisicing elit. Harum molestiae blanditiis modi. Repellendus reiciendis hic veritatis minima sed incidunt dolore alias perspiciatis, voluptatem repellat veniam reprehenderit nihil aliquid aut iste!',
    NULL,
    'Raisonnée',
    'Grasse',
    'Test',
    'g',
    'bocal',
    '2.50',
    '15',
    '150.00',
    '2022-08-26',
    NULL,
    '25.00',
    '25.00',
    NULL,
    '2022-10-31 13:21:35',
    '2022-10-31 13:21:35'
  );
INSERT INTO
  `stocks` (
    `id`,
    `week`,
    `departement`,
    `user_id`,
    `id_prod`,
    `name`,
    `variety`,
    `description`,
    `image`,
    `agr`,
    `loc`,
    `four`,
    `mes`,
    `cond`,
    `pf`,
    `marge`,
    `quantity`,
    `arrival`,
    `commande`,
    `stock_arrival`,
    `stock_current`,
    `clone`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    402,
    '2022-W44',
    '3_8',
    0,
    '3_8_109__2_241_24_8_',
    'Haricots blancs',
    '',
    'Lorem ipsum dolor sit amet consectetur adipisicing elit. Harum molestiae blanditiis modi. Repellendus reiciendis hic veritatis minima sed incidunt dolore alias perspiciatis, voluptatem repellat veniam reprehenderit nihil aliquid aut iste!',
    NULL,
    'Raisonnée',
    'Grasse',
    'Test',
    'g',
    'bocal',
    '1.50',
    '15',
    '150.00',
    '2022-08-26',
    NULL,
    '25.00',
    '25.00',
    NULL,
    '2022-10-31 13:21:35',
    '2022-10-31 13:21:35'
  );
INSERT INTO
  `stocks` (
    `id`,
    `week`,
    `departement`,
    `user_id`,
    `id_prod`,
    `name`,
    `variety`,
    `description`,
    `image`,
    `agr`,
    `loc`,
    `four`,
    `mes`,
    `cond`,
    `pf`,
    `marge`,
    `quantity`,
    `arrival`,
    `commande`,
    `stock_arrival`,
    `stock_current`,
    `clone`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    403,
    '2022-W44',
    '3_9',
    0,
    '3_9_805__2_241_24_8_',
    'Sorbet ananas',
    '',
    'Lorem ipsum dolor sit amet consectetur adipisicing elit. Harum molestiae blanditiis modi. Repellendus reiciendis hic veritatis minima sed incidunt dolore alias perspiciatis, voluptatem repellat veniam reprehenderit nihil aliquid aut iste!',
    NULL,
    'Raisonnée',
    'Grasse',
    'Test',
    'l',
    'barquette',
    '2.50',
    '15',
    '1.00',
    '2022-08-26',
    NULL,
    '25.00',
    '25.00',
    NULL,
    '2022-10-31 13:21:35',
    '2022-10-31 13:21:35'
  );
INSERT INTO
  `stocks` (
    `id`,
    `week`,
    `departement`,
    `user_id`,
    `id_prod`,
    `name`,
    `variety`,
    `description`,
    `image`,
    `agr`,
    `loc`,
    `four`,
    `mes`,
    `cond`,
    `pf`,
    `marge`,
    `quantity`,
    `arrival`,
    `commande`,
    `stock_arrival`,
    `stock_current`,
    `clone`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    404,
    '2022-W45',
    '3_7',
    0,
    '3_7_108_1_1_278_28__18',
    'Olives noires',
    'de Nyons',
    'Lorem ipsum dolor sit amet consectetur adipisicing elit. Harum molestiae blanditiis modi. Repellendus reiciendis hic veritatis minima sed incidunt dolore alias perspiciatis, voluptatem repellat veniam reprehenderit nihil aliquid aut iste!',
    NULL,
    'Bio',
    'Drôme',
    'ONyons',
    'cl',
    'bocal',
    '7.00',
    '15',
    '25.00',
    '2022-09-02',
    NULL,
    '50.00',
    '50.00',
    NULL,
    '2022-11-07 08:15:01',
    '2022-11-07 08:15:01'
  );
INSERT INTO
  `stocks` (
    `id`,
    `week`,
    `departement`,
    `user_id`,
    `id_prod`,
    `name`,
    `variety`,
    `description`,
    `image`,
    `agr`,
    `loc`,
    `four`,
    `mes`,
    `cond`,
    `pf`,
    `marge`,
    `quantity`,
    `arrival`,
    `commande`,
    `stock_arrival`,
    `stock_current`,
    `clone`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    405,
    '2022-W45',
    '1_1',
    0,
    '1_1_5__1_276_24_5_',
    'Brocolis',
    '',
    'Lorem ipsum dolor sit amet consectetur adipisicing elit. Harum molestiae blanditiis modi. Repellendus reiciendis hic veritatis minima sed incidunt dolore alias perspiciatis, voluptatem repellat veniam reprehenderit nihil aliquid aut iste!',
    NULL,
    'Bio',
    'Mouans-Sartoux',
    'Test',
    'pièce',
    '',
    '0.50',
    '15',
    '1.00',
    '2022-08-26',
    NULL,
    '60.00',
    '60.00',
    NULL,
    '2022-11-07 08:15:01',
    '2022-11-07 08:15:01'
  );
INSERT INTO
  `stocks` (
    `id`,
    `week`,
    `departement`,
    `user_id`,
    `id_prod`,
    `name`,
    `variety`,
    `description`,
    `image`,
    `agr`,
    `loc`,
    `four`,
    `mes`,
    `cond`,
    `pf`,
    `marge`,
    `quantity`,
    `arrival`,
    `commande`,
    `stock_arrival`,
    `stock_current`,
    `clone`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    406,
    '2022-W45',
    '1_1',
    0,
    '1_1_3_11_3_4_24_1_',
    'Aubergines',
    'tigrées',
    'Lorem ipsum dolor sit amet consectetur adipisicing elit. Harum molestiae blanditiis modi. Repellendus reiciendis hic veritatis minima sed incidunt dolore alias perspiciatis, voluptatem repellat veniam reprehenderit nihil aliquid aut iste!',
    NULL,
    'Traditionnelle',
    'Alpes-de-Haute-Provence',
    'Test',
    'kg',
    '',
    '5.00',
    '15',
    '1.00',
    '2022-08-26',
    NULL,
    '5.00',
    '5.00',
    NULL,
    '2022-11-07 08:15:01',
    '2022-11-07 08:15:01'
  );
INSERT INTO
  `stocks` (
    `id`,
    `week`,
    `departement`,
    `user_id`,
    `id_prod`,
    `name`,
    `variety`,
    `description`,
    `image`,
    `agr`,
    `loc`,
    `four`,
    `mes`,
    `cond`,
    `pf`,
    `marge`,
    `quantity`,
    `arrival`,
    `commande`,
    `stock_arrival`,
    `stock_current`,
    `clone`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    407,
    '2022-W45',
    '1_1',
    0,
    '1_1_1_3_1_274_24_8_',
    'Artichauts',
    'poivrades',
    'Lorem ipsum dolor sit amet consectetur adipisicing elit. Harum molestiae blanditiis modi. Repellendus reiciendis hic veritatis minima sed incidunt dolore alias perspiciatis, voluptatem repellat veniam reprehenderit nihil aliquid aut iste!',
    NULL,
    'Bio',
    'Peymeinade',
    'Test',
    'bouquet',
    '',
    '2.00',
    '15',
    '1.00',
    '2022-08-26',
    NULL,
    '30.00',
    '30.00',
    NULL,
    '2022-11-07 08:15:01',
    '2022-11-07 08:15:01'
  );
INSERT INTO
  `stocks` (
    `id`,
    `week`,
    `departement`,
    `user_id`,
    `id_prod`,
    `name`,
    `variety`,
    `description`,
    `image`,
    `agr`,
    `loc`,
    `four`,
    `mes`,
    `cond`,
    `pf`,
    `marge`,
    `quantity`,
    `arrival`,
    `commande`,
    `stock_arrival`,
    `stock_current`,
    `clone`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    408,
    '2022-W45',
    '2_4',
    0,
    '2_4_55__1_324_24_1_25',
    'Cassis',
    '',
    'Lorem ipsum dolor sit amet consectetur adipisicing elit. Harum molestiae blanditiis modi. Repellendus reiciendis hic veritatis minima sed incidunt dolore alias perspiciatis, voluptatem repellat veniam reprehenderit nihil aliquid aut iste!',
    NULL,
    'Bio',
    'Caussoles',
    'Test',
    'kg',
    'vrac',
    '2.00',
    '15',
    '1.00',
    '2022-09-01',
    NULL,
    '5.00',
    '5.00',
    NULL,
    '2022-11-07 08:15:01',
    '2022-11-07 08:15:01'
  );
INSERT INTO
  `stocks` (
    `id`,
    `week`,
    `departement`,
    `user_id`,
    `id_prod`,
    `name`,
    `variety`,
    `description`,
    `image`,
    `agr`,
    `loc`,
    `four`,
    `mes`,
    `cond`,
    `pf`,
    `marge`,
    `quantity`,
    `arrival`,
    `commande`,
    `stock_arrival`,
    `stock_current`,
    `clone`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    409,
    '2022-W45',
    '1_2',
    0,
    '1_2_41__1_241_24_8_',
    'Pois chiches',
    '',
    'Lorem ipsum dolor sit amet consectetur adipisicing elit. Harum molestiae blanditiis modi. Repellendus reiciendis hic veritatis minima sed incidunt dolore alias perspiciatis, voluptatem repellat veniam reprehenderit nihil aliquid aut iste!',
    NULL,
    'Bio',
    'Grasse',
    'Test',
    'bouquet',
    '',
    '1.00',
    '15',
    '1.00',
    '2022-08-26',
    NULL,
    '15.00',
    '15.00',
    NULL,
    '2022-11-07 08:15:01',
    '2022-11-07 08:15:01'
  );
INSERT INTO
  `stocks` (
    `id`,
    `week`,
    `departement`,
    `user_id`,
    `id_prod`,
    `name`,
    `variety`,
    `description`,
    `image`,
    `agr`,
    `loc`,
    `four`,
    `mes`,
    `cond`,
    `pf`,
    `marge`,
    `quantity`,
    `arrival`,
    `commande`,
    `stock_arrival`,
    `stock_current`,
    `clone`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    410,
    '2022-W45',
    '1_2',
    0,
    '1_2_40_5_1_241_24_8_',
    'Lentilles',
    'du Puy',
    'Lorem ipsum dolor sit amet consectetur adipisicing elit. Harum molestiae blanditiis modi. Repellendus reiciendis hic veritatis minima sed incidunt dolore alias perspiciatis, voluptatem repellat veniam reprehenderit nihil aliquid aut iste!',
    NULL,
    'Bio',
    'Grasse',
    'Test',
    'sachet',
    '',
    '0.50',
    '15',
    '1.00',
    '2022-08-26',
    NULL,
    '150.00',
    '150.00',
    NULL,
    '2022-11-07 08:15:01',
    '2022-11-07 08:15:01'
  );
INSERT INTO
  `stocks` (
    `id`,
    `week`,
    `departement`,
    `user_id`,
    `id_prod`,
    `name`,
    `variety`,
    `description`,
    `image`,
    `agr`,
    `loc`,
    `four`,
    `mes`,
    `cond`,
    `pf`,
    `marge`,
    `quantity`,
    `arrival`,
    `commande`,
    `stock_arrival`,
    `stock_current`,
    `clone`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    411,
    '2022-W45',
    '1_3',
    0,
    '1_3_42__1_241_24_8_',
    'Ail',
    '',
    'Lorem ipsum dolor sit amet consectetur adipisicing elit. Harum molestiae blanditiis modi. Repellendus reiciendis hic veritatis minima sed incidunt dolore alias perspiciatis, voluptatem repellat veniam reprehenderit nihil aliquid aut iste!',
    NULL,
    'Bio',
    'Grasse',
    'Test',
    'pièce',
    '',
    '0.10',
    '15',
    '1.00',
    '2022-08-26',
    NULL,
    '15.00',
    '15.00',
    NULL,
    '2022-11-07 08:15:01',
    '2022-11-07 08:15:01'
  );
INSERT INTO
  `stocks` (
    `id`,
    `week`,
    `departement`,
    `user_id`,
    `id_prod`,
    `name`,
    `variety`,
    `description`,
    `image`,
    `agr`,
    `loc`,
    `four`,
    `mes`,
    `cond`,
    `pf`,
    `marge`,
    `quantity`,
    `arrival`,
    `commande`,
    `stock_arrival`,
    `stock_current`,
    `clone`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    412,
    '2022-W45',
    '1_3',
    0,
    '1_3_48__1_241_24_8_',
    'Navets',
    '',
    'Lorem ipsum dolor sit amet consectetur adipisicing elit. Harum molestiae blanditiis modi. Repellendus reiciendis hic veritatis minima sed incidunt dolore alias perspiciatis, voluptatem repellat veniam reprehenderit nihil aliquid aut iste!',
    NULL,
    'Bio',
    'Grasse',
    'Test',
    'vrac',
    '',
    '0.20',
    '15',
    '1.00',
    '2022-08-26',
    NULL,
    '15.00',
    '15.00',
    NULL,
    '2022-11-07 08:15:01',
    '2022-11-07 08:15:01'
  );
INSERT INTO
  `stocks` (
    `id`,
    `week`,
    `departement`,
    `user_id`,
    `id_prod`,
    `name`,
    `variety`,
    `description`,
    `image`,
    `agr`,
    `loc`,
    `four`,
    `mes`,
    `cond`,
    `pf`,
    `marge`,
    `quantity`,
    `arrival`,
    `commande`,
    `stock_arrival`,
    `stock_current`,
    `clone`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    413,
    '2022-W45',
    '2_5',
    0,
    '2_5_87__3_241_24_8_',
    'Pignons de pin',
    '',
    'Lorem ipsum dolor sit amet consectetur adipisicing elit. Harum molestiae blanditiis modi. Repellendus reiciendis hic veritatis minima sed incidunt dolore alias perspiciatis, voluptatem repellat veniam reprehenderit nihil aliquid aut iste!',
    NULL,
    'Traditionnelle',
    'Grasse',
    'Test',
    'g',
    'sachet',
    '1.80',
    '15',
    '100.00',
    '2022-08-26',
    NULL,
    '5.00',
    '5.00',
    NULL,
    '2022-11-07 08:15:01',
    '2022-11-07 08:15:01'
  );
INSERT INTO
  `stocks` (
    `id`,
    `week`,
    `departement`,
    `user_id`,
    `id_prod`,
    `name`,
    `variety`,
    `description`,
    `image`,
    `agr`,
    `loc`,
    `four`,
    `mes`,
    `cond`,
    `pf`,
    `marge`,
    `quantity`,
    `arrival`,
    `commande`,
    `stock_arrival`,
    `stock_current`,
    `clone`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    414,
    '2022-W45',
    '2_4',
    0,
    '2_4_61__2_241_24_8_',
    'Figues',
    '',
    'Lorem ipsum dolor sit amet consectetur adipisicing elit. Harum molestiae blanditiis modi. Repellendus reiciendis hic veritatis minima sed incidunt dolore alias perspiciatis, voluptatem repellat veniam reprehenderit nihil aliquid aut iste!',
    NULL,
    'Raisonnée',
    'Grasse',
    'Test',
    'vrac',
    '',
    '0.80',
    '15',
    '1.00',
    '2022-08-26',
    NULL,
    '5.00',
    '5.00',
    NULL,
    '2022-11-07 08:15:01',
    '2022-11-07 08:15:01'
  );
INSERT INTO
  `stocks` (
    `id`,
    `week`,
    `departement`,
    `user_id`,
    `id_prod`,
    `name`,
    `variety`,
    `description`,
    `image`,
    `agr`,
    `loc`,
    `four`,
    `mes`,
    `cond`,
    `pf`,
    `marge`,
    `quantity`,
    `arrival`,
    `commande`,
    `stock_arrival`,
    `stock_current`,
    `clone`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    415,
    '2022-W45',
    '2_6',
    0,
    '2_6_88_18_1_241_24_8_',
    'Ananas',
    'Victoria',
    'Lorem ipsum dolor sit amet consectetur adipisicing elit. Harum molestiae blanditiis modi. Repellendus reiciendis hic veritatis minima sed incidunt dolore alias perspiciatis, voluptatem repellat veniam reprehenderit nihil aliquid aut iste!',
    NULL,
    'Bio',
    'Grasse',
    'Test',
    'pièce',
    '',
    '3.00',
    '15',
    '1.00',
    '2022-08-26',
    NULL,
    '25.00',
    '25.00',
    NULL,
    '2022-11-07 08:15:01',
    '2022-11-07 08:15:01'
  );
INSERT INTO
  `stocks` (
    `id`,
    `week`,
    `departement`,
    `user_id`,
    `id_prod`,
    `name`,
    `variety`,
    `description`,
    `image`,
    `agr`,
    `loc`,
    `four`,
    `mes`,
    `cond`,
    `pf`,
    `marge`,
    `quantity`,
    `arrival`,
    `commande`,
    `stock_arrival`,
    `stock_current`,
    `clone`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    416,
    '2022-W45',
    '2_6',
    0,
    '2_6_100__1_241_24_8_',
    'Mangues',
    '',
    'Lorem ipsum dolor sit amet consectetur adipisicing elit. Harum molestiae blanditiis modi. Repellendus reiciendis hic veritatis minima sed incidunt dolore alias perspiciatis, voluptatem repellat veniam reprehenderit nihil aliquid aut iste!',
    NULL,
    'Bio',
    'Grasse',
    'Test',
    'pièce',
    '',
    '2.00',
    '15',
    '1.00',
    '2022-08-26',
    NULL,
    '25.00',
    '25.00',
    NULL,
    '2022-11-07 08:15:01',
    '2022-11-07 08:15:01'
  );
INSERT INTO
  `stocks` (
    `id`,
    `week`,
    `departement`,
    `user_id`,
    `id_prod`,
    `name`,
    `variety`,
    `description`,
    `image`,
    `agr`,
    `loc`,
    `four`,
    `mes`,
    `cond`,
    `pf`,
    `marge`,
    `quantity`,
    `arrival`,
    `commande`,
    `stock_arrival`,
    `stock_current`,
    `clone`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    417,
    '2022-W45',
    '2_6',
    0,
    '2_6_101__3_241_24_8_',
    'Noix de coco',
    '',
    'Lorem ipsum dolor sit amet consectetur adipisicing elit. Harum molestiae blanditiis modi. Repellendus reiciendis hic veritatis minima sed incidunt dolore alias perspiciatis, voluptatem repellat veniam reprehenderit nihil aliquid aut iste!',
    NULL,
    'Traditionnelle',
    'Grasse',
    'Test',
    'pièce',
    '',
    '1.30',
    '15',
    '1.00',
    '2022-08-26',
    NULL,
    '25.00',
    '25.00',
    NULL,
    '2022-11-07 08:15:01',
    '2022-11-07 08:15:01'
  );
INSERT INTO
  `stocks` (
    `id`,
    `week`,
    `departement`,
    `user_id`,
    `id_prod`,
    `name`,
    `variety`,
    `description`,
    `image`,
    `agr`,
    `loc`,
    `four`,
    `mes`,
    `cond`,
    `pf`,
    `marge`,
    `quantity`,
    `arrival`,
    `commande`,
    `stock_arrival`,
    `stock_current`,
    `clone`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    418,
    '2022-W45',
    '2_5',
    0,
    '2_5_86__1_241_24_8_',
    'Noix',
    '',
    'Lorem ipsum dolor sit amet consectetur adipisicing elit. Harum molestiae blanditiis modi. Repellendus reiciendis hic veritatis minima sed incidunt dolore alias perspiciatis, voluptatem repellat veniam reprehenderit nihil aliquid aut iste!',
    NULL,
    'Bio',
    'Grasse',
    'Test',
    'g',
    'sachet',
    '1.00',
    '15',
    '100.00',
    '2022-08-26',
    NULL,
    '5.00',
    '5.00',
    NULL,
    '2022-11-07 08:15:01',
    '2022-11-07 08:15:01'
  );
INSERT INTO
  `stocks` (
    `id`,
    `week`,
    `departement`,
    `user_id`,
    `id_prod`,
    `name`,
    `variety`,
    `description`,
    `image`,
    `agr`,
    `loc`,
    `four`,
    `mes`,
    `cond`,
    `pf`,
    `marge`,
    `quantity`,
    `arrival`,
    `commande`,
    `stock_arrival`,
    `stock_current`,
    `clone`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    419,
    '2022-W45',
    '3_7',
    0,
    '3_7_106__2_241_24_8_',
    'Betteraves',
    '',
    'Lorem ipsum dolor sit amet consectetur adipisicing elit. Harum molestiae blanditiis modi. Repellendus reiciendis hic veritatis minima sed incidunt dolore alias perspiciatis, voluptatem repellat veniam reprehenderit nihil aliquid aut iste!',
    NULL,
    'Raisonnée',
    'Grasse',
    'Test',
    'pièce',
    '',
    '0.50',
    '15',
    '1.00',
    '2022-08-26',
    NULL,
    '25.00',
    '25.00',
    NULL,
    '2022-11-07 08:15:01',
    '2022-11-07 08:15:01'
  );
INSERT INTO
  `stocks` (
    `id`,
    `week`,
    `departement`,
    `user_id`,
    `id_prod`,
    `name`,
    `variety`,
    `description`,
    `image`,
    `agr`,
    `loc`,
    `four`,
    `mes`,
    `cond`,
    `pf`,
    `marge`,
    `quantity`,
    `arrival`,
    `commande`,
    `stock_arrival`,
    `stock_current`,
    `clone`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    420,
    '2022-W45',
    '3_7',
    0,
    '3_7_108_2_1_241_24_8',
    'Olives noires',
    'picholines',
    'Lorem ipsum dolor sit amet consectetur adipisicing elit. Harum molestiae blanditiis modi. Repellendus reiciendis hic veritatis minima sed incidunt dolore alias perspiciatis, voluptatem repellat veniam reprehenderit nihil aliquid aut iste!',
    NULL,
    'Raisonnée',
    'Grasse',
    'Test',
    'g',
    'bocal',
    '2.50',
    '15',
    '150.00',
    '2022-08-26',
    NULL,
    '25.00',
    '25.00',
    NULL,
    '2022-11-07 08:15:01',
    '2022-11-07 08:15:01'
  );
INSERT INTO
  `stocks` (
    `id`,
    `week`,
    `departement`,
    `user_id`,
    `id_prod`,
    `name`,
    `variety`,
    `description`,
    `image`,
    `agr`,
    `loc`,
    `four`,
    `mes`,
    `cond`,
    `pf`,
    `marge`,
    `quantity`,
    `arrival`,
    `commande`,
    `stock_arrival`,
    `stock_current`,
    `clone`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    421,
    '2022-W45',
    '3_8',
    0,
    '3_8_109__2_241_24_8_',
    'Haricots blancs',
    '',
    'Lorem ipsum dolor sit amet consectetur adipisicing elit. Harum molestiae blanditiis modi. Repellendus reiciendis hic veritatis minima sed incidunt dolore alias perspiciatis, voluptatem repellat veniam reprehenderit nihil aliquid aut iste!',
    NULL,
    'Raisonnée',
    'Grasse',
    'Test',
    'g',
    'bocal',
    '1.50',
    '15',
    '150.00',
    '2022-08-26',
    NULL,
    '25.00',
    '25.00',
    NULL,
    '2022-11-07 08:15:01',
    '2022-11-07 08:15:01'
  );
INSERT INTO
  `stocks` (
    `id`,
    `week`,
    `departement`,
    `user_id`,
    `id_prod`,
    `name`,
    `variety`,
    `description`,
    `image`,
    `agr`,
    `loc`,
    `four`,
    `mes`,
    `cond`,
    `pf`,
    `marge`,
    `quantity`,
    `arrival`,
    `commande`,
    `stock_arrival`,
    `stock_current`,
    `clone`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    422,
    '2022-W45',
    '3_9',
    0,
    '3_9_805__2_241_24_8_',
    'Sorbet ananas',
    '',
    'Lorem ipsum dolor sit amet consectetur adipisicing elit. Harum molestiae blanditiis modi. Repellendus reiciendis hic veritatis minima sed incidunt dolore alias perspiciatis, voluptatem repellat veniam reprehenderit nihil aliquid aut iste!',
    NULL,
    'Raisonnée',
    'Grasse',
    'Test',
    'l',
    'barquette',
    '2.50',
    '15',
    '1.00',
    '2022-08-26',
    NULL,
    '25.00',
    '25.00',
    NULL,
    '2022-11-07 08:15:01',
    '2022-11-07 08:15:01'
  );
INSERT INTO
  `stocks` (
    `id`,
    `week`,
    `departement`,
    `user_id`,
    `id_prod`,
    `name`,
    `variety`,
    `description`,
    `image`,
    `agr`,
    `loc`,
    `four`,
    `mes`,
    `cond`,
    `pf`,
    `marge`,
    `quantity`,
    `arrival`,
    `commande`,
    `stock_arrival`,
    `stock_current`,
    `clone`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    423,
    '2022-W46',
    '3_7',
    0,
    '3_7_108_1_1_278_28__18',
    'Olives noires',
    'de Nyons',
    'Lorem ipsum dolor sit amet consectetur adipisicing elit. Harum molestiae blanditiis modi. Repellendus reiciendis hic veritatis minima sed incidunt dolore alias perspiciatis, voluptatem repellat veniam reprehenderit nihil aliquid aut iste!',
    NULL,
    'Bio',
    'Drôme',
    'ONyons',
    'cl',
    'bocal',
    '7.00',
    '15',
    '25.00',
    '2022-09-02',
    NULL,
    '50.00',
    '50.00',
    NULL,
    '2022-11-14 10:47:01',
    '2022-11-14 10:47:01'
  );
INSERT INTO
  `stocks` (
    `id`,
    `week`,
    `departement`,
    `user_id`,
    `id_prod`,
    `name`,
    `variety`,
    `description`,
    `image`,
    `agr`,
    `loc`,
    `four`,
    `mes`,
    `cond`,
    `pf`,
    `marge`,
    `quantity`,
    `arrival`,
    `commande`,
    `stock_arrival`,
    `stock_current`,
    `clone`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    424,
    '2022-W46',
    '1_1',
    0,
    '1_1_5__1_276_24_5_',
    'Brocolis',
    '',
    'Lorem ipsum dolor sit amet consectetur adipisicing elit. Harum molestiae blanditiis modi. Repellendus reiciendis hic veritatis minima sed incidunt dolore alias perspiciatis, voluptatem repellat veniam reprehenderit nihil aliquid aut iste!',
    NULL,
    'Bio',
    'Mouans-Sartoux',
    'Test',
    'pièce',
    '',
    '0.50',
    '15',
    '1.00',
    '2022-08-26',
    NULL,
    '60.00',
    '60.00',
    NULL,
    '2022-11-14 10:47:01',
    '2022-11-14 10:47:01'
  );
INSERT INTO
  `stocks` (
    `id`,
    `week`,
    `departement`,
    `user_id`,
    `id_prod`,
    `name`,
    `variety`,
    `description`,
    `image`,
    `agr`,
    `loc`,
    `four`,
    `mes`,
    `cond`,
    `pf`,
    `marge`,
    `quantity`,
    `arrival`,
    `commande`,
    `stock_arrival`,
    `stock_current`,
    `clone`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    425,
    '2022-W46',
    '1_1',
    0,
    '1_1_3_11_3_4_24_1_',
    'Aubergines',
    'tigrées',
    'Lorem ipsum dolor sit amet consectetur adipisicing elit. Harum molestiae blanditiis modi. Repellendus reiciendis hic veritatis minima sed incidunt dolore alias perspiciatis, voluptatem repellat veniam reprehenderit nihil aliquid aut iste!',
    NULL,
    'Traditionnelle',
    'Alpes-de-Haute-Provence',
    'Test',
    'kg',
    '',
    '5.00',
    '15',
    '1.00',
    '2022-08-26',
    NULL,
    '5.00',
    '5.00',
    NULL,
    '2022-11-14 10:47:01',
    '2022-11-14 10:47:01'
  );
INSERT INTO
  `stocks` (
    `id`,
    `week`,
    `departement`,
    `user_id`,
    `id_prod`,
    `name`,
    `variety`,
    `description`,
    `image`,
    `agr`,
    `loc`,
    `four`,
    `mes`,
    `cond`,
    `pf`,
    `marge`,
    `quantity`,
    `arrival`,
    `commande`,
    `stock_arrival`,
    `stock_current`,
    `clone`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    426,
    '2022-W46',
    '1_2',
    0,
    '1_2_40_5_1_241_24_8_',
    'Lentilles',
    'du Puy',
    'Lorem ipsum dolor sit amet consectetur adipisicing elit. Harum molestiae blanditiis modi. Repellendus reiciendis hic veritatis minima sed incidunt dolore alias perspiciatis, voluptatem repellat veniam reprehenderit nihil aliquid aut iste!',
    NULL,
    'Bio',
    'Grasse',
    'Test',
    'sachet',
    '',
    '0.50',
    '15',
    '1.00',
    '2022-08-26',
    NULL,
    '150.00',
    '150.00',
    NULL,
    '2022-11-14 10:47:01',
    '2022-11-14 10:47:01'
  );
INSERT INTO
  `stocks` (
    `id`,
    `week`,
    `departement`,
    `user_id`,
    `id_prod`,
    `name`,
    `variety`,
    `description`,
    `image`,
    `agr`,
    `loc`,
    `four`,
    `mes`,
    `cond`,
    `pf`,
    `marge`,
    `quantity`,
    `arrival`,
    `commande`,
    `stock_arrival`,
    `stock_current`,
    `clone`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    427,
    '2022-W46',
    '1_1',
    0,
    '1_1_1_3_1_274_24_8_',
    'Artichauts',
    'poivrades',
    'Lorem ipsum dolor sit amet consectetur adipisicing elit. Harum molestiae blanditiis modi. Repellendus reiciendis hic veritatis minima sed incidunt dolore alias perspiciatis, voluptatem repellat veniam reprehenderit nihil aliquid aut iste!',
    NULL,
    'Bio',
    'Peymeinade',
    'Test',
    'bouquet',
    '',
    '2.00',
    '15',
    '1.00',
    '2022-08-26',
    NULL,
    '30.00',
    '30.00',
    NULL,
    '2022-11-14 10:47:01',
    '2022-11-14 10:47:01'
  );
INSERT INTO
  `stocks` (
    `id`,
    `week`,
    `departement`,
    `user_id`,
    `id_prod`,
    `name`,
    `variety`,
    `description`,
    `image`,
    `agr`,
    `loc`,
    `four`,
    `mes`,
    `cond`,
    `pf`,
    `marge`,
    `quantity`,
    `arrival`,
    `commande`,
    `stock_arrival`,
    `stock_current`,
    `clone`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    428,
    '2022-W46',
    '2_4',
    0,
    '2_4_55__1_324_24_1_25',
    'Cassis',
    '',
    'Lorem ipsum dolor sit amet consectetur adipisicing elit. Harum molestiae blanditiis modi. Repellendus reiciendis hic veritatis minima sed incidunt dolore alias perspiciatis, voluptatem repellat veniam reprehenderit nihil aliquid aut iste!',
    NULL,
    'Bio',
    'Caussoles',
    'Test',
    'kg',
    'vrac',
    '2.00',
    '15',
    '1.00',
    '2022-09-01',
    NULL,
    '5.00',
    '5.00',
    NULL,
    '2022-11-14 10:47:01',
    '2022-11-14 10:47:01'
  );
INSERT INTO
  `stocks` (
    `id`,
    `week`,
    `departement`,
    `user_id`,
    `id_prod`,
    `name`,
    `variety`,
    `description`,
    `image`,
    `agr`,
    `loc`,
    `four`,
    `mes`,
    `cond`,
    `pf`,
    `marge`,
    `quantity`,
    `arrival`,
    `commande`,
    `stock_arrival`,
    `stock_current`,
    `clone`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    429,
    '2022-W46',
    '1_2',
    0,
    '1_2_41__1_241_24_8_',
    'Pois chiches',
    '',
    'Lorem ipsum dolor sit amet consectetur adipisicing elit. Harum molestiae blanditiis modi. Repellendus reiciendis hic veritatis minima sed incidunt dolore alias perspiciatis, voluptatem repellat veniam reprehenderit nihil aliquid aut iste!',
    NULL,
    'Bio',
    'Grasse',
    'Test',
    'bouquet',
    '',
    '1.00',
    '15',
    '1.00',
    '2022-08-26',
    NULL,
    '15.00',
    '15.00',
    NULL,
    '2022-11-14 10:47:01',
    '2022-11-14 10:47:01'
  );
INSERT INTO
  `stocks` (
    `id`,
    `week`,
    `departement`,
    `user_id`,
    `id_prod`,
    `name`,
    `variety`,
    `description`,
    `image`,
    `agr`,
    `loc`,
    `four`,
    `mes`,
    `cond`,
    `pf`,
    `marge`,
    `quantity`,
    `arrival`,
    `commande`,
    `stock_arrival`,
    `stock_current`,
    `clone`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    430,
    '2022-W46',
    '1_3',
    0,
    '1_3_48__1_241_24_8_',
    'Navets',
    '',
    'Lorem ipsum dolor sit amet consectetur adipisicing elit. Harum molestiae blanditiis modi. Repellendus reiciendis hic veritatis minima sed incidunt dolore alias perspiciatis, voluptatem repellat veniam reprehenderit nihil aliquid aut iste!',
    NULL,
    'Bio',
    'Grasse',
    'Test',
    'vrac',
    '',
    '0.20',
    '15',
    '1.00',
    '2022-08-26',
    NULL,
    '15.00',
    '15.00',
    NULL,
    '2022-11-14 10:47:01',
    '2022-11-14 10:47:01'
  );
INSERT INTO
  `stocks` (
    `id`,
    `week`,
    `departement`,
    `user_id`,
    `id_prod`,
    `name`,
    `variety`,
    `description`,
    `image`,
    `agr`,
    `loc`,
    `four`,
    `mes`,
    `cond`,
    `pf`,
    `marge`,
    `quantity`,
    `arrival`,
    `commande`,
    `stock_arrival`,
    `stock_current`,
    `clone`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    431,
    '2022-W46',
    '1_3',
    0,
    '1_3_42__1_241_24_8_',
    'Ail',
    '',
    'Lorem ipsum dolor sit amet consectetur adipisicing elit. Harum molestiae blanditiis modi. Repellendus reiciendis hic veritatis minima sed incidunt dolore alias perspiciatis, voluptatem repellat veniam reprehenderit nihil aliquid aut iste!',
    NULL,
    'Bio',
    'Grasse',
    'Test',
    'pièce',
    '',
    '0.10',
    '15',
    '1.00',
    '2022-08-26',
    NULL,
    '15.00',
    '15.00',
    NULL,
    '2022-11-14 10:47:01',
    '2022-11-14 10:47:01'
  );
INSERT INTO
  `stocks` (
    `id`,
    `week`,
    `departement`,
    `user_id`,
    `id_prod`,
    `name`,
    `variety`,
    `description`,
    `image`,
    `agr`,
    `loc`,
    `four`,
    `mes`,
    `cond`,
    `pf`,
    `marge`,
    `quantity`,
    `arrival`,
    `commande`,
    `stock_arrival`,
    `stock_current`,
    `clone`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    432,
    '2022-W46',
    '2_5',
    0,
    '2_5_87__3_241_24_8_',
    'Pignons de pin',
    '',
    'Lorem ipsum dolor sit amet consectetur adipisicing elit. Harum molestiae blanditiis modi. Repellendus reiciendis hic veritatis minima sed incidunt dolore alias perspiciatis, voluptatem repellat veniam reprehenderit nihil aliquid aut iste!',
    NULL,
    'Traditionnelle',
    'Grasse',
    'Test',
    'g',
    'sachet',
    '1.80',
    '15',
    '100.00',
    '2022-08-26',
    NULL,
    '5.00',
    '5.00',
    NULL,
    '2022-11-14 10:47:01',
    '2022-11-14 10:47:01'
  );
INSERT INTO
  `stocks` (
    `id`,
    `week`,
    `departement`,
    `user_id`,
    `id_prod`,
    `name`,
    `variety`,
    `description`,
    `image`,
    `agr`,
    `loc`,
    `four`,
    `mes`,
    `cond`,
    `pf`,
    `marge`,
    `quantity`,
    `arrival`,
    `commande`,
    `stock_arrival`,
    `stock_current`,
    `clone`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    433,
    '2022-W46',
    '2_4',
    0,
    '2_4_61__2_241_24_8_',
    'Figues',
    '',
    'Lorem ipsum dolor sit amet consectetur adipisicing elit. Harum molestiae blanditiis modi. Repellendus reiciendis hic veritatis minima sed incidunt dolore alias perspiciatis, voluptatem repellat veniam reprehenderit nihil aliquid aut iste!',
    NULL,
    'Raisonnée',
    'Grasse',
    'Test',
    'vrac',
    '',
    '0.80',
    '15',
    '1.00',
    '2022-08-26',
    NULL,
    '5.00',
    '5.00',
    NULL,
    '2022-11-14 10:47:01',
    '2022-11-14 10:47:01'
  );
INSERT INTO
  `stocks` (
    `id`,
    `week`,
    `departement`,
    `user_id`,
    `id_prod`,
    `name`,
    `variety`,
    `description`,
    `image`,
    `agr`,
    `loc`,
    `four`,
    `mes`,
    `cond`,
    `pf`,
    `marge`,
    `quantity`,
    `arrival`,
    `commande`,
    `stock_arrival`,
    `stock_current`,
    `clone`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    434,
    '2022-W46',
    '2_6',
    0,
    '2_6_88_18_1_241_24_8_',
    'Ananas',
    'Victoria',
    'Lorem ipsum dolor sit amet consectetur adipisicing elit. Harum molestiae blanditiis modi. Repellendus reiciendis hic veritatis minima sed incidunt dolore alias perspiciatis, voluptatem repellat veniam reprehenderit nihil aliquid aut iste!',
    NULL,
    'Bio',
    'Grasse',
    'Test',
    'pièce',
    '',
    '3.00',
    '15',
    '1.00',
    '2022-08-26',
    NULL,
    '25.00',
    '25.00',
    NULL,
    '2022-11-14 10:47:01',
    '2022-11-14 10:47:01'
  );
INSERT INTO
  `stocks` (
    `id`,
    `week`,
    `departement`,
    `user_id`,
    `id_prod`,
    `name`,
    `variety`,
    `description`,
    `image`,
    `agr`,
    `loc`,
    `four`,
    `mes`,
    `cond`,
    `pf`,
    `marge`,
    `quantity`,
    `arrival`,
    `commande`,
    `stock_arrival`,
    `stock_current`,
    `clone`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    435,
    '2022-W46',
    '2_6',
    0,
    '2_6_100__1_241_24_8_',
    'Mangues',
    '',
    'Lorem ipsum dolor sit amet consectetur adipisicing elit. Harum molestiae blanditiis modi. Repellendus reiciendis hic veritatis minima sed incidunt dolore alias perspiciatis, voluptatem repellat veniam reprehenderit nihil aliquid aut iste!',
    NULL,
    'Bio',
    'Grasse',
    'Test',
    'pièce',
    '',
    '2.00',
    '15',
    '1.00',
    '2022-08-26',
    NULL,
    '25.00',
    '25.00',
    NULL,
    '2022-11-14 10:47:01',
    '2022-11-14 10:47:01'
  );
INSERT INTO
  `stocks` (
    `id`,
    `week`,
    `departement`,
    `user_id`,
    `id_prod`,
    `name`,
    `variety`,
    `description`,
    `image`,
    `agr`,
    `loc`,
    `four`,
    `mes`,
    `cond`,
    `pf`,
    `marge`,
    `quantity`,
    `arrival`,
    `commande`,
    `stock_arrival`,
    `stock_current`,
    `clone`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    436,
    '2022-W46',
    '2_6',
    0,
    '2_6_101__3_241_24_8_',
    'Noix de coco',
    '',
    'Lorem ipsum dolor sit amet consectetur adipisicing elit. Harum molestiae blanditiis modi. Repellendus reiciendis hic veritatis minima sed incidunt dolore alias perspiciatis, voluptatem repellat veniam reprehenderit nihil aliquid aut iste!',
    NULL,
    'Traditionnelle',
    'Grasse',
    'Test',
    'pièce',
    '',
    '1.30',
    '15',
    '1.00',
    '2022-08-26',
    NULL,
    '25.00',
    '25.00',
    NULL,
    '2022-11-14 10:47:01',
    '2022-11-14 10:47:01'
  );
INSERT INTO
  `stocks` (
    `id`,
    `week`,
    `departement`,
    `user_id`,
    `id_prod`,
    `name`,
    `variety`,
    `description`,
    `image`,
    `agr`,
    `loc`,
    `four`,
    `mes`,
    `cond`,
    `pf`,
    `marge`,
    `quantity`,
    `arrival`,
    `commande`,
    `stock_arrival`,
    `stock_current`,
    `clone`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    437,
    '2022-W46',
    '2_5',
    0,
    '2_5_86__1_241_24_8_',
    'Noix',
    '',
    'Lorem ipsum dolor sit amet consectetur adipisicing elit. Harum molestiae blanditiis modi. Repellendus reiciendis hic veritatis minima sed incidunt dolore alias perspiciatis, voluptatem repellat veniam reprehenderit nihil aliquid aut iste!',
    NULL,
    'Bio',
    'Grasse',
    'Test',
    'g',
    'sachet',
    '1.00',
    '15',
    '100.00',
    '2022-08-26',
    NULL,
    '5.00',
    '5.00',
    NULL,
    '2022-11-14 10:47:01',
    '2022-11-14 10:47:01'
  );
INSERT INTO
  `stocks` (
    `id`,
    `week`,
    `departement`,
    `user_id`,
    `id_prod`,
    `name`,
    `variety`,
    `description`,
    `image`,
    `agr`,
    `loc`,
    `four`,
    `mes`,
    `cond`,
    `pf`,
    `marge`,
    `quantity`,
    `arrival`,
    `commande`,
    `stock_arrival`,
    `stock_current`,
    `clone`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    438,
    '2022-W46',
    '3_7',
    0,
    '3_7_106__2_241_24_8_',
    'Betteraves',
    '',
    'Lorem ipsum dolor sit amet consectetur adipisicing elit. Harum molestiae blanditiis modi. Repellendus reiciendis hic veritatis minima sed incidunt dolore alias perspiciatis, voluptatem repellat veniam reprehenderit nihil aliquid aut iste!',
    NULL,
    'Raisonnée',
    'Grasse',
    'Test',
    'pièce',
    '',
    '0.50',
    '15',
    '1.00',
    '2022-08-26',
    NULL,
    '25.00',
    '25.00',
    NULL,
    '2022-11-14 10:47:01',
    '2022-11-14 10:47:01'
  );
INSERT INTO
  `stocks` (
    `id`,
    `week`,
    `departement`,
    `user_id`,
    `id_prod`,
    `name`,
    `variety`,
    `description`,
    `image`,
    `agr`,
    `loc`,
    `four`,
    `mes`,
    `cond`,
    `pf`,
    `marge`,
    `quantity`,
    `arrival`,
    `commande`,
    `stock_arrival`,
    `stock_current`,
    `clone`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    439,
    '2022-W46',
    '3_7',
    0,
    '3_7_108_2_1_241_24_8',
    'Olives noires',
    'picholines',
    'Lorem ipsum dolor sit amet consectetur adipisicing elit. Harum molestiae blanditiis modi. Repellendus reiciendis hic veritatis minima sed incidunt dolore alias perspiciatis, voluptatem repellat veniam reprehenderit nihil aliquid aut iste!',
    NULL,
    'Raisonnée',
    'Grasse',
    'Test',
    'g',
    'bocal',
    '2.50',
    '15',
    '150.00',
    '2022-08-26',
    NULL,
    '25.00',
    '25.00',
    NULL,
    '2022-11-14 10:47:01',
    '2022-11-14 10:47:01'
  );
INSERT INTO
  `stocks` (
    `id`,
    `week`,
    `departement`,
    `user_id`,
    `id_prod`,
    `name`,
    `variety`,
    `description`,
    `image`,
    `agr`,
    `loc`,
    `four`,
    `mes`,
    `cond`,
    `pf`,
    `marge`,
    `quantity`,
    `arrival`,
    `commande`,
    `stock_arrival`,
    `stock_current`,
    `clone`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    440,
    '2022-W46',
    '3_8',
    0,
    '3_8_109__2_241_24_8_',
    'Haricots blancs',
    '',
    'Lorem ipsum dolor sit amet consectetur adipisicing elit. Harum molestiae blanditiis modi. Repellendus reiciendis hic veritatis minima sed incidunt dolore alias perspiciatis, voluptatem repellat veniam reprehenderit nihil aliquid aut iste!',
    NULL,
    'Raisonnée',
    'Grasse',
    'Test',
    'g',
    'bocal',
    '1.50',
    '15',
    '150.00',
    '2022-08-26',
    NULL,
    '25.00',
    '25.00',
    NULL,
    '2022-11-14 10:47:01',
    '2022-11-14 10:47:01'
  );
INSERT INTO
  `stocks` (
    `id`,
    `week`,
    `departement`,
    `user_id`,
    `id_prod`,
    `name`,
    `variety`,
    `description`,
    `image`,
    `agr`,
    `loc`,
    `four`,
    `mes`,
    `cond`,
    `pf`,
    `marge`,
    `quantity`,
    `arrival`,
    `commande`,
    `stock_arrival`,
    `stock_current`,
    `clone`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    441,
    '2022-W46',
    '3_9',
    0,
    '3_9_805__2_241_24_8_',
    'Sorbet ananas',
    '',
    'Lorem ipsum dolor sit amet consectetur adipisicing elit. Harum molestiae blanditiis modi. Repellendus reiciendis hic veritatis minima sed incidunt dolore alias perspiciatis, voluptatem repellat veniam reprehenderit nihil aliquid aut iste!',
    NULL,
    'Raisonnée',
    'Grasse',
    'Test',
    'l',
    'barquette',
    '2.50',
    '15',
    '1.00',
    '2022-08-26',
    NULL,
    '25.00',
    '25.00',
    NULL,
    '2022-11-14 10:47:01',
    '2022-11-14 10:47:01'
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: taxes
# ------------------------------------------------------------

INSERT INTO
  `taxes` (`id`, `taux`, `designation`)
VALUES
  (1, 5.50, 'Réduit');
INSERT INTO
  `taxes` (`id`, `taux`, `designation`)
VALUES
  (2, 20.00, 'Normal');
INSERT INTO
  `taxes` (`id`, `taux`, `designation`)
VALUES
  (3, 10.00, 'Réduit intermédiaire');
INSERT INTO
  `taxes` (`id`, `taux`, `designation`)
VALUES
  (4, 2.10, 'Spécifique');
INSERT INTO
  `taxes` (`id`, `taux`, `designation`)
VALUES
  (5, 0.00, 'Auto-entrepreneur');

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: varietes
# ------------------------------------------------------------

INSERT INTO
  `varietes` (
    `id`,
    `id_article`,
    `variete`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    1,
    ',108,',
    'de Nyons',
    '2022-08-08 16:20:02',
    '2022-08-08 16:20:02'
  );
INSERT INTO
  `varietes` (
    `id`,
    `id_article`,
    `variete`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    2,
    ',108,',
    'picholines',
    '2022-08-08 16:20:02',
    '2022-08-08 16:20:02'
  );
INSERT INTO
  `varietes` (
    `id`,
    `id_article`,
    `variete`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    3,
    ',1,',
    'poivrades',
    '2022-08-08 16:20:02',
    '2022-08-08 16:20:02'
  );
INSERT INTO
  `varietes` (
    `id`,
    `id_article`,
    `variete`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    4,
    ',1,',
    'bretons',
    '2022-08-08 16:20:02',
    '2022-08-08 16:20:02'
  );
INSERT INTO
  `varietes` (
    `id`,
    `id_article`,
    `variete`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    5,
    ',40,',
    'du Puy',
    '2022-08-08 16:20:02',
    '2022-08-08 16:20:02'
  );
INSERT INTO
  `varietes` (
    `id`,
    `id_article`,
    `variete`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    6,
    ',40,',
    'corails',
    '2022-08-08 16:20:02',
    '2022-08-08 16:20:02'
  );
INSERT INTO
  `varietes` (
    `id`,
    `id_article`,
    `variete`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    7,
    ',2,4,',
    'sauvages',
    '2022-08-08 16:20:02',
    '2022-08-08 16:20:02'
  );
INSERT INTO
  `varietes` (
    `id`,
    `id_article`,
    `variete`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    8,
    ',2,40,',
    'vertes',
    '2022-08-08 16:20:02',
    '2022-08-08 16:20:02'
  );
INSERT INTO
  `varietes` (
    `id`,
    `id_article`,
    `variete`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    9,
    ',2,3,17,',
    'blanches',
    '2022-08-08 16:20:02',
    '2022-08-08 16:20:02'
  );
INSERT INTO
  `varietes` (
    `id`,
    `id_article`,
    `variete`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    10,
    ',3,',
    'violettes',
    '2022-08-08 16:20:02',
    '2022-08-08 16:20:02'
  );
INSERT INTO
  `varietes` (
    `id`,
    `id_article`,
    `variete`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    11,
    ',3,',
    'tigrées',
    '2022-08-08 16:20:02',
    '2022-08-08 16:20:02'
  );
INSERT INTO
  `varietes` (
    `id`,
    `id_article`,
    `variete`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    12,
    ',9,',
    'blancs',
    '2022-08-08 16:20:02',
    '2022-08-08 16:20:02'
  );
INSERT INTO
  `varietes` (
    `id`,
    `id_article`,
    `variete`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    13,
    ',9,',
    'bruns',
    '2022-08-08 16:20:02',
    '2022-08-08 16:20:02'
  );
INSERT INTO
  `varietes` (
    `id`,
    `id_article`,
    `variete`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    14,
    ',16,',
    'spaghettis',
    '2022-08-08 16:20:02',
    '2022-08-08 16:20:02'
  );
INSERT INTO
  `varietes` (
    `id`,
    `id_article`,
    `variete`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    15,
    ',16,',
    'butternut',
    '2022-08-08 16:20:02',
    '2022-08-08 16:20:02'
  );
INSERT INTO
  `varietes` (
    `id`,
    `id_article`,
    `variete`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    16,
    ',17,',
    'jaunes',
    '2022-08-08 16:20:02',
    '2022-08-08 16:20:02'
  );
INSERT INTO
  `varietes` (
    `id`,
    `id_article`,
    `variete`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    17,
    ',17,',
    'rondes',
    '2022-08-08 16:20:02',
    '2022-08-08 16:20:02'
  );
INSERT INTO
  `varietes` (
    `id`,
    `id_article`,
    `variete`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    18,
    ',88,',
    'Victoria',
    '2022-08-08 16:20:02',
    '2022-08-08 16:20:02'
  );
INSERT INTO
  `varietes` (
    `id`,
    `id_article`,
    `variete`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    19,
    ',91,',
    'plantains',
    '2022-08-08 16:20:02',
    '2022-08-08 16:20:02'
  );
INSERT INTO
  `varietes` (
    `id`,
    `id_article`,
    `variete`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    20,
    ',91,',
    'freycinettes',
    '2022-08-08 16:20:02',
    '2022-08-08 16:20:02'
  );

/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
