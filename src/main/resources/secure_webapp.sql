-- phpMyAdmin SQL Dump
-- version 4.1.4
-- http://www.phpmyadmin.net
--
-- Client :  127.0.0.1
-- Généré le :  Sam 03 Décembre 2016 à 08:31
-- Version du serveur :  5.6.15-log
-- Version de PHP :  5.5.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données :  `secure_webapp`
--

-- --------------------------------------------------------

--
-- Structure de la table `log_connection`
--

CREATE TABLE IF NOT EXISTS `log_connection` (
  `id_log_connection` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` int(11) NOT NULL,
  `phase` int(11) NOT NULL DEFAULT '0',
  `attempts` int(11) DEFAULT '0',
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_log_connection`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=19 ;

--
-- Contenu de la table `log_connection`
--

INSERT INTO `log_connection` (`id_log_connection`, `id_user`, `phase`, `attempts`, `date`) VALUES
(18, 31, 0, 0, '2016-12-03 07:31:00'),
(17, 30, 0, 0, '2016-12-03 07:31:00'),
(16, 29, 0, 0, '2016-12-03 07:31:00');

-- --------------------------------------------------------

--
-- Structure de la table `log_password`
--

CREATE TABLE IF NOT EXISTS `log_password` (
  `id_log_password` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` int(11) NOT NULL,
  `password` varchar(500) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_log_password`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=43 ;

--
-- Contenu de la table `log_password`
--

INSERT INTO `log_password` (`id_log_password`, `id_user`, `password`, `date`) VALUES
(42, 31, '356bd3aba2985fb4c027a577a923059e96e01ebcba443ea217dc47ad4271a9fc7588b3d2f51ed49a91b6a7465db5ff0ff62b3c76ae1b20d769c8e28a37f1e9dd:0dd1a516484f2c3457235f507686a7ebcc5023cd12d5783736441d8bd0722924b9d1c86d077fd28bffdbd8dbc2b5651941d63660c602b820c50318150fd978c6', '2016-12-03 07:31:00'),
(41, 30, '65f1ac0c8a7c85010451a3c6859a033872d6c82d85aedbc95a743456d382ae127036aa60e8d5b827abd135018404ee39917d4351ed026c670a59780a440a356d:79a1855e4da732ce6476b8cab8146eb5325d9d7d3eb02536f9ef509d008f07f825f23581008932ba4e2498d389662082647f06e1a75d3e76f8ec4fe4e470b23e', '2016-12-03 07:31:00'),
(40, 29, 'bd95f3b25d091cffd9c74a7393758a179f0bfce9a2302c92ed3a0ba5ec3367037287d7b63400fea2b638294e52d0d010ce693255990bab7e27f23c22e2785337:ff0dfc94c79210b2576a3a45af34bc1b372473e7d6ac47431c7b00e9389c5e4a05ded969023f1804d8a31d0d5bdd17c7240ae3713fc36059b83fb91e02fcd323', '2016-12-03 07:31:00');

-- --------------------------------------------------------

--
-- Structure de la table `role`
--

CREATE TABLE IF NOT EXISTS `role` (
  `id_role` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `maxInactiveInterval` int(11) NOT NULL,
  `maxAttempts` int(11) NOT NULL DEFAULT '5',
  `maxTimeForPhase1` bigint(20) NOT NULL,
  PRIMARY KEY (`id_role`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Contenu de la table `role`
--

INSERT INTO `role` (`id_role`, `name`, `maxInactiveInterval`, `maxAttempts`, `maxTimeForPhase1`) VALUES
(1, 'admin', 1200, 5, 60000),
(2, 'userCercle', 600, 5, 60000),
(3, 'userCarre', 600, 5, 60000);

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `id_user` int(11) NOT NULL AUTO_INCREMENT,
  `id_role` int(11) NOT NULL,
  `username` varchar(128) NOT NULL,
  `password` varchar(500) NOT NULL,
  `surname` varchar(128) NOT NULL,
  `name` varchar(128) NOT NULL,
  `avatar` varchar(128) NOT NULL DEFAULT './img/users/profile.png',
  `country` varchar(128) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_user`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=32 ;

--
-- Contenu de la table `user`
--

INSERT INTO `user` (`id_user`, `id_role`, `username`, `password`, `surname`, `name`, `avatar`, `country`, `date`) VALUES
(29, 1, 'admin@test.com', 'bd95f3b25d091cffd9c74a7393758a179f0bfce9a2302c92ed3a0ba5ec3367037287d7b63400fea2b638294e52d0d010ce693255990bab7e27f23c22e2785337:ff0dfc94c79210b2576a3a45af34bc1b372473e7d6ac47431c7b00e9389c5e4a05ded969023f1804d8a31d0d5bdd17c7240ae3713fc36059b83fb91e02fcd323', 'Best', 'Admin', './img/users/test.png', 'Canada', '2016-12-03 07:31:00'),
(30, 2, 'usercercle@test.com', '65f1ac0c8a7c85010451a3c6859a033872d6c82d85aedbc95a743456d382ae127036aa60e8d5b827abd135018404ee39917d4351ed026c670a59780a440a356d:79a1855e4da732ce6476b8cab8146eb5325d9d7d3eb02536f9ef509d008f07f825f23581008932ba4e2498d389662082647f06e1a75d3e76f8ec4fe4e470b23e', 'Cercle', 'Cercle', './img/users/profile.png', 'France', '2016-12-03 07:31:00'),
(31, 3, 'usercarre@test.com', '356bd3aba2985fb4c027a577a923059e96e01ebcba443ea217dc47ad4271a9fc7588b3d2f51ed49a91b6a7465db5ff0ff62b3c76ae1b20d769c8e28a37f1e9dd:0dd1a516484f2c3457235f507686a7ebcc5023cd12d5783736441d8bd0722924b9d1c86d077fd28bffdbd8dbc2b5651941d63660c602b820c50318150fd978c6', 'Carre', 'User', './img/users/profile.png', 'Canada', '2016-12-03 07:31:00');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
