-- DB 환경 맞추어주기 

-- 1. CMD로 들어가서 DBA(Database Administrator) 계정으로 로그인
sqlplus / as sysdba

   
-- 2. 오라클 DB 에 새로운 계정을 등록한다 
-- (사용자 생성 쿼리) 
CREATE USER kosta IDENTIFIED BY kosta1234
DEFAULT TABLESPACE users;


-- 참고 )사용자 비밀번호 변경
ALTER USER kosta IDENTIFIED BY kosta1234;


--  3. 권한 설정을 해준다 
-- 	   DBA 권한 설정 
GRANT RESOURCE, CONNECT TO kosta;
GRANT DBA TO kosta;

-- 4. 현재 계정의 모든 테이블 삭제!!
--%%주의%% 꼭 삭제할 계정으로 접속해서 삭제할 것
conn kosta/kosta1234

Begin
    for c in (select table_name from user_tables) loop
    execute immediate ('drop table '||c.table_name||' cascade constraints');
    end loop;
    End;
    .
-- 엔터 이렇게 입력하면
-- SQL>
-- 다시 이렇게 아무것도 안뜨는 명령어가 뜬다.
-- SQL> run 을 실행한다. 
-- PL/SQL procedure successfully completed.<--메시지가 나오면 성공
-- 그 후에 
-- SQL> purge recyclebin; 
   
