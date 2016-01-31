drop table Report cascade constraints;
drop SEQUENCE Report_seq;


drop table ApprReport cascade constraints;
drop SEQUENCE ApprReport_seq;



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




-- 보고서에 등록된 결재자들
select r.report_num as report_num, r.REPORT_STATE as reprot_state, a.mem_code as mem_code,
		a.appr_turn as appr_turn, a.appr_state as appr_state, m.mem_name as mem_name
		from Report r,
		ApprReport a, member m
		where r.report_num = a.report_num
		and a.mem_code
		= m.mem_code
		and r.report_num =40;
    
    select REPORT_STATE  from report
    where report_num =3;
    
    select * from report
    where report_num=3;
  -- 레포트 번호로 appr_state를 전부 0으로
    
   --레포트번호로  report_state 를 1에서 0 으로
    

select * from member;
select * from report;
select * from ApprReport;


    -- 승인 해야할 레포트 리스트
    SELECT A.REPORT_NUM AS REPORT_NUM, R.REPORT_STATE AS REPORT_STATE, A.MEM_CODE as MEM_CODE, A.APPR_TURN
		AS APPR_TURN,
		A.APPR_STATE AS APPR_STATE, R.REPORT_WRITER AS
		REPORT_WRITER,
		R.REPORT_TITLE AS REPORT_TITLE, R.REPORT_CONTENT AS
		REPORT_CONTENT,
		R.REPORT_SUBDATE AS REPORT_SUBDATE, R.REPORT_STATE AS
		REPORT_STATE,
		M.MEM_NAME AS MEM_NAME
		FROM APPRREPORT A,REPORT R, MEMBER
		M
		WHERE A.REPORT_NUM =
		R.REPORT_NUM
		AND R.REPORT_WRITER = M.MEM_CODE
		AND
		A.MEM_CODE = 151113111365
		AND A.APPR_STATE = '1'
		ORDER BY
		REPORT_SUBDATE DESC;
		
		
