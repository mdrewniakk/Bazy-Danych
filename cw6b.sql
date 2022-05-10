--a
ALTER TABLE ksiegowosc.pracownicy
ALTER COLUMN telefon
type character varying(15);
UPDATE ksiegowosc.pracownicy
SET telefon=CONCAT('+48',telefon)
SELECT * FROM ksiegowosc.pracownicy
--b
UPDATE ksiegowosc.pracownicy
SET telefon=SUBSTRING(telefon, 1,6)||'-'||SUBSTRING(telefon, 6,3)||'-'||SUBSTRING(telefon, 9,3)
--c
SELECT id_pracownika,UPPER(imie) AS imie,UPPER(nazwisko) AS nazwisko,UPPER(adres) AS adres,telefon FROM ksiegowosc.pracownicy
WHERE nazwisko = (SELECT MAX(nazwisko) FROM ksiegowosc.pracownicy)
--d
SELECT id_pracownika,MD5(imie) AS imie,MD5(nazwisko) AS nazwisko,MD5(adres) AS adres,MD5(telefon) AS telefon FROM ksiegowosc.pracownicy
--f
SELECT pracownicy.id_pracownika,imie,nazwisko,pensja.kwota AS pensja,premia.kwota AS premia FROM ksiegowosc.pracownicy
LEFT OUTER JOIN ksiegowosc.wynagrodzenie ON pracownicy.id_pracownika=wynagrodzenie.id_pracownika
LEFT OUTER JOIN ksiegowosc.premia ON wynagrodzenie.id_premii=premia.id_premii
LEFT OUTER JOIN ksiegowosc.pensja ON wynagrodzenie.id_pensji=pensja.id_pensji
--g
SELECT FORMAT('Pracownik %s %s, w dniu %s otrzymał pensję całkowitą na kwotę %s zł, gdzie wynagrodzenie zasadnicze wynosiło: %s zł, premia: %s zł, nadgodziny: 0 zł',imie,nazwisko,wynagrodzenie.data,pensja.kwota+premia.kwota,pensja.kwota,premia.kwota) FROM ksiegowosc.pracownicy
JOIN ksiegowosc.godziny ON pracownicy.id_pracownika=godziny.id_pracownika
JOIN ksiegowosc.wynagrodzenie ON pracownicy.id_pracownika=wynagrodzenie.id_pracownika
JOIN ksiegowosc.premia ON wynagrodzenie.id_premii=premia.id_premii
JOIN ksiegowosc.pensja ON wynagrodzenie.id_pensji=pensja.id_pensji

SELECT * FROM ksiegowosc.godziny