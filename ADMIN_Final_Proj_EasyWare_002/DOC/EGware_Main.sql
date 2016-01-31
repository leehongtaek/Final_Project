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
drop SEQUENCE mem_code_generator_seq;



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


insert into BOARDINFO  values(boardinfo_seq.nextVal,'카테고리1','자유게시판','자유 게시판 입니다.');
insert into BOARDINFO  values(boardinfo_seq.nextVal,'카테고리2','칭찬합시다','칭찬합시다 게시판 입니다.');
insert into BOARDINFO  values(boardinfo_seq.nextVal,'카테고리3','건의사항','건의사항 게시판 입니다.');

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
	comm_content CLOB, /* 내용 */
	comm_lvl NUMBER(5), /* 글lvl */
	comm_ref NUMBER(5), /* 글ref */
	comm_seq NUMBER(5), /* 글seq */
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
	sched_someday VARCHAR2(50), /* 언제가 */
	sched_somedayend VARCHAR2(50), /* 언제가끝 */
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
	file_size CLOB /* 파일크기 */
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
	report_title VARCHAR2(100) NOT NULL, /* 제목 */
	report_content CLOB, /* 내용 */
	report_regdate DATE, /* 제출일 */
	report_apprday DATE, /* 결재날짜 */
	report_state CHAR(1), /* 결재상태 */
	report_dday DATE, /* 결재기한 */
	file_num NUMBER, /* 파일번호 */
  CONSTRAINT FK_FileInfo_TO_Report FOREIGN KEY (file_num) REFERENCES FileInfo (file_num)
);

create SEQUENCE Report_seq
increment by 1
start with 1;

/* ApprReport */
CREATE TABLE ApprReport (
	appr_num NUMBER CONSTRAINT ApprReport_num_pk PRIMARY KEY, /* 결재번호 */
	report_num NUMBER NOT NULL, /* 보고서번호 */
	mem_code VARCHAR2(50) NOT NULL, /* 승인자 */
	appr_writer VARCHAR2(50) NOT NULL, /* 제출자 */
	appr_state CHAR(1), /* 승인상태 */
  CONSTRAINT FK_Report_TO_ApprReport FOREIGN KEY (report_num) REFERENCES Report (report_num),
  CONSTRAINT FK_Member_TO_ApprReport FOREIGN KEY (mem_code) REFERENCES Member (mem_code)
);

create SEQUENCE ApprReport_seq
increment by 1
start with 1;

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


------- TABLE VIEW  MEMBER 정보  ---
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
----------------------------------
-----------권한 정보 테이블 ---------------
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

commit;

