/* PL/SQL 제어문 */
DECLARE
    v_no    NUMBER(2) := 5;
    v_score NUMBER(3) := 80;
BEGIN
  -- 단순 IF ~ END IF;
    IF v_no = 5 THEN
        dbms_output.put_line('5입니다..');
    END IF;

  -- IF ~ ELSE ~ END IF;
    IF v_no = 5 THEN
        dbms_output.put_line('5입니다..');
    ELSE
        dbms_output.put_line('5가 아닙니다.');
    END IF;

  -- 다중 IF ~~ ELSEIF ~ END IF;
    IF v_score >= 90 THEN
        dbms_output.put_line('수');
    ELSIF v_score >= 80 THEN
        dbms_output.put_line('우');
    ELSIF v_score >= 70 THEN
        dbms_output.put_line('미');
    ELSIF v_score >= 60 THEN
        dbms_output.put_line('양');
    ELSE
        dbms_output.put_line('가');
    END IF;

END;