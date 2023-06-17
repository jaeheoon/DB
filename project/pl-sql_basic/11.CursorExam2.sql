DECLARE
    CURSOR employee_cursor IS
    SELECT
        employee_id,
        first_name,
        salary
    FROM
        employees;

    employee_row employee_cursor%ROWTYPE;
    v_totalsalary   NUMBER := 0;
BEGIN
    OPEN employee_cursor;
    dbms_output.put_line('=======================================');
    dbms_output.put_line('사원번호, 사원이름, 급여, 사원총급여');
    dbms_output.put_line('=======================================');
    LOOP
        FETCH employee_cursor INTO employee_row;
        EXIT WHEN employee_cursor%NOTFOUND;
        v_totalsalary := v_totalsalary + employee_row.salary;
        dbms_output.put_line(employee_row.employee_id
                             || ',  '
                             || employee_row.first_name
                             || ',  '
                             || employee_row.salary
                             || ', '
                             || v_totalsalary);

    END LOOP;

    dbms_output.put_line(employee_cursor%ROWCOUNT || '행이 검색되었습니다.');
    CLOSE employee_cursor;
END;