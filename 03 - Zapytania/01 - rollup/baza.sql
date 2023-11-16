--1
SELECT
    NVL(to_char(r.rok_produkcji), 'WSZYSTKIE LATA PRODUKCJI') AS rok_produkcji,
    NVL(to_char(k.klient_id), 'WSZYSCY KLIENCI') AS klient_id,
    NVL(to_char(w.wypozyczenia_id), 'WSZYSTKIE WYPOZYCZENIA') AS wypozyczenia_id,
    COUNT(*) AS liczba_wypozyczen
FROM
    rower r, klient k, wypozyczenia w
WHERE
    r.rower_id = w.rower_rower_id
    AND k.klient_id = w.klient_klient_id
GROUP BY
    ROLLUP (r.rok_produkcji, k.klient_id, w.wypozyczenia_id);

--2
SELECT
    NVL(to_char(r.nr_seryjny), 'Wszystkie numery') AS nr_seryjny,
    NVL(to_char(k.klient_id), 'Wszyscy klienci') AS nazwa_wyp,
    NVL(to_char(w.koszt_wypozyczenia), 'Wszystkie koszty wypożyczeń') AS koszt_wypozyczenia,
    COUNT(*) AS koszt_wypozyczeń
FROM
    wypozyczenia w,
    rower r,
    klient k
WHERE
    r.rower_id = w.rower_rower_id
    AND k.klient_id = w.klient_klient_id
GROUP BY ROLLUP(r.nr_seryjny, k.klient_id, w.koszt_wypozyczenia);

--3
SELECT
    NVL(to_char(w.wypozyczenia_id), 'Wszystkie wypożyczenia') AS wypozyczenia_id,
    NVL(to_char(k.klient_id), 'Wszyscy klienci') AS klient_id,
    NVL(to_char(wy.wypozyczalnia_id), 'Wszystkie wypożyczalnie') AS wypozyczalnia_id,
    COUNT(*) AS liczba_wypozyczen
FROM
    wypozyczenia w,
    wypozyczalnia wy,
    klient k
WHERE
    wy.wypozyczalnia_id = w.wypozyczalnia_wypozyczalnia_id
    AND k.klient_id = w.klient_klient_id
GROUP BY ROLLUP(w.wypozyczenia_id, k.klient_id, wy.wypozyczalnia_id);
