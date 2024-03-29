--2023/11/14
-- 회원테이블
CREATE TABLE MEMBER(
    M_ID    NVARCHAR2(20)       NOT NULL,
    M_PW    NVARCHAR2(100)      NOT NULL,
    M_NAME  NVARCHAR2(10)       NOT NULL,
    M_BIRTH NVARCHAR2(8)        NOT NULL,
    M_ADDR  NVARCHAR2(50)       NOT NULL,
    M_PHONE NVARCHAR2(13)       NOT NULL,
    M_POINT NUMBER DEFAULT 0    NOT NULL,
    M_ADDR_NUM  NUMBER          NOT NULL,
    M_ADDR_DET  NVARCHAR2(50)   NOT NULL,
    CONSTRAINT PK_M_ID PRIMARY KEY(M_ID)
);

SELECT * FROM MEMBER;


-- 회원등급
CREATE TABLE GRADE(
    G_CODE      NCHAR(1)        NOT NULL,
    G_NAME      NVARCHAR2(10)   NOT NULL,
    G_LOWPOINT  NUMBER,
    G_HIGHPOINT NUMBER,
    CONSTRAINT PK_G_CODE PRIMARY KEY(G_CODE)
);

SELECT * FROM GRADE;


-- 원글 게시판
 CREATE TABLE BOARD(
    B_NUM       NUMBER                  NOT NULL,
    B_TITLE     NVARCHAR2(50)           NOT NULL,
    B_CONTENTS  NCLOB                   NOT NULL,
    B_ID        NVARCHAR2(20)           NOT NULL,
    B_DATE      DATE  DEFAULT  SYSDATE  NOT NULL,
    B_VIEWS     NUMBER DEFAULT  0       NOT NULL,
    CONSTRAINT  PK_B_NUM PRIMARY KEY(B_NUM),
    CONSTRAINT  FK_B_ID  FOREIGN KEY(B_ID) REFERENCES MEMBER(M_ID)
 );
 
 -- 글번호 시퀀스 
 CREATE SEQUENCE B_SEQ;
 
 SELECT * FROM BOARD;
 

-- 파일 첨부
CREATE TABLE BOARD_FILE(
    BF_SEQ          NUMBER          NOT NULL,
    BF_BNUM         NUMBER          NOT NULL,
    BF_ORIGFILENAME NVARCHAR2(100)  NOT NULL,
    BF_SYSFILENAME  NVARCHAR2(100)  NOT NULL,
    CONSTRAINT PK_BF_SEQ PRIMARY KEY(BF_SEQ),
    CONSTRAINT FK_BF_BNUM  FOREIGN KEY(BF_BNUM) REFERENCES BOARD(B_NUM)
);

-- 파일번호 시퀀스
CREATE SEQUENCE BF_SEQ;


-- 게시판 댓글
CREATE TABLE REPLY(
    R_NUM       NUMBER          NOT NULL,
    R_BNUM      NUMBER          NOT NULL,
    R_CONTENTS  NVARCHAR2(20)   NOT NULL,
    R_ID        NVARCHAR2(20)   NOT NULL,
    R_DATE DATE DEFAULT SYSDATE NOT NULL,
    CONSTRAINT PK_R_NUM PRIMARY KEY(R_NUM),
    CONSTRAINT FK_R_BNUM FOREIGN KEY(R_BNUM) REFERENCES BOARD(B_NUM)
);
 

-- 로그인 후 회원정보 출력
CREATE OR REPLACE VIEW MINFO AS
SELECT MEMBER.M_ID, MEMBER.M_NAME, MEMBER.M_POINT, GRADE.G_NAME
  FROM MEMBER JOIN GRADE
    ON MEMBER.M_POINT BETWEEN GRADE.G_LOWPOINT AND GRADE.G_HIGHPOINT;


-- 게시판 글 출력
CREATE OR REPLACE VIEW BLIST AS
SELECT ROWNUM RONUM, MINFO.*
  FROM (SELECT BOARD.B_NUM, BOARD.B_TITLE, BOARD.B_CONTENTS, BOARD.B_ID, MEMBER.M_NAME, BOARD.B_DATE, BOARD.B_VIEWS
          FROM BOARD JOIN MEMBER
            ON BOARD.B_ID = MEMBER.M_ID
         ORDER BY BOARD.B_DATE DESC ) MINFO;
         
         
-- 게시판 페이징 위한 뷰
CREATE OR REPLACE VIEW BLIST_1 AS
SELECT ROWNUM RONUM1, BLIST.*  
FROM BLIST;

 
-- 최신글 순으로 댓글 출력
CREATE OR REPLACE VIEW RLIST AS 
SELECT *
  FROM REPLY
 ORDER BY R_DATE DESC;
 
SELECT * FROM RLIST;

commit;
                                                                    
