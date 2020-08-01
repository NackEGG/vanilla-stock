options(skip = 1) 
load data
characterset utf8
infile 'company.tsv'
insert into table company
fields terminated by x'09'
TRAILING NULLCOLS
(dummy1 filler,stock_code, company, dummy2 filler, stock_listed, capital, facevalue, currency, tel, address)