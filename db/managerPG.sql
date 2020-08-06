select * from industry;

select quarter from finance where year = 2018;	

select mem.no, mem.email, mem.password, mem.birthday, mem.score, mem.gender, mem.nickname, mem.profile, mem.regdate
from MEMBER mem
order by 1 DESC;

insert into MEMBER (no, email, password, birthday, score, gender, nickname, regdate) 
values(member_seq.nextval, 'AAAA@gmail.com', '1234', '1999-11-11', 1500.0, 'W', 'hellobin', sysdate);
insert into MEMBER (no, email, password, birthday, score, gender, nickname, regdate) 
values(member_seq.nextval, 'BBBB@gmail.com', '1234', '2001-11-11', 1500.0, 'M', 'ohh', sysdate);
insert into MEMBER (no, email, password, birthday, score, gender, nickname, regdate) 
values(member_seq.nextval, 'CCCC@gmail.com', '1234', '1980-11-11', 1500.0, 'M', 'KEy', sysdate);


select count(*) from member;