-- 트리거(Trigger)
-- 특정 테이블에 DML이 수행되면(이벤트 발생) 자동으로 수행되는 프로시저 (이벤트 처리)
-- 트리거는 사용자가 직접 실행할 수 없다.
CREATE OR REPLACE TRIGGER dept_insert_trigger
-- 이벤트 종류: insert | update | delete
-- 이벤트 시점: BEFORE | AFTER
 AFTER
    INSERT -- 인서트 이벤트 발생 후에..
     ON departments -- 이벤트 소스
--FOR EACH ROW -- 문장레벨트리거
/*
 * 트리거유형
   - 문장레벨트리거: DML 발생시 한번만 트리거 실행
   - 행레벨트리거  : DML 발생시 각 행이 변경될 때마다 트리거 실행
  */
BEGIN
    dbms_output.put_line('부서테이블에 행 추가되었습니다.');
END;