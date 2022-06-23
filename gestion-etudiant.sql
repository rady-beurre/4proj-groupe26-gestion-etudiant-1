-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : dim. 19 juin 2022 à 15:09
-- Version du serveur : 8.0.27
-- Version de PHP : 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `gestion-etudiant`
--

-- --------------------------------------------------------

--
-- Structure de la table `absences`
--

DROP TABLE IF EXISTS `absences`;
CREATE TABLE IF NOT EXISTS `absences` (
  `id_absences` bigint NOT NULL,
  `date_debut_absences` datetime DEFAULT NULL,
  `date_fin_absences` datetime DEFAULT NULL,
  `est_justifie` int NOT NULL,
  `id_etudiant` bigint NOT NULL,
  PRIMARY KEY (`id_absences`),
  KEY `FKn9q8vtv4yor8d3dy8d44y2jnj` (`id_etudiant`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `absences`
--

INSERT INTO `absences` (`id_absences`, `date_debut_absences`, `date_fin_absences`, `est_justifie`, `id_etudiant`) VALUES
(1, '2022-06-13 17:38:00', '2022-06-13 17:38:00', 1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `acces`
--

DROP TABLE IF EXISTS `acces`;
CREATE TABLE IF NOT EXISTS `acces` (
  `id_acces` bigint NOT NULL,
  `code_acces` varchar(255) DEFAULT NULL,
  `libelle_acces` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_acces`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `acces`
--

INSERT INTO `acces` (`id_acces`, `code_acces`, `libelle_acces`) VALUES
(0, 'ADMIN', 'ADMIN'),
(1, 'P', 'PEDAGOGIE'),
(2, 'ADM', 'ADMINISTRATION'),
(3, 'E', 'ETUDIANT'),
(4, 'DA', 'DIRECTION ACADEMIQUE');

-- --------------------------------------------------------

--
-- Structure de la table `administratif_etudiant`
--

DROP TABLE IF EXISTS `administratif_etudiant`;
CREATE TABLE IF NOT EXISTS `administratif_etudiant` (
  `id_administratif_etudiant` bigint NOT NULL,
  `annee_entree` datetime DEFAULT NULL,
  `annee_sortie` datetime DEFAULT NULL,
  `niveau_entree` int NOT NULL,
  `niveau_sortie` int NOT NULL,
  `id_personne` bigint NOT NULL,
  PRIMARY KEY (`id_administratif_etudiant`),
  KEY `FKf2b8bugoyadkm7hat81y8ialr` (`id_personne`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `administratif_etudiant`
--

INSERT INTO `administratif_etudiant` (`id_administratif_etudiant`, `annee_entree`, `annee_sortie`, `niveau_entree`, `niveau_sortie`, `id_personne`) VALUES
(1, '2020-01-01 01:00:00', '2022-12-31 01:00:00', 1, 2, 4);

-- --------------------------------------------------------

--
-- Structure de la table `adresse`
--

DROP TABLE IF EXISTS `adresse`;
CREATE TABLE IF NOT EXISTS `adresse` (
  `id_adresse` bigint NOT NULL,
  `actuel` int NOT NULL,
  `adresse_email_perso` varchar(255) DEFAULT NULL,
  `adresse_email_supinfo` varchar(255) DEFAULT NULL,
  `code_postal` varchar(255) DEFAULT NULL,
  `libelle_adresse` varchar(255) DEFAULT NULL,
  `num_telephone_perso` varchar(255) DEFAULT NULL,
  `num_telephone_supinfo` varchar(255) DEFAULT NULL,
  `region` varchar(255) DEFAULT NULL,
  `ville` varchar(255) DEFAULT NULL,
  `id_personne` bigint NOT NULL,
  PRIMARY KEY (`id_adresse`),
  KEY `FKby6uvgm4f1yju51ef2ildpn0x` (`id_personne`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `adresse`
--

INSERT INTO `adresse` (`id_adresse`, `actuel`, `adresse_email_perso`, `adresse_email_supinfo`, `code_postal`, `libelle_adresse`, `num_telephone_perso`, `num_telephone_supinfo`, `region`, `ville`, `id_personne`) VALUES
(1, 1, 'gino.ratsimandresy@icloud.com', 'gino.ratsimandresy@supinfo.fr', '78370', '45 Rue de la République', '06 03 40 75 56', '01 03 40 75 56', 'Yvelines', 'Plaisir', 4),
(2, 1, 'randy.raboanaly@gmail.com', 'randy.raboanaly@supinfo.fr', '78310', '20A Rue du Couserans', '06 17 29 73 94', '01 17 29 73 94', 'Yvelines', 'Maurepas', 5),
(3, 1, 'tiavina.ratsimandresy@yahoo.fr', 'tiavina.rakotondrafara@supinfo.com', '92300', '4 Rue de la Prairie', '00 00 00 11 11', '01 00 00 11 11', 'Hauts de Seine', 'Antony', 6);

-- --------------------------------------------------------

--
-- Structure de la table `anciens`
--

DROP TABLE IF EXISTS `anciens`;
CREATE TABLE IF NOT EXISTS `anciens` (
  `id_anciens` bigint NOT NULL,
  `date_debut` datetime DEFAULT NULL,
  `date_obtention_diplome` datetime DEFAULT NULL,
  `id_entreprise` bigint NOT NULL,
  `id_etudiant` bigint NOT NULL,
  `id_type_contrat` bigint NOT NULL,
  PRIMARY KEY (`id_anciens`),
  KEY `FK6rqri5r0x3g2r63t8f0nmk5ew` (`id_entreprise`),
  KEY `FKymkhrn37b7pfohkfg36lvkhh` (`id_etudiant`),
  KEY `FK8cvqtxjhxaw9pte4yrnqs6i2m` (`id_type_contrat`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `anciens`
--

INSERT INTO `anciens` (`id_anciens`, `date_debut`, `date_obtention_diplome`, `id_entreprise`, `id_etudiant`, `id_type_contrat`) VALUES
(1, '2022-06-19 02:00:00', '2022-06-19 02:00:00', 3, 3, 4);

-- --------------------------------------------------------

--
-- Structure de la table `annee_scolaire`
--

DROP TABLE IF EXISTS `annee_scolaire`;
CREATE TABLE IF NOT EXISTS `annee_scolaire` (
  `id_annee_scolaire` bigint NOT NULL,
  `annee` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_annee_scolaire`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `annee_scolaire`
--

INSERT INTO `annee_scolaire` (`id_annee_scolaire`, `annee`) VALUES
(1, '2020 - 2021'),
(2, '2021 - 2022'),
(3, '2022 - 2023'),
(4, '2023 - 2024'),
(5, '2024 - 2025');

-- --------------------------------------------------------

--
-- Structure de la table `campus`
--

DROP TABLE IF EXISTS `campus`;
CREATE TABLE IF NOT EXISTS `campus` (
  `id_campus` bigint NOT NULL,
  `code_campus` varchar(255) DEFAULT NULL,
  `libelle_campus` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_campus`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `campus`
--

INSERT INTO `campus` (`id_campus`, `code_campus`, `libelle_campus`) VALUES
(1, 'CMP001', 'CAMPUS DISTANCIEL'),
(2, 'CMP002', 'CAMPUS PRESENTIEL');

-- --------------------------------------------------------

--
-- Structure de la table `comptabilite`
--

DROP TABLE IF EXISTS `comptabilite`;
CREATE TABLE IF NOT EXISTS `comptabilite` (
  `id_comptabilite` bigint NOT NULL,
  `compta_paie_type` varchar(255) DEFAULT NULL,
  `compta_payement_due` double NOT NULL,
  `compta_relance` int NOT NULL,
  `est_totalement_payer` int NOT NULL,
  `id_etudiant` bigint NOT NULL,
  PRIMARY KEY (`id_comptabilite`),
  KEY `FKdfnobpjvcnpl7omfgoh3a71o1` (`id_etudiant`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `comptabilite`
--

INSERT INTO `comptabilite` (`id_comptabilite`, `compta_paie_type`, `compta_payement_due`, `compta_relance`, `est_totalement_payer`, `id_etudiant`) VALUES
(1, 'Mois de Juin', 2500, 1, 1, 1),
(2, 'Mois de Juin', 2500, 1, 1, 2);

-- --------------------------------------------------------

--
-- Structure de la table `contrat`
--

DROP TABLE IF EXISTS `contrat`;
CREATE TABLE IF NOT EXISTS `contrat` (
  `id_contrat` bigint NOT NULL,
  `adresse_email_encadreur` varchar(255) DEFAULT NULL,
  `date_debut_contrat` datetime DEFAULT NULL,
  `date_fin_contrat` datetime DEFAULT NULL,
  `duree_contrat` double NOT NULL,
  `fichier_contrat` varchar(255) DEFAULT NULL,
  `fichier_convention` varchar(255) DEFAULT NULL,
  `nom_prenom_encadreur` varchar(255) DEFAULT NULL,
  `telephone_encadreur` varchar(255) DEFAULT NULL,
  `id_entreprise` bigint NOT NULL,
  `id_type_contrat` bigint NOT NULL,
  PRIMARY KEY (`id_contrat`),
  KEY `FKfy93mnclhw151mlpoeec1y4m1` (`id_entreprise`),
  KEY `FK61ac4tjbd4hlpdv9sicaec31a` (`id_type_contrat`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `contrat`
--

INSERT INTO `contrat` (`id_contrat`, `adresse_email_encadreur`, `date_debut_contrat`, `date_fin_contrat`, `duree_contrat`, `fichier_contrat`, `fichier_convention`, `nom_prenom_encadreur`, `telephone_encadreur`, `id_entreprise`, `id_type_contrat`) VALUES
(1, 'noel.lodou@mind7.fr', '2022-01-01 01:00:00', '2022-12-31 01:00:00', 1, 'QR-4PROJ.pdf', 'QR-4PROJ.pdf', 'Noël LODOU', '00 00 00 01 01', 1, 3),
(2, 'naoufal.hadi@capgemini.fr', '2022-01-01 01:00:00', '2023-12-31 01:00:00', 2, '4PROJ-Sujet.pdf', '4PROJ-Sujet.pdf', 'Naoufal HADI', '00 00 00 02 02', 2, 2),
(3, 'zacharie.andrieu@cegape.fr', '2020-01-01 01:00:00', '2022-12-31 01:00:00', 12, 'Persona-4PROJ (1).pdf', 'Persona-4PROJ (1).pdf', 'Zacharie Andrieu', '00 00 00 03 03', 3, 1);

-- --------------------------------------------------------

--
-- Structure de la table `demande_document`
--

DROP TABLE IF EXISTS `demande_document`;
CREATE TABLE IF NOT EXISTS `demande_document` (
  `id_demande_document` bigint NOT NULL,
  `id_etudiant` bigint NOT NULL,
  `id_type_document` bigint NOT NULL,
  PRIMARY KEY (`id_demande_document`),
  KEY `FKaoivyb2xkflj6fqp16u1p8akb` (`id_etudiant`),
  KEY `FKdn31hn07q0xwxbo5ollelk0kh` (`id_type_document`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `entreprise`
--

DROP TABLE IF EXISTS `entreprise`;
CREATE TABLE IF NOT EXISTS `entreprise` (
  `id_entreprise` bigint NOT NULL,
  `adresse_entreprise` varchar(255) DEFAULT NULL,
  `code_postal_entreprise` varchar(255) DEFAULT NULL,
  `mail_entreprise` varchar(255) DEFAULT NULL,
  `nom_entreprise` varchar(255) DEFAULT NULL,
  `responsable_entreprise` varchar(255) DEFAULT NULL,
  `secteur_activite_entreprise` varchar(255) DEFAULT NULL,
  `telephone_entreprise` varchar(255) DEFAULT NULL,
  `ville_entreprise` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_entreprise`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `entreprise`
--

INSERT INTO `entreprise` (`id_entreprise`, `adresse_entreprise`, `code_postal_entreprise`, `mail_entreprise`, `nom_entreprise`, `responsable_entreprise`, `secteur_activite_entreprise`, `telephone_entreprise`, `ville_entreprise`) VALUES
(1, '6 Rue du Rome', '75008', 'stephane.hugot@mind7.fr', 'Mind7 Consulting', 'Stéphane HUGOT', 'Informatique', '00 00 00 00 01', 'Paris'),
(2, '12 Rue de la Verrerie', '92310', 'denis.flamant@capgemini.fr', 'CAPGEMINI', 'Denis FLAMANT', 'IT', '00 00 00 00 02', 'Meudon'),
(3, '114 Rue Chaptal', '92300', 'patrice.morard@cegape.fr', 'CEGAPE', 'Patrice MORARD', 'RH', '00 00 00 00 03', 'Levallois-Perret');

-- --------------------------------------------------------

--
-- Structure de la table `etudiant`
--

DROP TABLE IF EXISTS `etudiant`;
CREATE TABLE IF NOT EXISTS `etudiant` (
  `id_etudiant` bigint NOT NULL,
  `actuel` int NOT NULL,
  `admis` int NOT NULL,
  `credit_total_obtenus` double NOT NULL,
  `id_annee_scolaire` bigint NOT NULL,
  `id_campus` bigint NOT NULL,
  `id_contrat` bigint NOT NULL,
  `id_niveau` bigint NOT NULL,
  `id_personne` bigint NOT NULL,
  `id_specialite` bigint NOT NULL,
  `id_type_formation` bigint NOT NULL,
  PRIMARY KEY (`id_etudiant`),
  KEY `FKb808ce4njx9at09rr7ftgf521` (`id_annee_scolaire`),
  KEY `FK559liy0ep37nqplod3503stdm` (`id_campus`),
  KEY `FKgvh3luqe7ia1y2cjm58xp4kke` (`id_contrat`),
  KEY `FKnnt26w6r6qmg954hm5u661xed` (`id_niveau`),
  KEY `FKboafws2x4u1lc4k5x5d7hl0ks` (`id_personne`),
  KEY `FKmfbmjjh3wrxayli7givsc29g5` (`id_specialite`),
  KEY `FKkcvragtxha9gawael3b18a23l` (`id_type_formation`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `etudiant`
--

INSERT INTO `etudiant` (`id_etudiant`, `actuel`, `admis`, `credit_total_obtenus`, `id_annee_scolaire`, `id_campus`, `id_contrat`, `id_niveau`, `id_personne`, `id_specialite`, `id_type_formation`) VALUES
(1, 1, 1, 0, 2, 2, 1, 1, 4, 1, 1),
(2, 1, 0, 0, 2, 1, 2, 2, 5, 2, 2),
(3, 1, 0, 0, 2, 2, 3, 1, 6, 3, 1);

-- --------------------------------------------------------

--
-- Structure de la table `groupe`
--

DROP TABLE IF EXISTS `groupe`;
CREATE TABLE IF NOT EXISTS `groupe` (
  `id_groupe` bigint NOT NULL,
  `nom_groupe` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_groupe`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `groupe`
--

INSERT INTO `groupe` (`id_groupe`, `nom_groupe`) VALUES
(1, 'Groupe 1'),
(2, 'Groupe 2'),
(3, 'Groupe 3'),
(4, 'Groupe 4'),
(5, 'Groupe 5');

-- --------------------------------------------------------

--
-- Structure de la table `groupe_module`
--

DROP TABLE IF EXISTS `groupe_module`;
CREATE TABLE IF NOT EXISTS `groupe_module` (
  `id_groupe_module` bigint NOT NULL,
  `id_campus` bigint NOT NULL,
  `id_etudiant` bigint NOT NULL,
  `id_groupe` bigint NOT NULL,
  `id_module` bigint NOT NULL,
  PRIMARY KEY (`id_groupe_module`),
  KEY `FKh7m1rtouap6uf32fhjxjefa4r` (`id_campus`),
  KEY `FKs07g6png6ak470w23lutf8efy` (`id_etudiant`),
  KEY `FK5ofpok416gwakb1hxvgje5hl8` (`id_groupe`),
  KEY `FKd17fkgiq085d1flyl5snyxifh` (`id_module`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `groupe_module`
--

INSERT INTO `groupe_module` (`id_groupe_module`, `id_campus`, `id_etudiant`, `id_groupe`, `id_module`) VALUES
(1, 1, 1, 2, 1),
(2, 1, 2, 2, 1);

-- --------------------------------------------------------

--
-- Structure de la table `intervenant`
--

DROP TABLE IF EXISTS `intervenant`;
CREATE TABLE IF NOT EXISTS `intervenant` (
  `id_intervenant` bigint NOT NULL,
  `libelle_intervenant` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_intervenant`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `intervenant`
--

INSERT INTO `intervenant` (`id_intervenant`, `libelle_intervenant`) VALUES
(1, 'Chaker'),
(2, 'Rajae'),
(3, 'Amine');

-- --------------------------------------------------------

--
-- Structure de la table `intervenant_module`
--

DROP TABLE IF EXISTS `intervenant_module`;
CREATE TABLE IF NOT EXISTS `intervenant_module` (
  `id_intervenant_module` bigint NOT NULL,
  `date_debut_intervenention` datetime DEFAULT NULL,
  `date_fin_intervenention` datetime DEFAULT NULL,
  `id_campus` bigint NOT NULL,
  `id_module` bigint NOT NULL,
  `id_personne_intervenant` bigint NOT NULL,
  PRIMARY KEY (`id_intervenant_module`),
  KEY `FKji380xakj5y9extte4qy9n9ta` (`id_campus`),
  KEY `FK8h71qr9embg9x01yr6ly593k7` (`id_module`),
  KEY `FKl70np50vx29ypyx1jmbft2sds` (`id_personne_intervenant`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `intervenant_module`
--

INSERT INTO `intervenant_module` (`id_intervenant_module`, `date_debut_intervenention`, `date_fin_intervenention`, `id_campus`, `id_module`, `id_personne_intervenant`) VALUES
(1, '2022-06-19 14:40:55', '2022-06-19 14:40:55', 1, 1, 1),
(2, '2022-06-19 14:41:06', '2022-06-19 14:41:06', 2, 2, 2),
(3, '2022-06-19 14:41:13', '2022-06-19 14:41:13', 2, 3, 3);

-- --------------------------------------------------------

--
-- Structure de la table `login`
--

DROP TABLE IF EXISTS `login`;
CREATE TABLE IF NOT EXISTS `login` (
  `id_login` bigint NOT NULL,
  `pass` varchar(255) DEFAULT NULL,
  `user` varchar(255) DEFAULT NULL,
  `id_acces` bigint NOT NULL,
  `id_personne` bigint NOT NULL,
  PRIMARY KEY (`id_login`),
  KEY `FK14aggqsblbg2ogo3u63wydtds` (`id_acces`),
  KEY `FKii86gjd3oh9hmb752q61lld2r` (`id_personne`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `login`
--

INSERT INTO `login` (`id_login`, `pass`, `user`, `id_acces`, `id_personne`) VALUES
(0, 'admin', 'admin', 0, 0),
(1, 'justin', 'justin', 1, 1),
(2, 'nicole', 'nicole', 4, 2),
(3, 'florence', 'florence', 2, 3),
(4, 'gino', 'gino', 3, 4),
(5, 'randy', 'randy', 3, 5),
(6, 'tiavina', 'tiavina', 3, 6);

-- --------------------------------------------------------

--
-- Structure de la table `memoire`
--

DROP TABLE IF EXISTS `memoire`;
CREATE TABLE IF NOT EXISTS `memoire` (
  `id_memoire` bigint NOT NULL,
  `a_soutenance` int NOT NULL,
  `est_obligatoire` int NOT NULL,
  `est_valide` int NOT NULL,
  `notes_rapports` double NOT NULL,
  `notes_soutenance` double NOT NULL,
  `id_contrat` bigint NOT NULL,
  PRIMARY KEY (`id_memoire`),
  KEY `FKt1queq3uu9kgogu5qaxapvxy8` (`id_contrat`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `memoire`
--

INSERT INTO `memoire` (`id_memoire`, `a_soutenance`, `est_obligatoire`, `est_valide`, `notes_rapports`, `notes_soutenance`, `id_contrat`) VALUES
(1, 1, 1, 1, 16, 16, 3);

-- --------------------------------------------------------

--
-- Structure de la table `module`
--

DROP TABLE IF EXISTS `module`;
CREATE TABLE IF NOT EXISTS `module` (
  `id_module` bigint NOT NULL,
  `code_module` varchar(255) DEFAULT NULL,
  `credit_requis` double NOT NULL,
  `est_obligatoire` int NOT NULL,
  `libelle_module` varchar(255) DEFAULT NULL,
  `id_niveau` bigint NOT NULL,
  PRIMARY KEY (`id_module`),
  KEY `FKqk1etf7xkm7atiewmy7j1fg46` (`id_niveau`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `module`
--

INSERT INTO `module` (`id_module`, `code_module`, `credit_requis`, `est_obligatoire`, `libelle_module`, `id_niveau`) VALUES
(1, 'L1-MOD001', 30, 1, 'Mathémathique', 1),
(2, 'L1-MOD002', 20, 0, 'Analyse de donnée', 1),
(3, 'L1-MOD003', 10, 1, 'Algorithme', 1),
(4, 'L2-MOD001', 40, 1, 'Web', 2),
(5, 'L2-MOD002', 30, 0, 'Administration base', 2),
(6, 'L2-MOD003', 20, 1, 'Statistiques', 2);

-- --------------------------------------------------------

--
-- Structure de la table `module_specialite`
--

DROP TABLE IF EXISTS `module_specialite`;
CREATE TABLE IF NOT EXISTS `module_specialite` (
  `id_module_specialite` bigint NOT NULL,
  `id_module` bigint NOT NULL,
  `id_specialite` bigint NOT NULL,
  PRIMARY KEY (`id_module_specialite`),
  KEY `FKsu5w2j3ptjbu6150gk1ceshgy` (`id_module`),
  KEY `FKkij7jca0po89whp8bnfuscjb1` (`id_specialite`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `module_specialite`
--

INSERT INTO `module_specialite` (`id_module_specialite`, `id_module`, `id_specialite`) VALUES
(1, 1, 1),
(2, 2, 1),
(3, 4, 2),
(4, 5, 4);

-- --------------------------------------------------------

--
-- Structure de la table `nature_partenariat`
--

DROP TABLE IF EXISTS `nature_partenariat`;
CREATE TABLE IF NOT EXISTS `nature_partenariat` (
  `id_nature_partenariat` bigint NOT NULL,
  `libelle_nature_partenariat` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_nature_partenariat`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `nature_partenariat`
--

INSERT INTO `nature_partenariat` (`id_nature_partenariat`, `libelle_nature_partenariat`) VALUES
(1, 'Partenariat long'),
(2, 'Partenariat court'),
(3, 'Partenariat provisoire');

-- --------------------------------------------------------

--
-- Structure de la table `niveau`
--

DROP TABLE IF EXISTS `niveau`;
CREATE TABLE IF NOT EXISTS `niveau` (
  `id_niveau` bigint NOT NULL,
  `code_niveau` varchar(255) DEFAULT NULL,
  `libelle_niveau` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_niveau`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `niveau`
--

INSERT INTO `niveau` (`id_niveau`, `code_niveau`, `libelle_niveau`) VALUES
(1, 'L1', 'PREMIERE ANNEE'),
(2, 'L2', 'DEUXIEME ANNEE'),
(3, 'L3', 'TROISIEME ANNEE'),
(4, 'M1', 'MASTER ONE'),
(5, 'M2', 'MASTER TWO');

-- --------------------------------------------------------

--
-- Structure de la table `notes`
--

DROP TABLE IF EXISTS `notes`;
CREATE TABLE IF NOT EXISTS `notes` (
  `id_notes` bigint NOT NULL,
  `notes` double NOT NULL,
  `id_etudiant` bigint NOT NULL,
  `id_module` bigint NOT NULL,
  PRIMARY KEY (`id_notes`),
  KEY `FKmwqpo6yt4ifnyhf71lgs9gl47` (`id_etudiant`),
  KEY `FK1f1dd5po4dfgf77tfg2kd13dw` (`id_module`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `notes`
--

INSERT INTO `notes` (`id_notes`, `notes`, `id_etudiant`, `id_module`) VALUES
(1, 9, 1, 1),
(2, 13, 1, 3),
(3, 12, 1, 2);

-- --------------------------------------------------------

--
-- Structure de la table `offres_pro`
--

DROP TABLE IF EXISTS `offres_pro`;
CREATE TABLE IF NOT EXISTS `offres_pro` (
  `id_offres_pro` bigint NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `fichier_offre` varchar(255) DEFAULT NULL,
  `libelle_long` varchar(255) DEFAULT NULL,
  `id_entreprise` bigint NOT NULL,
  `id_type_contrat` bigint NOT NULL,
  PRIMARY KEY (`id_offres_pro`),
  KEY `FKknbmwxa88p8s97myut0o9ce0t` (`id_entreprise`),
  KEY `FKln64ibj6dupv1uh557rbkp86s` (`id_type_contrat`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `offres_pro`
--

INSERT INTO `offres_pro` (`id_offres_pro`, `description`, `fichier_offre`, `libelle_long`, `id_entreprise`, `id_type_contrat`) VALUES
(1, 'Contrat Pro de Mind7 Consulting', 'Wifi.pdf', 'CP-Mind7', 1, 1),
(2, 'Offre CDI Campgemini', 'QR-4PROJ.pdf', 'CDI-CAP', 2, 4);

-- --------------------------------------------------------

--
-- Structure de la table `partenariats`
--

DROP TABLE IF EXISTS `partenariats`;
CREATE TABLE IF NOT EXISTS `partenariats` (
  `id_partenariats` bigint NOT NULL,
  `date_debut_partenariat` datetime DEFAULT NULL,
  `date_fin_partenariat` datetime DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `libelle_partenariat_courte` varchar(255) DEFAULT NULL,
  `libelle_partenariat_long` varchar(255) DEFAULT NULL,
  `id_nature_partenariat` bigint NOT NULL,
  PRIMARY KEY (`id_partenariats`),
  KEY `FKatg61p92x55bs5g3yojjholg` (`id_nature_partenariat`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `partenariats`
--

INSERT INTO `partenariats` (`id_partenariats`, `date_debut_partenariat`, `date_fin_partenariat`, `description`, `libelle_partenariat_courte`, `libelle_partenariat_long`, `id_nature_partenariat`) VALUES
(1, '2020-01-01 01:00:00', '2025-12-31 01:00:00', 'Partenariat avec Miscrosoft', 'PL', 'Miscrosoft', 1),
(2, '2022-01-01 01:00:00', '2022-01-01 01:00:00', 'Partenariat avec IBM', 'PC', 'IBM', 2),
(3, '2022-06-01 02:00:00', '2022-06-30 02:00:00', 'Partenariat provisoire avec Oracle Database', 'PC', 'Oracle', 3);

-- --------------------------------------------------------

--
-- Structure de la table `personne`
--

DROP TABLE IF EXISTS `personne`;
CREATE TABLE IF NOT EXISTS `personne` (
  `id_personne` bigint NOT NULL,
  `date_naissance` date DEFAULT NULL,
  `identifiant` varchar(255) DEFAULT NULL,
  `nom` varchar(255) DEFAULT NULL,
  `nom_usage` varchar(255) DEFAULT NULL,
  `prenoms` varchar(255) DEFAULT NULL,
  `sexe` char(1) NOT NULL,
  PRIMARY KEY (`id_personne`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `personne`
--

INSERT INTO `personne` (`id_personne`, `date_naissance`, `identifiant`, `nom`, `nom_usage`, `prenoms`, `sexe`) VALUES
(0, '2000-01-01', 'ADMIN', 'SUPINFO', 'SUPINFO', 'ADMIN', 'M'),
(1, '1800-01-01', 'ID-P-001', 'RATSIMANDRESY', 'RATSIMANDRESY', 'Justin', 'M'),
(2, '1800-01-01', 'ID-DA-001', 'LALANIRINA', 'LALANIRINA', 'Nicole', 'F'),
(3, '1800-01-01', 'ID-ADM-001', 'RAJAONARIVELO', 'RAJAONARIVELO', 'Florence', 'F'),
(4, '1994-08-28', 'ID-E-001', 'RATSIMANDRESY', 'RATSIMANDRESY', 'Gino', 'M'),
(5, '1998-02-15', 'ID-E-002', 'RABOANALY', 'RABOANALY', 'Randÿ', 'F'),
(6, '2000-01-01', 'ID-E-003', 'RAKOTONDRAFARA', 'RAKOTONDRAFARA', 'Tiavina', 'M'),
(7, '1900-01-01', 'ID-I-001', 'ATTIAS', 'ATTIAS', 'Mickaël', 'M'),
(8, '1900-01-01', 'ID-I-002', 'DELOSME', 'DELOSME', 'Morgane', 'F'),
(9, '1990-01-01', 'ID-I-003', 'BENSIDHOUM', 'BENSIDHOUM', 'Samy', 'M');

-- --------------------------------------------------------

--
-- Structure de la table `personne_intervenant`
--

DROP TABLE IF EXISTS `personne_intervenant`;
CREATE TABLE IF NOT EXISTS `personne_intervenant` (
  `id_personne_intervenant` bigint NOT NULL,
  `date_debut_situation` date DEFAULT NULL,
  `date_derniere_modification` date DEFAULT NULL,
  `date_fin_situation` date DEFAULT NULL,
  `utilisateur_modif` int NOT NULL,
  `id_campus` bigint NOT NULL,
  `id_intervenant` bigint NOT NULL,
  `id_personne` bigint NOT NULL,
  PRIMARY KEY (`id_personne_intervenant`),
  KEY `FKh59gpkijqpcnm9qs9u3c8r8nu` (`id_campus`),
  KEY `FK11ao2nv8qwpo77bqogeg677px` (`id_intervenant`),
  KEY `FKjkx88xk3piv4hgxraxfwifrac` (`id_personne`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `personne_intervenant`
--

INSERT INTO `personne_intervenant` (`id_personne_intervenant`, `date_debut_situation`, `date_derniere_modification`, `date_fin_situation`, `utilisateur_modif`, `id_campus`, `id_intervenant`, `id_personne`) VALUES
(1, '2022-01-01', '2022-06-19', '2025-12-31', 0, 1, 1, 7),
(2, '2022-01-01', '2022-06-19', '2022-12-31', 0, 2, 2, 8),
(3, '2022-01-01', '2022-06-19', '2023-12-31', 0, 1, 3, 9);

-- --------------------------------------------------------

--
-- Structure de la table `planification_cours`
--

DROP TABLE IF EXISTS `planification_cours`;
CREATE TABLE IF NOT EXISTS `planification_cours` (
  `id_planification` bigint NOT NULL,
  `date_heure_debut_planification` datetime DEFAULT NULL,
  `date_heure_fin_planification` datetime DEFAULT NULL,
  `est_confirme` int NOT NULL,
  `id_module` bigint NOT NULL,
  `id_type_planification` bigint NOT NULL,
  PRIMARY KEY (`id_planification`),
  KEY `FKr36fsnj1ap110xoghxx680su4` (`id_module`),
  KEY `FKvlgyn6hfmb1xlprfi9wp2aq7` (`id_type_planification`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `planification_cours`
--

INSERT INTO `planification_cours` (`id_planification`, `date_heure_debut_planification`, `date_heure_fin_planification`, `est_confirme`, `id_module`, `id_type_planification`) VALUES
(1, '2022-06-20 11:00:00', '2022-06-20 20:00:00', 1, 1, 1),
(2, '2022-06-21 11:30:00', '2022-06-21 19:30:00', 1, 2, 1),
(3, '2022-06-22 10:00:00', '2022-06-22 13:00:00', 0, 1, 2),
(4, '2022-06-22 16:00:00', '2022-06-22 19:00:00', 1, 2, 2);

-- --------------------------------------------------------

--
-- Structure de la table `projet`
--

DROP TABLE IF EXISTS `projet`;
CREATE TABLE IF NOT EXISTS `projet` (
  `id_projet` bigint NOT NULL,
  `date_limite` datetime DEFAULT NULL,
  `date_soutenance` datetime DEFAULT NULL,
  `id_module` bigint NOT NULL,
  PRIMARY KEY (`id_projet`),
  KEY `FKi0mpxhqmjax5w83d9g8hc0id0` (`id_module`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `sct_etudiant`
--

DROP TABLE IF EXISTS `sct_etudiant`;
CREATE TABLE IF NOT EXISTS `sct_etudiant` (
  `id_sct_etudiant` bigint NOT NULL,
  `valide_certification` int NOT NULL,
  `id_annee_scolaire` bigint NOT NULL,
  `id_etudiant` bigint NOT NULL,
  `id_type_sct` bigint NOT NULL,
  PRIMARY KEY (`id_sct_etudiant`),
  KEY `FKst61u0yht8hls637kgv1812hc` (`id_annee_scolaire`),
  KEY `FKgc39ri2xtjn7c46dxd42tidfp` (`id_etudiant`),
  KEY `FKb09330duxcnm6i7n9wt4xsr3r` (`id_type_sct`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `sct_etudiant`
--

INSERT INTO `sct_etudiant` (`id_sct_etudiant`, `valide_certification`, `id_annee_scolaire`, `id_etudiant`, `id_type_sct`) VALUES
(1, 1, 2, 1, 1),
(2, 0, 2, 2, 2);

-- --------------------------------------------------------

--
-- Structure de la table `specialite`
--

DROP TABLE IF EXISTS `specialite`;
CREATE TABLE IF NOT EXISTS `specialite` (
  `id_specialite` bigint NOT NULL,
  `code_specialite` varchar(255) DEFAULT NULL,
  `libelle_specialite` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_specialite`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `specialite`
--

INSERT INTO `specialite` (`id_specialite`, `code_specialite`, `libelle_specialite`) VALUES
(1, 'SPEC001', 'BIG DATA'),
(2, 'SPEC002', 'SYSTEME D\'INFORMATION'),
(3, 'SPEC003', 'RESEAUX'),
(4, 'SPEC004', 'CYBERSECURITE');

-- --------------------------------------------------------

--
-- Structure de la table `type_contrat`
--

DROP TABLE IF EXISTS `type_contrat`;
CREATE TABLE IF NOT EXISTS `type_contrat` (
  `id_type_contrat` bigint NOT NULL,
  `libelle_type_contrat` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_type_contrat`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `type_contrat`
--

INSERT INTO `type_contrat` (`id_type_contrat`, `libelle_type_contrat`) VALUES
(1, 'CONTRAT PRO'),
(2, 'CONTRAT D\'APPRENTISSAGE'),
(3, 'CONTRAT D\'ALTERNANCE'),
(4, 'CDI'),
(5, 'CDD');

-- --------------------------------------------------------

--
-- Structure de la table `type_document`
--

DROP TABLE IF EXISTS `type_document`;
CREATE TABLE IF NOT EXISTS `type_document` (
  `id_type_document` bigint NOT NULL,
  `libelle_type_document` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_type_document`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `type_formation`
--

DROP TABLE IF EXISTS `type_formation`;
CREATE TABLE IF NOT EXISTS `type_formation` (
  `id_type_formation` bigint NOT NULL,
  `libelle_type_formation` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_type_formation`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `type_formation`
--

INSERT INTO `type_formation` (`id_type_formation`, `libelle_type_formation`) VALUES
(1, 'FORMATION CONTINUE'),
(2, 'FORMATION INITAILE'),
(3, 'FORMATION A DISTANCE');

-- --------------------------------------------------------

--
-- Structure de la table `type_planification`
--

DROP TABLE IF EXISTS `type_planification`;
CREATE TABLE IF NOT EXISTS `type_planification` (
  `id_type_planification` bigint NOT NULL,
  `libelle_type_planification` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_type_planification`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `type_planification`
--

INSERT INTO `type_planification` (`id_type_planification`, `libelle_type_planification`) VALUES
(1, 'Cours'),
(2, 'Rattrapages');

-- --------------------------------------------------------

--
-- Structure de la table `type_sct`
--

DROP TABLE IF EXISTS `type_sct`;
CREATE TABLE IF NOT EXISTS `type_sct` (
  `id_type_sct` bigint NOT NULL,
  `libelle_type_sct` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_type_sct`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `type_sct`
--

INSERT INTO `type_sct` (`id_type_sct`, `libelle_type_sct`) VALUES
(1, 'SCT 1'),
(2, 'SCT 2'),
(3, 'SCT 3'),
(4, 'SCT 4'),
(5, 'SCT 5');

-- --------------------------------------------------------

--
-- Structure de la table `_seq_absences`
--

DROP TABLE IF EXISTS `_seq_absences`;
CREATE TABLE IF NOT EXISTS `_seq_absences` (
  `next_val` bigint DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `_seq_absences`
--

INSERT INTO `_seq_absences` (`next_val`) VALUES
(51);

-- --------------------------------------------------------

--
-- Structure de la table `_seq_acces`
--

DROP TABLE IF EXISTS `_seq_acces`;
CREATE TABLE IF NOT EXISTS `_seq_acces` (
  `next_val` bigint DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `_seq_acces`
--

INSERT INTO `_seq_acces` (`next_val`) VALUES
(101);

-- --------------------------------------------------------

--
-- Structure de la table `_seq_administratif_etudiant`
--

DROP TABLE IF EXISTS `_seq_administratif_etudiant`;
CREATE TABLE IF NOT EXISTS `_seq_administratif_etudiant` (
  `next_val` bigint DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `_seq_administratif_etudiant`
--

INSERT INTO `_seq_administratif_etudiant` (`next_val`) VALUES
(51);

-- --------------------------------------------------------

--
-- Structure de la table `_seq_adresse`
--

DROP TABLE IF EXISTS `_seq_adresse`;
CREATE TABLE IF NOT EXISTS `_seq_adresse` (
  `next_val` bigint DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `_seq_adresse`
--

INSERT INTO `_seq_adresse` (`next_val`) VALUES
(101);

-- --------------------------------------------------------

--
-- Structure de la table `_seq_anciens`
--

DROP TABLE IF EXISTS `_seq_anciens`;
CREATE TABLE IF NOT EXISTS `_seq_anciens` (
  `next_val` bigint DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `_seq_anciens`
--

INSERT INTO `_seq_anciens` (`next_val`) VALUES
(51);

-- --------------------------------------------------------

--
-- Structure de la table `_seq_annee_scolaire`
--

DROP TABLE IF EXISTS `_seq_annee_scolaire`;
CREATE TABLE IF NOT EXISTS `_seq_annee_scolaire` (
  `next_val` bigint DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `_seq_annee_scolaire`
--

INSERT INTO `_seq_annee_scolaire` (`next_val`) VALUES
(101);

-- --------------------------------------------------------

--
-- Structure de la table `_seq_campus`
--

DROP TABLE IF EXISTS `_seq_campus`;
CREATE TABLE IF NOT EXISTS `_seq_campus` (
  `next_val` bigint DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `_seq_campus`
--

INSERT INTO `_seq_campus` (`next_val`) VALUES
(101);

-- --------------------------------------------------------

--
-- Structure de la table `_seq_comptabilite`
--

DROP TABLE IF EXISTS `_seq_comptabilite`;
CREATE TABLE IF NOT EXISTS `_seq_comptabilite` (
  `next_val` bigint DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `_seq_comptabilite`
--

INSERT INTO `_seq_comptabilite` (`next_val`) VALUES
(101);

-- --------------------------------------------------------

--
-- Structure de la table `_seq_contrat`
--

DROP TABLE IF EXISTS `_seq_contrat`;
CREATE TABLE IF NOT EXISTS `_seq_contrat` (
  `next_val` bigint DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `_seq_contrat`
--

INSERT INTO `_seq_contrat` (`next_val`) VALUES
(101);

-- --------------------------------------------------------

--
-- Structure de la table `_seq_demande_document`
--

DROP TABLE IF EXISTS `_seq_demande_document`;
CREATE TABLE IF NOT EXISTS `_seq_demande_document` (
  `next_val` bigint DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `_seq_demande_document`
--

INSERT INTO `_seq_demande_document` (`next_val`) VALUES
(1);

-- --------------------------------------------------------

--
-- Structure de la table `_seq_entreprise`
--

DROP TABLE IF EXISTS `_seq_entreprise`;
CREATE TABLE IF NOT EXISTS `_seq_entreprise` (
  `next_val` bigint DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `_seq_entreprise`
--

INSERT INTO `_seq_entreprise` (`next_val`) VALUES
(101);

-- --------------------------------------------------------

--
-- Structure de la table `_seq_etudiant`
--

DROP TABLE IF EXISTS `_seq_etudiant`;
CREATE TABLE IF NOT EXISTS `_seq_etudiant` (
  `next_val` bigint DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `_seq_etudiant`
--

INSERT INTO `_seq_etudiant` (`next_val`) VALUES
(101);

-- --------------------------------------------------------

--
-- Structure de la table `_seq_groupe`
--

DROP TABLE IF EXISTS `_seq_groupe`;
CREATE TABLE IF NOT EXISTS `_seq_groupe` (
  `next_val` bigint DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `_seq_groupe`
--

INSERT INTO `_seq_groupe` (`next_val`) VALUES
(101);

-- --------------------------------------------------------

--
-- Structure de la table `_seq_groupe_module`
--

DROP TABLE IF EXISTS `_seq_groupe_module`;
CREATE TABLE IF NOT EXISTS `_seq_groupe_module` (
  `next_val` bigint DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `_seq_groupe_module`
--

INSERT INTO `_seq_groupe_module` (`next_val`) VALUES
(101);

-- --------------------------------------------------------

--
-- Structure de la table `_seq_intervenant`
--

DROP TABLE IF EXISTS `_seq_intervenant`;
CREATE TABLE IF NOT EXISTS `_seq_intervenant` (
  `next_val` bigint DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `_seq_intervenant`
--

INSERT INTO `_seq_intervenant` (`next_val`) VALUES
(101);

-- --------------------------------------------------------

--
-- Structure de la table `_seq_intervenant_module`
--

DROP TABLE IF EXISTS `_seq_intervenant_module`;
CREATE TABLE IF NOT EXISTS `_seq_intervenant_module` (
  `next_val` bigint DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `_seq_intervenant_module`
--

INSERT INTO `_seq_intervenant_module` (`next_val`) VALUES
(1);

-- --------------------------------------------------------

--
-- Structure de la table `_seq_login`
--

DROP TABLE IF EXISTS `_seq_login`;
CREATE TABLE IF NOT EXISTS `_seq_login` (
  `next_val` bigint DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `_seq_login`
--

INSERT INTO `_seq_login` (`next_val`) VALUES
(101);

-- --------------------------------------------------------

--
-- Structure de la table `_seq_memoire`
--

DROP TABLE IF EXISTS `_seq_memoire`;
CREATE TABLE IF NOT EXISTS `_seq_memoire` (
  `next_val` bigint DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `_seq_memoire`
--

INSERT INTO `_seq_memoire` (`next_val`) VALUES
(51);

-- --------------------------------------------------------

--
-- Structure de la table `_seq_module`
--

DROP TABLE IF EXISTS `_seq_module`;
CREATE TABLE IF NOT EXISTS `_seq_module` (
  `next_val` bigint DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `_seq_module`
--

INSERT INTO `_seq_module` (`next_val`) VALUES
(101);

-- --------------------------------------------------------

--
-- Structure de la table `_seq_module_specialite`
--

DROP TABLE IF EXISTS `_seq_module_specialite`;
CREATE TABLE IF NOT EXISTS `_seq_module_specialite` (
  `next_val` bigint DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `_seq_module_specialite`
--

INSERT INTO `_seq_module_specialite` (`next_val`) VALUES
(101);

-- --------------------------------------------------------

--
-- Structure de la table `_seq_nature_partenariat`
--

DROP TABLE IF EXISTS `_seq_nature_partenariat`;
CREATE TABLE IF NOT EXISTS `_seq_nature_partenariat` (
  `next_val` bigint DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `_seq_nature_partenariat`
--

INSERT INTO `_seq_nature_partenariat` (`next_val`) VALUES
(101);

-- --------------------------------------------------------

--
-- Structure de la table `_seq_niveau`
--

DROP TABLE IF EXISTS `_seq_niveau`;
CREATE TABLE IF NOT EXISTS `_seq_niveau` (
  `next_val` bigint DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `_seq_niveau`
--

INSERT INTO `_seq_niveau` (`next_val`) VALUES
(101);

-- --------------------------------------------------------

--
-- Structure de la table `_seq_notes`
--

DROP TABLE IF EXISTS `_seq_notes`;
CREATE TABLE IF NOT EXISTS `_seq_notes` (
  `next_val` bigint DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `_seq_notes`
--

INSERT INTO `_seq_notes` (`next_val`) VALUES
(101);

-- --------------------------------------------------------

--
-- Structure de la table `_seq_offres_pro`
--

DROP TABLE IF EXISTS `_seq_offres_pro`;
CREATE TABLE IF NOT EXISTS `_seq_offres_pro` (
  `next_val` bigint DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `_seq_offres_pro`
--

INSERT INTO `_seq_offres_pro` (`next_val`) VALUES
(101);

-- --------------------------------------------------------

--
-- Structure de la table `_seq_partenariats`
--

DROP TABLE IF EXISTS `_seq_partenariats`;
CREATE TABLE IF NOT EXISTS `_seq_partenariats` (
  `next_val` bigint DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `_seq_partenariats`
--

INSERT INTO `_seq_partenariats` (`next_val`) VALUES
(101);

-- --------------------------------------------------------

--
-- Structure de la table `_seq_personne`
--

DROP TABLE IF EXISTS `_seq_personne`;
CREATE TABLE IF NOT EXISTS `_seq_personne` (
  `next_val` bigint DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `_seq_personne`
--

INSERT INTO `_seq_personne` (`next_val`) VALUES
(101);

-- --------------------------------------------------------

--
-- Structure de la table `_seq_personne_intervenant`
--

DROP TABLE IF EXISTS `_seq_personne_intervenant`;
CREATE TABLE IF NOT EXISTS `_seq_personne_intervenant` (
  `next_val` bigint DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `_seq_personne_intervenant`
--

INSERT INTO `_seq_personne_intervenant` (`next_val`) VALUES
(101);

-- --------------------------------------------------------

--
-- Structure de la table `_seq_planification_cours`
--

DROP TABLE IF EXISTS `_seq_planification_cours`;
CREATE TABLE IF NOT EXISTS `_seq_planification_cours` (
  `next_val` bigint DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `_seq_planification_cours`
--

INSERT INTO `_seq_planification_cours` (`next_val`) VALUES
(101);

-- --------------------------------------------------------

--
-- Structure de la table `_seq_projet`
--

DROP TABLE IF EXISTS `_seq_projet`;
CREATE TABLE IF NOT EXISTS `_seq_projet` (
  `next_val` bigint DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `_seq_projet`
--

INSERT INTO `_seq_projet` (`next_val`) VALUES
(1);

-- --------------------------------------------------------

--
-- Structure de la table `_seq_sct`
--

DROP TABLE IF EXISTS `_seq_sct`;
CREATE TABLE IF NOT EXISTS `_seq_sct` (
  `next_val` bigint DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `_seq_sct`
--

INSERT INTO `_seq_sct` (`next_val`) VALUES
(101);

-- --------------------------------------------------------

--
-- Structure de la table `_seq_sct_etudiant`
--

DROP TABLE IF EXISTS `_seq_sct_etudiant`;
CREATE TABLE IF NOT EXISTS `_seq_sct_etudiant` (
  `next_val` bigint DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `_seq_sct_etudiant`
--

INSERT INTO `_seq_sct_etudiant` (`next_val`) VALUES
(101);

-- --------------------------------------------------------

--
-- Structure de la table `_seq_specialite`
--

DROP TABLE IF EXISTS `_seq_specialite`;
CREATE TABLE IF NOT EXISTS `_seq_specialite` (
  `next_val` bigint DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `_seq_specialite`
--

INSERT INTO `_seq_specialite` (`next_val`) VALUES
(101);

-- --------------------------------------------------------

--
-- Structure de la table `_seq_type_contrat`
--

DROP TABLE IF EXISTS `_seq_type_contrat`;
CREATE TABLE IF NOT EXISTS `_seq_type_contrat` (
  `next_val` bigint DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `_seq_type_contrat`
--

INSERT INTO `_seq_type_contrat` (`next_val`) VALUES
(101);

-- --------------------------------------------------------

--
-- Structure de la table `_seq_type_document`
--

DROP TABLE IF EXISTS `_seq_type_document`;
CREATE TABLE IF NOT EXISTS `_seq_type_document` (
  `next_val` bigint DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `_seq_type_document`
--

INSERT INTO `_seq_type_document` (`next_val`) VALUES
(1);

-- --------------------------------------------------------

--
-- Structure de la table `_seq_type_formation`
--

DROP TABLE IF EXISTS `_seq_type_formation`;
CREATE TABLE IF NOT EXISTS `_seq_type_formation` (
  `next_val` bigint DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `_seq_type_formation`
--

INSERT INTO `_seq_type_formation` (`next_val`) VALUES
(101);

-- --------------------------------------------------------

--
-- Structure de la table `_seq_type_planification`
--

DROP TABLE IF EXISTS `_seq_type_planification`;
CREATE TABLE IF NOT EXISTS `_seq_type_planification` (
  `next_val` bigint DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `_seq_type_planification`
--

INSERT INTO `_seq_type_planification` (`next_val`) VALUES
(101);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
