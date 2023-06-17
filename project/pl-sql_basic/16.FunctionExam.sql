-- 함수(function)는 프로시저에 비해 실행결과를 더 유연하게 받을 수 있고, SQL문에서 호출가능한 장점을 가진다.
CREATE OR REPLACE FUNCTION getSalary (p_no employees.employee_id%TYPE) RETURN NUMBER IS
    v_salary NUMBER;
BEGIN
    SELECT
        salary
    INTO v_salary
    FROM
        employees
    WHERE
        employee_id = p_no;

    RETURN v_salary;
END;

-- SQLPlus* 실행
--VARIABLE salary NUMBER;
--EXECUTE :salary := getSalary(100);

-- SQL에서 함수 실행
--SELECT getSalary(100)
--FROM dual;