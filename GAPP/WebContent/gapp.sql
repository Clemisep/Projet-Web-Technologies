-- phpMyAdmin SQL Dump
-- version 4.5.5.1
-- http://www.phpmyadmin.net
--
-- Client :  127.0.0.1
-- Généré le :  Mer 22 Juin 2016 à 02:48
-- Version du serveur :  5.7.11
-- Version de PHP :  5.6.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `gapp`
--
CREATE DATABASE IF NOT EXISTS `gapp` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `gapp`;

-- --------------------------------------------------------

--
-- Structure de la table `admin`
--

CREATE TABLE `admin` (
  `id_admin` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Contenu de la table `admin`
--

INSERT INTO `admin` (`id_admin`) VALUES
(16);

-- --------------------------------------------------------

--
-- Structure de la table `course`
--

CREATE TABLE `course` (
  `id_course` int(11) NOT NULL,
  `type` varchar(15) NOT NULL COMMENT 'lesson, appTutor or app',
  `date` datetime NOT NULL,
  `duration` time NOT NULL,
  `id_group_app` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Cours assigné à un groupe d''APP et présences/absences.';

-- --------------------------------------------------------

--
-- Structure de la table `group_app`
--

CREATE TABLE `group_app` (
  `id_group_app` int(11) NOT NULL,
  `id_kind_of_app` int(11) NOT NULL,
  `id_tutor` int(11) NOT NULL,
  `name` varchar(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Contenu de la table `group_app`
--

INSERT INTO `group_app` (`id_group_app`, `id_kind_of_app`, `id_tutor`, `name`) VALUES
(5, 9, 9, 'G5');

-- --------------------------------------------------------

--
-- Structure de la table `group_remark`
--

CREATE TABLE `group_remark` (
  `id_group_remark` int(11) NOT NULL,
  `remark` text NOT NULL,
  `date` datetime NOT NULL,
  `id_group_app` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `kind_of_app`
--

CREATE TABLE `kind_of_app` (
  `id_kind_of_app` int(11) NOT NULL,
  `id_responsible` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `description` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Contenu de la table `kind_of_app`
--

INSERT INTO `kind_of_app` (`id_kind_of_app`, `id_responsible`, `name`, `description`) VALUES
(9, 9, 'Technos Web', 'Faire un site web en Java EE');

-- --------------------------------------------------------

--
-- Structure de la table `presence`
--

CREATE TABLE `presence` (
  `id_course` int(11) NOT NULL,
  `id_student` int(11) NOT NULL,
  `is_present` tinyint(1) NOT NULL,
  `remark` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `responsible`
--

CREATE TABLE `responsible` (
  `id_responsible` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Contenu de la table `responsible`
--

INSERT INTO `responsible` (`id_responsible`) VALUES
(9);

-- --------------------------------------------------------

--
-- Structure de la table `skill`
--

CREATE TABLE `skill` (
  `id_skill` int(11) NOT NULL,
  `id_skill_group` int(11) NOT NULL,
  `description` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Contenu de la table `skill`
--

INSERT INTO `skill` (`id_skill`, `id_skill_group`, `description`) VALUES
(9, 3, 'Java'),
(8, 3, 'CSS'),
(7, 3, 'HTML');

-- --------------------------------------------------------

--
-- Structure de la table `skill_group`
--

CREATE TABLE `skill_group` (
  `id_skill_group` int(11) NOT NULL,
  `id_kind_of_app` int(11) NOT NULL,
  `description` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Contenu de la table `skill_group`
--

INSERT INTO `skill_group` (`id_skill_group`, `id_kind_of_app`, `description`) VALUES
(4, 9, 'Humaine'),
(3, 9, 'Technique');

-- --------------------------------------------------------

--
-- Structure de la table `skill_instance`
--

CREATE TABLE `skill_instance` (
  `id_skill_instance` int(11) NOT NULL,
  `id_skill` int(11) NOT NULL,
  `id_student` int(11) NOT NULL,
  `level` int(11) NOT NULL,
  `tutor_comment` text NOT NULL,
  `student_comment` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Contenu de la table `skill_instance`
--

INSERT INTO `skill_instance` (`id_skill_instance`, `id_skill`, `id_student`, `level`, `tutor_comment`, `student_comment`) VALUES
(11, 9, 24, 5, '', '');

-- --------------------------------------------------------

--
-- Structure de la table `student`
--

CREATE TABLE `student` (
  `id_student` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `id_group_app` int(11) DEFAULT NULL,
  `promo` year(4) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Contenu de la table `student`
--

INSERT INTO `student` (`id_student`, `student_id`, `id_group_app`, `promo`) VALUES
(24, 9000, 5, 2017);

-- --------------------------------------------------------

--
-- Structure de la table `student_remark`
--

CREATE TABLE `student_remark` (
  `id_student_remark` int(11) NOT NULL,
  `remark` text NOT NULL,
  `date` datetime NOT NULL,
  `id_student` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `tutor`
--

CREATE TABLE `tutor` (
  `id_tutor` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Contenu de la table `tutor`
--

INSERT INTO `tutor` (`id_tutor`) VALUES
(9);

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `id_user` int(11) NOT NULL,
  `pseudo` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `birth_date` date NOT NULL,
  `is_admin` tinyint(1) NOT NULL DEFAULT '0',
  `id_admin` int(11) DEFAULT '0'COMMENT
) ;

--
-- Contenu de la table `user`
--

INSERT INTO `user` (`id_user`, `pseudo`, `first_name`, `last_name`, `birth_date`, `is_admin`, `id_admin`, `is_responsible`, `id_responsible`, `is_tutor`, `id_tutor`, `is_student`, `id_student`, `password`) VALUES
(39, 'yoan', 'yoan', 'yoan', '2010-11-11', 1, 16, 1, 9, 1, 9, 1, 24, 'cc175b9c0f1b6a831c399e269772661');

--
-- Index pour les tables exportées
--

--
-- Index pour la table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id_admin`);

--
-- Index pour la table `course`
--
ALTER TABLE `course`
  ADD PRIMARY KEY (`id_course`);

--
-- Index pour la table `group_app`
--
ALTER TABLE `group_app`
  ADD PRIMARY KEY (`id_group_app`);

--
-- Index pour la table `group_remark`
--
ALTER TABLE `group_remark`
  ADD PRIMARY KEY (`id_group_remark`);

--
-- Index pour la table `kind_of_app`
--
ALTER TABLE `kind_of_app`
  ADD PRIMARY KEY (`id_kind_of_app`);

--
-- Index pour la table `responsible`
--
ALTER TABLE `responsible`
  ADD PRIMARY KEY (`id_responsible`);

--
-- Index pour la table `skill`
--
ALTER TABLE `skill`
  ADD PRIMARY KEY (`id_skill`);

--
-- Index pour la table `skill_group`
--
ALTER TABLE `skill_group`
  ADD PRIMARY KEY (`id_skill_group`);

--
-- Index pour la table `skill_instance`
--
ALTER TABLE `skill_instance`
  ADD PRIMARY KEY (`id_skill_instance`);

--
-- Index pour la table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`id_student`);

--
-- Index pour la table `student_remark`
--
ALTER TABLE `student_remark`
  ADD PRIMARY KEY (`id_student_remark`);

--
-- Index pour la table `tutor`
--
ALTER TABLE `tutor`
  ADD PRIMARY KEY (`id_tutor`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `admin`
--
ALTER TABLE `admin`
  MODIFY `id_admin` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT pour la table `course`
--
ALTER TABLE `course`
  MODIFY `id_course` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `group_app`
--
ALTER TABLE `group_app`
  MODIFY `id_group_app` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT pour la table `group_remark`
--
ALTER TABLE `group_remark`
  MODIFY `id_group_remark` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `kind_of_app`
--
ALTER TABLE `kind_of_app`
  MODIFY `id_kind_of_app` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT pour la table `responsible`
--
ALTER TABLE `responsible`
  MODIFY `id_responsible` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT pour la table `skill`
--
ALTER TABLE `skill`
  MODIFY `id_skill` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT pour la table `skill_group`
--
ALTER TABLE `skill_group`
  MODIFY `id_skill_group` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT pour la table `skill_instance`
--
ALTER TABLE `skill_instance`
  MODIFY `id_skill_instance` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT pour la table `student`
--
ALTER TABLE `student`
  MODIFY `id_student` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;
--
-- AUTO_INCREMENT pour la table `student_remark`
--
ALTER TABLE `student_remark`
  MODIFY `id_student_remark` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `tutor`
--
ALTER TABLE `tutor`
  MODIFY `id_tutor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
