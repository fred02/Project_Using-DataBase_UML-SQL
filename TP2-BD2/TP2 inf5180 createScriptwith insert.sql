
/****
** Suppresion des tables
***/
DROP TABLE Evaluation CASCADE CONSTRAINT;

DROP TABLE MotsCles CASCADE CONSTRAINT;

DROP TABLE Soumission CASCADE CONSTRAINT;

DROP TABLE CompteUtilisateur CASCADE CONSTRAINT;

DROP TABLE Participant CASCADE CONSTRAINT;

DROP TABLE Theme CASCADE CONSTRAINT;

DROP TABLE Conference CASCADE CONSTRAINT;

DROP TABLE SoumissionParticipant CASCADE CONSTRAINT;

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
FOREIGN KEY (idAuteurCorrespondant) REFERENCES CompteUtilisateur,
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
ALTER SESSION SET NLS_DATE_FORMAT = 'DD.MM.YYYY';

/****
** les jeux de données
***/

INSERT INTO PARTICIPANT VALUES(4021,'Capitaine','Milene','Pata Assocoates','CAPNE@nrc.ca');
INSERT INTO PARTICIPANT VALUES(4001,'Case','Illa','U de Gaspesie','CASLA@nrc.ca');
INSERT INTO PARTICIPANT VALUES(4002,'David','Lucie','Pata Associates','DAVIE@nrc.ca');
INSERT INTO PARTICIPANT VALUES(4003,'Degas','Edgar','U de Gaspesie','DEGAR@nrc.ca');
INSERT INTO PARTICIPANT VALUES(4020,'Delisle','Xavier','UQAM','DESER@nrc.ca');
INSERT INTO PARTICIPANT VALUES(4004,'Duguay','Roger','UQAM','DUGER@nrc.ca');
INSERT INTO PARTICIPANT VALUES(4005,'Emerson','Keith','U de Gaspesie','EMETH@nrc.ca');
INSERT INTO PARTICIPANT VALUES(4006,'Galois','Evariste','U de Gaspesie','GALTE@nrc.ca');
INSERT INTO PARTICIPANT VALUES(4007,'Goldberg','Adele','New Pata-Solutions inc.','GOLLE@nrc.ca');
INSERT INTO PARTICIPANT VALUES(4008,'Knuth','Donald','New Pata-Solutions inc','KNULD@nrc.ca');
INSERT INTO PARTICIPANT VALUES(4009,'Lavoie','Paul','INRP','LAVUL@nrc.ca');
INSERT INTO PARTICIPANT VALUES(4010,'Marshall','Pamela','INRP','MARLA@nrc.ca');
INSERT INTO PARTICIPANT VALUES(4011,'Monet','Anderson','INRP','MONON@nrc.ca');
INSERT INTO PARTICIPANT VALUES(4012,'Pascal','Blaise','U de Gaspesie','PASSE@nrc.ca');
INSERT INTO PARTICIPANT VALUES(4013,'Pasquin','Richar','Pata Associates','PASRD@nrc.ca');
INSERT INTO PARTICIPANT VALUES(4014,'Sauve','Andre','UdeM','SAURE@nrc.ca');
INSERT INTO PARTICIPANT VALUES(4015,'Stephanie','Gwen','U de Gaspesie','STEEN@nrc.ca');
INSERT INTO PARTICIPANT VALUES(4016,'Trepanier','Jaqcues','UdeM','TREES@nrc.ca');
INSERT INTO PARTICIPANT VALUES(4017,'Tremblay','Lina','UdeM','TRENA@nrc.ca');
INSERT INTO PARTICIPANT VALUES(4018,'Tremblay','Lucie','U de Gaspesie','TREIE@nrc.ca');
INSERT INTO PARTICIPANT VALUES(4019,'Tremblay','Yvon','UQAM','TREON@nrc.ca');
INSERT INTO PARTICIPANT VALUES(4022,'Wouawad','Hadji','Pata Associates','WOUDI@nrc.ca');

INSERT INTO CONFERENCE VALUES(1001,'Symposium de PataphysiqueAppliquee',2010,'Paris','15.08.2010','20.08.2010','01.05.2010','28.06.2010','20.07.2010');
INSERT INTO CONFERENCE VALUES(1002,'Didactique de la pataphysique',2010,'Montreal','15.08.2010','19.08.2010','01.05.2010','28.06.2010','20.07.2010');

INSERT INTO CompteUtilisateur VALUES('DEGAR','DEGAR','President',1001,4003);
INSERT INTO CompteUtilisateur VALUES('CASLA','CASLA','President',1002,4001);
INSERT INTO CompteUtilisateur VALUES('TREIE','TREIE','President',1002,4018);


INSERT INTO CompteUtilisateur VALUES('DUGER','DUGER','Membre',1001,4004);
INSERT INTO CompteUtilisateur VALUES('GOLLE','GOLLE','Membre',1001,4007);
INSERT INTO CompteUtilisateur VALUES('LAVUL','LAVUL','Membre',1001,4009);
INSERT INTO CompteUtilisateur VALUES('GALTE','GALTE','Membre',1002,4006);
INSERT INTO CompteUtilisateur VALUES('STEEN','STEEN','Membre',1002,4015);
INSERT INTO CompteUtilisateur VALUES('SAURE','SAURE','Membre',1002,4014);
INSERT INTO CompteUtilisateur VALUES('TREON','TREON','Membre',1001,4019);
INSERT INTO CompteUtilisateur VALUES('PASSE','PASSE','Membre',1001,4012);

INSERT INTO Theme VALUES(3001,'Applications biomedicales de la pataphysique',1001,'Biomedical',20);
INSERT INTO Theme VALUES(3003,'Applications biomedicales de la pataphysique',1002,'Biomedical',5);
INSERT INTO Theme VALUES(3002,'Didactique de la pataphysique',1001,'Didactique',10);
INSERT INTO Theme VALUES(3004,'Didactique de la pataphysique',1002,'Didactique',4);

INSERT INTO Soumission VALUES(1,'Revue Ccritique des theories pataphydiques en epidemiologie',NULL,4001,1001);
INSERT INTO Soumission VALUES(2,'Vers une methodologies de la pataphysique experimentale',NULL,4020,1001);
INSERT INTO Soumission VALUES(3,'Enseignement de la pataphysique primaire','AL',4021,1002);
INSERT INTO Soumission VALUES(4,'Solutions extremes d’equations differentielles pataphysiques',NULL,4021,1001);
INSERT INTO Soumission VALUES(5,'Vers une nouvelle didactique de la pataphysique',NULL,4022,1002);
INSERT INTO Soumission VALUES(6,'Synthese sub-protonique en pataphysiques','R',4005,1001);
INSERT INTO Soumission VALUES(7,'Une ontologie des termes pataphysiques',NULL,4013,1002);

INSERT INTO SoumissionParticipant VALUES(1,4011);
INSERT INTO SoumissionParticipant VALUES(1,4006);
INSERT INTO SoumissionParticipant VALUES(1,4008);
INSERT INTO SoumissionParticipant VALUES(3,4016);
INSERT INTO SoumissionParticipant VALUES(3,4010);
INSERT INTO SoumissionParticipant VALUES(3,4012);
INSERT INTO SoumissionParticipant VALUES(4,4001);
INSERT INTO SoumissionParticipant VALUES(4,4002);
INSERT INTO SoumissionParticipant VALUES(4,4017);
INSERT INTO SoumissionParticipant VALUES(5,4003);
INSERT INTO SoumissionParticipant VALUES(5,4004);
INSERT INTO SoumissionParticipant VALUES(5,4005);
INSERT INTO SoumissionParticipant VALUES(6,4006);
INSERT INTO SoumissionParticipant VALUES(6,4007);
INSERT INTO SoumissionParticipant VALUES(7,4008);

INSERT INTO Evaluation VALUES(2, '', 4004, 1);
INSERT INTO Evaluation VALUES(3, '', 4007, 1);
INSERT INTO Evaluation VALUES(4, '', 4009, 1);
INSERT INTO Evaluation VALUES(1, '', 4004, 2);
INSERT INTO Evaluation VALUES(1, '', 4007, 2);
INSERT INTO Evaluation VALUES(3, '', 4009, 2);
INSERT INTO Evaluation VALUES(3, '', 4006, 3);
INSERT INTO Evaluation VALUES(3, '', 4015, 3);
INSERT INTO Evaluation VALUES(3, '', 4014, 3);
INSERT INTO Evaluation VALUES(5, '', 4004, 4);
INSERT INTO Evaluation VALUES(4, '', 4007, 4);
INSERT INTO Evaluation VALUES(5, '', 4009, 4);
INSERT INTO Evaluation VALUES(1, '', 4006, 5);
INSERT INTO Evaluation VALUES(5, '', 4015, 5);
INSERT INTO Evaluation VALUES(NULL, '', 4014, 5);
INSERT INTO Evaluation VALUES(5, '', 4004, 6);
INSERT INTO Evaluation VALUES(1, '', 4019, 6);
INSERT INTO Evaluation VALUES(1, '', 4012, 6);
INSERT INTO Evaluation VALUES(NULL, '', 4006, 7);
INSERT INTO Evaluation VALUES(NULL, '', 4015, 7);
INSERT INTO Evaluation VALUES(NULL, '', 4014, 7);













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

