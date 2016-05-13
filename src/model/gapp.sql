-- phpMyAdmin SQL Dump
-- version 4.5.2
-- http://www.phpmyadmin.net
--
-- Client :  127.0.0.1
-- Généré le :  Mar 05 Avril 2016 à 09:57
-- Version du serveur :  5.7.9
-- Version de PHP :  5.6.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `gapp`
--

-- --------------------------------------------------------

--
-- Structure de la table `absence`
--

DROP TABLE IF EXISTS `absence`;
CREATE TABLE IF NOT EXISTS `absence` (
  `idAbsence` int(11) NOT NULL AUTO_INCREMENT,
  `idStudent` int(11) NOT NULL,
  `date` date NOT NULL,
  `description` varchar(100) NOT NULL,
  `idProf` int(11) NOT NULL,
  PRIMARY KEY (`idAbsence`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `assoc_group_user`
--

DROP TABLE IF EXISTS `assoc_group_user`;
CREATE TABLE IF NOT EXISTS `assoc_group_user` (
  `idAssocGroupUser` int(11) NOT NULL AUTO_INCREMENT,
  `idGroupApp` int(11) NOT NULL,
  `idUser` int(11) NOT NULL,
  PRIMARY KEY (`idAssocGroupUser`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `group_app`
--

DROP TABLE IF EXISTS `group_app`;
CREATE TABLE IF NOT EXISTS `group_app` (
  `idGroupApp` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `idAppResp` int(11) NOT NULL,
  PRIMARY KEY (`idGroupApp`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `note`
--

DROP TABLE IF EXISTS `note`;
CREATE TABLE IF NOT EXISTS `note` (
  `idNote` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(100) NOT NULL,
  PRIMARY KEY (`idNote`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `skill`
--

DROP TABLE IF EXISTS `skill`;
CREATE TABLE IF NOT EXISTS `skill` (
  `idSkill` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(100) NOT NULL,
  `idSkillGroup` int(11) NOT NULL,
  PRIMARY KEY (`idSkill`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `skill_group`
--

DROP TABLE IF EXISTS `skill_group`;
CREATE TABLE IF NOT EXISTS `skill_group` (
  `idSkillGroup` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(100) NOT NULL,
  PRIMARY KEY (`idSkillGroup`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `sub_skill`
--

DROP TABLE IF EXISTS `sub_skill`;
CREATE TABLE IF NOT EXISTS `sub_skill` (
  `idSubSkill` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(100) NOT NULL,
  `idSkill` int(11) NOT NULL,
  PRIMARY KEY (`idSubSkill`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `idUser` int(11) NOT NULL AUTO_INCREMENT,
  `firstName` varchar(30) NOT NULL,
  `lastName` varchar(50) NOT NULL,
  `birthDate` date NOT NULL,
  `studentId` varchar(5) NOT NULL,
  `mark` int(11) NOT NULL,
  `role` varchar(10) NOT NULL,
  PRIMARY KEY (`idUser`),
  UNIQUE KEY `studentId` (`studentId`),
  UNIQUE KEY `studentId_2` (`studentId`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Contenu de la table `user`
--

INSERT INTO `user` (`idUser`, `firstName`, `lastName`, `birthDate`, `studentId`, `mark`, `role`) VALUES
(1, 'Prenom1', 'Nom1', '2016-04-01', '1', 3, ''),
(2, 'Prenom2', 'Nom2', '2016-04-29', '2', 6, ''),
(3, 'prenom', 'nom', '2001-01-01', '001', 0, ''),
(4, 'prenom', 'nom', '1970-01-01', '0000', 0, 'ADMIN'),
(5, 'prenom', 'nom', '1970-01-01', '0001', 0, 'ADMIN');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
