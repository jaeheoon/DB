-- 프로시저 매개변수 처리
-- 사원번호 입력받아 받아 사원번호, 이름, 급여 반환
CREATE OR REPLACE PROCEDURE findemployeebyno (
    in_id      IN employees.employee_id%TYPE,
    out_id     OUT employees.employee_id%TYPE,
    out_name   OUT employees.first_name%TYPE,
    out_salary OUT employees.salary%TYPE
) IS
BEGIN
    SELECT
        employee_id,
        first_name,
        salary
    INTO
        out_id,
        out_name,
        out_salary
    FROM
        employees
    WHERE
        employee_id = in_id;

END;

-- SQLPlus*에서 프로시저 실행
-- 반환값을 받기 위한 변수선언
/*
VAR b_id NUMBER;
VAR b_name VARCHAR2(20);
VAR b_salary NUMBER;

EXECUTE findEmployeeByNo(100, :b_id, :b_name, :b_salary);
-- 변수값 출력
print b_id;
*/