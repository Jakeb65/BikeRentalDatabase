--7
--ilosc wyp dla danego klienta w danym miesiacu z danej wypozyczalni
SELECT
    k.imie AS imie,
    k.nazwisko AS nazwisko,
    wy.nazwa_wyp AS wypozyczalnia,
    zag.miesiac,
    zag.liczba_wypozyczen
FROM(
    SELECT k.klient_id, wy.wypozyczalnia_id, COUNT(w.wypozyczenia_id) AS liczba_wypozyczen, EXTRACT(MONTH FROM w.data_wypozyczenia) AS miesiac
    FROM wypozyczenia w, wypozyczalnia wy, klient k
    WHERE wy.wypozyczalnia_id = w.wypozyczalnia_wypozyczalnia_id
      AND k.klient_id = w.klient_klient_id
      group by k.klient_id, wy.wypozyczalnia_id, EXTRACT(MONTH FROM w.data_wypozyczenia)
)zag, wypozyczalnia wy, klient k
WHERE
    wy.wypozyczalnia_id (+)= zag.wypozyczalnia_id 
    AND k.klient_id (+)= zag.klient_id;

--8
--ilosc wyp roweru ktora zrealizowal dany pracownik w danym roku
SELECT
    NVL(to_char(p.imie), 'imie pracownika') AS imie,
    NVL(to_char(p.nazwisko), 'nazwisko pracownika') AS nazwisko,
    zag.rok,
    zag.liczba_wypozyczen
FROM(
    SELECT p.pracownik_id, EXTRACT(YEAR FROM w.data_wypozyczenia) AS rok, COUNT(r.rower_id) AS liczba_wypozyczen
    FROM wypozyczenia w, pracownik p, rower r
    WHERE r.rower_id = w.rower_rower_id
    AND p.pracownik_id = w.pracownik_pracownik_id
    group by p.pracownik_id, EXTRACT(YEAR FROM w.data_wypozyczenia)
) zag, pracownik p
WHERE p.pracownik_id (+)= zag.pracownik_id;

--9
--ilosc wyp zrealizowanych przez dana wyp na danej ulicy w danym roku
SELECT
    NVL(to_char(wy.nazwa_wyp), 'nazwa wypozyczalni') AS nazwa_wyp,
    NVL(to_char(t.rodzaj), 'rodzaj') AS rodzaj,
    zag.rok,
    ZAG.liczba_wypozyczen
FROM(
    SELECT wy.wypozyczalnia_id, t.typ_id, EXTRACT(YEAR FROM w.data_wypozyczenia) AS rok, COUNT(w.wypozyczenia_id) AS liczba_wypozyczen
    FROM wypozyczalnia wy, typ t, wypozyczenia w, rower r
    WHERE wy.wypozyczalnia_id = w.wypozyczalnia_wypozyczalnia_id
    AND r.rower_id = w.rower_rower_id
    AND t.typ_id = r.typ_typ_id
    group by wy.wypozyczalnia_id, t.typ_id, EXTRACT(YEAR FROM w.data_wypozyczenia)
) zag, wypozyczalnia wy, typ t
WHERE
    wy.wypozyczalnia_id (+)= zag.wypozyczalnia_id 
    AND t.typ_id (+)= zag.typ_id;