--
-- Base de données :  Equida
--

-- --------------------------------------------------------

--
-- Structure de la table AVOIR
--

CREATE TABLE AVOIR (
  ID int(11) NOT NULL,
  ID_ROLE int(11) NOT NULL,
  ID_PERMISSION int(11) NOT NULL,
  DELETED tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table CATEG_VENTE
--

CREATE TABLE CATEG_VENTE (
  ID int(11) NOT NULL,
  LIBELLE varchar(30) NOT NULL,
  DELETED tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table CHEVAL
--

CREATE TABLE CHEVAL (
  ID int(11) NOT NULL,
  NOM varchar(50) DEFAULT NULL,
  SEXE varchar(1) NOT NULL,
  SIRE varchar(100) NOT NULL,
  ID_RACE_CHEVAL int(11) NOT NULL,
  ID_MERE int(11) DEFAULT NULL,
  ID_PERE int(11) DEFAULT NULL,
  ID_CLIENT int(11) NOT NULL,
  DELETED tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table CLIENT
--

CREATE TABLE CLIENT (
  ID_UTILISATEUR int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table CLIENT_CATEG_VENTE
--

CREATE TABLE CLIENT_CATEG_VENTE (
  ID int(11) NOT NULL,
  ID_CLIENT int(11) NOT NULL,
  ID_CATEG_VENTE int(11) NOT NULL,
  DELETED tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table COMPTE
--

CREATE TABLE COMPTE (
  ID int(11) NOT NULL,
  LOGIN varchar(32) NOT NULL,
  MDP char(64) NOT NULL,
  ID_ROLE int(11) DEFAULT NULL,
  DELETED tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table COURRIEL
--

CREATE TABLE COURRIEL (
  ID int(11) NOT NULL,
  DATE_ENVOI datetime NOT NULL,
  OBJET varchar(50) NOT NULL,
  CORPS text NOT NULL,
  ID_VENTE int(11) DEFAULT NULL,
  DELETED tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table COURSE
--

CREATE TABLE COURSE (
  ID int(11) NOT NULL,
  NOM varchar(32) DEFAULT NULL,
  DATE_COURSE date DEFAULT NULL,
  VILLE varchar(32) DEFAULT NULL,
  DELETED tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table DIRECTEUR_GENERAL
--

CREATE TABLE DIRECTEUR_GENERAL (
  ID_UTILISATEUR int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table ENCHERE
--

CREATE TABLE ENCHERE (
  ID int(4) NOT NULL,
  MONTANT decimal(8,2) NOT NULL,
  ID_LOT int(11) NOT NULL,
  ID_CLIENT int(11) NOT NULL,
  DELETED tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table JOINT
--

CREATE TABLE JOINT (
  ID int(11) NOT NULL,
  ID_COURRIEL int(11) NOT NULL,
  ID_PIECE_JOINTE int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table LIEU
--

CREATE TABLE LIEU (
  ID int(11) NOT NULL,
  VILLE varchar(50) NOT NULL,
  NB_BOXES int(11) NOT NULL,
  COMMENTAIRE varchar(255) NOT NULL,
  DELETED tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table LOT
--

CREATE TABLE LOT (
  ID int(11) NOT NULL,
  ID_CHEVAL int(11) NOT NULL,
  ID_VENTE int(11) NOT NULL,
  PRIX_DEPART decimal(8,2) NOT NULL,
  VALIDATION datetime DEFAULT NULL,
  DELETED tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table PARTICIPER
--

CREATE TABLE PARTICIPER (
  ID int(11) NOT NULL,
  ID_CHEVAL int(11) NOT NULL,
  ID_COURSE int(11) NOT NULL,
  CLASSEMENT int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table PAYS
--

CREATE TABLE PAYS (
  ID int(11) NOT NULL,
  LIBELLE varchar(30) NOT NULL,
  DELETED tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table PERMISSION
--

CREATE TABLE PERMISSION (
  ID int(11) NOT NULL,
  LIBELLE varchar(32) DEFAULT NULL,
  DELETED tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table PIECE_JOINTE
--

CREATE TABLE PIECE_JOINTE (
  ID int(11) NOT NULL,
  CHEMIN varchar(255) NOT NULL,
  DESCRIPTION varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table RACE_CHEVAL
--

CREATE TABLE RACE_CHEVAL (
  ID int(11) NOT NULL,
  LIBELLE varchar(50) NOT NULL,
  DESCRIPTION varchar(255) DEFAULT NULL,
  DELETED tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table ROLE
--

CREATE TABLE ROLE (
  ID int(11) NOT NULL,
  LIBELLE varchar(32) NOT NULL,
  DELETED tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table UTILISATEUR
--

CREATE TABLE UTILISATEUR (
  ID int(11) NOT NULL,
  NOM varchar(40) NOT NULL,
  PRENOM varchar(40) NOT NULL,
  RUE varchar(60) NOT NULL,
  COPOS varchar(5) NOT NULL,
  VILLE varchar(40) NOT NULL,
  MAIL varchar(60) DEFAULT NULL,
  ID_PAYS int(11) DEFAULT NULL,
  ID_COMPTE int(11) DEFAULT NULL,
  DELETED tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table VENTE
--

CREATE TABLE VENTE (
  ID int(11) NOT NULL,
  NOM varchar(40) NOT NULL,
  DATE_DEBUT datetime NOT NULL,
  ID_CATEG_VENTE int(11) NOT NULL,
  ID_LIEU int(11) DEFAULT NULL,
  DATE_FIN datetime DEFAULT NULL,
  DATE_VENTE datetime DEFAULT NULL,
  DELETED tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table AVOIR
--
ALTER TABLE AVOIR
  ADD PRIMARY KEY (ID),
  ADD KEY FK_AVOIR_ROLE (ID_ROLE),
  ADD KEY FK_AVOIR_PERMISSION (ID_PERMISSION);

--
-- Index pour la table CATEG_VENTE
--
ALTER TABLE CATEG_VENTE
  ADD PRIMARY KEY (ID);

--
-- Index pour la table CHEVAL
--
ALTER TABLE CHEVAL
  ADD PRIMARY KEY (ID),
  ADD KEY FK_CHEVAL_RACECHEVAL (ID_RACE_CHEVAL),
  ADD KEY FK_CHEVAL_MERE (ID_MERE),
  ADD KEY FK_CHEVAL_PERE (ID_PERE),
  ADD KEY FK_CHEVAL_CLIENT (ID_CLIENT);

--
-- Index pour la table CLIENT
--
ALTER TABLE CLIENT
  ADD PRIMARY KEY (ID_UTILISATEUR);

--
-- Index pour la table CLIENT_CATEG_VENTE
--
ALTER TABLE CLIENT_CATEG_VENTE
  ADD PRIMARY KEY (ID),
  ADD KEY FK_CLIENTCATEGVENTE_CATEGVENTE (ID_CATEG_VENTE),
  ADD KEY FK_CLIENTCATEGVENTE_UTILISATEUR (ID_CLIENT);

--
-- Index pour la table COMPTE
--
ALTER TABLE COMPTE
  ADD PRIMARY KEY (ID),
  ADD KEY FK_COMPTE_ROLE (ID_ROLE);

--
-- Index pour la table COURRIEL
--
ALTER TABLE COURRIEL
  ADD PRIMARY KEY (ID),
  ADD KEY FK_COURRIEL_VENTE (ID_VENTE);

--
-- Index pour la table COURSE
--
ALTER TABLE COURSE
  ADD PRIMARY KEY (ID);

--
-- Index pour la table DIRECTEUR_GENERAL
--
ALTER TABLE DIRECTEUR_GENERAL
  ADD PRIMARY KEY (ID_UTILISATEUR);

--
-- Index pour la table ENCHERE
--
ALTER TABLE ENCHERE
  ADD KEY FK_ENCHERE_LOT (ID_LOT),
  ADD KEY FK_ENCHERE_CLIENT (ID_CLIENT);

--
-- Index pour la table JOINT
--
ALTER TABLE JOINT
  ADD PRIMARY KEY (ID),
  ADD KEY FK_JOINT_COURRIEL (ID_COURRIEL),
  ADD KEY FK_JOINT_PIECEJOINTE (ID_PIECE_JOINTE);

--
-- Index pour la table LIEU
--
ALTER TABLE LIEU
  ADD PRIMARY KEY (ID);

--
-- Index pour la table LOT
--
ALTER TABLE LOT
  ADD PRIMARY KEY (ID),
  ADD KEY FK_LOT_CHEVAL (ID_CHEVAL),
  ADD KEY FK_LOT_VENTE (ID_VENTE);

--
-- Index pour la table PARTICIPER
--
ALTER TABLE PARTICIPER
  ADD PRIMARY KEY (ID),
  ADD KEY FK_PARTICIPER_CHEVAL (ID_CHEVAL),
  ADD KEY FK_PARTICIPER_COURSE (ID_COURSE);

--
-- Index pour la table PAYS
--
ALTER TABLE PAYS
  ADD PRIMARY KEY (ID);

--
-- Index pour la table PERMISSION
--
ALTER TABLE PERMISSION
  ADD PRIMARY KEY (ID);

--
-- Index pour la table PIECE_JOINTE
--
ALTER TABLE PIECE_JOINTE
  ADD PRIMARY KEY (ID);

--
-- Index pour la table RACE_CHEVAL
--
ALTER TABLE RACE_CHEVAL
  ADD PRIMARY KEY (ID);

--
-- Index pour la table ROLE
--
ALTER TABLE ROLE
  ADD PRIMARY KEY (ID);

--
-- Index pour la table UTILISATEUR
--
ALTER TABLE UTILISATEUR
  ADD PRIMARY KEY (ID),
  ADD KEY FK_UTILISATEUR_PAYS (ID_PAYS),
  ADD KEY FK_UTILISATEUR_COMPTE (ID_COMPTE);

--
-- Index pour la table VENTE
--
ALTER TABLE VENTE
  ADD PRIMARY KEY (ID),
  ADD KEY FK_VENTE_LIEU (ID_LIEU),
  ADD KEY FK_VENTE_CATEGVENTE (ID_CATEG_VENTE);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table AVOIR
--
ALTER TABLE AVOIR
  MODIFY ID int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table CATEG_VENTE
--
ALTER TABLE CATEG_VENTE
  MODIFY ID int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table CHEVAL
--
ALTER TABLE CHEVAL
  MODIFY ID int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table CLIENT_CATEG_VENTE
--
ALTER TABLE CLIENT_CATEG_VENTE
  MODIFY ID int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table COMPTE
--
ALTER TABLE COMPTE
  MODIFY ID int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table COURRIEL
--
ALTER TABLE COURRIEL
  MODIFY ID int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table JOINT
--
ALTER TABLE JOINT
  MODIFY ID int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table LIEU
--
ALTER TABLE LIEU
  MODIFY ID int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table LOT
--
ALTER TABLE LOT
  MODIFY ID int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table PARTICIPER
--
ALTER TABLE PARTICIPER
  MODIFY ID int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table PAYS
--
ALTER TABLE PAYS
  MODIFY ID int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table PERMISSION
--
ALTER TABLE PERMISSION
  MODIFY ID int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table PIECE_JOINTE
--
ALTER TABLE PIECE_JOINTE
  MODIFY ID int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table RACE_CHEVAL
--
ALTER TABLE RACE_CHEVAL
  MODIFY ID int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table ROLE
--
ALTER TABLE ROLE
  MODIFY ID int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table UTILISATEUR
--
ALTER TABLE UTILISATEUR
  MODIFY ID int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table VENTE
--
ALTER TABLE VENTE
  MODIFY ID int(11) NOT NULL AUTO_INCREMENT;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table AVOIR
--
ALTER TABLE AVOIR
  ADD CONSTRAINT FK_AVOIR_PERMISSION FOREIGN KEY (ID_PERMISSION) REFERENCES PERMISSION (ID),
  ADD CONSTRAINT FK_AVOIR_ROLE FOREIGN KEY (ID_ROLE) REFERENCES ROLE (ID);

--
-- Contraintes pour la table CHEVAL
--
ALTER TABLE CHEVAL
  ADD CONSTRAINT FK_CHEVAL_CLIENT FOREIGN KEY (ID_CLIENT) REFERENCES CLIENT (ID_UTILISATEUR),
  ADD CONSTRAINT FK_CHEVAL_MERE FOREIGN KEY (ID_MERE) REFERENCES CHEVAL (ID),
  ADD CONSTRAINT FK_CHEVAL_PERE FOREIGN KEY (ID_PERE) REFERENCES CHEVAL (ID),
  ADD CONSTRAINT FK_CHEVAL_RACECHEVAL FOREIGN KEY (ID_RACE_CHEVAL) REFERENCES RACE_CHEVAL (ID);

--
-- Contraintes pour la table CLIENT
--
ALTER TABLE CLIENT
  ADD CONSTRAINT FK_CLIENT_UTILISATEUR FOREIGN KEY (ID_UTILISATEUR) REFERENCES UTILISATEUR (ID);

--
-- Contraintes pour la table CLIENT_CATEG_VENTE
--
ALTER TABLE CLIENT_CATEG_VENTE
  ADD CONSTRAINT FK_CLIENTCATEGVENTE_CATEGVENTE FOREIGN KEY (ID_CATEG_VENTE) REFERENCES CATEG_VENTE (ID),
  ADD CONSTRAINT FK_CLIENTCATEGVENTE_UTILISATEUR FOREIGN KEY (ID_CLIENT) REFERENCES CLIENT (ID_UTILISATEUR);

--
-- Contraintes pour la table COMPTE
--
ALTER TABLE COMPTE
  ADD CONSTRAINT FK_COMPTE_ROLE FOREIGN KEY (ID_ROLE) REFERENCES ROLE (ID);

--
-- Contraintes pour la table COURRIEL
--
ALTER TABLE COURRIEL
  ADD CONSTRAINT FK_COURRIEL_VENTE FOREIGN KEY (ID_VENTE) REFERENCES VENTE (ID);

--
-- Contraintes pour la table DIRECTEUR_GENERAL
--
ALTER TABLE DIRECTEUR_GENERAL
  ADD CONSTRAINT FK_DIRECTEUR_GENERAL FOREIGN KEY (ID_UTILISATEUR) REFERENCES UTILISATEUR (ID);

--
-- Contraintes pour la table ENCHERE
--
ALTER TABLE ENCHERE
  ADD CONSTRAINT FK_ENCHERE_CLIENT FOREIGN KEY (ID_CLIENT) REFERENCES CLIENT (ID_UTILISATEUR),
  ADD CONSTRAINT FK_ENCHERE_LOT FOREIGN KEY (ID_LOT) REFERENCES LOT (ID);

--
-- Contraintes pour la table JOINT
--
ALTER TABLE JOINT
  ADD CONSTRAINT FK_JOINT_COURRIEL FOREIGN KEY (ID_COURRIEL) REFERENCES COURRIEL (ID),
  ADD CONSTRAINT FK_JOINT_PIECEJOINTE FOREIGN KEY (ID_PIECE_JOINTE) REFERENCES PIECE_JOINTE (ID);

--
-- Contraintes pour la table LOT
--
ALTER TABLE LOT
  ADD CONSTRAINT FK_LOT_CHEVAL FOREIGN KEY (ID_CHEVAL) REFERENCES VENTE (ID),
  ADD CONSTRAINT FK_LOT_VENTE FOREIGN KEY (ID_VENTE) REFERENCES VENTE (ID);

--
-- Contraintes pour la table PARTICIPER
--
ALTER TABLE PARTICIPER
  ADD CONSTRAINT FK_PARTICIPER_CHEVAL FOREIGN KEY (ID_CHEVAL) REFERENCES CHEVAL (ID),
  ADD CONSTRAINT FK_PARTICIPER_COURSE FOREIGN KEY (ID_COURSE) REFERENCES COURSE (ID);

--
-- Contraintes pour la table UTILISATEUR
--
ALTER TABLE UTILISATEUR
  ADD CONSTRAINT FK_UTILISATEUR_COMPTE FOREIGN KEY (ID_COMPTE) REFERENCES COMPTE (ID),
  ADD CONSTRAINT FK_UTILISATEUR_PAYS FOREIGN KEY (ID_PAYS) REFERENCES PAYS (ID);

--
-- Contraintes pour la table VENTE
--
ALTER TABLE VENTE
  ADD CONSTRAINT FK_VENTE_CATEGVENTE FOREIGN KEY (ID_CATEG_VENTE) REFERENCES CATEG_VENTE (ID),
  ADD CONSTRAINT FK_VENTE_LIEU FOREIGN KEY (ID_LIEU) REFERENCES LIEU (ID);
