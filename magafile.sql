-- !!ParcInfo.Sql!! --

DROP TABLE if EXISTS Segment CASCADE;


DROP TABLE if EXISTS Salle CASCADE;


DROP TABLE if EXISTS Poste CASCADE;


DROP TABLE if EXISTS Logiciel CASCADE;


DROP TABLE if EXISTS Installer CASCADE;


DROP TABLE if EXISTS Types CASCADE;


CREATE TABLE Segment (indIP INTEGER PRIMARY KEY,
                                    nomSegment TEXT NOT NULL,
                                                    etage INTEGER) ;


CREATE TABLE Salle(nSalle INTEGER PRIMARY KEY,
                                  nomSalle TEXT, nbPoste INTEGER, indIP INTEGER);


CREATE TABLE Poste (nPoste INTEGER PRIMARY KEY,
                                   nomPoste TEXT, indIP INTEGER, ad TEXT CHECK (ad >= '0'
                                                                                and ad <= '255'), typePoste TEXT, nSalle INTEGER);


CREATE TABLE Logiciel(nLog INTEGER PRIMARY KEY,
                                   nomLog TEXT, dateAch DATE, version TEXT, typeLog TEXT, prix REAL CHECK (prix >= 0));

-- todo what to do with the not null
-- todo what is the 'default' day

CREATE TABLE Installer (numIns SERIAL PRIMARY KEY,
                                      nPoste INTEGER, nLog INTEGER, dateIns TIMESTAMP NOT NULL,
                                                                                      delai INTEGER);


CREATE TABLE Types (typeLP TEXT PRIMARY KEY,
                                nomType TEXT);

-- !!question2.sql!!--

ALTER TABLE Segment
ALTER IndIp TYPE TEXT;


ALTER TABLE Salle
ALTER IndIp TYPE TEXT;


ALTER TABLE Poste
ALTER IndIp TYPE TEXT;


ALTER TABLE Salle
ALTER nSalle TYPE TEXT;


ALTER TABLE Poste
ALTER nSalle TYPE TEXT;


ALTER TABLE Logiciel
ALTER nLog TYPE TEXT;


ALTER TABLE Installer
ALTER nLog TYPE TEXT;


ALTER TABLE Poste
ALTER nPoste TYPE TEXT;


ALTER TABLE Installer
ALTER nPoste TYPE TEXT;


ALTER TABLE Installer
ALTER dateIns
DROP NOT NULL;

-- !!insert.sql!! --

INSERT INTO Segment
VALUES ('130.120.80','Brin RDC',NULL);


INSERT INTO Segment
VALUES ('130.120.81','Brin 1er  etage',NULL);


INSERT INTO Segment
VALUES ('130.120.82','Brin 2eme etage',NULL);


INSERT INTO Salle
VALUES ('s01','Salle 1',3,'130.120.80');


INSERT INTO Salle
VALUES ('s02','Salle 2',2,'130.120.80');


INSERT INTO Salle
VALUES ('s03','Salle 3',2,'130.120.80');


INSERT INTO Salle
VALUES ('s11','Salle 11',2,'130.120.81');


INSERT INTO Salle
VALUES ('s12','Salle 12',1,'130.120.81');


INSERT INTO Salle
VALUES ('s21','Salle 21',2,'130.120.82');


INSERT INTO Salle
VALUES ('s22','Salle 22',0,'130.120.83');


INSERT INTO Salle
VALUES ('s23','Salle 23',0,'130.120.83');


INSERT INTO poste
VALUES ('p1','Poste 1','130.120.80','01','TX','s01');


INSERT INTO poste
VALUES ('p2','Poste 2','130.120.80','02','UNIX','s01');


INSERT INTO poste
VALUES ('p3','Poste 3','130.120.80','03','TX','s01');


INSERT INTO poste
VALUES ('p4','Poste 4','130.120.80','04','PCWS','s02');


INSERT INTO poste
VALUES ('p5','Poste 5','130.120.80','05','PCWS','s02');


INSERT INTO poste
VALUES ('p6','Poste 6','130.120.80','06','UNIX','s03');


INSERT INTO poste
VALUES ('p7','Poste 7','130.120.80','07','TX','s03');


INSERT INTO poste
VALUES ('p8','Poste 8','130.120.81','01','UNIX','s11');


INSERT INTO poste
VALUES ('p9','Poste 9','130.120.81','02','TX','s11');


INSERT INTO poste
VALUES ('p10','Poste 10','130.120.81','03','UNIX','s12');


INSERT INTO poste
VALUES ('p11','Poste 11','130.120.82','01','PCNT','s21');


INSERT INTO poste
VALUES ('p12','Poste 12','130.120.82','02','PCWS','s21');


INSERT INTO logiciel
VALUES ('log1','Oracle 6', '1995-05-13','6.2','UNIX',3000);


INSERT INTO logiciel
VALUES ('log2','Oracle 8', '1999-09-15','8i','UNIX',5600);


INSERT INTO logiciel
VALUES ('log3','SQL Server', '1998-04-12','7','PCNT',3000);


INSERT INTO logiciel
VALUES ('log4','Front Page', '1997-06-03','5','PCWS',500);


INSERT INTO logiciel
VALUES ('log5','WinDev', '1997-05-12','5','PCWS',750);


INSERT INTO logiciel
VALUES ('log6','SQL*Net', NULL, '2.0','UNIX',500);


INSERT INTO logiciel
VALUES ('log7','I. I. S.', '2002-04-12','2','PCNT',900);


INSERT INTO logiciel
VALUES ('log8','DreamWeaver','2003-09-21','2.0','BeOS',1400);


INSERT INTO Types
VALUES ('TX', 'Terminal X-Window');


INSERT INTO Types
VALUES ('UNIX','Systeme Unix');


INSERT INTO Types
VALUES ('PCNT','PC Windows  NT');


INSERT INTO Types
VALUES ('PCWS','PC Windows');


INSERT INTO Types
VALUES ('NC', 'Network Computer');


INSERT INTO installer (nPoste, nLog, dateIns, delai)
VALUES ('p2', 'log1', '2003-05-15',NULL);


INSERT INTO installer (nPoste, nLog, dateIns, delai)
VALUES ('p2', 'log2', '2003-09-17',NULL);


INSERT INTO installer (nPoste, nLog, dateIns, delai)
VALUES ('p4', 'log5', NULL,NULL);


INSERT INTO installer (nPoste, nLog, dateIns, delai)
VALUES ('p6', 'log6', '2003-05-20',NULL);


INSERT INTO installer (nPoste, nLog, dateIns, delai)
VALUES ('p6', 'log1', '2003-05-20',NULL);


INSERT INTO installer (nPoste, nLog, dateIns, delai)
VALUES ('p8', 'log2', '2003-05-19',NULL);


INSERT INTO installer (nPoste, nLog, dateIns, delai)
VALUES ('p8', 'log6', '2003-05-20',NULL);


INSERT INTO installer (nPoste, nLog, dateIns, delai)
VALUES ('p11','log3', '2003-04-20',NULL);


INSERT INTO installer (nPoste, nLog, dateIns, delai)
VALUES ('p12','log4', '2003-04-20',NULL);


INSERT INTO installer (nPoste, nLog, dateIns, delai)
VALUES ('p11','log7', '2003-04-20',NULL);


INSERT INTO installer (nPoste, nLog, dateIns, delai)
VALUES ('p7', 'log7', '2002-04-01',NULL);


SELECT *
FROM Segment;


SELECT *
FROM Salle;


SELECT *
FROM Poste;


SELECT *
FROM Logiciel;


SELECT *
FROM Installer;


SELECT *
FROM Types;

-- !!references.sql!! --

DELETE
FROM Salle
WHERE indip = '130.120.83';


DELETE
FROM logiciel
WHERE typelog = 'BeOS';


ALTER TABLE Poste ADD CONSTRAINT poste_indIp_fk
FOREIGN KEY(indIp) REFERENCES Segment(indIp);


ALTER TABLE Poste ADD CONSTRAINT poste_typePoste_fk
FOREIGN KEY(typePoste) REFERENCES types(typeLP); -- should this reference this


ALTER TABLE Poste ADD CONSTRAINT poste_nSalle_fk
FOREIGN KEY(nSalle) REFERENCES Salle(nSalle);


ALTER TABLE Installer ADD CONSTRAINT installer_nPoste_fk
FOREIGN KEY(nPoste) REFERENCES Poste(nPoste);


ALTER TABLE Installer ADD CONSTRAINT installer_nLog_fk
FOREIGN KEY(nLog) REFERENCES Logiciel(nLog);


ALTER TABLE Logiciel ADD CONSTRAINT logiciel_typeLog_fk
FOREIGN KEY(typeLog) REFERENCES Types(typeLP);


ALTER TABLE Salle ADD CONSTRAINT salle_indIp_fk
FOREIGN KEY(indIp) REFERENCES Segment(indIp);