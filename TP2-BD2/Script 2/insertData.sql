/****
** Alteration du format de l'heure d'oracle pour permmettre l'insertion des donnees de date.
***/
ALTER SESSION SET NLS_DATE_FORMAT = 'DD.MM.YYYY';

/****
** les jeux de donnees
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

INSERT INTO MotsCles VALUES('epidemio',1);
INSERT INTO MotsCles VALUES('methodologies',2);
INSERT INTO MotsCles VALUES('Pataphysique',3);
INSERT INTO MotsCles VALUES('primaire',3);
INSERT INTO MotsCles VALUES('Equation diff',4);
INSERT INTO MotsCles VALUES('extreme',4);
INSERT INTO MotsCles VALUES('Didactique',5);
INSERT INTO MotsCles VALUES('pataphysique',5);
INSERT INTO MotsCles VALUES('Synthese chimique',6);
INSERT INTO MotsCles VALUES('Ontologie',7);
INSERT INTO MotsCles VALUES('terminologie',7);

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

