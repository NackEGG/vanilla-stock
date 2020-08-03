options(errors = 9999999999)
load data
characterset utf8
infile 'finance.tsv'
insert into table finance
fields terminated by x'09'
TRAILING NULLCOLS
(year, quarter, stock_code, account_code, account_value, regdate "sysdate", no "finance_seq.nextval")