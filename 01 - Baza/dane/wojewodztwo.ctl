load data
infile 'F:\projektbazy\wojewodztwo.csv'
append into table wojewodztwo
fields terminated by ';'
(woj_id,wojewodztwo)