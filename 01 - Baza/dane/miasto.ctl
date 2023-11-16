load data
infile 'F:\projektbazy\miasto.csv'
append into table miasto
fields terminated by ';'
(miasto_id,miasto,wojewodztwo_woj_id)