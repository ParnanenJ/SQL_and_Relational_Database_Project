-- 1. Kysely, joka käyttää AS-avainsanaa (aliasointi)
-- Palauttaa myyjien koko nimen yhtenä sarakkeena "KokoNimi" ja sähköpostin.
SELECT CONCAT(Etunimi, ' ', Sukunimi) AS KokoNimi, SPosti AS Sähköposti
FROM Myyja;

-- 2. Kysely, joka käyttää OR-avainsanaa
-- Palauttaa kaikki autot, jotka ovat joko vapaana tai joiden sijainti on Helsinki.
SELECT * FROM Auto
WHERE Vapaa = 0 OR SijaintiID = (SELECT SijaintiID FROM Sijainti WHERE Kaupunki = 'Helsinki');

-- 3. Kysely, joka käyttää AND-avainsanaa
-- Palauttaa kaikki asiakkaat, joiden etunimi on "Emilia" ja sukunimi on "Hakala".
SELECT * FROM Asiakas
WHERE Etunimi = 'Emilia' AND Sukunimi = 'Hakala';

-- 4. Agregaattifunktio: COUNT()
-- Laskee kuinka monta myyjää on missäkin kaupungissa.
SELECT Sijainti.Kaupunki, COUNT(myyja.myyjaID) AS 'Myyjien määrä' FROM myyja
INNER JOIN Sijainti ON myyja.SijaintiID = Sijainti.SijaintiID
GROUP BY Sijainti.Kaupunki;

-- 5. Agregaattifunktio: AVG()
-- Laskee varausten keskimääräisen keston tunneissa.
SELECT AVG(TIMESTAMPDIFF(HOUR, StartTime, EndTime)) AS KeskiVarausTunnit FROM Varaus;

-- 6. Agregaattifunktio: MAX()
-- Palauttaa pisimmän varauksen keston tunneissa ja varauksen tiedot.
SELECT VarausID, AsiakasID, RekNro, MAX(TIMESTAMPDIFF(HOUR, StartTime, EndTime)) AS PisinVarausTunnit FROM varaus 
ORDER BY TIMESTAMPDIFF(HOUR, StartTime, EndTime);

-- 7. Kysely, joka käyttää GROUP BY -avainsanaa
-- Laskee, kuinka monta autoa on kussakin kaupungissa.
SELECT Sijainti.Kaupunki, COUNT(Auto.RekNro) AS AutojenMaara FROM Auto
JOIN Sijainti ON Auto.SijaintiID = Sijainti.SijaintiID
GROUP BY Sijainti.Kaupunki;

-- 8. Kysely, joka käyttää HAVING-avainsanaa
-- Näyttää kaupungit, joissa on vähintään 3 autoa.
SELECT Sijainti.Kaupunki, COUNT(Auto.RekNro) AS AutojenMaara FROM Auto
JOIN Sijainti ON Auto.SijaintiID = Sijainti.SijaintiID
GROUP BY Sijainti.Kaupunki
HAVING COUNT(Auto.RekNro) >= 3;

-- 9. Kysely, joka käyttää LEFT JOIN -liitosta
-- Palauttaa kaikki asiakkaat ja heidän varauksensa, myös ne asiakkaat, joilla ei ole varauksia.
SELECT Asiakas.AsiakasID, Asiakas.Etunimi, Asiakas.Sukunimi, Varaus.RekNro, Varaus.StartTime, Varaus.EndTime
FROM Asiakas
LEFT JOIN Varaus ON Asiakas.AsiakasID = Varaus.AsiakasID;

-- 10. Kysely, joka käyttää INNER JOIN -liitosta
-- Palauttaa varaukset ja vastaavat autojen merkit ja mallit.
SELECT Varaus.VarausID, Varaus.AsiakasID, CONCAT(Asiakas.Etunimi, ' ', Asiakas.Sukunimi) AS KokoNimi, Varaus.StartTime, 
    Varaus.EndTime, Auto.Merkki, Auto.Malli 
FROM varaus
INNER JOIN Auto ON Varaus.RekNro = Auto.RekNro
INNER JOIN Asiakas ON Varaus.AsiakasID = Asiakas.AsiakasID
ORDER BY varaus.VarausID;