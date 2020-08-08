/*COMMENTS테이블 CONTENT부분 VARCHAR2(1024)로 변경*/
Alter table comments modify(content varchar2(1024));

/*MEMBER*/

Insert into member(no, email, password, birthday, score, gender, nickname, regdate) values(member_seq.nextval, 'yenayena@naver.com', 'admin1234', to_date('12-25-2018','MM-DD-YYYY'), 300.50, 'W', '넘넘', sysdate);

Insert into member(no,email, password, birthday, score, gender, nickname, regdate) values(member_seq.nextval,'fefev@naver.com',  'admin12345', to_date('12-25-2018','MM-DD-YYYY'), 900.50, 'W', '야야', sysdate);

Insert into member(no,email, password, birthday, score, gender, nickname, regdate) values(member_seq.nextval,'qkqhekdi@naver.com',  'admin123456', to_date('07-12-2018','MM-DD-YYYY'), 900.50, 'W', '호호', sysdate);

Insert into member(no,email, password, birthday, score, gender, nickname, regdate) values(member_seq.nextval,'difijidmif@naver.com',  'admin123456', to_date('07-12-2018','MM-DD-YYYY'), 900.50, 'W', '노', sysdate);

Insert into member(no,email, password, birthday, score, gender, nickname, regdate) values(member_seq.nextval,'eifvvmif@naver.com',  'admin456', to_date('06-12-2000','MM-DD-YYYY'), 1200.50, 'M', '사지마', sysdate);

Insert into member(no,email, password, birthday, score, gender, nickname, regdate) values(member_seq.nextval,'eivid1233@naver.com',  'admin456', to_date('07-12-2000','MM-DD-YYYY'), 470.50, 'M', '호호', sysdate);

Insert into member(no,email, password, birthday, score, gender, nickname, regdate) values(member_seq.nextval,'eidf1233@naver.com',  'admin456', to_date('07-12-2000','MM-DD-YYYY'), 470.50, 'M', '라라', sysdate);

Insert into member(no,email, password, birthday, score, gender, nickname, regdate) values(member_seq.nextval,'eqdf12dfdf3@naver.com',  'admin3456', to_date('07-31-2000','MM-DD-YYYY'), 876.00, 'W', '매매', sysdate);

Insert into member(no,email, password, birthday, score, gender, nickname, regdate) values(member_seq.nextval,'eqdf12dfdf3@naver.com',  'admin34056', to_date('02-23-2000','MM-DD-YYYY'), 876.00, 'M', '고양이', sysdate);

Insert into member(no,email, password, birthday, score, gender, nickname, regdate) values(member_seq.nextval,'eqddfdf3@naver.com',  'admin3456', to_date('01-29-2000','MM-DD-YYYY'), 876.00, 'W', '다빈', sysdate);

Insert into member(no,email, password, birthday, score, gender, nickname, regdate) values(member_seq.nextval,'aeqdf1fdf3@naver.com',  'admin3456', to_date('04-29-2000','MM-DD-YYYY'), 876.00, 'W', '노루', sysdate);

Insert into member(no,email, password, birthday, score, gender, nickname, regdate) values(member_seq.nextval,'weqdf12dfdf3@naver.com',  'admin3456', to_date('05-29-2000','MM-DD-YYYY'), 76.00, 'W', '바나프레소', sysdate);

Insert into member(no,email, password, birthday, score, gender, nickname, regdate) values(member_seq.nextval,'eeqdf12dfdf3@naver.com',  'admin3456', to_date('06-29-2000','MM-DD-YYYY'), 976.00, 'W', '예나', sysdate);

Insert into member(no,email, password, birthday, score, gender, nickname, regdate) values(member_seq.nextval,'eqdf1df3@naver.com',  'admin3456', to_date('07-29-2000','MM-DD-YYYY'), 1176.00, 'W', '석채', sysdate);

Insert into member(no,email, password, birthday, score, gender, nickname, regdate) values(member_seq.nextval,'eq1df12dfdf3@naver.com',  'admin3456', to_date('08-29-2000','MM-DD-YYYY'), 8176.00, 'W', '강사님', sysdate);

Insert into member(no,email, password, birthday, score, gender, nickname, regdate) values(member_seq.nextval,'12eqdf12dfdf3@naver.com',  'admin3456', to_date('09-29-2000','MM-DD-YYYY'), 8276.00, 'W', '영', sysdate);

Insert into member(no,email, password, birthday, score, gender, nickname, regdate) values(member_seq.nextval,'13eqdffdf3@naver.com',  'admin3456', to_date('10-29-2000','MM-DD-YYYY'), 1876.00, 'M', '노래', sysdate);

Insert into member(no,email, password, birthday, score, gender, nickname, regdate) values(member_seq.nextval,'14eqdfdf3@naver.com',  'admin3456', to_date('11-29-2000','MM-DD-YYYY'), 6876.00, 'W', '트와이스', sysdate);

Insert into member(no,email, password, birthday, score, gender, nickname, regdate) values(member_seq.nextval,'15eqdf12dfdf3@naver.com',  'admin3456', to_date('01-02-1992','MM-DD-YYYY'), 3876.00, 'W', '라붐', sysdate);

Insert into member(no,email, password, birthday, score, gender, nickname, regdate) values(member_seq.nextval,'16eqdf1f3@naver.com',  'admin3456', to_date('01-03-1993','MM-DD-YYYY'), 4876.00, 'M', '뱀뱀', sysdate);

Insert into member(no,email, password, birthday, score, gender, nickname, regdate) values(member_seq.nextval,'eqdf12dfdf3@naver.com',  'admin3456', to_date('01-04-1994','MM-DD-YYYY'), 8876.00, 'W', '아이유', sysdate);


/*ARTICLE*/

Insert into article (no, title, stock_code, member_no,regdate) values (article_seq.nextval, '흥국화재 투기방', '000540', 1, sysdate);
Insert into article (no, title, stock_code, member_no,regdate) values (article_seq.nextval, 's&T 투기방', '036530', 2, sysdate);
Insert into article (no, title, stock_code, member_no,regdate) values (article_seq.nextval, 'SBS미디어홀딩 투기방', '101060', 3, sysdate);
Insert into article (no, title, stock_code, member_no,regdate) values (article_seq.nextval, 'SK케미칼 투기방', '285130', 4, sysdate);
Insert into article (no, title, stock_code, member_no,regdate) values (article_seq.nextval, 'SM C&C 투기방', '048550', 5, sysdate);
Insert into article (no, title, stock_code, member_no,regdate) values (article_seq.nextval, '가온미디어 투기방', '078890', 6, sysdate);
Insert into article (no, title, stock_code, member_no,regdate) values (article_seq.nextval, '경남스틸 투기방', '039240', 7, sysdate);
Insert into article (no, title, stock_code, member_no,regdate) values (article_seq.nextval, '경인양행 투기방', '012610', 8, sysdate);
Insert into article (no, title, stock_code, member_no,regdate) values (article_seq.nextval, '넥슨지티 투기방', '041140', 9, sysdate);
Insert into article (no, title, stock_code, member_no,regdate) values (article_seq.nextval, '녹십자홀딩스 투기방', '005250', 10, sysdate);

/*PICK*/
Insert into pick(no, opinion, member_no, article_no, regdate) values(pick_seq.nextval, 'Y', 1, 2, sysdate);
Insert into pick(no, opinion, member_no, article_no, regdate) values(pick_seq.nextval, 'N', 2, 2, sysdate);
Insert into pick(no, opinion, member_no, article_no, regdate) values(pick_seq.nextval, 'Y', 3, 2, sysdate);
Insert into pick(no, opinion, member_no, article_no, regdate) values(pick_seq.nextval, 'Y', 4, 3, sysdate);
Insert into pick(no, opinion, member_no, article_no, regdate) values(pick_seq.nextval, 'N', 5, 3, sysdate);
Insert into pick(no, opinion, member_no, article_no, regdate) values(pick_seq.nextval, 'N', 6, 3, sysdate);
Insert into pick(no, opinion, member_no, article_no, regdate) values(pick_seq.nextval, 'N', 7, 3, sysdate);
Insert into pick(no, opinion, member_no, article_no, regdate) values(pick_seq.nextval, 'Y', 8, 4, sysdate);
Insert into pick(no, opinion, member_no, article_no, regdate) values(pick_seq.nextval, 'Y', 9, 4, sysdate);
Insert into pick(no, opinion, member_no, article_no, regdate) values(pick_seq.nextval, 'Y', 10, 4, sysdate);

Insert into pick(no, opinion, member_no, article_no, regdate) values(pick_seq.nextval, 'N', 11, 5, sysdate);
Insert into pick(no, opinion, member_no, article_no, regdate) values(pick_seq.nextval, 'Y', 12, 5, sysdate);
Insert into pick(no, opinion, member_no, article_no, regdate) values(pick_seq.nextval, 'N', 13, 6, sysdate);
Insert into pick(no, opinion, member_no, article_no, regdate) values(pick_seq.nextval, 'Y', 14, 6, sysdate);
Insert into pick(no, opinion, member_no, article_no, regdate) values(pick_seq.nextval, 'Y', 15, 6, sysdate);
Insert into pick(no, opinion, member_no, article_no, regdate) values(pick_seq.nextval, 'Y', 16, 7, sysdate);
Insert into pick(no, opinion, member_no, article_no, regdate) values(pick_seq.nextval, 'Y', 17, 7, sysdate);
Insert into pick(no, opinion, member_no, article_no, regdate) values(pick_seq.nextval, 'N', 18, 7, sysdate);
Insert into pick(no, opinion, member_no, article_no, regdate) values(pick_seq.nextval, 'Y', 19, 8, sysdate);
Insert into pick(no, opinion, member_no, article_no, regdate) values(pick_seq.nextval, 'Y', 20, 8, sysdate);



/*COMMENTS*/
insert into comments values(comments_seq.nextval, 1, 1, '살거야' , sysdate);
insert into comments values(comments_seq.nextval, 1, 2, '안살거야' , sysdate);
insert into comments values(comments_seq.nextval, 3, 2, '어쩌라는거지이이' , sysdate);
insert into comments values(comments_seq.nextval, 4, 3, '사라는거야 말라는거야' , sysdate);
insert into comments values(comments_seq.nextval, 5, 3, '이거 팔아야되나요 말아야하나요' , sysdate);
insert into comments values(comments_seq.nextval, 6, 3, '퇴근하고 싶어요!!!!!!!' , sysdate);
insert into comments values(comments_seq.nextval, 7, 3, '사든 말든' , sysdate);
insert into comments values(comments_seq.nextval, 8, 4, '관심 없음' , sysdate);
insert into comments values(comments_seq.nextval, 9, 4, '이럴거야 저럴거야 뭐할거야' , sysdate);
insert into comments values(comments_seq.nextval, 10, 4, '하기실허엉어어어ㅓㅇ어' , sysdate);
insert into comments values(comments_seq.nextval, 11, 5, '이거 안사면 어떡하죠?!!!!!' , sysdate);

insert into comments values(comments_seq.nextval, 12, 5, '어떡해여어어어어' , sysdate);
insert into comments values(comments_seq.nextval, 13, 6, '나도 비오기전에 집가고싶다아아아 그래서 이거 사나요?' , sysdate);


