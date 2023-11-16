--10
SELECT
    wy.nazwa_wyp AS wypozyczalnia,
    u.ulica AS ulica,
    r.rok AS rok,
    zag.liczba_wypozyczen
FROM(
    SELECT
        wy.wyp_alnia_id,
        u.ulica_id,
        r.rok_wyp_id,
        COUNT(w.wyp_enia_id) AS liczba_wypozyczen
    FROM h_wypozyczenia w, h_wypozyczalnia wy, h_ulica u, h_rok_wyp r
    WHERE wy.wyp_alnia_id = w.h_wypozyczalnia_wyp_alnia_id
      AND r.rok_wyp_id = w.h_rok_wyp_rok_wyp_id
      AND u.ulica_id = wy.h_ulica_ulica_id
      group by r.rok_wyp_id, wy.wyp_alnia_id, u.ulica_id
) zag, h_wypozyczalnia wy, h_ulica u, h_rok_wyp r
WHERE
    wy.wyp_alnia_id (+)= zag.wyp_alnia_id
    AND r.rok_wyp_id (+)= zag.rok_wyp_id
    AND u.ulica_id (+)= zag.ulica_id;

--11
SELECT
    wy.nazwa_wyp AS wypozyczalnia,
    p.imie AS imie,
    p.nazwisko AS nazwisko,
    r.rok AS rok,
    zag.liczba_wypozyczen
FROM(
    SELECT
        wy.wyp_alnia_id,
        p.pracownik_id,
        r.rok_wyp_id,
        COUNT(w.wyp_enia_id) AS liczba_wypozyczen
    FROM h_wypozyczenia w, h_wypozyczalnia wy, h_pracownik p, h_rok_wyp r
    WHERE wy.wyp_alnia_id = w.h_wypozyczalnia_wyp_alnia_id
      AND r.rok_wyp_id = w.h_rok_wyp_rok_wyp_id
      AND p.pracownik_id = w.h_pracownik_pracownik_id
      group by r.rok_wyp_id, wy.wyp_alnia_id, p.pracownik_id
) zag, h_wypozyczalnia wy, h_pracownik p, h_rok_wyp r
WHERE
    wy.wyp_alnia_id (+)= zag.wyp_alnia_id
    AND r.rok_wyp_id (+)= zag.rok_wyp_id
    AND p.pracownik_id (+)= zag.pracownik_id;

--12
SELECT
    wy.nazwa_wyp AS wypozyczalnia,
    k.imie AS imie,
    k.nazwisko AS nazwisko,
    w.koszt_wyp AS koszt_wyp,
    r.rok AS rok,
    zag.liczba_wyp
FROM(
    SELECT
        wy.wyp_alnia_id,
        k.klient_id,
        r.rok_wyp_id,
        COUNT(w.wyp_enia_id) AS liczba_wyp
    FROM h_wypozyczenia w, h_wypozyczalnia wy, h_klient k, h_rok_wyp r
    WHERE wy.wyp_alnia_id = w.h_wypozyczalnia_wyp_alnia_id
      AND r.rok_wyp_id = w.h_rok_wyp_rok_wyp_id
      AND k.klient_id = w.h_klient_klient_id
      group by r.rok_wyp_id, wy.wyp_alnia_id, k.klient_id
) zag, h_wypozyczalnia wy, h_klient k, h_rok_wyp r, h_wypozyczenia w
WHERE
    wy.wyp_alnia_id (+)= zag.wyp_alnia_id
    AND r.rok_wyp_id (+)= zag.rok_wyp_id
    AND k.klient_id (+)= zag.klient_id;