-- phpMyAdmin SQL Dump
-- version 4.5.2
-- http://www.phpmyadmin.net
--
-- Client :  127.0.0.1
-- Généré le :  Mar 03 Mai 2016 à 09:10
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
-- Structure de la table `admin`
--

DROP TABLE IF EXISTS `admin`;
CREATE TABLE IF NOT EXISTS `admin` (
  `id_admin` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id_admin`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `assoc_skill_skill_group`
--

DROP TABLE IF EXISTS `assoc_skill_skill_group`;
CREATE TABLE IF NOT EXISTS `assoc_skill_skill_group` (
  `idSkillGroup` int(11) NOT NULL,
  `idSkill` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `course`
--

DROP TABLE IF EXISTS `course`;
CREATE TABLE IF NOT EXISTS `course` (
  `id_course` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(15) NOT NULL COMMENT 'lesson, appTutor or app',
  `date` datetime NOT NULL,
  `duration` time NOT NULL,
  `id_group_app` int(11) NOT NULL,
  PRIMARY KEY (`id_course`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Cours assigné à un groupe d''APP et présences/absences.';

-- --------------------------------------------------------

--
-- Structure de la table `group_app`
--

DROP TABLE IF EXISTS `group_app`;
CREATE TABLE IF NOT EXISTS `group_app` (
  `id_group_app` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `id_responsible` int(11) NOT NULL,
  PRIMARY KEY (`id_group_app`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `group_remark`
--

DROP TABLE IF EXISTS `group_remark`;
CREATE TABLE IF NOT EXISTS `group_remark` (
  `id_group_remark` int(11) NOT NULL AUTO_INCREMENT,
  `remark` text NOT NULL,
  `date` datetime NOT NULL,
  `id_group_app` int(11) NOT NULL,
  PRIMARY KEY (`id_group_remark`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `presence`
--

DROP TABLE IF EXISTS `presence`;
CREATE TABLE IF NOT EXISTS `presence` (
  `id_course` int(11) NOT NULL,
  `id_student` int(11) NOT NULL,
  `is_present` tinyint(1) NOT NULL,
  `remark` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `responsible`
--

DROP TABLE IF EXISTS `responsible`;
CREATE TABLE IF NOT EXISTS `responsible` (
  `id_responsible` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id_responsible`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `skill`
--

DROP TABLE IF EXISTS `skill`;
CREATE TABLE IF NOT EXISTS `skill` (
  `id_skill` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(100) NOT NULL,
  PRIMARY KEY (`id_skill`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `skill_group`
--

DROP TABLE IF EXISTS `skill_group`;
CREATE TABLE IF NOT EXISTS `skill_group` (
  `id_skill_group` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(100) NOT NULL,
  PRIMARY KEY (`id_skill_group`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `student`
--

DROP TABLE IF EXISTS `student`;
CREATE TABLE IF NOT EXISTS `student` (
  `id_student` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` int(11) NOT NULL,
  `id_group_app` int(11) NOT NULL,
  PRIMARY KEY (`id_student`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `student_remark`
--

DROP TABLE IF EXISTS `student_remark`;
CREATE TABLE IF NOT EXISTS `student_remark` (
  `id_student_remark` int(11) NOT NULL AUTO_INCREMENT,
  `remark` text NOT NULL,
  `date` datetime NOT NULL,
  `id_student` int(11) NOT NULL,
  PRIMARY KEY (`id_student_remark`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `sub_skill`
--

DROP TABLE IF EXISTS `sub_skill`;
CREATE TABLE IF NOT EXISTS `sub_skill` (
  `id_sub_skill` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(100) NOT NULL,
  `id_skill` int(11) NOT NULL,
  PRIMARY KEY (`id_sub_skill`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `tutor`
--

DROP TABLE IF EXISTS `tutor`;
CREATE TABLE IF NOT EXISTS `tutor` (
  `id_tutor` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id_tutor`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id_user` int(11) NOT NULL AUTO_INCREMENT,
  `firstName` varchar(30) NOT NULL,
  `lastName` varchar(50) NOT NULL,
  `birthDate` date NOT NULL,
  `is_admin` tinyint(1) NOT NULL DEFAULT '0',
  `id_admin` int(11) NOT NULL COMMENT 'Meaningfull only if admin',
  `is_responsible` tinyint(1) NOT NULL DEFAULT '0',
  `id_responsible` int(11) NOT NULL COMMENT 'Meaningfull only if responsible',
  `is_tutor` tinyint(1) NOT NULL DEFAULT '0',
  `id_tutor` int(11) NOT NULL COMMENT 'Meaningfull only if tutor',
  `is_student` tinyint(1) NOT NULL DEFAULT '0',
  `id_student` int(11) NOT NULL COMMENT 'Meaningfull only if student',
  PRIMARY KEY (`id_user`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Contenu de la table `user`
--

INSERT INTO `user` (`id_user`, `firstName`, `lastName`, `birthDate`, `is_admin`, `id_admin`, `is_responsible`, `id_responsible`, `is_tutor`, `id_tutor`, `is_student`, `id_student`) VALUES
(1, 'Prenom1', 'Nom1', '2016-04-01', 0, 0, 0, 0, 0, 0, 0, 0),
(2, 'Prenom2', 'Nom2', '2016-04-29', 0, 0, 0, 0, 0, 0, 0, 0),
(3, 'prenom', 'nom', '2001-01-01', 0, 0, 0, 0, 0, 0, 0, 0),
(4, 'prenom', 'nom', '1970-01-01', 0, 0, 0, 0, 0, 0, 0, 0),
(5, 'prenom', 'nom', '1970-01-01', 0, 0, 0, 0, 0, 0, 0, 0);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
