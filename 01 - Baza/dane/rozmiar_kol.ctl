load data
infile 'F:\projektbazy\rozmiar_kol.csv'
append into table rozmiar_kol
fields terminated by ';'
(rozmiar_kol_id,rozmiar_kol)