load data
infile 'F:\projektbazy\rower.csv'
append into table rower
fields terminated by ';'
(rower_id,rok_produkcji,nr_seryjny,typ_typ_id,kolor_kolor_id,rozmiar_ramy_rozmiar_ramy_id)