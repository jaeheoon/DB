DECLARE
    i NUMBER := 0;
BEGIN
    WHILE i < 9 LOOP
        i := i + 1;
        dbms_output.put_line(i);
    END LOOP;
END;