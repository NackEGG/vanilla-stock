/*COMMENTS테이블 CONTENT부분 VARCHAR2(1024)로 변경*/
Alter table comments modify(content varchar2(1024));

/*MEMBER*/

Insert into member(no, email, password, birthday, score, gender, nickname, regdate) values(1, 'yenayena@naver.com', 'admin1234', to_date('12-25-2018','MM-DD-YYYY'), 300.50, 'W', '넘넘', sysdate);

Insert into member(no,email, password, birthday, score, gender, nickname, regdate) values(2,'fefev@naver.com',  'admin12345', to_date('12-25-2018','MM-DD-YYYY'), 900.50, 'W', '야야', sysdate);

Insert into member(no,email, password, birthday, score, gender, nickname, regdate) values(3,'qkqhekdi@naver.com',  'admin123456', to_date('07-12-2018','MM-DD-YYYY'), 900.50, 'W', '호호', sysdate);

Insert into member(no,email, password, birthday, score, gender, nickname, regdate) values(4,'difijidmif@naver.com',  'admin123456', to_date('07-12-2018','MM-DD-YYYY'), 900.50, 'W', '노', sysdate);

Insert into member(no,email, password, birthday, score, gender, nickname, regdate) values(5,'eifvvmif@naver.com',  'admin456', to_date('06-12-2000','MM-DD-YYYY'), 1200.50, 'M', '사지마', sysdate);

Insert into member(no,email, password, birthday, score, gender, nickname, regdate) values(6,'eivid1233@naver.com',  'admin456', to_date('07-12-2000','MM-DD-YYYY'), 470.50, 'M', '호호', sysdate);

Insert into member(no,email, password, birthday, score, gender, nickname, regdate) values(7,'eidf1233@naver.com',  'admin456', to_date('07-12-2000','MM-DD-YYYY'), 470.50, 'M', '라라', sysdate);

Insert into member(no,email, password, birthday, score, gender, nickname, regdate) values(8,'eqdf12dfdf3@naver.com',  'admin3456', to_date('07-31-2000','MM-DD-YYYY'), 876.00, 'W', '매매', sysdate);

Insert into member(no,email, password, birthday, score, gender, nickname, regdate) values(9,'eqdf12dfdf3@naver.com',  'admin34056', to_date('02-23-2000','MM-DD-YYYY'), 876.00, 'M', '고양이', sysdate);

Insert into member(no,email, password, birthday, score, gender, nickname, regdate) values(10,'eqddfdf3@naver.com',  'admin3456', to_date('01-29-2000','MM-DD-YYYY'), 876.00, 'W', '다빈', sysdate);

Insert into member(no,email, password, birthday, score, gender, nickname, regdate) values(11,'aeqdf1fdf3@naver.com',  'admin3456', to_date('04-29-2000','MM-DD-YYYY'), 876.00, 'W', '노루', sysdate);

Insert into member(no,email, password, birthday, score, gender, nickname, regdate) values(12,'weqdf12dfdf3@naver.com',  'admin3456', to_date('05-29-2000','MM-DD-YYYY'), 76.00, 'W', '바나프레소', sysdate);

Insert into member(no,email, password, birthday, score, gender, nickname, regdate) values(13,'eeqdf12dfdf3@naver.com',  'admin3456', to_date('06-29-2000','MM-DD-YYYY'), 976.00, 'W', '예나', sysdate);

Insert into member(no,email, password, birthday, score, gender, nickname, regdate) values(14,'eqdf1df3@naver.com',  'admin3456', to_date('07-29-2000','MM-DD-YYYY'), 1176.00, 'W', '석채', sysdate);

Insert into member(no,email, password, birthday, score, gender, nickname, regdate) values(15,'eq1df12dfdf3@naver.com',  'admin3456', to_date('08-29-2000','MM-DD-YYYY'), 8176.00, 'W', '강사님', sysdate);

Insert into member(no,email, password, birthday, score, gender, nickname, regdate) values(16,'12eqdf12dfdf3@naver.com',  'admin3456', to_date('09-29-2000','MM-DD-YYYY'), 8276.00, 'W', '영', sysdate);

Insert into member(no,email, password, birthday, score, gender, nickname, regdate) values(17,'13eqdffdf3@naver.com',  'admin3456', to_date('10-29-2000','MM-DD-YYYY'), 1876.00, 'M', '노래', sysdate);

Insert into member(no,email, password, birthday, score, gender, nickname, regdate) values(18,'14eqdfdf3@naver.com',  'admin3456', to_date('11-29-2000','MM-DD-YYYY'), 6876.00, 'W', '트와이스', sysdate);

Insert into member(no,email, password, birthday, score, gender, nickname, regdate) values(19,'15eqdf12dfdf3@naver.com',  'admin3456', to_date('01-02-1992','MM-DD-YYYY'), 3876.00, 'W', '라붐', sysdate);

Insert into member(no,email, password, birthday, score, gender, nickname, regdate) values(20,'16eqdf1f3@naver.com',  'admin3456', to_date('01-03-1993','MM-DD-YYYY'), 4876.00, 'M', '뱀뱀', sysdate);

Insert into member(no,email, password, birthday, score, gender, nickname, regdate) values(21,'eqdf12dfdf3@naver.com',  'admin3456', to_date('01-04-1994','MM-DD-YYYY'), 8876.00, 'W', '아이유', sysdate);


/*ARTICLE*/

Insert into article (no, title, stock_code, member_no,regdate) values (1, '흥국화재 투기방', '000540', 1, sysdate);
Insert into article (no, title, stock_code, member_no,regdate) values (2, 's&T 투기방', '036530', 2, sysdate);
Insert into article (no, title, stock_code, member_no,regdate) values (3, 'SBS미디어홀딩 투기방', '101060', 3, sysdate);
Insert into article (no, title, stock_code, member_no,regdate) values (4, 'SK케미칼 투기방', '285130', 4, sysdate);
Insert into article (no, title, stock_code, member_no,regdate) values (5, 'SM C&C 투기방', '048550', 5, sysdate);
Insert into article (no, title, stock_code, member_no,regdate) values (6, '가온미디어 투기방', '078890', 6, sysdate);
Insert into article (no, title, stock_code, member_no,regdate) values (7, '경남스틸 투기방', '039240', 7, sysdate);
Insert into article (no, title, stock_code, member_no,regdate) values (8, '경인양행 투기방', '012610', 8, sysdate);
Insert into article (no, title, stock_code, member_no,regdate) values (9, '넥슨지티 투기방', '041140', 9, sysdate);
Insert into article (no, title, stock_code, member_no,regdate) values (10, '녹십자홀딩스 투기방', '005250', 10, sysdate);

/*PICK*/
Insert into pick(no, opinion, member_no, article_no, regdate) values(1, 'Y', 1, 2, sysdate);
Insert into pick(no, opinion, member_no, article_no, regdate) values(2, 'N', 2, 2, sysdate);
Insert into pick(no, opinion, member_no, article_no, regdate) values(3, 'Y', 3, 2, sysdate);
Insert into pick(no, opinion, member_no, article_no, regdate) values(4, 'Y', 4, 3, sysdate);
Insert into pick(no, opinion, member_no, article_no, regdate) values(5, 'N', 5, 3, sysdate);
Insert into pick(no, opinion, member_no, article_no, regdate) values(6, 'N', 6, 3, sysdate);
Insert into pick(no, opinion, member_no, article_no, regdate) values(7, 'N', 7, 3, sysdate);
Insert into pick(no, opinion, member_no, article_no, regdate) values(8, 'Y', 8, 4, sysdate);
Insert into pick(no, opinion, member_no, article_no, regdate) values(9, 'Y', 9, 4, sysdate);
Insert into pick(no, opinion, member_no, article_no, regdate) values(10, 'Y', 10, 4, sysdate);

Insert into pick(no, opinion, member_no, article_no, regdate) values(11, 'N', 11, 5, sysdate);
Insert into pick(no, opinion, member_no, article_no, regdate) values(12, 'Y', 12, 5, sysdate);
Insert into pick(no, opinion, member_no, article_no, regdate) values(13, 'N', 13, 6, sysdate);
Insert into pick(no, opinion, member_no, article_no, regdate) values(14, 'Y', 14, 6, sysdate);
Insert into pick(no, opinion, member_no, article_no, regdate) values(15, 'Y', 15, 6, sysdate);
Insert into pick(no, opinion, member_no, article_no, regdate) values(16, 'Y', 16, 7, sysdate);
Insert into pick(no, opinion, member_no, article_no, regdate) values(17, 'Y', 17, 7, sysdate);
Insert into pick(no, opinion, member_no, article_no, regdate) values(18, 'N', 18, 7, sysdate);
Insert into pick(no, opinion, member_no, article_no, regdate) values(19, 'Y', 19, 8, sysdate);
Insert into pick(no, opinion, member_no, article_no, regdate) values(20, 'Y', 20, 8, sysdate);



/*COMMENTS*/
insert into comments values(1, 1, 1, '살거야' , sysdate);
insert into comments values(2, 1, 2, '안살거야' , sysdate);
insert into comments values(3, 3, 2, '어쩌라는거지이이' , sysdate);
insert into comments values(4, 4, 3, '사라는거야 말라는거야' , sysdate);
insert into comments values(5, 5, 3, '이거 팔아야되나요 말아야하나요' , sysdate);
insert into comments values(6, 6, 3, '퇴근하고 싶어요!!!!!!!' , sysdate);
insert into comments values(7, 7, 3, '사든 말든' , sysdate);
insert into comments values(8, 8, 4, '관심 없음' , sysdate);
insert into comments values(9, 9, 4, '이럴거야 저럴거야 뭐할거야' , sysdate);
insert into comments values(10, 10, 4, '하기실허엉어어어ㅓㅇ어' , sysdate);
insert into comments values(11, 11, 5, '이거 안사면 어떡하죠?!!!!!' , sysdate);

insert into comments values(12, 12, 5, '어떡해여어어어어' , sysdate);
insert into comments values(13, 13, 6, '나도 비오기전에 집가고싶다아아아 그래서 이거 사나요?' , sysdate);


