/* 테이블 삭제 */
DROP TABLE MEMBER CASCADE CONSTRAINTS;
DROP TABLE MEMBER_INFO CASCADE CONSTRAINTS;
DROP TABLE STOCK_RECORDS CASCADE CONSTRAINTS;
DROP TABLE INDUSTRY CASCADE CONSTRAINTS;
DROP TABLE COMPANY CASCADE CONSTRAINTS;
DROP TABLE FINANCE CASCADE CONSTRAINTS;
DROP TABLE ACCOUNT CASCADE CONSTRAINTS;
DROP TABLE ARENA CASCADE CONSTRAINTS;
DROP TABLE COMMENTS CASCADE CONSTRAINTS;
DROP TABLE PICK CASCADE CONSTRAINTS;
DROP TABLE LIKES CASCADE CONSTRAINTS;
DROP TABLE ANNOUNCEMENT CASCADE CONSTRAINTS;

/* 시퀀스 삭제 */
DROP SEQUENCE MEMBER_SEQ;
DROP SEQUENCE ANNOUNCEMENT_SEQ;
DROP SEQUENCE ARENA_SEQ;
DROP SEQUENCE COMMENTS_SEQ;
DROP SEQUENCE FINANCE_SEQ;

/* 시퀀스 생성 */
CREATE SEQUENCE MEMBER_SEQ
START with 1
INCREMENT by 1
MAXVALUE 9999999999999999999
MINVALUE 1
NOCACHE
NOCYCLE
NOORDER;

CREATE SEQUENCE ANNOUNCEMENT_SEQ
START with 1
INCREMENT by 1
MAXVALUE 9999999999999999999
MINVALUE 1
NOCACHE
NOCYCLE
NOORDER;

CREATE SEQUENCE ARENA_SEQ
START with 1
INCREMENT by 1
MAXVALUE 9999999999999999999
MINVALUE 1
NOCACHE
NOCYCLE
NOORDER;

CREATE SEQUENCE COMMENTS_SEQ
START with 1
INCREMENT by 1
MAXVALUE 9999999999999999999
MINVALUE 1
NOCACHE
NOCYCLE
NOORDER;

CREATE SEQUENCE FINANCE_SEQ
START with 1
INCREMENT by 1
MAXVALUE 9999999999999999999
MINVALUE 1
NOCACHE
NOCYCLE
NOORDER;

/* 회원 */
CREATE TABLE MEMBER (
	NO NUMBER NOT NULL, /* 회원번호 */
	TYPE CHAR(1) NOT NULL /* 회원타입 */
);

COMMENT ON TABLE MEMBER IS '회원';

COMMENT ON COLUMN MEMBER.NO IS '회원번호';

COMMENT ON COLUMN MEMBER.TYPE IS '회원타입';

CREATE UNIQUE INDEX PK_MEMBER
	ON MEMBER (
		NO ASC
	);

ALTER TABLE MEMBER
	ADD
		CONSTRAINT PK_MEMBER
		PRIMARY KEY (
			NO
		);
		
ALTER TABLE MEMBER
   ADD 
      CONSTRAINT CHK_MEMBER_TYPE
      CHECK (
         TYPE IN ('M','A','W','S') /* 관리자:M / 활동회원:A / 탈퇴회원:W / 중지회원:S */
      );


/* 회원상세 */
CREATE TABLE MEMBER_INFO (
	NO NUMBER NOT NULL, /* 회원번호 */
	EMAIL VARCHAR2(400) NOT NULL, /* 이메일 */
	PASSWORD VARCHAR2(30) NOT NULL, /* 패스워드 */
	BIRTHDAY DATE NOT NULL, /* 생년월일 */
	GENDER CHAR(1) NOT NULL, /* 성별 */
	NICKNAME VARCHAR2(50) NOT NULL, /* 닉네임 */
	PROFILE BLOB NOT NULL, /* 프로필 */
	REGDATE DATE DEFAULT SYSDATE NOT NULL /* 등록일 */
);

COMMENT ON TABLE MEMBER_INFO IS '회원상세';

COMMENT ON COLUMN MEMBER_INFO.NO IS '회원번호';

COMMENT ON COLUMN MEMBER_INFO.EMAIL IS '이메일';

COMMENT ON COLUMN MEMBER_INFO.PASSWORD IS '패스워드';

COMMENT ON COLUMN MEMBER_INFO.BIRTHDAY IS '생년월일';

COMMENT ON COLUMN MEMBER_INFO.GENDER IS '성별';

COMMENT ON COLUMN MEMBER_INFO.NICKNAME IS '닉네임';

COMMENT ON COLUMN MEMBER_INFO.PROFILE IS '프로필';

COMMENT ON COLUMN MEMBER_INFO.REGDATE IS '등록일';

CREATE UNIQUE INDEX PK_MEMBER_INFO
	ON MEMBER_INFO (
		NO ASC
	);

ALTER TABLE MEMBER_INFO
	ADD
		CONSTRAINT PK_MEMBER_INFO
		PRIMARY KEY (
			NO
		);
		
ALTER TABLE MEMBER_INFO
   ADD 
      CONSTRAINT CHK_MEMBER_INFO_GENDER
      CHECK (
         GENDER IN ('M','W') /* 남:M / 여:W */
      );

/* 공지사항 */
CREATE TABLE ANNOUNCEMENT (
	NO NUMBER NOT NULL, /* 공지사항번호 */
	TITLE VARCHAR2(200) NOT NULL, /* 제목 */
	CONTENT BLOB NOT NULL, /* 내용 */
	REGDATE DATE DEFAULT SYSDATE NOT NULL /* 등록일 */
);

COMMENT ON TABLE ANNOUNCEMENT IS '공지사항';

COMMENT ON COLUMN ANNOUNCEMENT.NO IS '공지사항번호';

COMMENT ON COLUMN ANNOUNCEMENT.TITLE IS '제목';

COMMENT ON COLUMN ANNOUNCEMENT.CONTENT IS '내용';

COMMENT ON COLUMN ANNOUNCEMENT.REGDATE IS '등록일';

CREATE UNIQUE INDEX PK_ANNOUNCEMENT
	ON ANNOUNCEMENT (
		NO ASC
	);

ALTER TABLE ANNOUNCEMENT
	ADD
		CONSTRAINT PK_ANNOUNCEMENT
		PRIMARY KEY (
			NO
		);

/* 업종 */
CREATE TABLE INDUSTRY (
	NO NUMBER NOT NULL, /* 업종번호 */
	NAME VARCHAR2(100) NOT NULL, /* 업종명 */
	REGDATE DATE NOT NULL /* 등록일 */
);

COMMENT ON TABLE INDUSTRY IS '업종';

COMMENT ON COLUMN INDUSTRY.NO IS '업종번호';

COMMENT ON COLUMN INDUSTRY.NAME IS '업종명';

COMMENT ON COLUMN INDUSTRY.REGDATE IS '등록일';

CREATE UNIQUE INDEX PK_INDUSTRY
	ON INDUSTRY (
		NO ASC
	);

ALTER TABLE INDUSTRY
	ADD
		CONSTRAINT PK_INDUSTRY
		PRIMARY KEY (
			NO
		);

/* 회사 */
CREATE TABLE COMPANY (
	CODE VARCHAR2(6) NOT NULL, /* 회사코드 */
	NAME VARCHAR2(100) NOT NULL, /* 회사명 */
	INDUSTRY_NO NUMBER DEFAULT 9999 NOT NULL, /* 업종번호 */
	STOCK_LISTED NUMBER, /* 상장주식수 */
	CAPITAL NUMBER, /* 자본금 */
	FACEVALUE NUMBER, /* 액면가 */
	CURRENCY VARCHAR2(20), /* 통화구분 */
	TEL VARCHAR2(40), /* 대표전화 */
	ADDRESS VARCHAR2(400), /* 주소 */
	REGDATE DATE DEFAULT SYSDATE NOT NULL /* 등록일 */
);

COMMENT ON TABLE COMPANY IS '회사';

COMMENT ON COLUMN COMPANY.CODE IS '회사코드';

COMMENT ON COLUMN COMPANY.NAME IS '회사명';

COMMENT ON COLUMN COMPANY.INDUSTRY_NO IS '업종번호';

COMMENT ON COLUMN COMPANY.STOCK_LISTED IS '상장주식수';

COMMENT ON COLUMN COMPANY.CAPITAL IS '자본금';

COMMENT ON COLUMN COMPANY.FACEVALUE IS '액면가';

COMMENT ON COLUMN COMPANY.CURRENCY IS '통화구분';

COMMENT ON COLUMN COMPANY.TEL IS '대표전화';

COMMENT ON COLUMN COMPANY.ADDRESS IS '주소';

COMMENT ON COLUMN COMPANY.REGDATE IS '등록일';

CREATE UNIQUE INDEX PK_COMPANY
	ON COMPANY (
		CODE ASC
	);

ALTER TABLE COMPANY
	ADD
		CONSTRAINT PK_COMPANY
		PRIMARY KEY (
			CODE
		);

/* 재무정보 */
CREATE TABLE FINANCE (
	NO NUMBER NOT NULL, /* 재무정보번호 */
	YEAR NUMBER NOT NULL, /* 연도 */
	QUARTER NUMBER NOT NULL, /* 분기 */
	COMPANY_CODE VARCHAR2(6) NOT NULL, /* 회사코드 */
	ACCOUNT_CODE VARCHAR2(400) NOT NULL, /* 계정코드 */
	ACCOUNT_VALUE NUMBER, /* 계정값 */
	REGDATE DATE DEFAULT SYSDATE NOT NULL /* 등록일 */)
PARTITION BY RANGE (YEAR)
SUBPARTITION BY LIST (QUARTER)
SUBPARTITION TEMPLATE 
(
	 SUBPARTITION QUARTER_01 VALUES (1) 
	,SUBPARTITION QUARTER_02 VALUES (2)
	,SUBPARTITION QUARTER_03 VALUES (3)
    ,SUBPARTITION QUARTER_04 VALUES (4) 
)
(
	 PARTITION YEAR_2015 VALUES LESS THAN('2016')
	,PARTITION YEAR_2016 VALUES LESS THAN('2017')
    ,PARTITION YEAR_2017 VALUES LESS THAN('2018')
    ,PARTITION YEAR_2018 VALUES LESS THAN('2019')
    ,PARTITION YEAR_2019 VALUES LESS THAN('2020')
    ,PARTITION YEAR_2020 VALUES LESS THAN('2021')
);


COMMENT ON TABLE FINANCE IS '재무정보';

COMMENT ON COLUMN FINANCE.NO IS '재무정보번호';

COMMENT ON COLUMN FINANCE.YEAR IS '연도';

COMMENT ON COLUMN FINANCE.QUARTER IS '분기';

COMMENT ON COLUMN FINANCE.COMPANY_CODE IS '회사코드';

COMMENT ON COLUMN FINANCE.ACCOUNT_CODE IS '계정코드';

COMMENT ON COLUMN FINANCE.ACCOUNT_VALUE IS '계정값';

COMMENT ON COLUMN FINANCE.REGDATE IS '등록일';

CREATE UNIQUE INDEX PK_FINANCE
	ON FINANCE (
		NO ASC
	);

ALTER TABLE FINANCE
	ADD
		CONSTRAINT PK_FINANCE
		PRIMARY KEY (
			NO
		);

/* 계정정보 */
CREATE TABLE ACCOUNT (
	SJ_DIV VARCHAR2(30) NOT NULL, /* 재무제표구분 */
	CODE VARCHAR2(400) NOT NULL, /* 계정코드 */
	NAME VARCHAR2(100) NOT NULL, /* 계정명 */
	BSNS_DE DATE, /* 기준일 */
	LABEL_KOR VARCHAR2(400), /* 한글출력명 */
	LABEL_ENG VARCHAR2(400) /* 영문출력명 */
);

COMMENT ON TABLE ACCOUNT IS '계정정보';

COMMENT ON COLUMN ACCOUNT.SJ_DIV IS '재무제표구분';

COMMENT ON COLUMN ACCOUNT.CODE IS '계정코드';

COMMENT ON COLUMN ACCOUNT.NAME IS '계정명';

COMMENT ON COLUMN ACCOUNT.BSNS_DE IS '기준일';

COMMENT ON COLUMN ACCOUNT.LABEL_KOR IS '한글출력명';

COMMENT ON COLUMN ACCOUNT.LABEL_ENG IS '영문출력명';

CREATE UNIQUE INDEX PK_ACCOUNT
	ON ACCOUNT (
		CODE ASC
	);

ALTER TABLE ACCOUNT
	ADD
		CONSTRAINT PK_ACCOUNT
		PRIMARY KEY (
			CODE
		);

/* 주식정보 */
CREATE TABLE STOCK_RECORDS (
	COMPANY_CODE VARCHAR2(6) NOT NULL, /* 회사코드 */
	T_DATE DATE NOT NULL, /* 등록일 */
	OPEN NUMBER NOT NULL, /* 시가 */
	HIGH NUMBER, /* 고가 */
	LOW NUMBER, /* 저가 */
	CLOSE NUMBER, /* 종가 */
	VOLUME NUMBER, /* 거래량 */
	ADJ_CLOSE NUMBER(20,2) /* 수정주가 */
);

COMMENT ON TABLE STOCK_RECORDS IS '주식정보';

COMMENT ON COLUMN STOCK_RECORDS.COMPANY_CODE IS '회사코드';

COMMENT ON COLUMN STOCK_RECORDS.T_DATE IS '등록일';

COMMENT ON COLUMN STOCK_RECORDS.OPEN IS '시가';

COMMENT ON COLUMN STOCK_RECORDS.HIGH IS '고가';

COMMENT ON COLUMN STOCK_RECORDS.LOW IS '저가';

COMMENT ON COLUMN STOCK_RECORDS.CLOSE IS '종가';

COMMENT ON COLUMN STOCK_RECORDS.VOLUME IS '거래량';

COMMENT ON COLUMN STOCK_RECORDS.ADJ_CLOSE IS '수정주가';

CREATE UNIQUE INDEX PK_STOCK_RECORDS
	ON STOCK_RECORDS (
		COMPANY_CODE ASC,
		T_DATE ASC
	);

ALTER TABLE STOCK_RECORDS
	ADD
		CONSTRAINT PK_STOCK_RECORDS
		PRIMARY KEY (
			COMPANY_CODE,
			T_DATE
		);

/* 투기장 */
CREATE TABLE ARENA (
	NO NUMBER NOT NULL, /* 투기장번호 */
	TITLE VARCHAR2(200) NOT NULL, /* 제목 */
	COMPANY_CODE VARCHAR2(6) NOT NULL, /* 회사코드 */
	MEMBER_NO NUMBER DEFAULT 1, /* 회원번호 */
	REGDATE DATE DEFAULT SYSDATE NOT NULL /* 등록일 */
);

COMMENT ON TABLE ARENA IS '투기장';

COMMENT ON COLUMN ARENA.NO IS '투기장번호';

COMMENT ON COLUMN ARENA.TITLE IS '제목';

COMMENT ON COLUMN ARENA.COMPANY_CODE IS '회사코드';

COMMENT ON COLUMN ARENA.MEMBER_NO IS '회원번호';

COMMENT ON COLUMN ARENA.REGDATE IS '등록일';

CREATE UNIQUE INDEX PK_ARENA
	ON ARENA (
		NO ASC
	);

ALTER TABLE ARENA
	ADD
		CONSTRAINT PK_ARENA
		PRIMARY KEY (
			NO
		);

/* 댓글 */
CREATE TABLE COMMENTS (
	NO NUMBER NOT NULL, /* 댓글번호 */
	MEBMER_NO NUMBER NOT NULL, /* 회원번호 */
	ARENA_NO NUMBER NOT NULL, /* 투기장번호 */
	CONTENT VARCHAR2(1024) NOT NULL, /* 내용 */
	OPINION CHAR(1) NOT NULL, /* 투자의견 */
	REGDATE DATE DEFAULT SYSDATE NOT NULL /* 등록일 */
);

COMMENT ON TABLE COMMENTS IS '댓글';

COMMENT ON COLUMN COMMENTS.NO IS '댓글번호';

COMMENT ON COLUMN COMMENTS.MEBMER_NO IS '회원번호';

COMMENT ON COLUMN COMMENTS.ARENA_NO IS '투기장번호';

COMMENT ON COLUMN COMMENTS.CONTENT IS '내용';

COMMENT ON COLUMN COMMENTS.OPINION IS '투자의견';

COMMENT ON COLUMN COMMENTS.REGDATE IS '등록일';

CREATE UNIQUE INDEX PK_COMMENTS
	ON COMMENTS (
		NO ASC
	);

ALTER TABLE COMMENTS
	ADD
		CONSTRAINT PK_COMMENTS
		PRIMARY KEY (
			NO
		);
		
ALTER TABLE COMMENTS
   ADD 
      CONSTRAINT CHK_COMMENTS_OPINION
      CHECK (
         OPINION IN ('Y','N') /* 매수:Y / 매도:N */
      );

/* 좋아요 */
CREATE TABLE LIKES (
	COMMENTS_NO NUMBER NOT NULL, /* 댓글번호 */
	MEMBER_NO NUMBER DEFAULT 1 NOT NULL, /* 회원번호 */
	REGDATE DATE DEFAULT SYSDATE NOT NULL /* 등록일 */
);

COMMENT ON TABLE LIKES IS '좋아요';

COMMENT ON COLUMN LIKES.COMMENTS_NO IS '댓글번호';

COMMENT ON COLUMN LIKES.MEMBER_NO IS '회원번호';

COMMENT ON COLUMN LIKES.REGDATE IS '등록일';

CREATE UNIQUE INDEX PK_LIKES
	ON LIKES (
		COMMENTS_NO ASC,
		MEMBER_NO ASC
	);

ALTER TABLE LIKES
	ADD
		CONSTRAINT PK_LIKES
		PRIMARY KEY (
			COMMENTS_NO,
			MEMBER_NO
		);

/* 투자의견 */
CREATE TABLE PICK (
	ARENO_NO NUMBER NOT NULL, /* 투기장번호 */
	MEMBER_NO NUMBER NOT NULL, /* 회원번호 */
	OPINION CHAR(1) NOT NULL, /* 투자의견 */
	REGDATE DATE DEFAULT SYSDATE NOT NULL /* 등록일 */
);

COMMENT ON TABLE PICK IS '투자의견';

COMMENT ON COLUMN PICK.ARENO_NO IS '투기장번호';

COMMENT ON COLUMN PICK.MEMBER_NO IS '회원번호';

COMMENT ON COLUMN PICK.OPINION IS '투자의견';

COMMENT ON COLUMN PICK.REGDATE IS '등록일';

CREATE UNIQUE INDEX PK_PICK
	ON PICK (
		ARENO_NO ASC,
		MEMBER_NO ASC
	);

ALTER TABLE PICK
	ADD
		CONSTRAINT PK_PICK
		PRIMARY KEY (
			ARENO_NO,
			MEMBER_NO
		);
		
ALTER TABLE PICK
   ADD 
      CONSTRAINT CHK_PICK_OPINION
      CHECK (
         OPINION IN ('Y','N') /* 매수:Y / 매도:N */
      );

ALTER TABLE MEMBER_INFO
	ADD
		CONSTRAINT FK_MEMBER_TO_MEMBER_INFO
		FOREIGN KEY (
			NO
		)
		REFERENCES MEMBER (
			NO
		);

ALTER TABLE COMPANY
	ADD
		CONSTRAINT FK_INDUSTRY_TO_COMPANY
		FOREIGN KEY (
			INDUSTRY_NO
		)
		REFERENCES INDUSTRY (
			NO
		);

ALTER TABLE FINANCE
	ADD
		CONSTRAINT FK_COMPANY_TO_FINANCE
		FOREIGN KEY (
			COMPANY_CODE
		)
		REFERENCES COMPANY (
			CODE
		);

ALTER TABLE FINANCE
	ADD
		CONSTRAINT FK_ACCOUNT_TO_FINANCE
		FOREIGN KEY (
			ACCOUNT_CODE
		)
		REFERENCES ACCOUNT (
			CODE
		);

ALTER TABLE STOCK_RECORDS
	ADD
		CONSTRAINT FK_COMPANY_TO_STOCK_RECORDS
		FOREIGN KEY (
			COMPANY_CODE
		)
		REFERENCES COMPANY (
			CODE
		);

ALTER TABLE ARENA
	ADD
		CONSTRAINT FK_COMPANY_TO_ARENA
		FOREIGN KEY (
			COMPANY_CODE
		)
		REFERENCES COMPANY (
			CODE
		);

ALTER TABLE ARENA
	ADD
		CONSTRAINT FK_MEMBER_TO_ARENA
		FOREIGN KEY (
			MEMBER_NO
		)
		REFERENCES MEMBER (
			NO
		);

ALTER TABLE COMMENTS
	ADD
		CONSTRAINT FK_MEMBER_TO_COMMENTS
		FOREIGN KEY (
			MEBMER_NO
		)
		REFERENCES MEMBER (
			NO
		);

ALTER TABLE COMMENTS
	ADD
		CONSTRAINT FK_ARENA_TO_COMMENTS
		FOREIGN KEY (
			ARENA_NO
		)
		REFERENCES ARENA (
			NO
		);

ALTER TABLE LIKES
	ADD
		CONSTRAINT FK_COMMENTS_TO_LIKES
		FOREIGN KEY (
			COMMENTS_NO
		)
		REFERENCES COMMENTS (
			NO
		);

ALTER TABLE LIKES
	ADD
		CONSTRAINT FK_MEMBER_TO_LIKES
		FOREIGN KEY (
			MEMBER_NO
		)
		REFERENCES MEMBER (
			NO
		);

ALTER TABLE PICK
	ADD
		CONSTRAINT FK_ARENA_TO_PICK
		FOREIGN KEY (
			ARENO_NO
		)
		REFERENCES ARENA (
			NO
		);

ALTER TABLE PICK
	ADD
		CONSTRAINT FK_MEMBER_TO_PICK
		FOREIGN KEY (
			MEMBER_NO
		)
		REFERENCES MEMBER (
			NO
		);
		
/* 트리거 생성 */
/* 회원타입이 탈퇴회원이 되면 회원상세정보 삭제*/
CREATE OR REPLACE TRIGGER TG_A_MEMBER_UPDATE
	AFTER UPDATE OF TYPE ON MEMBER
	FOR EACH ROW
	BEGIN
		IF :NEW.TYPE = 'W' THEN
			DELETE FROM MEMBER_INFO
			WHERE NO = :NEW.NO;
		END IF;	
	END;
/