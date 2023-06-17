SET SERVEROUTPUT ON;
-- SQLPlus*에서 실행시 set serveroutput on; 설정 필요...
-- 선언부
DECLARE
	-- 변수
    v_no       NUMBER(3) := 10;
    -- 상수
    c_message  CONSTANT VARCHAR2(50) := '안녕하세요. PL/SQL!!!';
    v_hiredate VARCHAR2(30) := to_char(sysdate, 'YYYY/MM/DD HH24:MI:SS');
-- 실행부
BEGIN
	-- dbms_output 패키지의 put_line 프로시저를 이용한 문자열 출력
    dbms_output.put_line('--- PL/SQL 실습입니다. ---');
    -- 변수 출력    
    dbms_output.put_line(v_no);
    dbms_output.put_line(c_message);
    dbms_output.put_line(v_hiredate);
END;