--------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------- DROP TABLE & SEQUENCE START -------------------------------------------
--------------------------------------------------------------------------------------------------------------------------


/*제약조건 무시 테이블 삭제  */
drop table MemDept cascade constraints;
drop table MemPosit cascade constraints;
drop table Member cascade constraints;
drop table MemRoles cascade constraints;
drop table BoardInfo cascade constraints;
drop table Board cascade constraints;
drop table CommBoard cascade constraints;
--drop table Company cascade constraints;
--drop table ExtDept cascade constraints;
--drop table Contact cascade constraints;
drop table Schedule cascade constraints;
drop table Room cascade constraints;
drop table Rent cascade constraints;
drop table Timecard cascade constraints;
drop table FileInfo cascade constraints;
drop table DocForm cascade constraints;
drop table Report cascade constraints;
drop table ApprReport cascade constraints;
drop table sns;
DROP TABLE ASSIGNEE;
DROP TABLE TASK;
DROP TABLE BACKUP_TASK;
DROP TABLE BACKUP_ASSIGNEE;

drop VIEW MEMBER_INFO;
drop VIEW AUTHORITY_INFO;

/* 시퀀스 삭제  */
drop SEQUENCE MemDept_seq;
drop SEQUENCE MemPosit_seq;
drop SEQUENCE BoardInfo_seq;
drop SEQUENCE Board_seq;
drop SEQUENCE CommBoard_seq;
--drop SEQUENCE Company_seq;
--drop SEQUENCE ExtDept_seq;
--drop SEQUENCE Contact_seq;
drop SEQUENCE Schedule_seq;
drop SEQUENCE Room_seq;
drop SEQUENCE Rent_seq;
drop SEQUENCE Timecard_seq;
drop SEQUENCE FileInfo_seq;
drop SEQUENCE DocForm_seq;
drop SEQUENCE Report_seq;
drop SEQUENCE ApprReport_seq;
drop SEQUENCE sns_seq;
drop SEQUENCE mem_code_generator_seq;

DROP SEQUENCE TASK_SEQ;
DROP SEQUENCE ASSIGNEE_SEQ;

DROP TABLE LOG_CONNECT;
DROP SEQUENCE LOG_CONNECT_SEQ;
 
/* TRIGGER & PROCEDURE DROP */
--DROP TRIGGER TASK_DELETE_TRIGER;
--DROP TRIGGER ASSIGNEE_DELETE_TRIGER;
DROP PROCEDURE TASK_ASSGINEE_DELETE_PROCEDURE;

--------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------- DROP TABLE & SEQUENCE END ---------------------------------------------
--------------------------------------------------------------------------------------------------------------------------



--------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------- TABLE & SEQUENCE START ------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------


/* MemDept */
CREATE TABLE MemDept (
	dept_num NUMBER CONSTRAINT MemDept_num_pk PRIMARY KEY, /* 부서번호 */
	dept_name VARCHAR2(30) NOT NULL /* 부서이름 */
);

create SEQUENCE MemDept_seq
increment by 1
start with 1;

/* MemPosit */
CREATE TABLE MemPosit (
	posit_num NUMBER  CONSTRAINT MemPosit_num_pk PRIMARY KEY, /* 직급번호 */
	posit_name VARCHAR2(20) NOT NULL /* 직급명 */
);


create SEQUENCE MemPosit_seq
increment by 1
start with 1;

/* Member */
CREATE TABLE Member (
	mem_code VARCHAR2(50) CONSTRAINT Member_code_pk PRIMARY KEY, /* 사번 */
	mem_id VARCHAR2(30) NOT NULL, /* 아이디 */
	mem_pwd VARCHAR2(30) NOT NULL, /* 패스워드 */
	mem_name VARCHAR2(30) NOT NULL, /* 사원이름 */
	dept_num NUMBER, /* 부서번호 */
	posit_num NUMBER, /* 직급번호 */
	mem_tel VARCHAR2(20), /* 전화번호 */
	mem_email VARCHAR2(30), /* 이메일 */
	mem_hiredate DATE NOT NULL, /* 입사일 */
	mem_birthdate DATE NOT NULL, /* 생년월일 */
	mem_post CHAR(6), /* 우편번호 */
	mem_roadaddr VARCHAR2(300), /* 도로명 */
	mem_jibunaddr VARCHAR2(300), /* 지번 */
	mem_detailaddr VARCHAR2(300), /* 상세주소 */
	mem_state CHAR(1) DEFAULT 1 NOT NULL /* 사원상태 */,
  CONSTRAINT FK_MemDept_TO_Member FOREIGN KEY(dept_num) REFERENCES MemDept(dept_num),
  CONSTRAINT FK_MemPosit_TO_Member FOREIGN KEY (posit_num) REFERENCES MemPosit (posit_num)
);


/* MemRoles */
/* 권한 정보  트리거로 처리 */ 
CREATE TABLE MemRoles (
role_auth VARCHAR2(20) NOT NULL, /* 권한 */
mem_id VARCHAR2(30) NOT NULL, /* 아이디 */
mem_code VARCHAR2(50) NOT NULL, /* 사원코드 */
CONSTRAINT ROLES_USER_ROLE_PK PRIMARY KEY(role_auth, mem_id, mem_code)
);

/* 트리거 MemRoles*/
--------------------------------------------------
CREATE OR REPLACE TRIGGER MemRoles_Triggers
	AFTER INSERT ON MEMBER
	FOR EACH ROW
	BEGIN
	INSERT INTO MemRoles VALUES('1', :new.mem_id, :new.mem_code);
END;
/
----------------------------------------



/* BoardInfo */
CREATE TABLE BoardInfo (
	board_code NUMBER CONSTRAINT BoardInfo_code_pk PRIMARY KEY, /* 게시판코드 */
	board_kindof VARCHAR2(20), /* 게시판종류 */
	board_name VARCHAR2(30), /* 게시판이름 */
	board_comment VARCHAR2(200) /* 게시판코멘트 */
);

create SEQUENCE BoardInfo_seq
increment by 1
start with 1;


/* Board*/
CREATE TABLE Board (
	board_num NUMBER CONSTRAINT Board_num_pk PRIMARY KEY, /* 글번호 */
	board_code NUMBER, /* 게시판코드 */
	board_title VARCHAR2(100) NOT NULL, /* 제목 */
	board_content CLOB, /* 내용 */
 	board_likenum NUMBER(10), /* 좋아요 */
	board_hit NUMBER(10), /* 조회수 */
	board_regdate DATE NOT NULL,  /* 작성일 */
  mem_code  VARCHAR2(50), /* 멤버코드 */
  mem_name VARCHAR2(40), /* 멤버이름*/
  CONSTRAINT FK_Member_TO_Board FOREIGN KEY (mem_code) REFERENCES Member (mem_code),
  CONSTRAINT FK_BoardInfo_TO_Board FOREIGN KEY (board_code) REFERENCES BoardInfo (board_code)
);

create SEQUENCE Board_seq
increment by 1
start with 1;

/* Comment  */
CREATE TABLE CommBoard (
	comm_num NUMBER CONSTRAINT Comment_num_pk PRIMARY KEY, /* 댓글번호 */
	board_num NUMBER, /* 글번호 */
	comm_content varchar2(400), /* 내용 */
	comm_reip varchar2(40), /* 댓글 IP */
	comm_regdate date NOT NULL, /* 댓글 작성일 */
	mem_name varchar2(40), /* 멤버이르 */
  CONSTRAINT FK_Board_TO_Comment FOREIGN KEY (board_num) REFERENCES Board (board_num)
);

create SEQUENCE CommBoard_seq
increment by 1
start with 1;

/* Company  Disable*/
--CREATE TABLE Company (
--	comp_num NUMBER CONSTRAINT Company_num_pk PRIMARY KEY, /* 회사번호 */
--	comp_name VARCHAR2(100) NOT NULL, /* 이름 */
--	comp_post CHAR(6), /* 우편번호 */
--	comp_roadaddr VARCHAR2(300), /* 도로명 */
--	comp_jibunaddr VARCHAR2(300), /* 지번 */
--	comp_detailaddr VARCHAR2(300), /* 상세주소 */
--	comp_tel VARCHAR2(20), /* 전화번호 */
--	comp_home VARCHAR2(30) /* 홈페이지 */
--);

--create SEQUENCE Company_seq
--increment by 1
--start with 1;

/* ExtDept  Disable*/
--CREATE TABLE ExtDept (
--	dept_num NUMBER CONSTRAINT ExtDept_num_pk PRIMARY KEY, /* 부서번호 */
--	dept_name VARCHAR2(30) NOT NULL /* 부서이름 */
--);

--create SEQUENCE ExtDept_seq
--increment by 1
--start with 1;

/* Contact  Disable*/
--CREATE TABLE Contact (
--	cont_num NUMBER CONSTRAINT Contact_num_pk PRIMARY KEY, /* 등록번호 */
--	comp_num NUMBER, /* 회사번호 */
--	dept_num NUMBER, /* 부서번호 */
--  position_num NUMBER, /* 직급번호 */
--  cont_regdate DATE, /* 등록일 */
--	cont_name VARCHAR2(30), /* 사원이름 */
--	cont_tel VARCHAR2(20), /* 전화번호 */
--	cont_email VARCHAR2(30), /* 이메일 */
--	cont_roadaddr VARCHAR2(300),	/* 도로명 */
--	cont_jibunaddr VARCHAR2(300),	/* 지번 */
--	cont_post VARCHAR2(300),		/* 우편번호 */
--  cont_detailaddr VARCHAR2(300), /* 상세주소 */
--	cont_etc VARCHAR2(200), /* etc */
-- CONSTRAINT FK_Company_TO_Contact FOREIGN KEY (comp_num) REFERENCES Company (comp_num),
--  CONSTRAINT FK_ExtDept_TO_Contact FOREIGN KEY (dept_num) REFERENCES ExtDept (dept_num)
--);

--create SEQUENCE Contact_seq
--increment by 1
--start with 1;

/* Schedule */
CREATE TABLE Schedule (
	sched_num NUMBER NOT NULL, /* 스케줄번호 */
	mem_code VARCHAR2(50), /* 사번 */
	sched_someday_date VARCHAR2(50), /* 언제가 */
	sched_somedayend_date VARCHAR2(50), /* 언제가끝 */
	sched_someday_time VARCHAR2(50) DEFAULT '', /* 언제가 */
	sched_somedayend_time VARCHAR2(50) DEFAULT '', /* 언제가끝 */  
 	sched_event VARCHAR2(30), /* 이벤트 */
	sched_check CHAR(1), /* 확인 */
	sched_type VARCHAR2(15), /* 종류 */
	sched_content VARCHAR2(300), /* 내용 */
  CONSTRAINT FK_Member_TO_Schedule FOREIGN KEY (mem_code) REFERENCES Member (mem_code)
);

create SEQUENCE Schedule_seq
increment by 1
start with 1;

/* Room */
CREATE TABLE Room (
	room_num NUMBER CONSTRAINT Room_num_pk PRIMARY KEY , /* 시설번호 */
	room_name VARCHAR2(30) NOT NULL, /* 시설이름 */
	room_loc VARCHAR2(300), /* 시설위치 */
	room_limit NUMBER(10) /* 수용인원 */
);

create SEQUENCE Room_seq
increment by 1
start with 1;

/* Rent */
CREATE TABLE Rent (
	rent_num NUMBER CONSTRAINT Rent_num_pk PRIMARY KEY, /* 예약번호 */
	rent_reason VARCHAR2(300), /* 예약사유 */
	rent_date_start varchar2(30) NOT NULL, /* 사용시작시간 */
	rent_date_end varchar2(30) NOT NULL, /* 사용종료시간 */
	room_num NUMBER, /* 시설번호 */
	mem_code VARCHAR2(50), /* 사번 */
  CONSTRAINT FK_Room_TO_Rent FOREIGN KEY (room_num ) REFERENCES Room (room_num),
  CONSTRAINT FK_Member_TO_Rent FOREIGN KEY (mem_code) REFERENCES Member (mem_code)
);

create SEQUENCE Rent_seq
increment by 1
start with 1;

/* Timecard */
CREATE TABLE Timecard (
	tc_num NUMBER CONSTRAINT Timecard_num_pk PRIMARY KEY, /* 카드번호 */
	tcwork_start DATE, /* 출근시간 */
	tcwork_end DATE, /* 퇴근시간 */
	tcgoout_start DATE, /* 외출시작 */
	tcgoout_end DATE, /* 외출종료 */
	tc_state CHAR(1), /* 상태 */
	tcetc VARCHAR2(200), /* etc */
	mem_code VARCHAR2(50), /* 사번 */
  CONSTRAINT FK_Member_TO_Timecard FOREIGN KEY (mem_code) REFERENCES Member (mem_code)
);

create SEQUENCE Timecard_seq
increment by 1
start with 1;

/* FileInfo */
CREATE TABLE FileInfo (
	file_num NUMBER CONSTRAINT FileInfo_num_pk PRIMARY KEY,/* 파일번호 */
	file_name VARCHAR2(100) NOT NULL, /* 파일이름 */
	file_path VARCHAR2(500) NOT NULL, /* 파일경로 */
	file_type VARCHAR2(20) NOT NULL, /* 파일타입 */
	file_size NUMBER, /* 파일크기 */
	mem_code VARCHAR2(50) NOT NULL, /* 멤버코드  */
	constraint FileInfo_memcode_fk foreign key(mem_code) references Member(mem_code)
);

create SEQUENCE FileInfo_seq
increment by 1
start with 1;

/* DocForm */
CREATE TABLE DocForm (
	doc_num NUMBER CONSTRAINT DocForm_num_pk PRIMARY KEY, /* 문서번호 */
	doc_name VARCHAR2(100) NOT NULL, /* 문서이름 */
	doc_form CLOB /* 문서양식 */
);

create SEQUENCE DocForm_seq
increment by 1
start with 1;

/* Report */
CREATE TABLE Report (
	report_num NUMBER CONSTRAINT Report_num_pk PRIMARY KEY, /* 보고서번호 */
	report_writer VARCHAR2(50) NOT NULL, /* 제출자  11-12일 추가*/
	report_title VARCHAR2(100) NOT NULL, /* 제목 */
	report_content CLOB, /* 내용 */
	report_regdate DATE, /* 저장일 */
 	report_subdate DATE , /* 제출일 */
	report_state CHAR(1) DEFAULT 0, /* 결재상태, 0 저장상태 1 승인대기, 2 승인완료, 3반려 */
	report_dday DATE, /* 결재기한 */
	file_num NUMBER, /* 파일번호 */
  CONSTRAINT FK_Member_TO_Report FOREIGN KEY (report_writer) REFERENCES Member (mem_code),
  CONSTRAINT FK_FileInfo_TO_Report FOREIGN KEY (file_num) REFERENCES FileInfo (file_num)
);

create SEQUENCE Report_seq
increment by 1
start with 1;


/* ApprReport 11-27일 on delete Cascade 추가  */
CREATE TABLE ApprReport (
	appr_num NUMBER CONSTRAINT ApprReport_num_pk PRIMARY KEY, /* 결재번호 */
	report_num NUMBER NOT NULL, /* 보고서번호 */
	mem_code VARCHAR2(50) NOT NULL, /* 승인자 */
    appr_turn VARCHAR2(50) NOT NULL, /* 결재순번 길이값과 같은놈이 최종 승인자*/
	report_apprday DATE, /* 결재날짜 */
	appr_state CHAR(1) DEFAULT 0 , --승인상태  :   0 초기, 1결재중, 2승인, 3반려
  CONSTRAINT FK_Report_TO_ApprReport FOREIGN KEY (report_num) REFERENCES Report (report_num) On Delete Cascade,
  CONSTRAINT FK_Member_TO_ApprReport FOREIGN KEY (mem_code) REFERENCES Member (mem_code)
);


create SEQUENCE ApprReport_seq
increment by 1
start with 1;

/* SNS  */
CREATE TABLE sns(
	sns_num NUMBER NOT NULL, /* 번호 */
	mem_code VARCHAR2(50) NOT NULL, /* 사번 */
    mem_name VARCHAR2(30) NOT NULL,
    dept_num NUMBER ,
	sns_date DATE, 
	sns_title VARCHAR2(30) NOT NULL, 
	sns_content VARCHAR2(300), /* 내용 */
  CONSTRAINT FK_Memcode_TO_SNS FOREIGN KEY (mem_code) REFERENCES Member (mem_code),
  CONSTRAINT FK_MemDept_TO_SNS FOREIGN KEY(dept_num) REFERENCES MemDept (dept_num)
);


create SEQUENCE sns_seq
increment by 1
start with 1;


/*  TASK  */
CREATE TABLE TASK(
TASK_NUM NUMBER CONSTRAINT TASK_PK_NUM PRIMARY KEY, /* TASK 고유키 */
TASK_TITLE VARCHAR2(100) NOT NULL, /* 제목 크기 변경*/
TASK_DESCRIPTION VARCHAR2(4000), /* TASK 내용 */
TASK_START DATE, /* TASK 시작일 */
TASK_END DATE, /* TASK 종료일 */
TASK_STATE CHAR(1) DEFAULT 'N', /* TASK 처리상태 */
TASK_ORGANIZER VARCHAR2(50), /* TASK 부여자 */
TASK_DATE DATE /* TASK 등록일 */
);
CREATE SEQUENCE TASK_SEQ
INCREMENT BY 1
START WITH 1;

/* ASSIGNEE */
CREATE TABLE ASSIGNEE(
ASSIGNEE_NUM NUMBER CONSTRAINT ASSIGNEE_NUM_PK PRIMARY KEY, /* TASK 위임자 */
TASK_NUM NUMBER, /* TASK 고유번호 */
ASSIGNEE_ASSIGNEE VARCHAR2(50), /* TASK 위임자  사원코드 */ 
ASSIGNEE_COMMENT VARCHAR2(4000), /* TASK 위임자 업무 보고 내용  */
ASSIGNEE_STATE CHAR(1) DEFAULT 'N', /* 업무 승인 처리 상태 */
CONSTRAINT TASK_NUM FOREIGN KEY(TASK_NUM) REFERENCES TASK(TASK_NUM)
);

CREATE SEQUENCE ASSIGNEE_SEQ
INCREMENT BY 1
START WITH 1;

/* LOG_CONNECT  */
CREATE TABLE LOG_CONNECT(
LOG_ID VARCHAR2(50) CONSTRAINT LOG_ID_PK PRIMARY KEY,
LOG_TYPE CHAR(1), /* 0 정상로그인 1 정상 로그아웃 2 로그인 실패*/
MEM_CODE VARCHAR2(50),
MEM_ID VARCHAR2(30),
MEM_NAME VARCHAR2(30),
MEM_IP VARCHAR2(50),
LOG_DATE DATE
);

CREATE SEQUENCE LOG_CONNECT_SEQ
increment by 1
start with 1;


--------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------- TABLE & SEQUENCE END --------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------









--------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------- FUNTION START ------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------

-- 함수 시퀀스 
CREATE SEQUENCE mem_code_generator_seq
increment by 1
start with 1;

-- 사원 코드 제너레이터 함수 
CREATE OR REPLACE FUNCTION  member_code_generator(mem_hiredate IN DATE,mem_birthdate IN DATE)
RETURN VARCHAR2 IS 
 temp VARCHAR2(50);
 res_code VARCHAR2(50); 
BEGIN -- 함수 : 사원 입사일+ 생일날짜+ 시퀀서 
  temp:= concat(TO_CHAR(mem_hiredate,'YYMMDD'),TO_CHAR(mem_birthdate,'MMDD'));
  res_code := concat(temp,TO_CHAR(mem_code_generator_seq.nextVal));
  RETURN res_code;
END;
/

--------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------- FUNTION END --------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------






--------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------- VIEW START ---------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------

------ TABLE VIEW  MEMBER 정보  -----
CREATE OR REPLACE VIEW MEMBER_INFO AS
SELECT m.MEM_CODE,
m.MEM_ID,
m.MEM_PWD,
m.MEM_NAME,
m.DEPT_NUM,
d.DEPT_NAME,
m.POSIT_NUM,
p.POSIT_NAME,
m.MEM_TEL,
m.MEM_EMAIL,
m.MEM_HIREDATE,
m.MEM_BIRTHDATE,
m.MEM_POST,
m.MEM_ROADADDR,
m.MEM_JIBUNADDR,
m.MEM_DETAILADDR,
m.MEM_STATE FROM MEMBER m ,MEMDEPT d, MEMPOSIT p WHERE m.DEPT_NUM = d.DEPT_NUM 
AND p.POSIT_NUM = m.POSIT_NUM;

------ 권한 정보 VIEW -----
CREATE VIEW AUTHORITY_INFO
AS
SELECT d.DEPT_NAME , 
       p.POSIT_NAME , 
       m.MEM_NAME ,
       m.MEM_CODE ,
       m.MEM_ID ,
       r.ROLE_AUTH 
FROM MEMBER m , 
     MEMROLES r , 
     MEMDEPT d , 
     MEMPOSIT p
WHERE r.MEM_ID = m.MEM_ID 
AND r.MEM_CODE = m.MEM_CODE 
AND m.DEPT_NUM = d.DEPT_NUM
AND p.POSIT_NUM = m.POSIT_NUM;
--------------------------------------

--------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------- VIEW END -----------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------






--------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------- PROCEDURE START ----------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------

-- TASK DATA BACK_UP 할 테이블 만들기
-- 테이블 스키마만 복사해서 백업 테이블 생성
CREATE TABLE BACKUP_TASK
AS SELECT * FROM TASK WHERE 1!=1;

CREATE TABLE BACKUP_ASSIGNEE
AS SELECT * FROM ASSIGNEE WHERE 1!=1;

-- ASSIGNEE 삭제시 트리거
CREATE OR REPLACE TRIGGER ASSIGNEE_DELETE_TRIGER
BEFORE DELETE ON ASSIGNEE
FOR EACH ROW
DECLARE
BEGIN
    INSERT INTO BACKUP_ASSIGNEE
    VALUES(
    :OLD.ASSIGNEE_NUM,
    :OLD.TASK_NUM,
    :OLD.ASSIGNEE_ASSIGNEE,
    :OLD.ASSIGNEE_COMMENT,
    :OLD.ASSIGNEE_STATE);
END;
/
-- TASK 삭제시 트리거

CREATE OR REPLACE TRIGGER TASK_DELETE_TRIGER
BEFORE DELETE ON TASK
FOR EACH ROW
DECLARE
BEGIN
    INSERT INTO BACKUP_TASK
    VALUES (
    :OLD.TASK_NUM,
    :OLD.TASK_TITLE,
    :OLD.TASK_DESCRIPTION,
    :OLD.TASK_START,
    :OLD.TASK_END,
    :OLD.TASK_STATE,
    :OLD.TASK_ORGANIZER, 
    :OLD.TASK_DATE);
END;
/

------------ TASK AND ASSIGNEE TABLE 동시 삭제 프로시져-------

CREATE OR REPLACE PROCEDURE TASK_ASSGINEE_DELETE_PROCEDURE
(
TASK_NUMV IN ASSIGNEE.ASSIGNEE_NUM%TYPE
)
  IS 

BEGIN
  -- ASSIGNEE 에 있는 테이블을 먼저 삭제하고
  DELETE
  FROM ASSIGNEE
  WHERE TASK_NUM= TASK_NUMV;
  -- TASK 에 있는 테이블을 삭제한다.
  DELETE FROM TASK
  WHERE TASK_NUM =TASK_NUMV;
END;
/

-------------------------------------------------------------


--------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------- PROCEDURE END ------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------









commit;

