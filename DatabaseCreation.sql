CREATE TABLE Sijainti ( 
    SijaintiID int NOT NULL, 
    Kaupunki varchar(30) NOT NULL,
    Maa varchar(30) NOT NULL,  
    PRIMARY KEY (SijaintiID)
);

CREATE TABLE Myyja ( 
    MyyjaID int NOT NULL, 
    SijaintiID int NOT NULL, 
    Etunimi varchar(30) NOT NULL,
    Sukunimi varchar(30) NOT NULL,
    SPosti varchar(40) NOT NULL, 
    PuhNro varchar(15) NOT NULL, 
    PRIMARY KEY (MyyjaID), 
    FOREIGN KEY (SijaintiID) REFERENCES Sijainti(SijaintiID)
);

CREATE TABLE Auto ( 
    RekNro varchar(7) NOT NULL, 
    Merkki varchar(20) NOT NULL,
    Malli varchar(20) NOT NULL, 
    Vapaa TINYINT(1) NOT NULL,
    SijaintiID int NOT NULL,
    MyyjaID int NOT NULL,  
    PRIMARY KEY (RekNro), 
    FOREIGN KEY (SijaintiID) REFERENCES Sijainti(SijaintiID), 
    FOREIGN KEY (MyyjaID) REFERENCES Myyja(MyyjaID)
);

CREATE TABLE Asiakas ( 
    AsiakasID int NOT NULL, 
    Etunimi varchar(30) NOT NULL,
    Sukunimi varchar(30) NOT NULL, 
    SPosti varchar(40) NOT NULL, 
    PuhNro varchar(15) NOT NULL, 
    PRIMARY KEY (AsiakasID)
);

CREATE TABLE Varaus ( 
    VarausID int NOT NULL, 
    AsiakasID int NOT NULL,  
    RekNro varchar(7) NOT NULL,
    StartTime DATETIME NOT NULL,
    EndTime DATETIME NOT NULL,
    PRIMARY KEY (VarausID), 
    FOREIGN KEY (AsiakasID) REFERENCES Asiakas(AsiakasID),
    FOREIGN KEY (RekNro) REFERENCES Auto(RekNro)
);


INSERT INTO Sijainti VALUES  
    (,,,),
    (,,,);

INSERT INTO Myyja VALUES 
    (,,,,,,), 
    (,,,,,,);

INSERT INTO Auto VALUES 
    (,,,,,,), 
    (,,,,,,);

INSERT INTO Asiakas VALUES  
    (,,,,,), 
    (,,,,,);

INSERT INTO Varaus VALUES
    (,,,,,), 
    (,,,,,);
