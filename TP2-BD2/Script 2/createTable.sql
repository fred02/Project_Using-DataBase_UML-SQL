/****
** Creation des tables
***/

CREATE TABLE Conference (
IDConf INTEGER NOT NULL,
titre VARCHAR(50) NOT NULL,
annee INTEGER NOT NULL,
lieu VARCHAR(50) NOT NULL,
debut DATE NOT NULL,
fin DATE NOT NULL,
premierAppel DATE NOT NULL,
soumission DATE NOT NULL,
annonces DATE NOT NULL,
PRIMARY KEY (IDConf)
);

CREATE TABLE Theme (
IDTheme INTEGER NOT NULL,
nom VARCHAR(100) NOT NULL,
IDConf INTEGER NOT NULL,
description VARCHAR(250) NOT NULL,
nbMaxPapiers INTEGER NOT NULL,
PRIMARY KEY (IDTheme),
FOREIGN KEY (IDConf) REFERENCES Conference
);

CREATE TABLE Participant (
noParticipant INTEGER NOT NULL,
nom VARCHAR(50) NOT NULL,
prenom VARCHAR(50) NOT NULL,
institution VARCHAR(100) NOT NULL,
courriel VARCHAR(100) NOT NULL,
PRIMARY KEY (noParticipant)
);
 
CREATE TABLE CompteUtilisateur (
login VARCHAR(50) NOT NULL,
motDePasse VARCHAR(50) NOT NULL,
categorieCompte VARCHAR(50) NOT NULL,
IDConf INTEGER,
noParticipant INTEGER NOT NULL,
PRIMARY KEY (noParticipant),
FOREIGN KEY (IDConf) REFERENCES Conference,
FOREIGN KEY (noParticipant) REFERENCES Participant,
CONSTRAINT DomaineCategorieCompte CHECK (categorieCompte IN ('President','Membre','Auteur'))
);

CREATE TABLE Soumission (
noSoumission INTEGER NOT NULL,
titre VARCHAR(100) NOT NULL,
decision VARCHAR(2),
idAuteurCorrespondant INTEGER NOT NULL,
IDConf INTEGER NOT NULL,
PRIMARY KEY (noSoumission),
FOREIGN KEY (IDConf) REFERENCES Conference,
FOREIGN KEY (idAuteurCorrespondant) REFERENCES Participant,
CONSTRAINT TypeDecision CHECK (decision IN ('AL', 'AC', 'R'))
);

CREATE TABLE MotsCles (
motsCles VARCHAR(50),
noSoumission INTEGER,
PRIMARY KEY (motsCles, noSoumission),
FOREIGN KEY (noSoumission) REFERENCES Soumission
);

CREATE TABLE Evaluation (
noteEvaluateur INTEGER,
remarques VARCHAR(500),
idUtilisateur INTEGER NOT NULL,
noSoumission INTEGER NOT NULL,
PRIMARY KEY (idUtilisateur, noSoumission),
FOREIGN KEY (noSoumission) REFERENCES Soumission,
FOREIGN KEY (idUtilisateur) REFERENCES CompteUtilisateur,
CONSTRAINT TypeNote CHECK (noteEvaluateur >= 1 AND noteEvaluateur <= 5)
);

CREATE TABLE SoumissionParticipant (
noSoumission INTEGER NOT NULL,
noParticipant INTEGER NOT NULL,
PRIMARY KEY (noSoumission, noParticipant),
FOREIGN KEY (noSoumission) REFERENCES Soumission,
FOREIGN KEY (noParticipant) REFERENCES Participant
);














/*
CREATE TABLE Article
(noArticle INTEGER NOT NULL,
description VARCHAR(20) NOT NULL,
prixUnitaire DECIMAL(10,2) NOT NULL,
quantiteEnStock INTEGER NOT NULL,
PRIMARY KEY (noArticle));

//CREATE CLUSTER CommandeLigneCommandeCluster (noCommande INTEGER) HASHKEYS 9375 SIZE 256;

CREATE TABLE Commande
(noCommande INTEGER NOT NULL,
dateCommande DATE NOT NULL,
noClient INTEGER NOT NULL,
PRIMARY KEY (noCommande),
FOREIGN KEY (noClient) REFERENCES Client
)
CLUSTER CommandeLigneCommandeCluster(noCommande);

CREATE INDEX CommandeDateIndex ON Commande(dateCommande);

CREATE TABLE LigneCommande
(noCommande INTEGER NOT NULL,
noArticle INTEGER NOT NULL,
quantite INTEGER NOT NULL,
PRIMARY KEY (noCommande, noArticle),
FOREIGN KEY (noCommande) REFERENCES Commande,
FOREIGN KEY (noArticle) REFERENCES Article
)
CLUSTER CommandeLigneCommandeCluster(noCommande);

CREATE CLUSTER LivraisonCluster (dateLivraison DATE) INDEX;

CREATE INDEX LivClusterIndex ON CLUSTER LivraisonCluster;


CREATE TABLE Livraison
(noLivraison INTEGER NOT NULL,
dateLivraison DATE NOT NULL,
PRIMARY KEY (noLivraison)
)
CLUSTER LivraisonCluster(dateLivraison);

CREATE TABLE DetailLivraison
(noLivraison INTEGER NOT NULL,
noCommande INTEGER NOT NULL,
noArticle INTEGER NOT NULL,
quantiteLivree INTEGER NOT NULL,
PRIMARY KEY (noLivraison, noCommande, noArticle),
FOREIGN KEY (noLivraison) REFERENCES Livraison,
FOREIGN KEY (noCommande, noArticle) REFERENCES LigneCommande
);*/

