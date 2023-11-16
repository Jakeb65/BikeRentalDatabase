load data
infile 'F:\projektbazy\klient.csv'
append into table klient
fields terminated by ';'
(klient_id,imie,nazwisko,nr_telefonu,nr_budynku,nr_mieszkania,kod_pocztowy,ulica_ulica_id)