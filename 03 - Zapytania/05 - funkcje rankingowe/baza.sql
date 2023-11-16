--13
ranking klientów którzy wykonali najwiecej wyp dla danego sklepu
SELECT k.klient_id, wy.wypozyczalnia_id, RANK() OVER (ORDER BY COUNT(w.wypozyczenia_id) DESC) as rank
FROM klient k, wypozyczenia w, wypozyczalnia wy
WHERE k.klient_id = w.klient_klient_id
  AND wy.wypozyczalnia_id = w.wypozyczalnia_wypozyczalnia_id
GROUP BY k.klient_id, wy.wypozyczalnia_id
ORDER BY rank ASC;

--14
ranking pracow którzy zrealizowali najwiecej zlecen dla danej wypozyczalni
SELECT p.pracownik_id, wy.wypozyczalnia_id, RANK() OVER (ORDER BY COUNT(*) DESC) as rank
FROM pracownik p, wypozyczenia w, wypozyczalnia wy
WHERE p.pracownik_id = w.pracownik_pracownik_id
  AND wy.wypozyczalnia_id = w.wypozyczalnia_wypozyczalnia_id
GROUP BY p.pracownik_id, wy.wypozyczalnia_id
ORDER BY rank, p.pracownik_id ASC;

--15
ranking wypozyczen kazdego typu roweru dla wszystkich wypozyczalni
SELECT
    t.typ_id, wy.wypozyczalnia_id, RANK() OVER (ORDER BY COUNT(w.wypozyczenia_id) DESC) as rank
FROM
    typ t, rower r, wypozyczenia w, wypozyczalnia wy
WHERE
    wy.wypozyczalnia_id = w.wypozyczalnia_wypozyczalnia_id
  AND t.typ_id = r.typ_typ_id
  AND r.rower_id = w.rower_rower_id
GROUP BY t.typ_id, r.rower_id, w.wypozyczenia_id, wy.wypozyczalnia_id
ORDER BY rank, wy.wypozyczalnia_id ASC;