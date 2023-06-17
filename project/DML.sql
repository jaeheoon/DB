DESC departments;

--유저의 제약조건 파악
SELECT *
FROM user_constraints
WHERE table_name = 'DEPARTMENTS';

--값을 넣을때 DESC의 유형을 확인하면서 넣어야함
INSERT INTO departments(department_id, department_name)
VALUES(7777, '이젠학원');

--컬럼 4개 다 넣기
INSERT INTO departments(department_id, department_name, manager_id, location_id)
VALUES(7778, '이젠학원2', 100, 1000);

--location_id FK를 확인하기 위해 로케이션 필드 확인
SELECT *
FROM locations;

--시퀀스를 이용한 부서번호 자동 생성 이용
INSERT INTO departments(department_id, department_name, manager_id, location_id)
VALUES(departments_seq.NEXTVAL, '재헌', 100, 1000);

--위에 값이 잘 들어갔는지 확인
SELECT *
FROM departments
ORDER BY department_id;

-- 서브쿼리를 이용한 테이블 행 복사/붙여넣기
-- 테스트를 위한 dept 테이블 생성
-- 서브쿼리를 이용한 테이블 구조만 복사 - 안에 데이터 없음
CREATE TABLE dept
AS SELECT *
FROM departments
WHERE 0 = 1;

-- 서브쿼리를 이용한 복사/붙여넣기해서 값 넣기
INSERT INTO dept
SELECT * FROM departments;

--위에 값이 잘 들어갔는지 확인
SELECT *
FROM departments;

--행 수정
UPDATE employees
SET department_id = 30
WHERE employee_id = 127;

--모든 직원들 급여 변경
UPDATE emp
SET salary = salary * 1.1;

--행 삭제
DELETE FROM employees
WHERE employee_id = 210;

DELETE FROM departments
WHERE department_name LIKE '%이젠%';

-- 서브쿼리 활용하여 삭제
DELETE FROM emp
WHERE salary > (SELECT AVG(salary)
                FROM emp) ;
                
COMMIT;     --파일에 옮겨준다
--ROLLBACK; --메모리에 저장되어있는 데이터를 원상복구 시켜준다/다날라감

--JAVA에서 클래스로 추상화 하기 위해 컬럼값 출력
DESC employees;

INSERT INTO employees(employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, department_id)
VALUES(employees_seq.NEXTVAL, '기정', '김', 'kkkk@kkk.co.kr', '011.123.4567', sysdate, 'IT_PROG', 5000, 10);

SELECT * FROM employees
WHERE department_id = 100;

UPDATE employees
SET salary = salary + 500
--WHERE employee_id = employees_seq.CURRVAL;      --employees_seq.CURRVAL : 현재 값을 보여줌
WHERE department_id = 10;

commit;

rollback;










