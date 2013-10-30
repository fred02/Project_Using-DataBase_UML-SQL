/*
*Dans un premier temps on affiche la liste des theme associer au President dont l'id est definie
*par idPresident.
*/
SELECT IDTheme, Theme.nom
FROM Theme, CompteUtilisateur, Conference
WHERE idUtilisateur = 4018 AND
	  CompteUtilisateur.IDConf = Conference.IDConf AND
	  Conference.IDConf = Theme.IDConf;
	  
/*
*Ensuit on execute la requete de selection des papiers.
*/
SELECT Soumission.noSoumission, titre, p1.nom, p1.prenom, COUNT(p2.nom) AS "nb Auteur"
FROM Soumission, Theme, Participant p1, Participant p2, SoumissionParticipant
WHERE Theme.IDTheme = 3003 AND
	  Soumission.IDTheme = Theme.IDTheme AND
	  Soumission.idAuteurCorrespondant = p1.noParticipant AND
	  Soumission.noSoumission = SoumissionParticipant.noSoumission AND
	  SoumissionParticipant.noParticipant = p2.noParticipant
	  Group By Soumission.noSoumission, titre, p1.nom, p1.prenom; | 
	  

NOSOUMISSION TITRE NOM PRENOM  nb Auteur
---- ---------------------------------------------------- ----------- ------------------------------- -------------------------------------------------------------------------------- ----------
   3 Enseignement de la pataphysique primaire				Capitaine




Milene
         3


NOSOUMISSION
------------
TITRE
--------------------------------------------------------------------------------
NOM
--------------------------------------------------------------------------------
PRENOM
--------------------------------------------------------------------------------
 nb Auteur
----------
           5
Vers une nouvelle didactique de la pataphysique
Wouawad

NOSOUMISSION
------------
TITRE
--------------------------------------------------------------------------------
NOM
--------------------------------------------------------------------------------
PRENOM
--------------------------------------------------------------------------------
 nb Auteur
----------
Hadji
         3
