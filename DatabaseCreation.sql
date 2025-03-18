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


INSERT INTO Sijainti (SijaintiID, Kaupunki, Maa) VALUES
(1, 'Helsinki', 'Suomi'),
(2, 'Tampere', 'Suomi'),
(3, 'Turku', 'Suomi');

INSERT INTO Myyja (MyyjaID, SijaintiID, Etunimi, Sukunimi, SPosti, PuhNro) VALUES
(1, 1, 'Matti', 'Meikäläinen', 'matti.meikalainen@example.com', '0401234567'),
(2, 2, 'Liisa', 'Virtanen', 'liisa.virtanen@example.com', '0402345678'),
(3, 3, 'Pekka', 'Korhonen', 'pekka.korhonen@example.com', '0403456789'),
(4, 1, 'Antti', 'Räsänen', 'antti.rasanen@example.com', '0404567890'),
(5, 2, 'Maija', 'Lehtinen', 'maija.lehtinen@example.com', '0405678901');

INSERT INTO Auto (RekNro, Merkki, Malli, Vapaa, SijaintiID, MyyjaID) VALUES
('ABC-123', 'Toyota', 'Corolla', 1, 1, 1),
('XYZ-789', 'Volkswagen', 'Golf', 0, 2, 2),
('JKL-456', 'Ford', 'Focus', 1, 3, 3),
('DEF-321', 'Nissan', 'Qashqai', 1, 1, 4),
('GHI-654', 'BMW', '320i', 0, 2, 5),
('MNO-987', 'Mercedes', 'C200', 1, 3, 3),
('PQR-741', 'Audi', 'A4', 1, 1, 1),
('STU-852', 'Skoda', 'Octavia', 0, 2, 2);

INSERT INTO Asiakas (AsiakasID, Etunimi, Sukunimi, SPosti, PuhNro) VALUES
(1, 'Anna', 'Laakso', 'anna.laakso@example.com', '0451234567'),
(2, 'Janne', 'Mäkinen', 'janne.makinen@example.com', '0452345678'),
(3, 'Emilia', 'Hakala', 'emilia.hakala@example.com', '0453456789'),
(4, 'Timo', 'Heikkinen', 'timo.heikkinen@example.com', '0454567890'),
(5, 'Laura', 'Koskinen', 'laura.koskinen@example.com', '0455678901'),
(6, 'Sami', 'Järvinen', 'sami.jarvinen@example.com', '0456789012'),
(7, 'Heli', 'Salminen', 'heli.salminen@example.com', '0457890123');

INSERT INTO Varaus (VarausID, AsiakasID, RekNro, StartTime, EndTime) VALUES
(1, 3, 'STU-852', '2024-03-18 14:00:00', '2024-03-18 17:00:00'),
(2, 5, 'MNO-987', '2024-03-25 10:00:00', '2024-03-25 12:30:00'),
(3, 2, 'PQR-741', '2024-04-01 08:00:00', '2024-04-01 11:15:00'),
(4, 6, 'XYZ-789', '2024-04-05 09:30:00', '2024-04-05 13:00:00'),
(5, 1, 'PQR-741', '2024-04-10 09:00:00', '2024-04-10 14:00:00'),
(6, 3, 'JKL-456', '2024-05-01 10:00:00', '2024-05-01 11:30:00'),
(7, 4, 'ABC-123', '2024-06-01 08:30:00', '2024-06-01 10:45:00'),
(8, 7, 'GHI-654', '2024-06-07 09:00:00', '2024-06-08 10:00:00'),
(9, 2, 'DEF-321', '2024-06-20 08:30:00', '2024-06-20 12:00:00'),
(10, 3, 'MNO-987', '2024-07-01 07:45:00', '2024-07-01 09:15:00'),
(11, 4, 'JKL-456', '2024-08-03 10:00:00', '2024-08-03 13:45:00'),
(12, 5, 'ABC-123', '2024-09-15 09:00:00', '2024-09-15 12:30:00'),
(13, 6, 'STU-852', '2024-10-05 11:00:00', '2024-10-06 09:30:00'),
(14, 7, 'GHI-654', '2024-11-01 08:00:00', '2024-11-01 13:45:00'),
(15, 2, 'MNO-987', '2024-12-10 09:30:00', '2024-12-10 15:30:00');
