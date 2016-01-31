/* Member */
CREATE TABLE Member (
	mem_code VARCHAR2(50) NOT NULL, /* 사번 */
	mem_id VARCHAR2(30) NOT NULL, /* 아이디 */
	mem_pwd VARCHAR2(30) NOT NULL, /* 패스워드 */
	mem_name VARCHAR2(30) NOT NULL, /* 사원이름 */
	dept_num NUMBER, /* 부서번호 */
	posit_num NUMBER, /* 직급번호 */
	mem_tel VARCHAR2(20), /* 전화번호 */
	mem_email VARCHAR2(30), /* 이메일 */
	mem_birthdate DATE NOT NULL, /* 생년월일 */
	mem_hiredate DATE NOT NULL, /* 입사일 */
	mem_post CHAR(6), /* 우편번호 */
	mem_roadaddr VARCHAR2(300), /* 도로명 */
	mem_jibunaddr VARCHAR2(300), /* 지번 */
	mem_detailaddr VARCHAR2(300), /* 상세주소 */
	mem_state CHAR(1) DEFAULT 1 NOT NULL /* 사원상태 */
);




/
/* Company */
CREATE TABLE Company (
	comp_num NUMBER NOT NULL, /* 회사번호 */
	comp_name VARCHAR2(100) NOT NULL, /* 이름 */
	comp_roadaddr VARCHAR2(300), /* 도로명 */
	comp_jibunaddr VARCHAR2(300), /* 지번 */
	comp_post CHAR(6), /* 우편번호 */
	comp_detailaddr VARCHAR2(300), /* 상세주소 */
	comp_tel VARCHAR2(20), /* 전화번호 */
	comp_home VARCHAR2(30) /* 홈페이지 */
);



/* 권한 정보 */
CREATE TABLE MemRole (
	role_auth VARCHAR2(20) NOT NULL, /* 권한 */
	mem_code VARCHAR2(20) NOT NULL /* 사원코드 */
);


