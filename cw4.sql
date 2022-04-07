--zad 1
CREATE DATABASE firma
-- zad 2
CREATE SCHEMA rozliczenia
--zad 3
CREATE TABLE rozliczenia.pracownicy(
id_pracownika INT PRIMARY KEY NOT NULL,
imie NVARCHAR(50)NOT NULL, 
nazwisko NVARCHAR(50)NOT NULL, 
adres NVARCHAR(70), 
telefon VARCHAR(9)
);

CREATE TABLE rozliczenia.godziny(
id_godziny INT PRIMARY KEY NOT NULL,
data DATE NOT NULL, 
liczba_godzin INT NOT NULL, 
id_pracownika INT NOT NULL
);

CREATE TABLE rozliczenia.pensje(
id_pensji INT PRIMARY KEY NOT NULL,
stanowisko NVARCHAR(50)NOT NULL, 
kwota DECIMAL(8,2) NOT NULL, 
id_premii INT NOT NULL
);

CREATE TABLE rozliczenia.premie(
id_premii INT PRIMARY KEY NOT NULL,
rodzaj NVARCHAR(50), 
kwota DECIMAL(8,2) NOT NULL 
);

ALTER TABLE rozliczenia.godziny ADD CONSTRAINT fkid_pracownika FOREIGN KEY (id_pracownika) REFERENCES rozliczenia.pracownicy(id_pracownika)
ALTER TABLE rozliczenia.pensje ADD CONSTRAINT fkid_premii FOREIGN KEY (id_premii) REFERENCES rozliczenia.premie(id_premii)
--zad 4
INSERT INTO rozliczenia.pracownicy (id_pracownika, imie, nazwisko, adres, telefon)
VALUES
('1','Hubert','Pietrzak','ul. Zamczysko 134, Bydgoszcz','770644261'),
('2','Eustachy', 'WoŸniak','ul. Czeremchowa 88, Lublin','873449533'),
('3','Weronika', 'Pawlak','ul. Puszkina Aleksandra 92, Opole','986497329'),
('4','Konrad','Wasilewski','ul. Platynowa 7, Gdynia','938479239'),
('5','Rados³aw','Gajewski','ul. Otyñska 19, Wroc³aw','403883905'),
('6','Martyna', 'Witkowska','ul. Modliñska 100, Warszawa','630686462'),
('7','Edward','Jaworski','ul. G³ogowska 138, Poznañ','193269568'),
('8','Paulina','Pawlak','ul. Krótka 49, Miko³ów','507787172'),
('9','Andrzej','W³odarczyk','ul. Bagno 52, Warszawa','442515102'),
('10','Olga','Zalewska','ul. Janosika 3, Poznañ','481221454')


INSERT INTO rozliczenia.godziny (id_godziny,data,liczba_godzin,id_pracownika)
VALUES
('1','2018-07-10','8','6'),
('2','2018-07-11','4','3'),
('3','2018-07-12','10','1'),
('4','2018-07-12','2','8'),
('5','2018-07-15','6','7'),
('6','2018-07-15','6','2'),
('7','2018-07-15','4','10'),
('8','2018-07-16','10','5'),
('9','2018-07-17','2','9'),
('10','2018-07-19','8','4')

INSERT INTO rozliczenia.premie (id_premii,rodzaj,kwota)
VALUES
('1','uznaniowa','125.00'),
('2','uznaniowa','50.00'),
('3','regulaminowa','300.00'),
('4','regulaminowa','300.00'),
('5','uznaniowa','100.00'),
('6','uznaniowa','50.00'),
('7','regulaminowa','300.00'),
('8','uznaniowa','150.00'),
('9','uznaniowa','100.00'),
('10','regulaminowa','300.00')


INSERT INTO rozliczenia.pensje (id_pensji,stanowisko,kwota,id_premii)
VALUES
('1','Ksiêgowy','4853.24','4'),
('2','Gleboznawca','6125.00','1'),
('3','Analityk','4600.00','6'),
('4','Analityk','4900.00','8'),
('5','Gleboznawca','6200.00','7'),
('6','Analityk','5300.00','9'),
('7','Administrator','4000.00','5'),
('8','Ksiêgowy','5000.34','10'),
('9','Gleboznawca','6000.00','2'),
('10','Gleboznawca','6600.60','3')
-- zad 5
SELECT nazwisko,adres FROM rozliczenia.pracownicy
--zad 6
SELECT DATEPART(dw,data) AS dzien_tygodnia,DATEPART(m,data) AS miesiac FROM rozliczenia.godziny 
--zad 7
EXEC sp_rename 'rozliczenia.pensje.kwota', 'kwota_brutto'
ALTER TABLE rozliczenia.pensje ADD kwota_netto AS [kwota_brutto]*0.81




