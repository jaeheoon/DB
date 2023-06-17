--테이블 생성
--DDL은 실행과 동시에 Auto Commit된다
CREATE TABLE dept2(
  dept_id NUMBER(4), 
  dept_name VARCHAR2(30)
);

SELECT *
FROM user_tables;

--테이블 생성(비권장) : 레벨에 제약조건을 같이 써놓음
--Default : 유저 생성 시 테이블 행을 입력 하지 않아도 지정된 값이 디폴트로 입력된다
--NOT NULL : 테이블 생성 시 컬럼 레벨 NOT NULL 제약조건 추가
CREATE TABLE member(
  member_id VARCHAR2(10) CONSTRAINT member_id_pk PRIMARY KEY, 
  passwd VARCHAR2(20) NOT NULL,
  name VARCHAR2(10) NOT NULL,
  email VARCHAR2(30) CONSTRAINT member_email_uk UNIQUE,
  gender VARCHAR2(1) CONSTRAINT member_gender_ck CHECK(gender IN('M', 'F')),
  regdate DATE DEFAULT SYSDATE,
  manager_id NUMBER(6) CONSTRAINT member_manager_fk REFERENCES employees(employee_id)
);

DESC member;

--멤버 테이블 조회
SELECT *
FROM user_constraints
WHERE table_name = 'MEMBER';

--멤버 생성
INSERT INTO member(member_id, passwd, name, email, gender, manager_id)
VALUES('bangry313', '1111', '김기정', 'bangry313@gmail.com', 'M', 100);
--멤버 하나 더 생성
INSERT INTO member(member_id, passwd, name, email, gender, manager_id)
VALUES('bangry314', '1111', '김기정', 'bangry314@gmail.com', 'M', 100);
--날짜 수정하기
INSERT INTO member(member_id, passwd, name, email, regdate, gender, manager_id)
VALUES('bangry315', '1111', '김기정', 'bangry315@gmail.com', TO_DATE('2023-06-08', 'YYYY-MM-DD'), 'M', 100);
--값 들어가면 커밋 해줘야함
COMMIT;

SELECT * FROM member;

--기존 만든 테이블 삭제
DROP TABLE member;

--테이블 생성과 제약조건 분리(권장)
CREATE TABLE member(
  member_id VARCHAR2(10), 
  passwd VARCHAR2(20) NOT NULL,
  name VARCHAR2(10) NOT NULL,
  email VARCHAR2(30),
  gender VARCHAR2(1),
  regdate DATE DEFAULT SYSDATE,
  manager_id NUMBER(6)
);

ALTER TABLE member
  ADD(
  CONSTRAINT member_id_pk PRIMARY KEY(member_id), 
  CONSTRAINT member_email_uk UNIQUE(email),
  CONSTRAINT member_gender_ck CHECK(gender IN('M', 'F')),
  CONSTRAINT member_manager_fk FOREIGN KEY(manager_id) REFERENCES employees(employee_id)
  );

--개발의 편의성을 위해 제약조건 비활성화
ALTER TABLE member
  DISABLE CONSTRAINT member_id_pk
  DISABLE CONSTRAINT member_email_uk
  DISABLE CONSTRAINT member_gender_ck
  DISABLE CONSTRAINT member_manager_fk;

--다시 배포할때 제약조건 활성화
ALTER TABLE member
  ENABLE CONSTRAINT member_id_pk
  ENABLE CONSTRAINT member_email_uk
  ENABLE CONSTRAINT member_gender_ck
  ENABLE CONSTRAINT member_manager_fk;

--테이블 삭제 시 제약조건 같이 삭제
--DROP TABLE member [CASCADE CONSTRAINTS];

--테이블을 생성할 시 소문자로 생성해도 자동으로 대문자로 되는데 "테이블명"을 하면 소문자로도 생성됨
CREATE TABLE "abc"(
 num NUMBER(10)
);

--시퀀스 생성---------------------------------------------------------------------
CREATE SEQUENCE member_id_seq
  START WITH 100
  INCREMENT BY 10;

--딕셔너리 조회
SELECT *
FROM user_sequences;

SELECT member_id_seq.NEXTVAL
FROM dual;

SELECT member_id_seq.CURRVAL
FROM dual;

--뷰 생성 ------------------------------------------------------------------------
-- 조회할 수 있는 뷰 생성
CREATE OR REPLACE VIEW emp_view
AS SELECT employee_id, last_name, department_id
FROM employees;

-- 뷰 조회
SELECT * FROM emp_view;

-- 딕셔너리 조회
SELECT * FROM user_views;

-- 복잡한 쿼리를 뷰로 생성
CREATE OR REPLACE VIEW dept_detail_view
AS SELECT e.employee_id "사원 번호", e.last_name "사원 이름", d.department_name "부서명", l.city "도시명", l.state_province "주", c.country_name "국가명", r.region_name "대륙명"
FROM employees e 
  JOIN departments d ON e.department_id = d.department_id
  JOIN locations l ON d.location_id = l.location_id
  JOIN countries c ON l.country_id = c.country_id
  JOIN regions r ON c.region_id = r.region_id;

SELECT * FROM dept_detail_view;

-- 10번 부서의 사원에 대해서만 INSERT, UPDATE 할 수 있는 뷰 생성
CREATE OR REPLACE VIEW emp_view
AS SELECT employee_id, last_name, email, hire_date, job_id, department_id
FROM employees
WHERE department_id = 10
WITH CHECK OPTION;

INSERT INTO emp_view (employee_id, last_name, email, hire_date, job_id, department_id)
VALUES (employees_seq.nextval, 'jack', 'jack@korea.com', sysdate, 'AD_VP', 10);

-- INSERT ERROR - department_id가 다르기때문에 실행이 안된다
INSERT INTO emp_view (employee_id, last_name, email, hire_date, job_id, department_id)
VALUES (employees_seq.nextval, 'king', 'jack@korea.com', sysdate, 'AD_VP', 20);

-- 읽기 전용 뷰 생성
CREATE OR REPLACE VIEW emp_view
AS SELECT employee_id, last_name, email, hire_date, job_id, department_id
FROM employees
WHERE department_id = 10
WITH READ ONLY;

-- INSERT ERROR - 읽기 전용 뷰이기 때문에 실행이 안된다
INSERT INTO emp_view (employee_id, last_name, email, hire_date, job_id, department_id)
VALUES (employees_seq.nextval, 'jack', 'jack@korea.com', sysdate, 'AD_VP', 10);

SELECT rowid, employee_id
FROM employees;

--인덱스-----------------------------------------------------------------------------
-- 인덱스에서 사용하는 가상컬럼(rowid) 조회
SELECT rowid, employee_id
FROM employees;

-- 딕셔너리로부터 인덱스 조회
SELECT *
FROM user_indexes
WHERE table_name = 'EMPLOYEES';

-- 수동 인덱스 생성
CREATE INDEX emp_salary_idx
ON employees(salary);
 
-- 수동 인덱스 사용
SELECT employee_id, last_name, salary
FROM employees
WHERE salary BETWEEN 10000 AND 12000;

-- 자동 인덱스 사용 - 이메일은 유니크 키이기 때문에 따로 생성 안하고 사용됨
SELECT employee_id, last_name, salary
FROM employees
WHERE email = 'JSEO';

-- ROWNUM
SELECT ROWNUM, employee_id, first_name
FROM employees;

-- 테이블의 같은 행이라도 서로 다른 ROWNUM을 가질 수 있다
SELECT ROWNUM, employee_id
FROM employees;

SELECT ROWNUM, employee_id
FROM employees
ORDER BY employee_id DESC;

-- 사원 5명만 조회
SELECT ROWNUM, employee_id, first_name
FROM employees
WHERE ROWNUM <= 5;

-- 주의
-- 첫번째 행의 rownum이 1이므로
-- 1 > 1은 false가 되어 rownum은 더이상 증가하지 않으며, 하나의 행도 반환되지 않음
SELECT ROWNUM, employee_id, first_name
FROM employees
WHERE ROWNUM > 1;

-- 사원 10명만 조회
SELECT ROWNUM, employee_id, first_name
FROM employees
WHERE ROWNUM <= 10;

/* 특정 컬럼을 기준으로 정렬하여 상위 5개(범위)를 조회하고자 한다면 */
-- 예)전체 사원의 급여순으로 5명 조회하기
SELECT first_name, salary
FROM employees
WHERE ROWNUM <=5
ORDER BY salary DESC;
-- 잘못된 query : 전체 급여 순위가 아닌 처음 5명안에서의 급여 순위 정렬됨

-- 문제 해결) FROM절에서 서브쿼리(Inline View)를 사용해야 한다
SELECT * 
FROM (SELECT * 
      FROM employees 
      ORDER BY salary DESC) --전체에서 역순으로 정렬 후 5명을 가져온다
WHERE ROWNUM <= 5;

-- 급여순으로 페이징 처리 (10개씩 잘라서 조회하기) - 서브쿼리 두 번 사용하여 가져옴
SELECT page, 
       employee_id, 
       first_name, 
       salary 
FROM (SELECT CEIL(ROWNUM / 10) page, 
                               employee_id, 
                               first_name, 
                               salary 
       FROM (SELECT ROWNUM, 
                    employee_id, 
                    first_name, 
                    salary 
             FROM employees 
             -- 필요에 따라 검색 조건 추가
             ORDER BY salary DESC)) 
WHERE page = 2; 

-- 시노님 생성-----------------------------------------------------------------------
CREATE SYNONYM emps
FOR HR.employees;

SELECT * FROM emps;

-- 시노님 삭제
DROP SYNONYM emps;












