BEGIN TRANSACTION;


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


COMMIT;