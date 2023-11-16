load data
infile 'F:\projektbazy\kolor.csv'
append into table kolor
fields terminated by ';'
(kolor_id,kolor)