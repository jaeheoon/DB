/*
 * 특정 테이블의 행을 검색하여 변수에 할당한 후 변수의 값 출력
 */
DECLARE
    v_name     VARCHAR2(20);
    v_salary   NUMBER(8, 2);
    v_hiredate VARCHAR2(30);
BEGIN
    SELECT last_name, salary, to_char(hire_date, 'YYYY-MM-DD')
    INTO   v_name, v_salary,v_hiredate      --INTO는 출력된 쿼리를 변수에 선언된 것에 넣어주는 것
    FROM   employees
    WHERE  employee_id = 104;

    dbms_output.put_line('=== 사원 정보 ===');
    dbms_output.put_line(v_name || ', ' || v_salary || ', ' || v_hiredate);
END;