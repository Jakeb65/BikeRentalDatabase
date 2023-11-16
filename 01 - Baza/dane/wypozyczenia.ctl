load data
infile 'F:\projektbazy\wypozyczenia.csv'
append into table wypozyczenia
fields terminated by ';'
(wypozyczenia_id,data_wypozyczenia,data_zwrotu,koszt_wypozyczenia,rower_rower_id,wypozyczalnia_wypozyczalnia_id,klient_klient_id,pracownik_pracownik_id)