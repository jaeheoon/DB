/* 반복문 */
DECLARE
    i NUMBER := 0;
BEGIN
    LOOP
        i := i + 1;
      -- 조건
        EXIT WHEN i >= 10;
        dbms_output.put_line(i);
    END LOOP;
END;