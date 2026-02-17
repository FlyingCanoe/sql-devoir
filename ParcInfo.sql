DROP TABLE if EXISTS Segment;


DROP TABLE if EXISTS Salle;


DROP TABLE if EXISTS Poste;


DROP TABLE if EXISTS Logicel;


DROP TABLE if EXISTS Installer;


DROP TABLE if EXISTS Type;


CREATE TABLE Segment (indIP INTEGER PRIMARY KEY,
                                    nomSegment TEXT NOT NULL,
                                                    etage INTEGER) ;


CREATE TABLE Salle(nSalle INTEGER PRIMARY KEY,
                                  nomSalle TEXT, nbPoste INTEGER, indIP INTEGER);


CREATE TABLE Poste (nPoste INTEGER PRIMARY KEY,
                                   nomPoste TEXT, indIP INTEGER, ad TEXT CHECK (ad >= '0'
                                                                                and ad <= '255'), typePoste TEXT, nSalle INTEGER);


CREATE TABLE Logicel(nLog INTEGER PRIMARY KEY,
                                  nomLog TEXT, dateAch DATE, version TEXT, typeLog TEXT, prix REAL CHECK (prix >= 0));


CREATE TABLE Installer (numIns SERIAL PRIMARY KEY,
                                      nPoste INTEGER, nLog INTEGER, dateIns TIMESTAMP, delai INTEGER);


CREATE TABLE Type (typeLP TEXT, nomType TEXT);