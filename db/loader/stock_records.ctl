options(errors = 9999999999)
load data
characterset utf8
infile 'stock_records.tsv'
insert into table stock_records
fields terminated by x'09'
TRAILING NULLCOLS
(stock_code, t_date, open, high, low, close, volume, adj_close, no "stock_records_seq.nextval")