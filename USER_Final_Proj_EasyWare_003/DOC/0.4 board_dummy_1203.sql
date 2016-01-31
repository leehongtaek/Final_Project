Insert into BOARDINFO (BOARD_CODE,BOARD_KINDOF,BOARD_NAME,BOARD_COMMENT) values (1,'카테고리2','감사부','부서전용 게시판 입니다.');
Insert into BOARDINFO (BOARD_CODE,BOARD_KINDOF,BOARD_NAME,BOARD_COMMENT) values (2,'카테고리2','인사부','부서전용 게시판 입니다.');
Insert into BOARDINFO (BOARD_CODE,BOARD_KINDOF,BOARD_NAME,BOARD_COMMENT) values (3,'카테고리2','관리부','부서전용 게시판 입니다.');
Insert into BOARDINFO (BOARD_CODE,BOARD_KINDOF,BOARD_NAME,BOARD_COMMENT) values (4,'카테고리2','영업부','부서전용 게시판 입니다.');
Insert into BOARDINFO (BOARD_CODE,BOARD_KINDOF,BOARD_NAME,BOARD_COMMENT) values (5,'카테고리2','연구소','부서전용 게시판 입니다.');
Insert into BOARDINFO (BOARD_CODE,BOARD_KINDOF,BOARD_NAME,BOARD_COMMENT) values (6,'카테고리2','개발부','부서전용 게시판 입니다.');
Insert into BOARDINFO (BOARD_CODE,BOARD_KINDOF,BOARD_NAME,BOARD_COMMENT) values (7,'카테고리2','보수부','부서전용 게시판 입니다.');
Insert into BOARDINFO (BOARD_CODE,BOARD_KINDOF,BOARD_NAME,BOARD_COMMENT) values (8,'카테고리2','운영부','부서전용 게시판 입니다.');
Insert into BOARDINFO (BOARD_CODE,BOARD_KINDOF,BOARD_NAME,BOARD_COMMENT) values (9,'카테고리1','공지사항','공지사항 게시판 입니다.');
Insert into BOARDINFO (BOARD_CODE,BOARD_KINDOF,BOARD_NAME,BOARD_COMMENT) values (10,'카테고리3','커뮤니티','커뮤니티 게시판 입니다.');

commit;


Insert into BOARD (BOARD_NUM,BOARD_CODE,BOARD_TITLE,BOARD_CONTENT,BOARD_LIKENUM,BOARD_HIT,BOARD_REGDATE,MEM_CODE,MEM_NAME) values (BOARD_SEQ.nextVal,1,'감사부 전용 게시판','',0,0,to_date('15/10/22','RR/MM/DD'),'15111311131','김선우');
Insert into BOARD (BOARD_NUM,BOARD_CODE,BOARD_TITLE,BOARD_CONTENT,BOARD_LIKENUM,BOARD_HIT,BOARD_REGDATE,MEM_CODE,MEM_NAME) values (BOARD_SEQ.nextVal,2,'인사부 전용 게시판','',0,1,to_date('15/10/22','RR/MM/DD'),'15111311131','김병기');
Insert into BOARD (BOARD_NUM,BOARD_CODE,BOARD_TITLE,BOARD_CONTENT,BOARD_LIKENUM,BOARD_HIT,BOARD_REGDATE,MEM_CODE,MEM_NAME) values (BOARD_SEQ.nextVal,3,'관리부 전용 게시판','',0,0,to_date('15/10/21','RR/MM/DD'),'15111311131','박성민');
Insert into BOARD (BOARD_NUM,BOARD_CODE,BOARD_TITLE,BOARD_CONTENT,BOARD_LIKENUM,BOARD_HIT,BOARD_REGDATE,MEM_CODE,MEM_NAME) values (BOARD_SEQ.nextVal,4,'영업부 전용 게시판','',0,0,to_date('15/10/21','RR/MM/DD'),'15111311131','박종문');
Insert into BOARD (BOARD_NUM,BOARD_CODE,BOARD_TITLE,BOARD_CONTENT,BOARD_LIKENUM,BOARD_HIT,BOARD_REGDATE,MEM_CODE,MEM_NAME) values (BOARD_SEQ.nextVal,5,'연구소 전용 게시판','',0,0,to_date('15/10/21','RR/MM/DD'),'15111311131','이홍택');
Insert into BOARD (BOARD_NUM,BOARD_CODE,BOARD_TITLE,BOARD_CONTENT,BOARD_LIKENUM,BOARD_HIT,BOARD_REGDATE,MEM_CODE,MEM_NAME) values (BOARD_SEQ.nextVal,6,'개발부 전용 게시판','',0,0,to_date('15/10/21','RR/MM/DD'),'15111311131','유현주');
Insert into BOARD (BOARD_NUM,BOARD_CODE,BOARD_TITLE,BOARD_CONTENT,BOARD_LIKENUM,BOARD_HIT,BOARD_REGDATE,MEM_CODE,MEM_NAME) values (BOARD_SEQ.nextVal,7,'보수부 전용 게시판','',0,1,to_date('15/10/21','RR/MM/DD'),'15111311131','박종문');
Insert into BOARD (BOARD_NUM,BOARD_CODE,BOARD_TITLE,BOARD_CONTENT,BOARD_LIKENUM,BOARD_HIT,BOARD_REGDATE,MEM_CODE,MEM_NAME) values (BOARD_SEQ.nextVal,8,'운영부 전용 게시판','',0,0,to_date('15/10/21','RR/MM/DD'),'15111311131','김병기');
Insert into BOARD (BOARD_NUM,BOARD_CODE,BOARD_TITLE,BOARD_CONTENT,BOARD_LIKENUM,BOARD_HIT,BOARD_REGDATE,MEM_CODE,MEM_NAME) values (BOARD_SEQ.nextVal,9,'공지사항 게시판','',0,8,to_date('15/10/21','RR/MM/DD'),'15111311131','김선우');
Insert into BOARD (BOARD_NUM,BOARD_CODE,BOARD_TITLE,BOARD_CONTENT,BOARD_LIKENUM,BOARD_HIT,BOARD_REGDATE,MEM_CODE,MEM_NAME) values (BOARD_SEQ.nextVal,10,'커뮤니티 게시판','',0,8,to_date('15/10/21','RR/MM/DD'),'15111311131','이홍택');
commit;

