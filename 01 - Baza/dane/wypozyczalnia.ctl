load data
infile 'F:\projektbazy\wypozyczalnia.csv'
append into table wypozyczalnia
fields terminated by ';'
(wypozyczalnia_id,nazwa_wyp,ulica_ulica_id)