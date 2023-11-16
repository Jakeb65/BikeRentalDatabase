--13
SELECT k.klient_id, wy.wyp_alnia_id AS wypozyczalnia_id, RANK() OVER (ORDER BY COUNT(w.wyp_enia_id) DESC) as rank
FROM h_klient k, h_wypozyczenia w, h_wypozyczalnia wy
WHERE k.klient_id = w.h_klient_klient_id
  AND wy.wyp_alnia_id = w.h_wypozyczalnia_wyp_alnia_id
GROUP BY k.klient_id, wy.wyp_alnia_id
ORDER BY rank ASC;

--14
SELECT p.pracownik_id, wy.wyp_alnia_id AS wypozyczalnia_id, RANK() OVER (ORDER BY COUNT(*) DESC) as rank
FROM h_pracownik p, h_wypozyczenia w, h_wypozyczalnia wy
WHERE p.pracownik_id = w.h_pracownik_pracownik_id
  AND wy.wyp_alnia_id = w.h_wypozyczalnia_wyp_alnia_id
GROUP BY p.pracownik_id, wy.wyp_alnia_id
ORDER BY rank, p.pracownik_id ASC;

--15
SELECT
    t.typ_id, wy.wyp_alnia_id, RANK() OVER (ORDER BY COUNT(w.wyp_enia_id) DESC) as rank
FROM
    h_typ t, h_rower r, h_wypozyczenia w, h_wypozyczalnia wy
WHERE
    wy.wyp_alnia_id = w.h_wypozyczalnia_wyp_alnia_id
  AND t.typ_id = w.h_typ_typ_id
  AND r.rower_id = w.h_rower_rower_id
GROUP BY t.typ_id, r.rower_id, w.wyp_enia_id, wy.wyp_alnia_id
ORDER BY rank, wy.wyp_alnia_id ASC;