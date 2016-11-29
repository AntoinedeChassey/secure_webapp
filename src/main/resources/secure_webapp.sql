-- phpMyAdmin SQL Dump
-- version 4.1.4
-- http://www.phpmyadmin.net
--
-- Client :  127.0.0.1
-- Généré le :  Mar 29 Novembre 2016 à 09:39
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
-- Structure de la table `history`
--

CREATE TABLE IF NOT EXISTS `history` (
  `id_history` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` int(11) NOT NULL,
  `password` varchar(500) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_history`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Contenu de la table `history`
--

INSERT INTO `history` (`id_history`, `id_user`, `password`, `date`) VALUES
(3, 8, 'a02ec26f56bcc83fa1a0d64a30c59405bde1b12a0555ce620435f2814daa041e9f95347f8caf1f13674271fa951118510f2c6e24754c9f839864dbef420c7e93:04fd23f7c225eaefb0752d3980c0e9f70b19fdc38f78f56c6669f50fd35086b5ef37d277a6fdd3484ba140b1335a8f03cbf3cf2adb9c9b29fe607135f54ac666', '2016-11-29 08:36:48'),
(4, 9, 'a49ccd200ad18ee88a837b07109a0107eeb260829927ec1eb25c3850a40d036965af06021a55b88b99ed926fc81858cd7210c20a64cfca4325b01c997c9c0c69:1c3252752007dc751d49c9c3441fdd681fdb384f6ea93b40a74f909fb355e055c4c0aaee88bbf6d23c961ec6856473b25bbc29c6f57fc2e96b4effd42dc53b58', '2016-11-29 08:36:49'),
(5, 10, 'db446bae2e352864badf1315c2bcec18d818df2823c709a0cf38328c96fd3e8171182df725f1650a9ce155f00cb2667ec148c75fa5444fc6fd8e0632558928d6:b1fe68343462c3c963943ffcdd457e31f6e1a215e7bd786e2c393ccdf422839592597f9fec33d62e2fbb9301b4c897a6c076fe46098285cdc89120b7487428fe', '2016-11-29 08:36:49');

-- --------------------------------------------------------

--
-- Structure de la table `role`
--

CREATE TABLE IF NOT EXISTS `role` (
  `id_role` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `maxInactiveInterval` int(11) NOT NULL,
  PRIMARY KEY (`id_role`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Contenu de la table `role`
--

INSERT INTO `role` (`id_role`, `name`, `maxInactiveInterval`) VALUES
(1, 'admin', 1200),
(2, 'userCercle', 600),
(3, 'userCarre', 600);

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
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Contenu de la table `user`
--

INSERT INTO `user` (`id_user`, `id_role`, `username`, `password`, `surname`, `name`, `avatar`, `country`, `date`) VALUES
(10, 2, 'usercercle@test.com', 'db446bae2e352864badf1315c2bcec18d818df2823c709a0cf38328c96fd3e8171182df725f1650a9ce155f00cb2667ec148c75fa5444fc6fd8e0632558928d6:b1fe68343462c3c963943ffcdd457e31f6e1a215e7bd786e2c393ccdf422839592597f9fec33d62e2fbb9301b4c897a6c076fe46098285cdc89120b7487428fe', 'Cercle', 'Cercle', './img/users/profile.png', 'France', '2016-11-29 08:36:49'),
(9, 3, 'usercarre@test.com', 'a49ccd200ad18ee88a837b07109a0107eeb260829927ec1eb25c3850a40d036965af06021a55b88b99ed926fc81858cd7210c20a64cfca4325b01c997c9c0c69:1c3252752007dc751d49c9c3441fdd681fdb384f6ea93b40a74f909fb355e055c4c0aaee88bbf6d23c961ec6856473b25bbc29c6f57fc2e96b4effd42dc53b58', 'Carre', 'User', './img/users/profile.png', 'Canada', '2016-11-29 08:36:49'),
(8, 1, 'admin@test.com', 'a02ec26f56bcc83fa1a0d64a30c59405bde1b12a0555ce620435f2814daa041e9f95347f8caf1f13674271fa951118510f2c6e24754c9f839864dbef420c7e93:04fd23f7c225eaefb0752d3980c0e9f70b19fdc38f78f56c6669f50fd35086b5ef37d277a6fdd3484ba140b1335a8f03cbf3cf2adb9c9b29fe607135f54ac666', 'Best', 'Admin', './img/users/test.png', 'Canada', '2016-11-29 08:36:48');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
