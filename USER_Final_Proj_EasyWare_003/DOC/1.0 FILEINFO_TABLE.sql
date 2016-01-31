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
 
 commit;
 
 