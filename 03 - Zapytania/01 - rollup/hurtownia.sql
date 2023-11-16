--1
SELECT
    NVL(to_char(r.rok_produkcji), 'WSZYSTKIE LATA PRODUKCJI') AS rok_produkcji,
    NVL(to_char(k.klient_id), 'WSZYSCY KLIENCI') AS klient_id,
    NVL(to_char(w.wyp_enia_id), 'WSZYSTKIE WYPOZYCZENIA') AS wypozyczenia_id,
    COUNT(*) AS liczba_wypozyczen
FROM
    h_rower r, h_klient k, h_wypozyczenia w
WHERE
    r.rower_id = w.h_rower_rower_id
    AND k.klient_id = w.h_klient_klient_id
GROUP BY
    ROLLUP (r.rok_produkcji, k.klient_id, w.wyp_enia_id);

--2
SELECT
    NVL(to_char(r.nr_seryjny), 'WSZYSTKIE NUMERY') AS numery_seryjne,
    NVL(to_char(k.klient_id), 'WSZYSCY KLIENCI') AS klient_id,
    NVL(to_char(w.koszt_wyp), 'KOSZT WYPOZYCZEN') AS koszt_wypozyczen
FROM
    h_rower r, h_klient k, h_wypozyczenia w
WHERE
    r.rower_id = w.h_rower_rower_id
    AND k.klient_id = w.h_klient_klient_id
GROUP BY
    ROLLUP (r.nr_seryjny, k.klient_id, w.koszt_wyp);

--3
SELECT
    NVL(to_char(w.wyp_enia_id), 'WSZYSTKIE WYPOZYCZENIA') AS wypozyczenia,
    NVL(to_char(k.klient_id), 'WSZYSCY KLIENCI') AS klient,
    NVL(to_char(wy.wyp_alnia_id), 'WSZYSTKIE WYPOZYCZALNIE') AS wypozyczalnia,
    COUNT(w.wyp_enia_id) AS liczba_wypozyczen
FROM
    h_wypozyczenia w, h_wypozyczalnia wy, h_klient k
WHERE
    wy.wyp_alnia_id = w.h_wypozyczalnia_wyp_alnia_id
    AND k.klient_id = w.h_klient_klient_id
GROUP BY
    ROLLUP (w.wyp_enia_id, k.klient_id, wy.wyp_alnia_id);