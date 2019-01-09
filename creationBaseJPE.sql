-- novembre 2008
-- Version du serveur: 5.0.18

use JPE;
-- --------------------------------------------------------

DROP TABLE IF EXISTS `visite`;
DROP TABLE IF EXISTS `entreprise`;
DROP TABLE IF EXISTS `visiteur`;
DROP TABLE IF EXISTS `activite`;
-- 
-- Structure de la table `activite`
-- 

CREATE TABLE activite
(
  id int(11) NOT NULL auto_increment,
  libelle  varchar(50) NOT NULL,
  PRIMARY KEY  (id)
) 
ENGINE = INNODB AUTO_INCREMENT=1 ;


-- --------------------------------------------------------

-- 
-- Structure de la table `entreprise`
-- 

CREATE TABLE entreprise 
(
  id int(11) NOT NULL auto_increment,
  raisonSociale varchar(50) NOT NULL default '',
  adresse varchar(50) NOT NULL default '',
  ville varchar(30) NOT NULL default '',
  cp varchar(5) NOT NULL,
  nomResponsable varchar(30) NOT NULL default '',
  nomContact varchar(30) NOT NULL default '',
  telContact varchar(14) NOT NULL,
  site varchar(50) default NULL,
  effectif int(11) default NULL,
  idActivite int(11) NOT NULL,
  PRIMARY KEY  (id),
  constraint fk_entreprise foreign key(idActivite) references activite(id) 
) 
ENGINE=INNODB AUTO_INCREMENT=1 ;


-- --------------------------------------------------------

-- 
-- Structure de la table `visite`
-- 

CREATE TABLE visite 
(
   id int(11) NOT NULL auto_increment,
   dateV date NOT NULL,
   heureDebut varchar(12) NOT NULL default '',
   duree varchar(12) NOT NULL default '',
   description varchar(500) NOT NULL,
   nbPlacesMax int(11) NOT NULL default '0',
   nbPlacesMin int(11) NOT NULL default '0',
   etat varchar(12) NOT NULL default 'ouverte',
   nbVisiteursInscrits int(11) NOT NULL default '0',
   idEntreprise int(11) NOT NULL default '0',
  PRIMARY KEY  (id),
  constraint fk_visite foreign key(idEntreprise) references entreprise(id) 
) 
ENGINE=INNODB AUTO_INCREMENT=1 ;


-- --------------------------------------------------------

-- 
-- Structure de la table `visiteur`
-- 

CREATE TABLE visiteur 
(
   id int(11) NOT NULL auto_increment,
   nom varchar(50) NOT NULL default '',
   prenom varchar(50) NOT NULL default '',	
   tel varchar(12) default NULL,
   cp varchar(5) NOT NULL,
   nbPersonnes int(11) NOT NULL,
   idVisite int(11) ,
  PRIMARY KEY  (id),
  constraint fk_visiteur foreign key(idVisite) references visite(id)
) 
ENGINE=INNODB AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

-- 
-- Insertions des lignes
-- 

INSERT INTO activite VALUES (NULL, 'Assurance');
INSERT INTO activite VALUES (NULL, 'Commerce');
INSERT INTO activite VALUES (NULL, 'Travaux public');
INSERT INTO activite VALUES (NULL, 'Industrie');




INSERT INTO entreprise VALUES (NULL,'BatiRefect', 'Route de Paris', 'Bergerac', '24100', 'Monsieur Pontel', 'Jean Durand', '0512131415','',250, 3);
INSERT INTO entreprise VALUES (NULL,'Brossette', 'Bd de l''Atlantique', 'Bergerac', '241007', 'Monsieur Ramy', 'Jules renard', '0510101012','',  50,1);
INSERT INTO entreprise VALUES (NULL,'Aluminium de Dordogne', 'ZI de Périgueux', 'Périgueux', '24000', 'Madame Parmielle', 'France Binard', '0513420712','', 50,4);
INSERT INTO entreprise VALUES (NULL,'MAGIF', '45 Bd de l''Ouest', 'Bergerac', '241007', 'Madame Chymene', 'Yves Polard', '0514457893','',  150,1);
INSERT INTO entreprise VALUES (NULL,'Carrefour', 'ZI de Périgueux', 'Périgueux', '24000', 'Monsieur Piedblanc', 'Anne Zrari', '0524579812','', 350,2);
INSERT INTO entreprise VALUES (NULL,'Le Nouveau Comptoir', 'Avenue Auguste Blanqui', 'Périgueux', '24000', 'Monsieur Barron', 'Annie Demarque', '0532899899','', 50,2);
INSERT INTO entreprise VALUES (NULL,'InfoDev', '12 Avenue Aristide Briand', 'Périgueux', '24000', 'Monsieur hardy', 'Jean lassalle', '0578945653','', 25,4);


INSERT INTO visite VALUES (NULL, '2008/10/20', '10h', '1h30','Visite de l''entrepot', 15, 10,  'ouverte', 0, 1);
INSERT INTO visite VALUES (NULL, '2008/10/18', '8H', '1h', 'Visite du magasin',20, 10,  'ouverte', 0, 2);
INSERT INTO visite VALUES (NULL, '2008/10/18', '15h', '1h30','Visite des bureaux', 25, 10,  'ouverte', 0, 3);
INSERT INTO visite VALUES (NULL, '2008/10/18', '10H', '1h','Visite du SI', 20, 10,  'ouverte', 0, 2);
INSERT INTO visite VALUES (NULL, '2008/10/20', '10h', '1h30','Visite de l''entrepot', 35, 10,  'ouverte', 0, 5);
INSERT INTO visite VALUES (NULL, '2008/10/20', '8H', '1h','Visite des stoks', 20, 10,  'ouverte', 0, 2);
INSERT INTO visite VALUES (NULL, '2008/10/21', '15h', '1h30','Visite des bureaux', 10, 2,  'ouverte', 0, 4);
INSERT INTO visite VALUES (NULL, '2008/10/20', '14H', '2h','Présentation du SI', 20, 10,  'ouverte', 0, 4);
INSERT INTO visite VALUES (NULL, '2008/10/21', '10H', '2h','Visite des locaux', 30, 10,  'ouverte', 0, 6);
INSERT INTO visite VALUES (NULL, '2008/10/21', '15H', '2h','Visite des locaux', 25, 5,  'ouverte', 0, 7);


INSERT INTO visiteur VALUES (NULL,'Ardie','Jean','0623231299','24500',2,1);
INSERT INTO visiteur VALUES (NULL,'Macler','Marie','0634631299','24450',1,1);
INSERT INTO visiteur VALUES (NULL,'Sami','Andree','0523223459','24320',3,1);
INSERT INTO visiteur VALUES (NULL,'Moineau','Jeanne','0611231299','24500',3,2);
INSERT INTO visiteur VALUES (NULL,'Marcel','Yves','0699871299','24500',2,7);
INSERT INTO visiteur VALUES (NULL,'Poisson','Myriam','0547831232','24530',2,2);
INSERT INTO visiteur VALUES (NULL,'Renard','Marie','0634671299','24500',1,3);
INSERT INTO visiteur VALUES (NULL,'Gramon','Patrice','0623234231','24430',2,4);
INSERT INTO visiteur VALUES (NULL,'Paris','Marc','0645321299','24510',2,3);
INSERT INTO visiteur VALUES (NULL,'Finele','Marie','0634637856','24550',1,1);
INSERT INTO visiteur VALUES (NULL,'Satyre','Ange','0528745459','24320',3,1);
INSERT INTO visiteur VALUES (NULL,'Mignon','Jules','0611232156','24610',2,8);
INSERT INTO visiteur VALUES (NULL,'Pignon','Maurice','0665891299','24740',2,2);
INSERT INTO visiteur VALUES (NULL,'Poireau','Gilles','0588761232','24530',2,2);
INSERT INTO visiteur VALUES (NULL,'Boisse','Anne','0634674532','24500',1,3);
INSERT INTO visiteur VALUES (NULL,'Garmine','Pascal','0623234231','24430',2,4);
INSERT INTO visiteur VALUES (NULL,'Margie','Hamed','0632451299','24510',2,3);
INSERT INTO visiteur VALUES (NULL,'Ramon','Marc','0634567856','24550',1,7);
INSERT INTO visiteur VALUES (NULL,'Jojo','Annie','0512457459','24320',3,1);
INSERT INTO visiteur VALUES (NULL,'PoiMignon','Jim','0687982156','24610',2,2);
INSERT INTO visiteur VALUES (NULL,'Panard','Mathilde','0623231299','24740',2,6);
INSERT INTO visiteur VALUES (NULL,'Hamadi','Youssef','0588761232','24530',2,6);
INSERT INTO visiteur VALUES (NULL,'Elimouni','Zieb','0634674532','24500',1,4);
INSERT INTO visiteur VALUES (NULL,'Costra','Pascal','0623234231','24430',2,5);
INSERT INTO visiteur VALUES (NULL,'Rahmy','Aulélien','0514567477','24320',3,9);
INSERT INTO visiteur VALUES (NULL,'Prince','Camille','0687912789','24610',2,9);
INSERT INTO visiteur VALUES (NULL,'Plantu','René','0623212345','24740',1,9);
INSERT INTO visiteur VALUES (NULL,'Parizi','Julio','0588788954','24530',2,10);
INSERT INTO visiteur VALUES (NULL,'Arbi','Zineb','0634678981','24500',1,10);
INSERT INTO visiteur VALUES (NULL,'Castro','Pascal','0623211457','24430',2,10);

-- --------------------------------------------------------

-- 
-- Mise à jours du nombre de visiteurs
-- 

UPDATE visite SET nbVisiteursInscrits=13 where id = 1 ;
UPDATE visite SET nbVisiteursInscrits=11  where id = 2 ;
UPDATE visite SET nbVisiteursInscrits=6  where id = 3 ;
UPDATE visite SET nbVisiteursInscrits=5  where id = 4 ;
UPDATE visite SET nbVisiteursInscrits=2 where id = 5 ;
UPDATE visite SET nbVisiteursInscrits=4  where id = 6 ;
UPDATE visite SET nbVisiteursInscrits=3  where id = 7 ;
UPDATE visite SET nbVisiteursInscrits=2  where id = 8 ;
UPDATE visite SET nbVisiteursInscrits=6  where id = 9 ;
UPDATE visite SET nbVisiteursInscrits=5  where id = 10 ;

