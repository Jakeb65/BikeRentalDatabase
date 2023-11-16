--4
SELECT
    NVL(to_char(w.wyp_enia_id), 'WSZYSTKIE WYPOZYCZENIA') AS wypozyczenia,
    NVL(to_char(p.pracownik_id), 'WSZYSCY PRACOWNICY') AS pracownik,
    NVL(to_char(wy.nazwa_wyp), 'WSZYSTKIE WYPOZYCZALNIE') AS wypozyczalnia,
    COUNT(w.wyp_enia_id) AS liczba_wypozyczen
FROM
    h_wypozyczenia w, h_wypozyczalnia wy, h_pracownik p
WHERE
    wy.wyp_alnia_id = w.h_wypozyczalnia_wyp_alnia_id
    AND p.pracownik_id = w.h_pracownik_pracownik_id
GROUP BY
    CUBE (w.wyp_enia_id, p.pracownik_id, wy.nazwa_wyp);

--5
SELECT
    COUNT(w.wyp_enia_id) AS WYPOZYCZENIA, 
    NVL(to_char(p.pracownik_id), 'WSZYSCY PRACOWNICY') AS pracownik_id,
    NVL(to_char(r.rower_id), 'WSZYSTKIE ROWERY') AS rower
From h_pracownik p, h_rower r, h_wypozyczenia w
    where p.pracownik_id = w.h_pracownik_pracownik_id
      AND w.h_rower_rower_id = r.rower_id
    GROUP BY CUBE(r.rower_id,p.pracownik_id);

--6
SELECT
    NVL(to_char(k.klient_id), 'Wszyscy klienci') AS klient_id,
    NVL(to_char(wy.wyp_alnia_id), 'Wszystkie wypozyczalnie') AS wypozyczalnia_id,
    ZAG.liczba_wypozyczen
FROM(
    SELECT wy.wyp_alnia_id, k.klient_id, w.wyp_enia_id, COUNT(w.wyp_enia_id) AS liczba_wypozyczen
    FROM h_wypozyczenia w, h_wypozyczalnia wy, h_klient k
    WHERE wy.wyp_alnia_id = w.h_wypozyczalnia_wyp_alnia_id
      AND k.klient_id = w.h_klient_klient_id
    GROUP BY CUBE(wy.wyp_alnia_id, k.klient_id, w.wyp_enia_id)
) zag, h_wypozyczalnia wy, h_klient k
WHERE
    wy.wyp_alnia_id (+)= zag.wyp_alnia_id 
    AND k.klient_id (+)= zag.klient_id;