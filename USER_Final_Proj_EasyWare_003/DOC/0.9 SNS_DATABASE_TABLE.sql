drop table sns;
DROP SEQUENCE sns_seq;

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

