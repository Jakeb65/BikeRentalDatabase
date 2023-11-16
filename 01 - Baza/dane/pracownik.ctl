load data
infile 'F:\projektbazy\pracownik.csv'
append into table pracownik
fields terminated by ';'
(pracownik_id,imie,nazwisko,data_zatrudnienia,ulica_ulica_id,funkcja_funkcja_id)