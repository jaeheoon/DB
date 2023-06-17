--묵시적 조인(오라클 조인) : where 절에 행 조건과 조인 조건이 같이 있기 때문에 가독성 떨어진다
--e.department_id = d.department_id 이런식으로 PK와 FK가 같은 행을 추가한다
SELECT
    employee_id,
    salary,
    department_name
FROM
    employees   e,
    departments d
WHERE
        e.department_id = d.department_id
    AND e.employee_id = 104;

--명시적 조인(ANSI 조인) : From 절에 JOIN 키워드와 함께 조인 테이블을 명시
--employees e JOIN departments d ON e.department_id = d.department_id 이런 식으로 JOIN과 ON을 사용하여 명시적으로 표현해준다
SELECT
    employee_id,
    salary,
    department_name
FROM
         employees e
    JOIN departments d ON e.department_id = d.department_id
WHERE
    e.employee_id = 104;

--3개 이상 명시적 조인(딕셔너리(테이블)로부터 테이블 종류 조회)
--딕셔너리 테이블 : 가상 테이블 - 레지스트리처럼 테이블 목록을 관리해주는 것 - 저장을 안해도 자동으로 저장해준다
SELECT
    *
FROM
    user_tables;

--내부 조인(EQUI 조인) : 조인하고자 하는 두 테이블에서 공통적으로 존재하는 컬럼(department_id)의 값이 일치하는 행과 행을 조인한다
SELECT
    e.employee_id     "사원 번호",
    e.last_name       "사원 이름",
    d.department_name "부서명",
    l.city            "도시명",
    l.state_province  "주",
    c.country_name    "국가명",
    r.region_name     "대륙명"
FROM
         employees e
    JOIN departments d ON e.department_id = d.department_id
    JOIN locations   l ON d.location_id = l.location_id
    JOIN countries   c ON l.country_id = c.country_id
    JOIN regions     r ON c.region_id = r.region_id;
  
--내부 조인(NON-EQUI 조인) : 조인 조건에서‘=’ 연산자를 이용한 동등비교가 아닌 다른 비교연산자를 사용하여 특정범위로 행과 행을 연결하여 조인
--#1 테스트 급여등급(salgrade) 테이블 생성
CREATE TABLE salgrade (
    grade NUMBER,
    losal NUMBER,
    hisal NUMBER
);

--#2 데이터 입력
INSERT INTO salgrade VALUES (
    1,
    2000,
    2999
);

INSERT INTO salgrade VALUES (
    2,
    3000,
    3999
);

INSERT INTO salgrade VALUES (
    3,
    4000,
    4999
);

INSERT INTO salgrade VALUES (
    4,
    5000,
    5999
);

INSERT INTO salgrade VALUES (
    5,
    6000,
    100000
);

COMMIT;

-- 제대로 생성되었는지 조회
SELECT
    *
FROM
    salgrade;

--#3 ANSI 표준 NON-EQUI JOIN
SELECT
    e.employee_id "사원 번호",
    e.last_name   "이름",
    e.salary      "급여",
    s.grade       "급여등급"
FROM
         employees e
    JOIN salgrade s ON e.salary BETWEEN s.losal AND s.hisal
ORDER BY
    s.grade ASC;

--외부 조인 : 두 테이블에서 조인 조건을 만족하지 않는 행들도 결과 테이블에 포함시키는 조인이다
--원래 LEFT를 붙이지 않을 경우 106개가 조회되지만 사원 정보를 왼쪽에 붙여서 조회됐다
--employees에 있는 정보를 붙여주는 것
SELECT
    employee_id,
    salary,
    department_name
FROM
    employees   e
    LEFT JOIN departments d ON e.department_id = d.department_id;
  
--원래 RIGHT를 붙이지 않을 경우 106개가 조회되지만 부서를 오른쪽에 붙여서 조회됐다
--departments에 있는 정보를 붙여주는 것
SELECT
    employee_id,
    salary,
    department_name
FROM
    employees   e
    RIGHT JOIN departments d ON e.department_id = d.department_id;
  
--원래 FULL을 붙이지 않을 경우 106개가 조회되지만 부서와 사원 정보가 붙어서 조회됐다
--employees와 departments 두개를 붙여주는 것
SELECT
    employee_id,
    salary,
    department_name
FROM
    employees   e
    FULL JOIN departments d ON e.department_id = d.department_id;

--오라클 조인의 외부 조인 방법(참고사항, 지금은 쓰지 않지만 예전 방식이 사용됐을 경우 참고)
--오라클조인의 LEFT OUT 조인 방식 : 오른쪽에 (+)를 붙여준다, FULL은 안됨
SELECT
    employee_id,
    salary,
    department_name
FROM
    employees   e,
    departments d
WHERE
    e.department_id = d.department_id (+);

--셀프 조인
SELECT
    e1.employee_id "사원 번호",
    e1.last_name   "이름",
    e2.last_name   "상사 이름"
FROM
         employees e1
    JOIN employees e2 ON e1.manager_id = e2.employee_id;

SELECT
    e.employee_id,
    e.last_name,
    d.department_name,
    l.city
FROM
         employees e
    JOIN departments d ON e.department_id = d.department_id
    JOIN locations   l ON d.location_id = l.location_id










