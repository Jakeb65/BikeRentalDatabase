INSERT INTO h_rok_wyp (rok_wyp_id, rok)
SELECT ROW_NUMBER() OVER (ORDER BY EXTRACT(YEAR FROM data_wypozyczenia)) AS rok_wyp_id, EXTRACT(YEAR FROM data_wypozyczenia) AS rok
FROM wypozyczenia
WHERE data_wypozyczenia IS NOT NULL
  AND EXTRACT(YEAR FROM data_wypozyczenia) IS NOT NULL
GROUP BY EXTRACT(YEAR FROM data_wypozyczenia)
ORDER BY rok;

INSERT INTO h_miesiac_wyp (miesiac_wyp_id, miesiac)
SELECT ROW_NUMBER() OVER (ORDER BY EXTRACT(MONTH FROM data_wypozyczenia)) AS miesiac_wyp_id, EXTRACT(MONTH FROM data_wypozyczenia) AS miesiac
FROM wypozyczenia
WHERE data_wypozyczenia IS NOT NULL
  AND EXTRACT(MONTH FROM data_wypozyczenia) IS NOT NULL
GROUP BY EXTRACT(MONTH FROM data_wypozyczenia)
ORDER BY miesiac;

INSERT INTO h_dzien_wyp (dzien_wyp_id, dzien)
SELECT ROW_NUMBER() OVER (ORDER BY EXTRACT(DAY FROM data_wypozyczenia)) AS dzien_wyp_id, EXTRACT(DAY FROM data_wypozyczenia) AS dzien
FROM wypozyczenia
WHERE data_wypozyczenia IS NOT NULL
  AND EXTRACT(DAY FROM data_wypozyczenia) IS NOT NULL
GROUP BY EXTRACT(DAY FROM data_wypozyczenia)
ORDER BY dzien;

INSERT INTO h_ulica (ulica_id,ulica)
    SELECT ulica_id,ulica FROM ulica;

INSERT INTO h_klient (klient_id,imie,nazwisko,h_ulica_ulica_id)
    SELECT klient_id,imie,nazwisko,ulica_ulica_id FROM klient;

INSERT INTO h_rower (rower_id,nr_seryjny, rok_produkcji)
    SELECT rower_id,nr_seryjny, rok_produkcji FROM rower;

INSERT INTO h_typ (typ_id,rodzaj)
    SELECT typ_id,rodzaj FROM typ;

INSERT INTO h_pracownik (pracownik_id,imie,nazwisko,h_ulica_ulica_id)
    SELECT pracownik_id,imie,nazwisko,ulica_ulica_id FROM pracownik;

INSERT INTO h_wypozyczalnia (wyp_alnia_id,nazwa_wyp,h_ulica_ulica_id)
    SELECT wypozyczalnia_id,nazwa_wyp,ulica_ulica_id FROM wypozyczalnia;

INSERT INTO h_wypozyczenia (wyp_enia_id, koszt_wyp, h_rower_rower_id, h_pracownik_pracownik_id, h_klient_klient_id, h_typ_typ_id, h_dzien_wyp_dzien_wyp_id, h_miesiac_wyp_miesiac_wyp_id, h_rok_wyp_rok_wyp_id, h_wypozyczalnia_wyp_alnia_id)
SELECT
    TO_CHAR(w.wypozyczenia_id),
    TO_CHAR(w.koszt_wypozyczenia),
    TO_CHAR(w.rower_rower_id),
    TO_CHAR(w.pracownik_pracownik_id),
    TO_CHAR(w.klient_klient_id),
    TO_CHAR(t.typ_id),
    (SELECT dzien_wyp_id FROM h_dzien_wyp WHERE dzien = EXTRACT(DAY FROM w.data_wypozyczenia)),
    (SELECT miesiac_wyp_id FROM h_miesiac_wyp WHERE miesiac = EXTRACT(MONTH FROM w.data_wypozyczenia)),
    (SELECT rok_wyp_id FROM h_rok_wyp WHERE rok = EXTRACT(YEAR FROM w.data_wypozyczenia)),
    TO_CHAR(w.wypozyczalnia_wypozyczalnia_id)
FROM
    wypozyczenia w, rower r, typ t, pracownik p
WHERE
    w.rower_rower_id = r.rower_id
    AND w.pracownik_pracownik_id = p.pracownik_id
    AND r.typ_typ_id = t.typ_id;