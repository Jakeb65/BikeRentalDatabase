--4
SELECT
    NVL(to_char(p.pracownik_id), 'Wszyscy pracownicy') AS pracownik_id,
    NVL(to_char(w.koszt_wypozyczenia), 'Wszystkie koszty wypożyczeń') AS koszt_wypozyczenia,
    NVL(wy.nazwa_wyp, 'Wszystkie wypożyczalnie') AS nazwa_wyp,
    COUNT(*) AS liczba_wypozyczen
FROM
    pracownik p,
    wypozyczenia w,
    wypozyczalnia wy
WHERE
    p.pracownik_id = w.pracownik_pracownik_id
    AND w.wypozyczalnia_wypozyczalnia_id = wy.wypozyczalnia_id
GROUP BY CUBE (p.pracownik_id, w.koszt_wypozyczenia, wy.nazwa_wyp);

--5
SELECT COUNT(w.wypozyczenia_id) AS WYPOZYCZENIA, 
NVL(to_char(p.pracownik_id), 'WSZYSCY PRACOWNICY') AS pracownik_id,
NVL(to_char(r.rower_id), 'WSZYSTKIE ROWERY') AS rower_id
From pracownik p, rower r, wypozyczenia w
where p.pracownik_id = w.pracownik_pracownik_id
 AND w.rower_rower_id = r.rower_id
 GROUP BY CUBE(r.rower_id,p.pracownik_id);

--6
SELECT
    NVL(to_char(k.klient_id), 'Wszyscy klienci') AS klient_id,
    NVL(to_char(wy.wypozyczalnia_id), 'Wszystkie wypożyczalnie') AS wypozyczalnia_id,
    ZAG.liczba_wypozyczen
FROM(
    SELECT wy.wypozyczalnia_id, k.klient_id, w.wypozyczenia_id, COUNT(*) AS liczba_wypozyczen
    FROM wypozyczenia w, wypozyczalnia wy, klient k
    WHERE wy.wypozyczalnia_id = w.wypozyczalnia_wypozyczalnia_id
      AND k.klient_id = w.klient_klient_id
    GROUP BY CUBE(w.wypozyczenia_id, k.klient_id, wy.wypozyczalnia_id)
) zag, wypozyczalnia wy, klient k
WHERE
    wy.wypozyczalnia_id (+)= zag.wypozyczalnia_id 
    AND k.klient_id (+)= zag.klient_id;