/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: contacts
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `contacts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` int(11) NOT NULL,
  `mobile` varchar(50) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `fax` varchar(50) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `cp` varchar(50) DEFAULT NULL,
  `city` varchar(200) DEFAULT NULL,
  `state` varchar(200) DEFAULT NULL,
  `society` varchar(255) DEFAULT NULL,
  `billing_address` varchar(255) DEFAULT NULL,
  `delivery_address` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_user` (`id_user`)
) ENGINE = InnoDB AUTO_INCREMENT = 34 DEFAULT CHARSET = utf8mb4;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: listpasswords
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `listpasswords` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 52 DEFAULT CHARSET = utf8mb4;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: refreshTokens
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `refreshTokens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `token` varchar(255) DEFAULT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `userId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `userId` (`userId`),
  CONSTRAINT `refreshTokens_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE
  SET
  NULL ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 525 DEFAULT CHARSET = utf8mb4;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: roles
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` varchar(50) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 7 DEFAULT CHARSET = utf8mb4;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: user_roles
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `user_roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `roleId` varchar(6) NOT NULL,
  `userId` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 64 DEFAULT CHARSET = utf8mb4;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: users
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE = InnoDB AUTO_INCREMENT = 144 DEFAULT CHARSET = utf8mb4;

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: contacts
# ------------------------------------------------------------

INSERT INTO
  `contacts` (
    `id`,
    `id_user`,
    `mobile`,
    `phone`,
    `fax`,
    `address`,
    `cp`,
    `city`,
    `state`,
    `society`,
    `billing_address`,
    `delivery_address`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    31,
    133,
    '1819a2be86eec60a74767bdf2f5da11a',
    'd68c8365b327d3899715f11487887b6e',
    'd68c8365b327d3899715f11487887b6e',
    'd68c8365b327d3899715f11487887b6e',
    'd68c8365b327d3899715f11487887b6e',
    'd68c8365b327d3899715f11487887b6e',
    'eb2880eb9bd3e4c99c236c35201a11c2',
    'd68c8365b327d3899715f11487887b6e',
    'd68c8365b327d3899715f11487887b6e',
    'd68c8365b327d3899715f11487887b6e',
    '2022-07-11 12:55:09',
    '2022-07-29 09:40:53'
  );
INSERT INTO
  `contacts` (
    `id`,
    `id_user`,
    `mobile`,
    `phone`,
    `fax`,
    `address`,
    `cp`,
    `city`,
    `state`,
    `society`,
    `billing_address`,
    `delivery_address`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    33,
    142,
    'd68c8365b327d3899715f11487887b6e',
    'd68c8365b327d3899715f11487887b6e',
    'd68c8365b327d3899715f11487887b6e',
    'd68c8365b327d3899715f11487887b6e',
    'd68c8365b327d3899715f11487887b6e',
    'd68c8365b327d3899715f11487887b6e',
    'd68c8365b327d3899715f11487887b6e',
    '86826809765951cc5d2fbe849b1d2981',
    '7f8db33b22fd422e64820f10a34e5713',
    '3406162685cfc88a1ff7dd110cda6bbb',
    '2022-10-28 14:11:28',
    '2022-10-28 16:15:42'
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: listpasswords
# ------------------------------------------------------------

INSERT INTO
  `listpasswords` (`id`, `email`, `createdAt`, `updatedAt`)
VALUES
  (
    49,
    'dcb87a8d88fd63db7ed9e9dd62ee24faf0733ecea41e7c1deae2c97aaafc371b',
    '2022-10-26 14:09:02',
    '2022-10-26 14:09:02'
  );
INSERT INTO
  `listpasswords` (`id`, `email`, `createdAt`, `updatedAt`)
VALUES
  (
    50,
    'dcb87a8d88fd63db7ed9e9dd62ee24faf0733ecea41e7c1deae2c97aaafc371b',
    '2022-10-26 14:09:18',
    '2022-10-26 14:09:18'
  );
INSERT INTO
  `listpasswords` (`id`, `email`, `createdAt`, `updatedAt`)
VALUES
  (
    51,
    'dcb87a8d88fd63db7ed9e9dd62ee24faf0733ecea41e7c1deae2c97aaafc371b',
    '2022-11-03 08:56:56',
    '2022-11-03 08:56:56'
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: refreshTokens
# ------------------------------------------------------------

INSERT INTO
  `refreshTokens` (
    `id`,
    `token`,
    `expiryDate`,
    `createdAt`,
    `updatedAt`,
    `userId`
  )
VALUES
  (
    466,
    '814abcf7-406a-4445-962f-6b9bf758907d',
    '2022-10-19 13:33:03',
    '2022-10-18 13:33:03',
    '2022-10-18 13:33:03',
    NULL
  );
INSERT INTO
  `refreshTokens` (
    `id`,
    `token`,
    `expiryDate`,
    `createdAt`,
    `updatedAt`,
    `userId`
  )
VALUES
  (
    467,
    'a59b353e-ccab-4883-9f52-d9f33449ece9',
    '2022-10-19 13:39:09',
    '2022-10-18 13:39:09',
    '2022-10-18 13:39:09',
    NULL
  );
INSERT INTO
  `refreshTokens` (
    `id`,
    `token`,
    `expiryDate`,
    `createdAt`,
    `updatedAt`,
    `userId`
  )
VALUES
  (
    468,
    'fdd28780-37c9-4982-bb04-1f8b829a8f9c',
    '2022-10-19 13:56:42',
    '2022-10-18 13:56:42',
    '2022-10-18 13:56:42',
    NULL
  );
INSERT INTO
  `refreshTokens` (
    `id`,
    `token`,
    `expiryDate`,
    `createdAt`,
    `updatedAt`,
    `userId`
  )
VALUES
  (
    482,
    'be111279-ef75-4f30-8bb8-414fc03de2bc',
    '2022-10-29 12:19:10',
    '2022-10-28 12:19:10',
    '2022-10-28 12:19:10',
    NULL
  );
INSERT INTO
  `refreshTokens` (
    `id`,
    `token`,
    `expiryDate`,
    `createdAt`,
    `updatedAt`,
    `userId`
  )
VALUES
  (
    483,
    '59a37acb-8e3e-486d-89d1-512b6558a220',
    '2022-10-29 12:24:16',
    '2022-10-28 12:24:16',
    '2022-10-28 12:24:16',
    NULL
  );
INSERT INTO
  `refreshTokens` (
    `id`,
    `token`,
    `expiryDate`,
    `createdAt`,
    `updatedAt`,
    `userId`
  )
VALUES
  (
    484,
    '1efa11a6-542d-473a-84ca-3b8ab0f55c7f',
    '2022-10-29 12:42:24',
    '2022-10-28 12:42:24',
    '2022-10-28 12:42:24',
    NULL
  );
INSERT INTO
  `refreshTokens` (
    `id`,
    `token`,
    `expiryDate`,
    `createdAt`,
    `updatedAt`,
    `userId`
  )
VALUES
  (
    485,
    '8372fffe-7b48-47a4-a9be-61137f149bda',
    '2022-10-29 14:05:02',
    '2022-10-28 14:05:02',
    '2022-10-28 14:05:02',
    NULL
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: roles
# ------------------------------------------------------------

INSERT INTO
  `roles` (
    `id`,
    `name`,
    `description`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    1,
    'Client',
    'customer',
    '2022-02-22 11:18:08',
    '2022-02-22 11:18:08'
  );
INSERT INTO
  `roles` (
    `id`,
    `name`,
    `description`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    2,
    'Administrateur',
    'administrator',
    '2022-02-22 11:18:08',
    '2022-02-22 11:18:08'
  );
INSERT INTO
  `roles` (
    `id`,
    `name`,
    `description`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    3,
    'Manager',
    'seller',
    '2022-02-22 11:18:08',
    '2022-02-22 11:18:08'
  );
INSERT INTO
  `roles` (
    `id`,
    `name`,
    `description`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    4,
    'Manager',
    'stock',
    '2022-02-22 11:18:08',
    '2022-02-22 11:18:08'
  );
INSERT INTO
  `roles` (
    `id`,
    `name`,
    `description`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    5,
    'Manager',
    'management',
    '2022-02-22 11:18:08',
    '2022-02-22 11:18:08'
  );
INSERT INTO
  `roles` (
    `id`,
    `name`,
    `description`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    6,
    'Manager',
    'administrative',
    '2022-02-22 11:18:08',
    '2022-02-22 11:18:08'
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: user_roles
# ------------------------------------------------------------

INSERT INTO
  `user_roles` (`id`, `createdAt`, `updatedAt`, `roleId`, `userId`)
VALUES
  (
    50,
    '2022-07-04 09:36:46',
    '2022-07-04 09:36:46',
    '1',
    133
  );
INSERT INTO
  `user_roles` (`id`, `createdAt`, `updatedAt`, `roleId`, `userId`)
VALUES
  (
    51,
    '2022-07-04 09:36:46',
    '2022-07-04 09:36:46',
    '4',
    133
  );
INSERT INTO
  `user_roles` (`id`, `createdAt`, `updatedAt`, `roleId`, `userId`)
VALUES
  (
    53,
    '2022-09-20 15:11:57',
    '2022-09-20 15:11:57',
    '1',
    134
  );
INSERT INTO
  `user_roles` (`id`, `createdAt`, `updatedAt`, `roleId`, `userId`)
VALUES
  (
    54,
    '2022-09-20 15:11:57',
    '2022-09-20 15:11:57',
    '4',
    134
  );
INSERT INTO
  `user_roles` (`id`, `createdAt`, `updatedAt`, `roleId`, `userId`)
VALUES
  (
    62,
    '2022-10-28 14:11:28',
    '2022-10-28 14:11:28',
    '1',
    142
  );
INSERT INTO
  `user_roles` (`id`, `createdAt`, `updatedAt`, `roleId`, `userId`)
VALUES
  (
    63,
    '2022-10-28 14:14:37',
    '2022-10-28 14:14:37',
    '1',
    143
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: users
# ------------------------------------------------------------

INSERT INTO
  `users` (
    `id`,
    `firstname`,
    `lastname`,
    `email`,
    `password`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    133,
    'b3245265892724339e355ff454665880',
    'a3480d2a21d5d2ffe77bf29a398cf46d',
    '7efd51f00ed31116fbdf63c255c496de0b67e7550931d4e2c0d4679220039f21',
    '$2b$10$voEsfck.dJkfLhARMFJpIOnY0VSFyK2jg7s9Prhr6eAV3YUvkAqJu',
    '2022-07-04 09:36:45',
    '2022-07-29 09:40:53'
  );
INSERT INTO
  `users` (
    `id`,
    `firstname`,
    `lastname`,
    `email`,
    `password`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    134,
    'b3245265892724339e355ff454665880',
    'a3480d2a21d5d2ffe77bf29a398cf46d',
    'dcb87a8d88fd63db7ed9e9dd62ee24faf0733ecea41e7c1deae2c97aaafc371b',
    '$2b$10$2U2SgBcoJyxZ29KP0mfVV.uj8H6Mb7r/vGMIPoOB6SdzgpG6su0D6',
    '2022-09-20 15:11:57',
    '2022-10-18 15:47:40'
  );
INSERT INTO
  `users` (
    `id`,
    `firstname`,
    `lastname`,
    `email`,
    `password`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    142,
    'dc071b1b8ddda700f4510678de8121fa',
    'a3480d2a21d5d2ffe77bf29a398cf46d',
    '0cf93a40f28aaa6c461fd2fc713b7db71369de1cc5840854ca7085ad446f4114',
    '$2b$10$s4fhEP0oOGLVhQuQnQMY2OMiXjDrxoq9.wtZLbICLoC4Kinclb4Aq',
    '2022-10-28 14:11:27',
    '2022-10-28 16:15:41'
  );
INSERT INTO
  `users` (
    `id`,
    `firstname`,
    `lastname`,
    `email`,
    `password`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    143,
    'e576493fa8e73ff1497b643595c1338d',
    'cc3f29c5a8e806db91260226ac4248c7',
    'c9e6f728227f1dbe279224b43009a4fcf96842699511adf0c3d7c8d257b4be70',
    '$2b$10$JjummOUiswMF7LKqQZzd3uWzGfj3CcBHA5twAHj44tb3Ob1WGGytK',
    '2022-10-28 14:14:37',
    '2022-10-28 14:14:37'
  );

/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
