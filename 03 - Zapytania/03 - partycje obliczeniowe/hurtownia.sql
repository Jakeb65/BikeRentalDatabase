--7
SELECT
    k.imie AS imie,
    k.nazwisko AS nazwisko,
    wy.nazwa_wyp AS wypozyczalnia,
    m.miesiac AS miesiac,
    zag.liczba_wypozyczen
FROM(
    SELECT
        k.klient_id,
        wy.wyp_alnia_id,
        m.miesiac_wyp_id,
        COUNT(w.wyp_enia_id) AS liczba_wypozyczen
    FROM h_wypozyczenia w, h_wypozyczalnia wy, h_klient k, h_miesiac_wyp m
    WHERE wy.wyp_alnia_id = w.h_wypozyczalnia_wyp_alnia_id
      AND k.klient_id = w.h_klient_klient_id
      AND m.miesiac_wyp_id = w.h_miesiac_wyp_miesiac_wyp_id
      group by k.klient_id, wy.wyp_alnia_id, m.miesiac_wyp_id
) zag, h_wypozyczalnia wy, h_klient k, h_miesiac_wyp m
WHERE
    wy.wyp_alnia_id (+)= zag.wyp_alnia_id
    AND m.miesiac_wyp_id (+)= zag.miesiac_wyp_id
    AND k.klient_id (+)= zag.klient_id;

--8
SELECT
    p.imie AS imie,
    p.nazwisko AS nazwisko,
    wy.nazwa_wyp AS wypozyczalnia,
    r.rok AS rok,
    zag.liczba_wypozyczen
FROM(
    SELECT
        p.pracownik_id,
        wy.wyp_alnia_id,
        r.rok_wyp_id,
        COUNT(w.wyp_enia_id) AS liczba_wypozyczen
    FROM h_wypozyczenia w, h_wypozyczalnia wy, h_pracownik p, h_rok_wyp r
    WHERE wy.wyp_alnia_id = w.h_wypozyczalnia_wyp_alnia_id
      AND p.pracownik_id = w.h_pracownik_pracownik_id
      AND r.rok_wyp_id = w.h_rok_wyp_rok_wyp_id
      group by r.rok_wyp_id, wy.wyp_alnia_id, p.pracownik_id
) zag, h_wypozyczalnia wy, h_pracownik p, h_rok_wyp r
WHERE
    wy.wyp_alnia_id (+)= zag.wyp_alnia_id
    AND r.rok_wyp_id (+)= zag.rok_wyp_id
    AND p.pracownik_id (+)= zag.pracownik_id;

--9
SELECT
    wy.nazwa_wyp AS wypozyczalnia,
    t.rodzaj AS rodzaj,
    r.rok AS rok,
    zag.liczba_wypozyczen
FROM(
    SELECT
        wy.wyp_alnia_id,
        t.typ_id,
        r.rok_wyp_id,
        COUNT(w.wyp_enia_id) AS liczba_wypozyczen
    FROM h_wypozyczenia w, h_wypozyczalnia wy, h_typ t, h_rok_wyp r
    WHERE wy.wyp_alnia_id = w.h_wypozyczalnia_wyp_alnia_id
      AND r.rok_wyp_id = w.h_rok_wyp_rok_wyp_id
      AND t.typ_id = w.h_typ_typ_id
      group by r.rok_wyp_id, wy.wyp_alnia_id, t.typ_id
) zag, h_wypozyczalnia wy, h_typ t, h_rok_wyp r
WHERE
    wy.wyp_alnia_id (+)= zag.wyp_alnia_id
    AND r.rok_wyp_id (+)= zag.rok_wyp_id
    AND t.typ_id (+)= zag.typ_id;