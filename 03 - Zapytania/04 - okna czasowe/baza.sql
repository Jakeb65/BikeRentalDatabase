--10
--ilosc rowerow wyp w danym roku z danej ulicy z danej wypozyczalni
SELECT
    NVL(to_char(wy.nazwa_wyp), 'nazwa wypozyczalni') AS nazwa_wyp,
    NVL(to_char(u.ulica), 'ulica') AS ulica,
    zag.rok,
    ZAG.liczba_wypozyczen
FROM(
    SELECT wy.wypozyczalnia_id, u.ulica_id, EXTRACT(YEAR FROM w.data_wypozyczenia) AS rok, COUNT(w.wypozyczenia_id) AS liczba_wypozyczen
    FROM wypozyczalnia wy, ulica u, wypozyczenia w
    WHERE wy.wypozyczalnia_id = w.wypozyczalnia_wypozyczalnia_id
    AND u.ulica_id = wy.ulica_ulica_id
    group by wy.wypozyczalnia_id, u.ulica_id, EXTRACT(YEAR FROM w.data_wypozyczenia)
) zag, wypozyczalnia wy, ulica u
WHERE
    wy.wypozyczalnia_id (+)= zag.wypozyczalnia_id 
    AND u.ulica_id (+)= zag.ulica_id
    order by wy.nazwa_wyp, zag.rok, zag.liczba_wypozyczen;

--11
--pracownicy i ilosc zrealizowanych przez nich wypozyczen w danym roku w danej wypozyczalni
SELECT
    zag.rok,
    p.imie,
    p.nazwisko,
    wy.nazwa_wyp,
    zag.liczba_wypozyczen
FROM(
    SELECT wy.wypozyczalnia_id, p.pracownik_id, EXTRACT(YEAR FROM w.data_wypozyczenia) AS rok, COUNT(w.wypozyczenia_id) AS liczba_wypozyczen
    FROM wypozyczalnia wy, wypozyczenia w, pracownik p
    WHERE wy.wypozyczalnia_id = w.wypozyczalnia_wypozyczalnia_id
      AND p.pracownik_id = w.pracownik_pracownik_id
      group by wy.wypozyczalnia_id, p.pracownik_id, EXTRACT(YEAR FROM w.data_wypozyczenia)
)zag, pracownik p, wypozyczalnia wy
WHERE p.pracownik_id (+)= zag.pracownik_id
  AND wy.wypozyczalnia_id (+)= zag.wypozyczalnia_id
ORDER BY rok, p.pracownik_id, wy.wypozyczalnia_id DESC;

--12
--suma kosztow wypozyczenia danego klienta i danego roweru w danym roku
SELECT
    zag.rok,
    k.imie,
    k.nazwisko,
    r.nr_seryjny,
    zag.koszt_wypozyczenia
FROM(
    SELECT k.klient_id, r.rower_id, w.koszt_wypozyczenia, EXTRACT(YEAR FROM w.data_wypozyczenia) AS rok
    FROM wypozyczenia w, klient k, rower r
    WHERE r.rower_id = w.rower_rower_id
    AND k.klient_id = w.klient_klient_id
      group by k.klient_id, r.rower_id, w.koszt_wypozyczenia, EXTRACT(YEAR FROM w.data_wypozyczenia)
)zag, klient k, rower r
WHERE k.klient_id (+)= zag.rower_id
  AND r.rower_id (+)= zag.rower_id
ORDER BY rok, k.klient_id, r.rower_id DESC;