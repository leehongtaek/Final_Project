INSERT INTO "KOSTA"."MEMDEPT" (DEPT_NUM, DEPT_NAME) VALUES (MemDept_seq.nextVal, '부서0');
INSERT INTO "KOSTA"."MEMDEPT" (DEPT_NUM, DEPT_NAME) VALUES (MemDept_seq.nextVal, '부서1');
INSERT INTO "KOSTA"."MEMDEPT" (DEPT_NUM, DEPT_NAME) VALUES (MemDept_seq.nextVal, '부서2');
INSERT INTO "KOSTA"."MEMDEPT" (DEPT_NUM, DEPT_NAME) VALUES (MemDept_seq.nextVal, '부서3');
INSERT INTO "KOSTA"."MEMDEPT" (DEPT_NUM, DEPT_NAME) VALUES (MemDept_seq.nextVal, '부서4');
INSERT INTO "KOSTA"."MEMDEPT" (DEPT_NUM, DEPT_NAME) VALUES (MemDept_seq.nextVal, '부서5');


INSERT INTO "KOSTA"."MEMPOSIT" (POSIT_NUM, POSIT_NAME) VALUES (MemPosit_seq.nextVal, '관리자');
INSERT INTO "KOSTA"."MEMPOSIT" (POSIT_NUM, POSIT_NAME) VALUES (MemPosit_seq.nextVal, '사장');
INSERT INTO "KOSTA"."MEMPOSIT" (POSIT_NUM, POSIT_NAME) VALUES (MemPosit_seq.nextVal, '부장');
INSERT INTO "KOSTA"."MEMPOSIT" (POSIT_NUM, POSIT_NAME) VALUES (MemPosit_seq.nextVal, '차장');
INSERT INTO "KOSTA"."MEMPOSIT" (POSIT_NUM, POSIT_NAME) VALUES (MemPosit_seq.nextVal, '사원');
INSERT INTO "KOSTA"."MEMPOSIT" (POSIT_NUM, POSIT_NAME) VALUES (MemPosit_seq.nextVal, '인턴');

INSERT INTO "KOSTA"."MEMBER" (MEM_CODE, MEM_ID, MEM_PWD, MEM_NAME, DEPT_NUM, POSIT_NUM, MEM_TEL, MEM_EMAIL, MEM_HIREDATE, MEM_BIRTHDATE, MEM_POST, MEM_ROADADDR, MEM_JIBUNADDR, MEM_DETAILADDR) VALUES (member_code_generator(TO_DATE('2015-11-13 10:47:12', 'YYYY-MM-DD HH24:MI:SS'),TO_DATE('2015-11-13 10:47:12', 'YYYY-MM-DD HH24:MI:SS')), 'red', '123', '김병기', '1', '1', '010-4723-3426', 'wwww@nv.com', TO_DATE('2015-11-13 10:47:12', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2015-11-13 10:47:15', 'YYYY-MM-DD HH24:MI:SS'), '132456', '도로명', '지번주소', '상세주소');
INSERT INTO "KOSTA"."MEMBER" (MEM_CODE, MEM_ID, MEM_PWD, MEM_NAME, DEPT_NUM, POSIT_NUM, MEM_TEL, MEM_EMAIL, MEM_HIREDATE, MEM_BIRTHDATE, MEM_POST, MEM_ROADADDR, MEM_JIBUNADDR, MEM_DETAILADDR) VALUES (member_code_generator(TO_DATE('2015-11-13 10:47:12', 'YYYY-MM-DD HH24:MI:SS'),TO_DATE('2015-11-13 10:47:12', 'YYYY-MM-DD HH24:MI:SS')), 'test1', '123', 'test1', '1', '1', '010-4723-3426', 'wwww@nv.com', TO_DATE('2015-11-13 10:47:12', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2015-11-13 10:47:15', 'YYYY-MM-DD HH24:MI:SS'), '132456', '도로명', '지번주소', '상세주소');
INSERT INTO "KOSTA"."MEMBER" (MEM_CODE, MEM_ID, MEM_PWD, MEM_NAME, DEPT_NUM, POSIT_NUM, MEM_TEL, MEM_EMAIL, MEM_HIREDATE, MEM_BIRTHDATE, MEM_POST, MEM_ROADADDR, MEM_JIBUNADDR, MEM_DETAILADDR) VALUES (member_code_generator(TO_DATE('2015-11-13 10:47:12', 'YYYY-MM-DD HH24:MI:SS'),TO_DATE('2015-11-13 10:47:12', 'YYYY-MM-DD HH24:MI:SS')), 'test2', '123', 'test1', '1', '1', '010-4723-3426', 'wwww@nv.com', TO_DATE('2015-11-13 10:47:12', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2015-11-13 10:47:15', 'YYYY-MM-DD HH24:MI:SS'), '132456', '도로명', '지번주소', '상세주소');
INSERT INTO "KOSTA"."MEMBER" (MEM_CODE, MEM_ID, MEM_PWD, MEM_NAME, DEPT_NUM, POSIT_NUM, MEM_TEL, MEM_EMAIL, MEM_HIREDATE, MEM_BIRTHDATE, MEM_POST, MEM_ROADADDR, MEM_JIBUNADDR, MEM_DETAILADDR) VALUES (member_code_generator(TO_DATE('2015-11-13 10:47:12', 'YYYY-MM-DD HH24:MI:SS'),TO_DATE('2015-11-13 10:47:12', 'YYYY-MM-DD HH24:MI:SS')), 'test3', '123', 'test1', '1', '1', '010-4723-3426', 'wwww@nv.com', TO_DATE('2015-11-13 10:47:12', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2015-11-13 10:47:15', 'YYYY-MM-DD HH24:MI:SS'), '132456', '도로명', '지번주소', '상세주소');
INSERT INTO "KOSTA"."MEMBER" (MEM_CODE, MEM_ID, MEM_PWD, MEM_NAME, DEPT_NUM, POSIT_NUM, MEM_TEL, MEM_EMAIL, MEM_HIREDATE, MEM_BIRTHDATE, MEM_POST, MEM_ROADADDR, MEM_JIBUNADDR, MEM_DETAILADDR) VALUES (member_code_generator(TO_DATE('2015-11-13 10:47:12', 'YYYY-MM-DD HH24:MI:SS'),TO_DATE('2015-11-13 10:47:12', 'YYYY-MM-DD HH24:MI:SS')), 'test4', '123', 'test1', '1', '1', '010-4723-3426', 'wwww@nv.com', TO_DATE('2015-11-13 10:47:12', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2015-11-13 10:47:15', 'YYYY-MM-DD HH24:MI:SS'), '132456', '도로명', '지번주소', '상세주소');
INSERT INTO "KOSTA"."MEMBER" (MEM_CODE, MEM_ID, MEM_PWD, MEM_NAME, DEPT_NUM, POSIT_NUM, MEM_TEL, MEM_EMAIL, MEM_HIREDATE, MEM_BIRTHDATE, MEM_POST, MEM_ROADADDR, MEM_JIBUNADDR, MEM_DETAILADDR) VALUES (member_code_generator(TO_DATE('2015-11-13 10:47:12', 'YYYY-MM-DD HH24:MI:SS'),TO_DATE('2015-11-13 10:47:12', 'YYYY-MM-DD HH24:MI:SS')), 'test5', '123', 'test1', '1', '1', '010-4723-3426', 'wwww@nv.com', TO_DATE('2015-11-13 10:47:12', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2015-11-13 10:47:15', 'YYYY-MM-DD HH24:MI:SS'), '132456', '도로명', '지번주소', '상세주소');
INSERT INTO "KOSTA"."MEMBER" (MEM_CODE, MEM_ID, MEM_PWD, MEM_NAME, DEPT_NUM, POSIT_NUM, MEM_TEL, MEM_EMAIL, MEM_HIREDATE, MEM_BIRTHDATE, MEM_POST, MEM_ROADADDR, MEM_JIBUNADDR, MEM_DETAILADDR) VALUES (member_code_generator(TO_DATE('2015-11-13 10:47:12', 'YYYY-MM-DD HH24:MI:SS'),TO_DATE('2015-11-13 10:47:12', 'YYYY-MM-DD HH24:MI:SS')), 'test6', '123', 'test1', '1', '1', '010-4723-3426', 'wwww@nv.com', TO_DATE('2015-11-13 10:47:12', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2015-11-13 10:47:15', 'YYYY-MM-DD HH24:MI:SS'), '132456', '도로명', '지번주소', '상세주소');
INSERT INTO "KOSTA"."MEMBER" (MEM_CODE, MEM_ID, MEM_PWD, MEM_NAME, DEPT_NUM, POSIT_NUM, MEM_TEL, MEM_EMAIL, MEM_HIREDATE, MEM_BIRTHDATE, MEM_POST, MEM_ROADADDR, MEM_JIBUNADDR, MEM_DETAILADDR) VALUES (member_code_generator(TO_DATE('2015-11-13 10:47:12', 'YYYY-MM-DD HH24:MI:SS'),TO_DATE('2015-11-13 10:47:12', 'YYYY-MM-DD HH24:MI:SS')), 'test7', '123', '김병기', '1', '1', '010-4723-3426', 'wwww@nv.com', TO_DATE('2015-11-13 10:47:12', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2015-11-13 10:47:15', 'YYYY-MM-DD HH24:MI:SS'), '132456', '도로명', '지번주소', '상세주소');
INSERT INTO "KOSTA"."MEMBER" (MEM_CODE, MEM_ID, MEM_PWD, MEM_NAME, DEPT_NUM, POSIT_NUM, MEM_TEL, MEM_EMAIL, MEM_HIREDATE, MEM_BIRTHDATE, MEM_POST, MEM_ROADADDR, MEM_JIBUNADDR, MEM_DETAILADDR) VALUES (member_code_generator(TO_DATE('2015-11-13 10:47:12', 'YYYY-MM-DD HH24:MI:SS'),TO_DATE('2015-11-13 10:47:12', 'YYYY-MM-DD HH24:MI:SS')), 'test8', '123', '김병기', '1', '1', '010-4723-3426', 'wwww@nv.com', TO_DATE('2015-11-13 10:47:12', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2015-11-13 10:47:15', 'YYYY-MM-DD HH24:MI:SS'), '132456', '도로명', '지번주소', '상세주소');
INSERT INTO "KOSTA"."MEMBER" (MEM_CODE, MEM_ID, MEM_PWD, MEM_NAME, DEPT_NUM, POSIT_NUM, MEM_TEL, MEM_EMAIL, MEM_HIREDATE, MEM_BIRTHDATE, MEM_POST, MEM_ROADADDR, MEM_JIBUNADDR, MEM_DETAILADDR) VALUES (member_code_generator(TO_DATE('2015-11-13 10:47:12', 'YYYY-MM-DD HH24:MI:SS'),TO_DATE('2015-11-13 10:47:12', 'YYYY-MM-DD HH24:MI:SS')), 'test9', '123', '김병기', '1', '1', '010-4723-3426', 'wwww@nv.com', TO_DATE('2015-11-13 10:47:12', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2015-11-13 10:47:15', 'YYYY-MM-DD HH24:MI:SS'), '132456', '도로명', '지번주소', '상세주소');
INSERT INTO "KOSTA"."MEMBER" (MEM_CODE, MEM_ID, MEM_PWD, MEM_NAME, DEPT_NUM, POSIT_NUM, MEM_TEL, MEM_EMAIL, MEM_HIREDATE, MEM_BIRTHDATE, MEM_POST, MEM_ROADADDR, MEM_JIBUNADDR, MEM_DETAILADDR) VALUES (member_code_generator(TO_DATE('2015-11-13 10:47:12', 'YYYY-MM-DD HH24:MI:SS'),TO_DATE('2015-11-13 10:47:12', 'YYYY-MM-DD HH24:MI:SS')), 'test10', '123', '김병기', '1', '1', '010-4723-3426', 'wwww@nv.com', TO_DATE('2015-11-13 10:47:12', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2015-11-13 10:47:15', 'YYYY-MM-DD HH24:MI:SS'), '132456', '도로명', '지번주소', '상세주소');
INSERT INTO "KOSTA"."MEMBER" (MEM_CODE, MEM_ID, MEM_PWD, MEM_NAME, DEPT_NUM, POSIT_NUM, MEM_TEL, MEM_EMAIL, MEM_HIREDATE, MEM_BIRTHDATE, MEM_POST, MEM_ROADADDR, MEM_JIBUNADDR, MEM_DETAILADDR) VALUES (member_code_generator(TO_DATE('2015-11-13 10:47:12', 'YYYY-MM-DD HH24:MI:SS'),TO_DATE('2015-11-13 10:47:12', 'YYYY-MM-DD HH24:MI:SS')), 'test11', '123', '김병기', '1', '1', '010-4723-3426', 'wwww@nv.com', TO_DATE('2015-11-13 10:47:12', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2015-11-13 10:47:15', 'YYYY-MM-DD HH24:MI:SS'), '132456', '도로명', '지번주소', '상세주소');
INSERT INTO "KOSTA"."MEMBER" (MEM_CODE, MEM_ID, MEM_PWD, MEM_NAME, DEPT_NUM, POSIT_NUM, MEM_TEL, MEM_EMAIL, MEM_HIREDATE, MEM_BIRTHDATE, MEM_POST, MEM_ROADADDR, MEM_JIBUNADDR, MEM_DETAILADDR) VALUES (member_code_generator(TO_DATE('2015-11-13 10:47:12', 'YYYY-MM-DD HH24:MI:SS'),TO_DATE('2015-11-13 10:47:12', 'YYYY-MM-DD HH24:MI:SS')), 'test12', '123', '김병기', '1', '1', '010-4723-3426', 'wwww@nv.com', TO_DATE('2015-11-13 10:47:12', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2015-11-13 10:47:15', 'YYYY-MM-DD HH24:MI:SS'), '132456', '도로명', '지번주소', '상세주소');
INSERT INTO "KOSTA"."MEMBER" (MEM_CODE, MEM_ID, MEM_PWD, MEM_NAME, DEPT_NUM, POSIT_NUM, MEM_TEL, MEM_EMAIL, MEM_HIREDATE, MEM_BIRTHDATE, MEM_POST, MEM_ROADADDR, MEM_JIBUNADDR, MEM_DETAILADDR) VALUES (member_code_generator(TO_DATE('2015-11-13 10:47:12', 'YYYY-MM-DD HH24:MI:SS'),TO_DATE('2015-11-13 10:47:12', 'YYYY-MM-DD HH24:MI:SS')), 'test13', '123', '김병기', '1', '1', '010-4723-3426', 'wwww@nv.com', TO_DATE('2015-11-13 10:47:12', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2015-11-13 10:47:15', 'YYYY-MM-DD HH24:MI:SS'), '132456', '도로명', '지번주소', '상세주소');
INSERT INTO "KOSTA"."MEMBER" (MEM_CODE, MEM_ID, MEM_PWD, MEM_NAME, DEPT_NUM, POSIT_NUM, MEM_TEL, MEM_EMAIL, MEM_HIREDATE, MEM_BIRTHDATE, MEM_POST, MEM_ROADADDR, MEM_JIBUNADDR, MEM_DETAILADDR) VALUES (member_code_generator(TO_DATE('2015-11-13 10:47:12', 'YYYY-MM-DD HH24:MI:SS'),TO_DATE('2015-11-13 10:47:12', 'YYYY-MM-DD HH24:MI:SS')), 'test14', '123', '김병기', '1', '1', '010-4723-3426', 'wwww@nv.com', TO_DATE('2015-11-13 10:47:12', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2015-11-13 10:47:15', 'YYYY-MM-DD HH24:MI:SS'), '132456', '도로명', '지번주소', '상세주소');
INSERT INTO "KOSTA"."MEMBER" (MEM_CODE, MEM_ID, MEM_PWD, MEM_NAME, DEPT_NUM, POSIT_NUM, MEM_TEL, MEM_EMAIL, MEM_HIREDATE, MEM_BIRTHDATE, MEM_POST, MEM_ROADADDR, MEM_JIBUNADDR, MEM_DETAILADDR) VALUES (member_code_generator(TO_DATE('2015-11-13 10:47:12', 'YYYY-MM-DD HH24:MI:SS'),TO_DATE('2015-11-13 10:47:12', 'YYYY-MM-DD HH24:MI:SS')), 'test15', '123', '김병기', '1', '1', '010-4723-3426', 'wwww@nv.com', TO_DATE('2015-11-13 10:47:12', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2015-11-13 10:47:15', 'YYYY-MM-DD HH24:MI:SS'), '132456', '도로명', '지번주소', '상세주소');
INSERT INTO "KOSTA"."MEMBER" (MEM_CODE, MEM_ID, MEM_PWD, MEM_NAME, DEPT_NUM, POSIT_NUM, MEM_TEL, MEM_EMAIL, MEM_HIREDATE, MEM_BIRTHDATE, MEM_POST, MEM_ROADADDR, MEM_JIBUNADDR, MEM_DETAILADDR) VALUES (member_code_generator(TO_DATE('2015-11-13 10:47:12', 'YYYY-MM-DD HH24:MI:SS'),TO_DATE('2015-11-13 10:47:12', 'YYYY-MM-DD HH24:MI:SS')), 'test16', '123', '김병기', '1', '1', '010-4723-3426', 'wwww@nv.com', TO_DATE('2015-11-13 10:47:12', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2015-11-13 10:47:15', 'YYYY-MM-DD HH24:MI:SS'), '132456', '도로명', '지번주소', '상세주소');
INSERT INTO "KOSTA"."MEMBER" (MEM_CODE, MEM_ID, MEM_PWD, MEM_NAME, DEPT_NUM, POSIT_NUM, MEM_TEL, MEM_EMAIL, MEM_HIREDATE, MEM_BIRTHDATE, MEM_POST, MEM_ROADADDR, MEM_JIBUNADDR, MEM_DETAILADDR) VALUES (member_code_generator(TO_DATE('2015-11-13 10:47:12', 'YYYY-MM-DD HH24:MI:SS'),TO_DATE('2015-11-13 10:47:12', 'YYYY-MM-DD HH24:MI:SS')), 'test17', '123', '김병기', '1', '1', '010-4723-3426', 'wwww@nv.com', TO_DATE('2015-11-13 10:47:12', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2015-11-13 10:47:15', 'YYYY-MM-DD HH24:MI:SS'), '132456', '도로명', '지번주소', '상세주소');
INSERT INTO "KOSTA"."MEMBER" (MEM_CODE, MEM_ID, MEM_PWD, MEM_NAME, DEPT_NUM, POSIT_NUM, MEM_TEL, MEM_EMAIL, MEM_HIREDATE, MEM_BIRTHDATE, MEM_POST, MEM_ROADADDR, MEM_JIBUNADDR, MEM_DETAILADDR) VALUES (member_code_generator(TO_DATE('2015-11-13 10:47:12', 'YYYY-MM-DD HH24:MI:SS'),TO_DATE('2015-11-13 10:47:12', 'YYYY-MM-DD HH24:MI:SS')), 'test18', '123', '김병기', '1', '1', '010-4723-3426', 'wwww@nv.com', TO_DATE('2015-11-13 10:47:12', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2015-11-13 10:47:15', 'YYYY-MM-DD HH24:MI:SS'), '132456', '도로명', '지번주소', '상세주소');
INSERT INTO "KOSTA"."MEMBER" (MEM_CODE, MEM_ID, MEM_PWD, MEM_NAME, DEPT_NUM, POSIT_NUM, MEM_TEL, MEM_EMAIL, MEM_HIREDATE, MEM_BIRTHDATE, MEM_POST, MEM_ROADADDR, MEM_JIBUNADDR, MEM_DETAILADDR) VALUES (member_code_generator(TO_DATE('2015-11-13 10:47:12', 'YYYY-MM-DD HH24:MI:SS'),TO_DATE('2015-11-13 10:47:12', 'YYYY-MM-DD HH24:MI:SS')), 'test19', '123', '김병기', '1', '1', '010-4723-3426', 'wwww@nv.com', TO_DATE('2015-11-13 10:47:12', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2015-11-13 10:47:15', 'YYYY-MM-DD HH24:MI:SS'), '132456', '도로명', '지번주소', '상세주소');
INSERT INTO "KOSTA"."MEMBER" (MEM_CODE, MEM_ID, MEM_PWD, MEM_NAME, DEPT_NUM, POSIT_NUM, MEM_TEL, MEM_EMAIL, MEM_HIREDATE, MEM_BIRTHDATE, MEM_POST, MEM_ROADADDR, MEM_JIBUNADDR, MEM_DETAILADDR) VALUES (member_code_generator(TO_DATE('2015-11-13 10:47:12', 'YYYY-MM-DD HH24:MI:SS'),TO_DATE('2015-11-13 10:47:12', 'YYYY-MM-DD HH24:MI:SS')), 'test20', '123', '김병기', '1', '1', '010-4723-3426', 'wwww@nv.com', TO_DATE('2015-11-13 10:47:12', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2015-11-13 10:47:15', 'YYYY-MM-DD HH24:MI:SS'), '132456', '도로명', '지번주소', '상세주소');
INSERT INTO "KOSTA"."MEMBER" (MEM_CODE, MEM_ID, MEM_PWD, MEM_NAME, DEPT_NUM, POSIT_NUM, MEM_TEL, MEM_EMAIL, MEM_HIREDATE, MEM_BIRTHDATE, MEM_POST, MEM_ROADADDR, MEM_JIBUNADDR, MEM_DETAILADDR) VALUES (member_code_generator(TO_DATE('2015-11-13 10:47:12', 'YYYY-MM-DD HH24:MI:SS'),TO_DATE('2015-11-13 10:47:12', 'YYYY-MM-DD HH24:MI:SS')), 'test21', '123', '김병기', '1', '1', '010-4723-3426', 'wwww@nv.com', TO_DATE('2015-11-13 10:47:12', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2015-11-13 10:47:15', 'YYYY-MM-DD HH24:MI:SS'), '132456', '도로명', '지번주소', '상세주소');
INSERT INTO "KOSTA"."MEMBER" (MEM_CODE, MEM_ID, MEM_PWD, MEM_NAME, DEPT_NUM, POSIT_NUM, MEM_TEL, MEM_EMAIL, MEM_HIREDATE, MEM_BIRTHDATE, MEM_POST, MEM_ROADADDR, MEM_JIBUNADDR, MEM_DETAILADDR) VALUES (member_code_generator(TO_DATE('2015-11-13 10:47:12', 'YYYY-MM-DD HH24:MI:SS'),TO_DATE('2015-11-13 10:47:12', 'YYYY-MM-DD HH24:MI:SS')), 'test22', '123', '김병기', '1', '1', '010-4723-3426', 'wwww@nv.com', TO_DATE('2015-11-13 10:47:12', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2015-11-13 10:47:15', 'YYYY-MM-DD HH24:MI:SS'), '132456', '도로명', '지번주소', '상세주소');
INSERT INTO "KOSTA"."MEMBER" (MEM_CODE, MEM_ID, MEM_PWD, MEM_NAME, DEPT_NUM, POSIT_NUM, MEM_TEL, MEM_EMAIL, MEM_HIREDATE, MEM_BIRTHDATE, MEM_POST, MEM_ROADADDR, MEM_JIBUNADDR, MEM_DETAILADDR) VALUES (member_code_generator(TO_DATE('2015-11-13 10:47:12', 'YYYY-MM-DD HH24:MI:SS'),TO_DATE('2015-11-13 10:47:12', 'YYYY-MM-DD HH24:MI:SS')), 'test23', '123', '김병기', '1', '1', '010-4723-3426', 'wwww@nv.com', TO_DATE('2015-11-13 10:47:12', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2015-11-13 10:47:15', 'YYYY-MM-DD HH24:MI:SS'), '132456', '도로명', '지번주소', '상세주소');
INSERT INTO "KOSTA"."MEMBER" (MEM_CODE, MEM_ID, MEM_PWD, MEM_NAME, DEPT_NUM, POSIT_NUM, MEM_TEL, MEM_EMAIL, MEM_HIREDATE, MEM_BIRTHDATE, MEM_POST, MEM_ROADADDR, MEM_JIBUNADDR, MEM_DETAILADDR) VALUES (member_code_generator(TO_DATE('2015-11-13 10:47:12', 'YYYY-MM-DD HH24:MI:SS'),TO_DATE('2015-11-13 10:47:12', 'YYYY-MM-DD HH24:MI:SS')), 'test24', '123', '김병기', '1', '1', '010-4723-3426', 'wwww@nv.com', TO_DATE('2015-11-13 10:47:12', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2015-11-13 10:47:15', 'YYYY-MM-DD HH24:MI:SS'), '132456', '도로명', '지번주소', '상세주소');
INSERT INTO "KOSTA"."MEMBER" (MEM_CODE, MEM_ID, MEM_PWD, MEM_NAME, DEPT_NUM, POSIT_NUM, MEM_TEL, MEM_EMAIL, MEM_HIREDATE, MEM_BIRTHDATE, MEM_POST, MEM_ROADADDR, MEM_JIBUNADDR, MEM_DETAILADDR) VALUES (member_code_generator(TO_DATE('2015-11-13 10:47:12', 'YYYY-MM-DD HH24:MI:SS'),TO_DATE('2015-11-13 10:47:12', 'YYYY-MM-DD HH24:MI:SS')), 'test25', '123', '김병기', '1', '1', '010-4723-3426', 'wwww@nv.com', TO_DATE('2015-11-13 10:47:12', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2015-11-13 10:47:15', 'YYYY-MM-DD HH24:MI:SS'), '132456', '도로명', '지번주소', '상세주소');
INSERT INTO "KOSTA"."MEMBER" (MEM_CODE, MEM_ID, MEM_PWD, MEM_NAME, DEPT_NUM, POSIT_NUM, MEM_TEL, MEM_EMAIL, MEM_HIREDATE, MEM_BIRTHDATE, MEM_POST, MEM_ROADADDR, MEM_JIBUNADDR, MEM_DETAILADDR) VALUES (member_code_generator(TO_DATE('2015-11-13 10:47:12', 'YYYY-MM-DD HH24:MI:SS'),TO_DATE('2015-11-13 10:47:12', 'YYYY-MM-DD HH24:MI:SS')), 'test26', '123', '김병기', '1', '1', '010-4723-3426', 'wwww@nv.com', TO_DATE('2015-11-13 10:47:12', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2015-11-13 10:47:15', 'YYYY-MM-DD HH24:MI:SS'), '132456', '도로명', '지번주소', '상세주소');
INSERT INTO "KOSTA"."MEMBER" (MEM_CODE, MEM_ID, MEM_PWD, MEM_NAME, DEPT_NUM, POSIT_NUM, MEM_TEL, MEM_EMAIL, MEM_HIREDATE, MEM_BIRTHDATE, MEM_POST, MEM_ROADADDR, MEM_JIBUNADDR, MEM_DETAILADDR) VALUES (member_code_generator(TO_DATE('2015-11-13 10:47:12', 'YYYY-MM-DD HH24:MI:SS'),TO_DATE('2015-11-13 10:47:12', 'YYYY-MM-DD HH24:MI:SS')), 'test27', '123', '김병기', '1', '1', '010-4723-3426', 'wwww@nv.com', TO_DATE('2015-11-13 10:47:12', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2015-11-13 10:47:15', 'YYYY-MM-DD HH24:MI:SS'), '132456', '도로명', '지번주소', '상세주소');
INSERT INTO "KOSTA"."MEMBER" (MEM_CODE, MEM_ID, MEM_PWD, MEM_NAME, DEPT_NUM, POSIT_NUM, MEM_TEL, MEM_EMAIL, MEM_HIREDATE, MEM_BIRTHDATE, MEM_POST, MEM_ROADADDR, MEM_JIBUNADDR, MEM_DETAILADDR) VALUES (member_code_generator(TO_DATE('2015-11-13 10:47:12', 'YYYY-MM-DD HH24:MI:SS'),TO_DATE('2015-11-13 10:47:12', 'YYYY-MM-DD HH24:MI:SS')), 'test28', '123', '김병기', '1', '1', '010-4723-3426', 'wwww@nv.com', TO_DATE('2015-11-13 10:47:12', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2015-11-13 10:47:15', 'YYYY-MM-DD HH24:MI:SS'), '132456', '도로명', '지번주소', '상세주소');
INSERT INTO "KOSTA"."MEMBER" (MEM_CODE, MEM_ID, MEM_PWD, MEM_NAME, DEPT_NUM, POSIT_NUM, MEM_TEL, MEM_EMAIL, MEM_HIREDATE, MEM_BIRTHDATE, MEM_POST, MEM_ROADADDR, MEM_JIBUNADDR, MEM_DETAILADDR) VALUES (member_code_generator(TO_DATE('2015-11-13 10:47:12', 'YYYY-MM-DD HH24:MI:SS'),TO_DATE('2015-11-13 10:47:12', 'YYYY-MM-DD HH24:MI:SS')), 'test29', '123', '김병기', '1', '1', '010-4723-3426', 'wwww@nv.com', TO_DATE('2015-11-13 10:47:12', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2015-11-13 10:47:15', 'YYYY-MM-DD HH24:MI:SS'), '132456', '도로명', '지번주소', '상세주소');
INSERT INTO "KOSTA"."MEMBER" (MEM_CODE, MEM_ID, MEM_PWD, MEM_NAME, DEPT_NUM, POSIT_NUM, MEM_TEL, MEM_EMAIL, MEM_HIREDATE, MEM_BIRTHDATE, MEM_POST, MEM_ROADADDR, MEM_JIBUNADDR, MEM_DETAILADDR) VALUES (member_code_generator(TO_DATE('2015-11-13 10:47:12', 'YYYY-MM-DD HH24:MI:SS'),TO_DATE('2015-11-13 10:47:12', 'YYYY-MM-DD HH24:MI:SS')), 'test30', '123', '김병기', '1', '1', '010-4723-3426', 'wwww@nv.com', TO_DATE('2015-11-13 10:47:12', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2015-11-13 10:47:15', 'YYYY-MM-DD HH24:MI:SS'), '132456', '도로명', '지번주소', '상세주소');
INSERT INTO "KOSTA"."MEMBER" (MEM_CODE, MEM_ID, MEM_PWD, MEM_NAME, DEPT_NUM, POSIT_NUM, MEM_TEL, MEM_EMAIL, MEM_HIREDATE, MEM_BIRTHDATE, MEM_POST, MEM_ROADADDR, MEM_JIBUNADDR, MEM_DETAILADDR) VALUES (member_code_generator(TO_DATE('2015-11-13 10:47:12', 'YYYY-MM-DD HH24:MI:SS'),TO_DATE('2015-11-13 10:47:12', 'YYYY-MM-DD HH24:MI:SS')), 'test31', '123', '김병기', '1', '1', '010-4723-3426', 'wwww@nv.com', TO_DATE('2015-11-13 10:47:12', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2015-11-13 10:47:15', 'YYYY-MM-DD HH24:MI:SS'), '132456', '도로명', '지번주소', '상세주소');
INSERT INTO "KOSTA"."MEMBER" (MEM_CODE, MEM_ID, MEM_PWD, MEM_NAME, DEPT_NUM, POSIT_NUM, MEM_TEL, MEM_EMAIL, MEM_HIREDATE, MEM_BIRTHDATE, MEM_POST, MEM_ROADADDR, MEM_JIBUNADDR, MEM_DETAILADDR) VALUES (member_code_generator(TO_DATE('2015-11-13 10:47:12', 'YYYY-MM-DD HH24:MI:SS'),TO_DATE('2015-11-13 10:47:12', 'YYYY-MM-DD HH24:MI:SS')), 'test32', '123', '김병기', '1', '1', '010-4723-3426', 'wwww@nv.com', TO_DATE('2015-11-13 10:47:12', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2015-11-13 10:47:15', 'YYYY-MM-DD HH24:MI:SS'), '132456', '도로명', '지번주소', '상세주소');

INSERT INTO "KOSTA"."TIMECARD" (TC_NUM, TCWORK_START, TCWORK_END, MEM_CODE) VALUES (Timecard_seq.nextVal, TO_DATE('2015-11-13 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2015-11-13 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '15111311131');
INSERT INTO "KOSTA"."TIMECARD" (TC_NUM, TCWORK_START, TCWORK_END, MEM_CODE) VALUES (Timecard_seq.nextVal, TO_DATE('2015-11-14 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2015-11-14 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '15111311131');
INSERT INTO "KOSTA"."TIMECARD" (TC_NUM, TCWORK_START, TCWORK_END, MEM_CODE) VALUES (Timecard_seq.nextVal, TO_DATE('2015-11-15 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2015-11-15 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '15111311131');
INSERT INTO "KOSTA"."TIMECARD" (TC_NUM, TCWORK_START, TCWORK_END, MEM_CODE) VALUES (Timecard_seq.nextVal, TO_DATE('2015-11-16 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2015-11-16 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '15111311131');
INSERT INTO "KOSTA"."TIMECARD" (TC_NUM, TCWORK_START, TCWORK_END, MEM_CODE) VALUES (Timecard_seq.nextVal, TO_DATE('2015-11-17 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2015-11-17 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '15111311131');
INSERT INTO "KOSTA"."TIMECARD" (TC_NUM, TCWORK_START, TCWORK_END, MEM_CODE) VALUES (Timecard_seq.nextVal, TO_DATE('2015-11-18 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2015-11-18 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '15111311131');
INSERT INTO "KOSTA"."TIMECARD" (TC_NUM, TCWORK_START, TCWORK_END, MEM_CODE) VALUES (Timecard_seq.nextVal, TO_DATE('2015-11-19 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2015-11-19 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '15111311131');
INSERT INTO "KOSTA"."TIMECARD" (TC_NUM, TCWORK_START, TCWORK_END, MEM_CODE) VALUES (Timecard_seq.nextVal, TO_DATE('2015-11-20 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2015-11-20 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '15111311131');
INSERT INTO "KOSTA"."TIMECARD" (TC_NUM, TCWORK_START, TCWORK_END, MEM_CODE) VALUES (Timecard_seq.nextVal, TO_DATE('2015-11-21 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2015-11-21 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '15111311131');
INSERT INTO "KOSTA"."TIMECARD" (TC_NUM, TCWORK_START, TCWORK_END, MEM_CODE) VALUES (Timecard_seq.nextVal, TO_DATE('2015-11-22 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2015-11-22 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '15111311131');
INSERT INTO "KOSTA"."TIMECARD" (TC_NUM, TCWORK_START, TCWORK_END, MEM_CODE) VALUES (Timecard_seq.nextVal, TO_DATE('2015-11-23 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2015-11-23 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '15111311131');

commit;