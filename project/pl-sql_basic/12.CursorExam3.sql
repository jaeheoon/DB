/* FOR...IN...LOOP...END LOOP;문 이용하여 간단하게 커서 사용*/
DECLARE
    CURSOR employee_cursor IS
    SELECT
        employee_id,
        first_name,
        salary
    FROM
        employees;

    employee_row employee_cursor%ROWTYPE;
    v_total_salary  NUMBER := 0;
    v_row_count     NUMBER := 0;
BEGIN
	--OPEN employee_cursor;
    dbms_output.put_line('=======================================');
    dbms_output.put_line('사원번호, 사-이름, 급여, 사원총급여');
    dbms_output.put_line('=======================================');
    FOR employee_row IN employee_cursor LOOP
    	--FETCH employee_cursor  INTO employee_row;
        --EXIT WHEN employee_cursor%NOTFOUND;
        v_total_salary := v_total_salary + employee_row.salary;
        v_row_count := v_row_count + 1;
        dbms_output.put_line(employee_row.employee_id
                             || ',  '
                             || employee_row.first_name
                             || ',  '
                             || employee_row.salary
                             || ', '
                             || v_total_salary);

    END LOOP;

    dbms_output.put_line(v_row_count || '행이 검색되었습니다.');
    --CLOSE employee_cursor;

END;