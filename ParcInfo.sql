ROLLBACK;

BEGIN TRANSACTION;


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


CREATE TABLE Installer (numIns SERIAL PRIMARY KEY,
                                      nPoste INTEGER, nLog INTEGER, dateIns DATE default CURRENT_DATE,
                                                                                         delai INTEGER);


CREATE TABLE Types (typeLP TEXT PRIMARY KEY,
                                nomType TEXT);


COMMIT;