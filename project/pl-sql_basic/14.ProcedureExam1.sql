-- 프로시저(Procedure)
-- 자주 사용되는 PL/SQL 코드 블럭을 재사용할 수 있도록 모듈화하여 DBMS에 저장하고 사용(호출)
-- 부서번호 입력 받아 사원목록 출력
-- DDL 이용하여 프로시저 생성
CREATE OR REPLACE PROCEDURE listbydeptno (p_deptno employees.department_id%TYPE) IS
    employee_row employees%ROWTYPE;
    CURSOR employee_cursor IS
    SELECT
        *
    FROM
        employees
    WHERE
        department_id = p_deptno;

BEGIN
    dbms_output.put_line('--- 사원 목록 ---');
    FOR employee_row IN employee_cursor LOOP
    	--EXIT WHEN employee_cursor%NOTFOUND;
        dbms_output.put_line(p_deptno
                             || ','
                             || employee_row.employee_id
                             || ', '
                             || employee_row.first_name
                             || ', '
                             || employee_row.salary);
    END LOOP;

END;

-- SQLPlus*에서 프로시저 실행
--EXECUTE listByDeptno(100);