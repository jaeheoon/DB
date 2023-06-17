/*
 * 커서(CURSOR)란?
 * SELECT문의 결과집합을 저장하기 위해 서버에 확보하는 메모리 영역
 * SELECT문의 결과집합이 다중행인 경우 반드시 커서를 이용해야 한다.
 */
DECLARE
	-- #1. 커서 선언
    CURSOR department_cursor IS
    SELECT
        department_id,
        department_name,
        location_id
    FROM
        departments;
        
    --변수선언
    department_row department_cursor%rowtype;
BEGIN
	-- #2. 커서 생성(질의를 수행하고 모든 행으로 구성된 결과집합을 생성하고,
    -- 커서는 결과셋의 첫번째행을 가리킨다
    OPEN department_cursor;
    LOOP
        FETCH department_cursor INTO
              department_row.department_id,
              department_row.department_name,
              department_row.location_id;
        EXIT WHEN department_cursor%notfound;
        
        -- 커서가 제공하는 속성: FOUND, NOTFOUND, ROWCOUNT
        dbms_output.put_line(department_row.department_id || ', ' || department_row.department_name
                             || ', ' || department_row.location_id);
    END LOOP;
    dbms_output.put_line(department_cursor%rowcount || '행이 검색되었습니다.');

    -- #3.커서 닫기
    CLOSE department_cursor;
END;