DROP TABLE BOARDINFO;
DROP TABLE BOARD;
DROP TABLE COMMBOARD;
DROP SEQUENCE BOARDINFO_SEQ;
DROP SEQUENCE BOARD_SEQ;
DROP SEQUENCE COMMBOARD_SEQ;

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
	comm_reip varchar2(40), /* 댓글 ip */
	comm_regdate date NOT NULL, /* 댓글 작성 날짜 */
	mem_name varchar2(40), /* 작성자 이름 */
  CONSTRAINT FK_Board_TO_Comment FOREIGN KEY (board_num) REFERENCES Board (board_num)
);

create SEQUENCE CommBoard_seq
increment by 1
start with 1;