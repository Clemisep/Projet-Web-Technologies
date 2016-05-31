-- phpMyAdmin SQL Dump
-- version 4.5.2
-- http://www.phpmyadmin.net
--
-- Client :  127.0.0.1
-- Généré le :  Mar 24 Mai 2016 à 08:28
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
  `id_kind_of_app` int(11) NOT NULL,
  `id_tutor` int(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  PRIMARY KEY (`id_group_app`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Contenu de la table `group_app`
--

INSERT INTO `group_app` (`id_group_app`, `id_kind_of_app`, `id_tutor`, `name`) VALUES
(1, 1, 1, 'fds');

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
-- Structure de la table `kind_of_app`
--

DROP TABLE IF EXISTS `kind_of_app`;
CREATE TABLE IF NOT EXISTS `kind_of_app` (
  `id_kind_of_app` int(11) NOT NULL AUTO_INCREMENT,
  `id_responsible` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`id_kind_of_app`)
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
  `id_skill_group` int(11) NOT NULL,
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
  `id_kind_of_app` int(11) NOT NULL,
  `description` varchar(100) NOT NULL,
  PRIMARY KEY (`id_skill_group`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `skill_instance`
--

DROP TABLE IF EXISTS `skill_instance`;
CREATE TABLE IF NOT EXISTS `skill_instance` (
  `id_skill_instance` int(11) NOT NULL,
  `id_skill` int(11) NOT NULL,
  `id_student` int(11) NOT NULL,
  `level` int(11) NOT NULL,
  `tutor_comment` text NOT NULL,
  `student_comment` text NOT NULL,
  PRIMARY KEY (`id_skill_instance`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `student`
--

DROP TABLE IF EXISTS `student`;
CREATE TABLE IF NOT EXISTS `student` (
  `id_student` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` int(11) NOT NULL,
  `id_group_app` int(11) DEFAULT NULL,
  `promo` year(4) NOT NULL,
  PRIMARY KEY (`id_student`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

--
-- Contenu de la table `student`
--

INSERT INTO `student` (`id_student`, `student_id`, `id_group_app`, `promo`) VALUES
(9, 46512, 1, 0000),
(8, 46512, NULL, 0000);

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
  `pseudo` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `birth_date` date NOT NULL,
  `is_admin` tinyint(1) NOT NULL DEFAULT '0',
  `id_admin` int(11) DEFAULT '0' COMMENT 'Meaningfull only if admin',
  `is_responsible` tinyint(1) NOT NULL DEFAULT '0',
  `id_responsible` int(11) DEFAULT '0' COMMENT 'Meaningfull only if responsible',
  `is_tutor` tinyint(1) NOT NULL DEFAULT '0',
  `id_tutor` int(11) DEFAULT '0' COMMENT 'Meaningfull only if tutor',
  `is_student` tinyint(1) NOT NULL DEFAULT '0',
  `id_student` int(11) NOT NULL DEFAULT '0' COMMENT 'Meaningfull only if student',
  `password` text NOT NULL,
  PRIMARY KEY (`id_user`),
  UNIQUE KEY `pseudo` (`pseudo`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

--
-- Contenu de la table `user`
--

INSERT INTO `user` (`id_user`, `pseudo`, `first_name`, `last_name`, `birth_date`, `is_admin`, `id_admin`, `is_responsible`, `id_responsible`, `is_tutor`, `id_tutor`, `is_student`, `id_student`, `password`) VALUES
(15, 'cou', 'prenom2', 'nom', '1970-01-01', 0, 0, 0, 0, 0, 0, 1, 9, ''),
(14, 'co', 'prenom', 'nom', '1970-01-01', 0, 0, 0, 0, 0, 0, 1, 8, '');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
