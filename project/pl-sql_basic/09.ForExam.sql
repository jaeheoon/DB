BEGIN
    FOR i IN 0..9 LOOP
        dbms_output.put_line(i || ': 김기정 최고');
    END LOOP;

  -- 중첩 for 구구단 출력
    FOR i IN 2..9 LOOP
        FOR j IN 1..9 LOOP
            dbms_output.put(i || '*' || j || '=' || i * j || ' ');
        END LOOP;
        dbms_output.put_line(' ');
    END LOOP;

END;