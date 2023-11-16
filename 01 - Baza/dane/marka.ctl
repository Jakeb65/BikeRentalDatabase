load data
infile 'F:\projektbazy\marka.csv'
append into table marka
fields terminated by ';'
(marka_id,marka,model_model_id)