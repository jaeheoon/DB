DECLARE
  -- 레퍼런스 타입(ROWTYPE)
    v_employee_row   employees%rowtype; -- 구조체 형식
    v_department_name departments.department_name%TYPE;
BEGIN
  -- 조인 사용하지 않아도 됨..
    SELECT    *
    INTO  v_employee_row
    FROM  employees
    WHERE first_name = 'Lisa';

    SELECT  department_name
    INTO    v_department_name
    FROM    departments
    WHERE   department_id = v_employee_row.department_id;

    dbms_output.put_line('====== 사원 정보 ======');
    dbms_output.put_line(v_employee_row.employee_id || ', ' || v_employee_row.last_name || ', ' || v_department_name);

END;