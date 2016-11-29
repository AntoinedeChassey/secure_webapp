-- phpMyAdmin SQL Dump
-- version 4.1.4
-- http://www.phpmyadmin.net
--
-- Client :  127.0.0.1
-- Généré le :  Mar 29 Novembre 2016 à 06:30
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
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

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
  `avatar` varchar(128) NOT NULL DEFAULT './img/users/default.jpg',
  `country` varchar(128) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_user`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Contenu de la table `user`
--

INSERT INTO `user` (`id_user`, `id_role`, `username`, `password`, `surname`, `name`, `avatar`, `country`, `date`) VALUES
(1, 2, 'usercercle@test.com', 'ac120d6b66deef81f57880bf86ba5bf61a3da0f7b12092f773ce95791112f78363bc55bc2c896b31a2fe96beb013af877d89a2daf6e32c02bc98a6045ae14591:356820aaafe62a32a672549223837a5ac9089810975b41fe19dbc3fab1b5b405c97e4d172a160bc35e478d43f32baba814508ab06a894d5e96a10949d8177c7a', 'Cercle', 'User', './img/users/profile.png', 'Canada', '2017-03-16 19:50:04'),
(3, 1, 'admin@test.com', '67718c4772e3179dc3ee034edd89714129c741ee890d87d6a7ed81e816b80c321304ad0bbf3ba6b20bf7f74e2ede9f1b55bc7b89fbfbf64b1b1b4f5ac286294a:3710dcbd24b3f50f13d69418e3f03a68ef896ad8ce6ba78e293e3601030a78711338510d46d8674c769912ec86ee50e2267c861bfa05bc681a86cb2a9df582fd', 'Best', 'Admin', './img/users/test.png', 'Canada', '2016-11-26 19:34:35'),
(4, 3, 'usercarre@test.com', 'dd85d38e34464703e416fa6dc27c17c16f72875418ccc91a00b75eaca8f4bc9be676715813341d37c69d80e6dcbf36c0cabbe1d0e437566263e84eed9a395b9f:47b68fadb66239f8c1ba9fc86339694dca8f168455793fcd7859da2f9746504e4af2ef137cd9629616f44b18eb303aa4449907fdd7a323dc96b96702cd1aaf3a', 'Carre', 'User', './img/users/default.jpg', 'Canada', '2016-11-26 21:14:55');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
