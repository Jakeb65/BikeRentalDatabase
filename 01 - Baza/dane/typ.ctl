load data
infile 'F:\projektbazy\typ.csv'
append into table typ
fields terminated by ';'
(typ_id,rodzaj,marka_marka_id)