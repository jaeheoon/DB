/* FOR...IN...LOOP...END LOOP;문에서 인라인커서 사용하기 */
DECLARE
    v_total_salary NUMBER := 0;
    v_row_count    NUMBER := 0;
BEGIN
    dbms_output.put_line('=======================================');
    dbms_output.put_line('사원번호, 사원이름, 급여, 사원총급여');
    dbms_output.put_line('=======================================');
    FOR employee_row IN (
        SELECT
            employee_id,
            first_name,
            salary
        FROM
            employees
    ) LOOP
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
END;