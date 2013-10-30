
/****
** Suppresion des tables
***/
DROP TABLE Evaluation
/
DROP TABLE MotsCles
/
DROP TABLE VersionFinal
/
DROP TABLE Soumission
/
DROP TABLE CompteUtilisateur
/
DROP TABLE Participant
/
DROP TABLE Theme
/
DROP TABLE Conference
/

/****
** Creation des tables
***/


CREATE TABLE Conference (
titre VARCHAR(25) NOT NULL,
annee INTEGER NOT NULL,
lieu VARCHAR(50) NOT NULL,
debut DATE NOT NULL,
fin DATE NOT NULL,
premierAppel DATE NOT NULL,
soumission DATE NOT NULL,
annonces DATE NOT NULL,
PRIMARY KEY (titre, annee)
);

CREATE TABLE Theme (
nom VARCHAR(25) NOT NULL,
nomConference VARCHAR(25) NOT NULL,
annee INTEGER NOT NULL,
description VARCHAR(250) NOT NULL,
nbMaxPapiers INTEGER NOT NULL,
titreConference VARCHAR(25) NOT NULL,
PRIMARY KEY (nom, nomConference),
FOREIGN KEY (nomConference, annee) REFERENCES Conference
);

CREATE TABLE Participant (
noParticipant INTEGER NOT NULL,
nom VARCHAR(25) NOT NULL,
prenom VARCHAR(25) NOT NULL,
institution VARCHAR(25) NOT NULL,
courriel VARCHAR(50) NOT NULL,
PRIMARY KEY (noParticipant)
);

CREATE TABLE CompteUtilisateur (
login VARCHAR(25) NOT NULL,
motDePasse VARCHAR(25) NOT NULL,
categorieCompte VARCHAR(25) NOT NULL,
titreConference VARCHAR(25),
anneeConference INTEGER,
noParticipant INTEGER,
PRIMARY KEY (login),
FOREIGN KEY (titreConference, anneeConference) REFERENCES Conference,
FOREIGN KEY (noParticipant) REFERENCES Participant,
CONSTRAINT DomaineCategorieCompte CHECK (categorieCompte IN ('President','Membre','Auteur'))
);

CREATE TABLE Soumission (
noSoumission INTEGER NOT NULL,
titre VARCHAR(25) NOT NULL,
resume VARCHAR(500) NOT NULL,
ficheAttache VARCHAR(500) NOT NULL,
decision VARCHAR(2) NOT NULL,
titreConference VARCHAR(25) NOT NULL,
idAuteurCorrespondant VARCHAR(25) NOT NULL,
anneeConference INTEGER NOT NULL,
PRIMARY KEY (noSoumission),
FOREIGN KEY (titreConference, anneeConference) REFERENCES Conference,
FOREIGN KEY (idAuteurCorrespondant) REFERENCES CompteUtilisateur,
CONSTRAINT TypeDecision CHECK (decision IN ('AL', 'AC', 'R'))
);

CREATE TABLE VersionFinal (
noSoumission INTEGER NOT NULL,
titre VARCHAR(25) NOT NULL,
resume VARCHAR(500) NOT NULL,
ficheAttache VARCHAR(500) NOT NULL,
decision VARCHAR(2) NOT NULL,
titreConference VARCHAR(25) NOT NULL,
idAuteurCorrespondant VARCHAR(25) NOT NULL,
anneeConference INTEGER NOT NULL,
PRIMARY KEY (noSoumission),
FOREIGN KEY (noSoumission) REFERENCES Soumission,
CONSTRAINT TypeDecisionFinal CHECK (decision IN ('AL', 'AC', 'R'))
);

CREATE TABLE MotsCles (
motsCles VARCHAR(25),
noSoumission INTEGER,
PRIMARY KEY (motsCles, noSoumission),
FOREIGN KEY (noSoumission) REFERENCES Soumission,
FOREIGN KEY (noSoumission) REFERENCES VersionFinal
);


CREATE TABLE Evaluation (
noteEvaluateur INTEGER NOT NULL,
remarques VARCHAR(500) NOT NULL,
idUtilisateur VARCHAR(25) NOT NULL,
noSoumission INTEGER NOT NULL,
PRIMARY KEY (idUtilisateur, noSoumission),
FOREIGN KEY (noSoumission) REFERENCES Soumission,
FOREIGN KEY (idUtilisateur) REFERENCES CompteUtilisateur,
CONSTRAINT TypeNote CHECK (noteEvaluateur >= 1 AND noteEvaluateur <= 5)
);




/****
** les jeux de données
***/

INSERT INTO PARTICIPANT VALUES(4021,'Capitaine','Milene','Pata Assocoates','CAPNE@nrc.ca')
INSERT INTO PARTICIPANT VALUES(4001,'Case','Illa','U de Gaspesie','CASLA@nrc.ca')
INSERT INTO PARTICIPANT VALUES(4002,'David','Lucie','Pata Associates','DAVIE@nrc.ca')
INSERT INTO PARTICIPANT VALUES(4003,'Degas','Edgar','U de Gaspesie','DEGAR@nrc.ca')
INSERT INTO PARTICIPANT VALUES(4020,'Delisle','Xavier','UQAM','DESER@nrc.ca')
INSERT INTO PARTICIPANT VALUES(4004,'Duguay','Roger','UQAM','DUGER@nrc.ca')
INSERT INTO PARTICIPANT VALUES(4005,'Emerson','Keith','U de Gaspesie','EMETH@nrc.ca')
INSERT INTO PARTICIPANT VALUES(4006,'Galois','Evariste','U de Gaspesie','GALTE@nrc.ca')
INSERT INTO PARTICIPANT VALUES(4007,'Goldberg','Adele','New Pata-Solutions inc.','GOLLE@nrc.ca')
INSERT INTO PARTICIPANT VALUES(4008,'Knuth','Donald','New Pata-Solutions inc','KNULD@nrc.ca')
INSERT INTO PARTICIPANT VALUES(4009,'Lavoie','Paul','INRP','LAVUL@nrc.ca')
INSERT INTO PARTICIPANT VALUES(4010,'Marshall','Pamela','INRP','MARLA@nrc.ca')
INSERT INTO PARTICIPANT VALUES(4011,'Monet','Anderson','INRP','MONON@nrc.ca')
INSERT INTO PARTICIPANT VALUES(4012,'Pascal','Blaise','U de Gaspesie','PASSE@nrc.ca')
INSERT INTO PARTICIPANT VALUES(4013,'Pasquin','Richar','Pata Associates','PASRD@nrc.ca')
INSERT INTO PARTICIPANT VALUES(4014,'Sauve','','Andre','UdeM','SAURE@nrc.ca')
INSERT INTO PARTICIPANT VALUES(4015,'Stephanie','Gwen','U de Gaspesie','STEEN@nrc.ca')
INSERT INTO PARTICIPANT VALUES(4016,'Trepanier','Jaqcues','UdeM','TREES@nrc.ca')
INSERT INTO PARTICIPANT VALUES(4017,'Tremblay','Lina','UdeM','TRENA@nrc.ca')
INSERT INTO PARTICIPANT VALUES(4018,'Tremblay','Lucie','U de Gaspesie','TREIE@nrc.ca')
INSERT INTO PARTICIPANT VALUES(4019,'Tremblay','Yvon','UQAM','TREON@nrc.ca')
INSERT INTO PARTICIPANT VALUES(4022,'Wouawad','Hadji','Pata Associates','WOUDI@nrc.ca')





INSERT INTO CONFERENCE VALUES(1001,'Symposium de PataphysiqueAppliquee',2010,'Paris','15.08.2010','20.08.2010','1.05.2010','28.06.2010','20.07.2010')
INSERT INTO CONFERENCE VALUES(1002,'Didactique de la pataphysique',2010,'Montreal','15.08.2010','19.08.2010','1.05.2010','28.06.2010','20.07.2010')























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

