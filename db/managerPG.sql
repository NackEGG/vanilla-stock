select no, email, password, birthday, score, utl_raw.cast_to_varchar2(dbms_lob.substr(profile, dbms_lob.getlength(profile))) profile ,gender, nickname, regdate
from MEMBER;


select company, length(company)
from company
order by length(company) desc;

select name, length(name)
from industry
order by length(name) desc;

select tb2.*
from(
select rownum r, tb1.*
from(
select f.no financeNO, f.year financeYEAR, f.quarter financeQuarter, f.stock_code financeStockCode, f.account_code financeAccountCode, fc.account_nm financeAccountName, fc.label_kor financeCateLabelKor, fc.sj_div financeCateSjDiv, f.account_value financeAccountValue, f.regdate financeRegdate, comp.*
from finance f, (select c.stock_code companyStockCode, c.company company, c.industry_no companyIndustryNo, i.name industryName, c.stock_listed companyStockListed, c.capital companyCapital, c.facevalue companyFacevalue, c.currency companyCurrency, c.tel companyTel, 
c.address companyAddress, c.regdate companyRegdate
from company c, industry i 
where c.industry_no = i.no) comp, finance_cate fc
where comp.companyStockCode = f.stock_code and f.account_code = fc.account_id
  and company LIKE '삼성전기'
order by f.year desc, f.quarter desc) tb1) tb2
where tb2.r BETWEEN 1 AND 10;

select rownum as r, x.*
from(
select f.no, f.year, f.quarter, f.stock_code stockCode, f.account_code accountCode, fc.account_nm accountName, fc.label_kor, fc.sj_div, f.account_value accountValue, f.regdate, comp.*
from finance f, (select c.stock_code, c.company, c.industry_no industryNo, i.name industryName, c.stock_listed stockListed, c.capital, c.facevalue, c.currency, c.tel, 
c.address, c.regdate
from company c, industry i 
where c.industry_no = i.no) comp, finance_cate fc
where comp.stock_code = f.stock_code and f.account_code = fc.account_id
order by f.year desc, f.quarter desc ) x;


SELECT *
  FROM 
CREATE OR REPLACE PROCEDURE select_member02 ( search_word in varchar2, sort_type in varchar2, out_cursor out SYS_REFCURSOR)

IS
v_query varchar(1000);
v_search_word MEMBER.email%TYPE := '%'||search_word||'%';

BEGIN
v_query :=    'select m.no, m.email, m.password, m.birthday, m.score, utl_raw.cast_to_varchar2(dbms_lob.substr(m.profile, dbms_lob.getlength(m.profile))) profile ,m.gender, m.nickname, m.regdate,
(select count(c.no) from COMMENTS c where  m.no = c.member_no) as countComments,
(select count(a.no) from  ARTICLE a where m.no = a.member_no) as countArticles' || CHR(13);
v_query := v_query || ' from MEMBER m' || CHR(13);

IF search_word IS NOT NULL THEN
v_query := v_query || ' where m.email like '||''''||v_search_word||''''|| CHR(13);
END IF;

IF sort_type = 'latestMember' THEN
v_query := v_query ||  ' order by m.no DESC';
ELSIF sort_type = 'hardMember' THEN
v_query := v_query || ' order by (countComments+countArticles) DESC, m.no DESC';
END IF;
	OPEN out_cursor FOR v_query;
END;
/


var out_cursor refcursor;
exec select_member02('gmail', 'latestMember', :out_cursor);
print out_cursor



CREATE OR REPLACE PROCEDURE select_member ( search_word in varchar2, sort_type in varchar2, out_cursor out SYS_REFCURSOR)

IS
v_query varchar(1000);
v_search_word MEMBER.email%TYPE := '%' || search_word || '%';

BEGIN
v_query :=    'select m.no, m.email, m.password, m.birthday, m.score, utl_raw.cast_to_varchar2(dbms_lob.substr(m.profile, dbms_lob.getlength(m.profile))) profile ,m.gender, m.nickname, m.regdate,
(select count(mLog.no) from MEMBER_LOG mLog where m.no = mLog.member_no and mLog.action = '||'login'||') as countVisits ,
(select count(c.no) from COMMENTS c where  m.no = c.member_no) as countComments,
(select count(a.no) from  ARTICLE a where m.no = a.member_no) as countArticles' || CHR(13);
v_query := v_query || ' from MEMBER m' || CHR(13);

IF search_word IS NOT NULL THEN
v_query := v_query || ' where m.email like '||''''||v_search_word||''''|| CHR(13);
END IF;

IF sort_type = 'latestMember' THEN
v_query := v_query ||  ' order by m.no DESC';
ELSIF searchWord = 'hardMember' THEN
v_query := v_query || ' order by (countVisits+countComments+countArticles) DESC, m.no DESC';
END IF;

    BEGIN

    -- CURSOR를 리턴 받을때
    EXECUTE IMMEDIATE v_query
        USING search_word, sort_type;
    END;

END;
/

-- select List
-- 최신 가입자순 latestMember
select m.no, m.email, m.password, m.birthday, m.score, utl_raw.cast_to_varchar2(dbms_lob.substr(m.profile, dbms_lob.getlength(m.profile))) profile ,m.gender, m.nickname, m.regdate,
(select count(mLog.no) from MEMBER_LOG mLog where m.no = mLog.member_no and mLog.action = 'login') as 방문수 ,
(select count(c.no) from COMMENTS c where  m.no = c.member_no) as 댓글수,
(select count(a.no) from  ARTICLE a where m.no = a.member_no) as 글개수
from MEMBER m 
where m.email like '%eqd%'
order by m.no DESC;

-- 열혈순 hardMember
select m.no, m.email, m.password, m.birthday, m.score, utl_raw.cast_to_varchar2(dbms_lob.substr(m.profile, dbms_lob.getlength(m.profile))) profile ,m.gender, m.nickname, m.regdate,
(select count(mLog.no) from MEMBER_LOG mLog where m.no = mLog.member_no and mLog.action = 'login') as countVisits ,
(select count(c.no) from COMMENTS c where  m.no = c.member_no) as countComments,
(select count(a.no) from  ARTICLE a where m.no = a.member_no) as countArticles
from MEMBER m 
where m.email like '%AAAA@gmail.com%'
order by (countVisits+countComments+countArticles) DESC, m.no DESC;

-- insert Member_Log
insert into MEMBER_LOG(no, member_no, screen, action, regdate) values(member_log_seq.nextval, 1, 'session', 'login',sysdate);
insert into MEMBER_LOG(no, member_no, screen, action, regdate) values(member_log_seq.nextval, 2, 'session', 'login',sysdate);
insert into MEMBER_LOG(no, member_no, screen, action, regdate) values(member_log_seq.nextval, 3, 'session', 'login',sysdate);
insert into MEMBER_LOG(no, member_no, screen, action, regdate) values(member_log_seq.nextval, 4, 'session', 'login',sysdate);
insert into MEMBER_LOG(no, member_no, screen, action, regdate) values(member_log_seq.nextval, 5, 'session', 'login',sysdate);
insert into MEMBER_LOG(no, member_no, screen, action, regdate) values(member_log_seq.nextval, 6, 'session', 'login',sysdate);
insert into MEMBER_LOG(no, member_no, screen, action, regdate) values(member_log_seq.nextval, 7, 'session', 'login',sysdate);
insert into MEMBER_LOG(no, member_no, screen, action, regdate) values(member_log_seq.nextval, 8, 'session', 'login',sysdate);
insert into MEMBER_LOG(no, member_no, screen, action, regdate) values(member_log_seq.nextval, 9, 'session', 'login',sysdate);
insert into MEMBER_LOG(no, member_no, screen, action, regdate) values(member_log_seq.nextval, 10, 'session', 'login',sysdate);
insert into MEMBER_LOG(no, member_no, screen, action, regdate) values(member_log_seq.nextval, 11, 'session', 'login',sysdate);
insert into MEMBER_LOG(no, member_no, screen, action, regdate) values(member_log_seq.nextval, 12, 'session', 'login',sysdate);
insert into MEMBER_LOG(no, member_no, screen, action, regdate) values(member_log_seq.nextval, 13, 'session', 'login',sysdate);
insert into MEMBER_LOG(no, member_no, screen, action, regdate) values(member_log_seq.nextval, 14, 'session', 'login',sysdate);
insert into MEMBER_LOG(no, member_no, screen, action, regdate) values(member_log_seq.nextval, 15, 'session', 'login',sysdate);
insert into MEMBER_LOG(no, member_no, screen, action, regdate) values(member_log_seq.nextval, 16, 'session', 'login',sysdate);
insert into MEMBER_LOG(no, member_no, screen, action, regdate) values(member_log_seq.nextval, 17, 'session', 'login',sysdate);
insert into MEMBER_LOG(no, member_no, screen, action, regdate) values(member_log_seq.nextval, 18, 'session', 'login',sysdate);
insert into MEMBER_LOG(no, member_no, screen, action, regdate) values(member_log_seq.nextval, 19, 'session', 'login',sysdate);
insert into MEMBER_LOG(no, member_no, screen, action, regdate) values(member_log_seq.nextval, 20, 'session', 'login',sysdate);
insert into MEMBER_LOG(no, member_no, screen, action, regdate) values(member_log_seq.nextval, 21, 'session', 'login',sysdate);
insert into MEMBER_LOG(no, member_no, screen, action, regdate) values(member_log_seq.nextval, 22, 'session', 'login',sysdate);
insert into MEMBER_LOG(no, member_no, screen, action, regdate) values(member_log_seq.nextval, 23, 'session', 'login',sysdate);
insert into MEMBER_LOG(no, member_no, screen, action, regdate) values(member_log_seq.nextval, 24, 'session', 'login',sysdate);
insert into MEMBER_LOG(no, member_no, screen, action, regdate) values(member_log_seq.nextval, 25, 'session', 'login',sysdate);

select count(*) from MEMBER_LOG;

--TEST
select * from industry;

select quarter from finance where year = 2018;	

select mem.no, mem.email, mem.password, mem.birthday, mem.score, utl_raw.cast_to_varchar2(dbms_lob.substr(mem.profile, dbms_lob.getlength(mem.profile))) profile ,mem.gender, mem.nickname, mem.regdate
from MEMBER mem
order by 1 DESC;


select *
from MEMBER mem
order by 1 DESC;

insert into MEMBER (no, email, password, birthday, score, gender, nickname, regdate) 
values(member_seq.nextval, 'AAAA@gmail.com', '1234', '1999-11-11', 1500.0, 'W', 'hellobin', sysdate);
insert into MEMBER (no, email, password, birthday, score, gender, nickname, regdate) 
values(member_seq.nextval, 'BBBB@gmail.com', '1234', '2001-11-11', 1500.0, 'M', 'ohh', sysdate);
insert into MEMBER (no, email, password, birthday, score, gender, nickname, regdate) 
values(member_seq.nextval, 'CCCC@gmail.com', '1234', '1980-11-11', 1500.0, 'M', 'KEy', sysdate);

update MEMBER set profile = RAWTOHEX('/profile/default.png') where profile IS NULL;

select SYS.DBMS_LOB.GETLENGTH(profile) profile
from MEMBER
where profile IS NULL; 

select SYS.DBMS_LOB.GETLENGTH(profile) profile
from MEMBER;

select count(no)
from MEMBER
where profile IS NULL; 

select count(*) from member;