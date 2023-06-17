DECLARE
	--  사용자 정의 ROWTYPE(구조체)
    TYPE my_row_type IS RECORD (
        v_no     employees.employee_id%TYPE,
        v_name   employees.first_name%TYPE,
        v_salary employees.salary%TYPE
    );
    
    employee_row my_row_type;
BEGIN
    SELECT
        employee_id,
        first_name,
        salary
    INTO employee_row
    FROM
        employees
    WHERE
        first_name = 'Lisa';

    dbms_output.put_line(employee_row.v_no || ', ' || employee_row.v_name || ' ' || employee_row.v_salary);

END;