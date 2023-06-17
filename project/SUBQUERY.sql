--SUBQUERY(서브쿼리 or 내부쿼리)---------------------------------------------------------
SELECT e.employee_id, e.last_name, e.hire_date
FROM employees e
WHERE hire_date < (SELECT hire_date FROM employees WHERE employee_id = 100);

-- 사원 중에 이름이 Seo 인 사원과 동일한 급여(salary)를 받는 사원을 조회
SELECT e.employee_id, e.last_name, e.hire_date
FROM employees e
WHERE salary = (
SELECT salary FROM employees WHERE last_name = 'Seo'
) AND last_name != 'Seo';

--단일행 서브쿼리------------------------------------------------------------------------
--값이 하나로 나온다
-- 서브쿼리를 사용하지 않을 경우
SELECT salary
FROM employees
WHERE LOWER(last_name) = 'seo';

SELECT *
FROM employees
WHERE salary = 2700;

-- 단일행 서브쿼리
SELECT *
FROM employees
WHERE salary = (SELECT salary
FROM employees
WHERE LOWER(last_name) = 'seo');

-- 전체사원 평균급여보다 더 많은 급여를 받는 사원 목록 조회
SELECT *
FROM employees
WHERE salary > (SELECT AVG(salary)
FROM employees); 

--다중행 서브쿼리------------------------------------------------------------------------
--IN 연산자 : 포함된 모든 것들 출력
--30번 부서에 소속된 사원들과 동일한 업무를 가지는 전체 사원목록 조회
SELECT last_name, job_id, department_id
FROM employees
WHERE job_id IN (SELECT DISTINCT job_id
                FROM employees
                WHERE department_id = 30);
            
--ANY 연산자 : 이 중에서 최소값을 출력 - 단일행 서브쿼리 MIN을 주로 씀
-- 30번 부서의 최소 급여자보다 더 많은 급여를 받는 전체 사원목록 조회
SELECT *
FROM employees
WHERE salary > ANY (SELECT salary
                    FROM employees
                    WHERE department_id = 30);
--단일행으로 변경
SELECT *
FROM employees
WHERE salary > (SELECT min(salary)
                    FROM employees
                    WHERE department_id = 30);

--ALL 연산자 : 이 중에서 최대값을 출력 - 단일행 서브쿼리 MAX을 주로 씀
-- 30번 부서의 최소 급여자보다 더 많은 급여를 받는 전체 사원목록 조회
SELECT *
FROM employees
WHERE salary > ALL (SELECT salary
                    FROM employees
                    WHERE department_id = 30);

--EXISTS 연산자 : 서브쿼리의 결과 유무에 따른 조회(하나 이상 존재 시 실행)
-- 보통 재고가 있을 경우 테이블로 보여줘서 목록을 출력할때 사용
SELECT *
FROM employees
WHERE EXISTS(SELECT *
              FROM departments
              WHERE department_id = 30)
    AND department_id = 30;
    
--2007년 이후 입사한 사원이 있는 사원이름, 부서번호, 부서명 조회
--EXISTS 연산자 사용
SELECT department_id "부서 번호", d.department_name "부서명"
FROM departments d
WHERE EXISTS(SELECT d.department_id
             FROM employees e
             WHERE e.hire_date >= TO_DATE('2007/01/01') AND e.department_id = d.department_id);
--IN 연산자 사용
SELECT department_id "부서 번호", d.department_name "부서명"
FROM departments d
WHERE d.department_id IN(SELECT e.department_id
                         FROM employees e
                         WHERE e.hire_date >= TO_DATE('2007/01/01'));

--다중컬럼 서브쿼리------------------------------------------------------------------------
-- 사원번호가 147인 사원과 같은 부서, 같은 입사일자인 사원들의 사원번호, 이름, 업무, 부서번호를 조회
SELECT employee_id, last_name, job_id, department_id
FROM employees
WHERE (department_id, hire_date) = (SELECT department_id, hire_date
                                    FROM employees
                                    WHERE employee_id = 147);

-- 부서별 최소급여를 받는 사원 정보
SELECT *
FROM employees
WHERE (department_id, salary) IN(SELECT department_id, MIN(salary)
                                 FROM employees
                                 GROUP BY department_id)
ORDER BY department_id;

--인라인 뷰---------------------------------------------------------------------------------
-- 부서별 최대 급여자 정보 확인
SELECT e.employee_id, e.first_name, e.department_id, e.salary
FROM employees e
    JOIN (SELECT department_id, MAX(salary) maxsal
      FROM employees
      GROUP BY department_id) i
    ON e.department_id = i.department_id
WHERE e.salary = i.maxsal
ORDER BY department_id;

--스칼라 서브쿼리--------------------------------------------------------------------------
--스칼라 서브쿼리는 행마다 서브쿼리가 실행되기 때문에 성능이 좋지 않다. 웬만하면 조인으로 표현 가능하니 조인 사용을 권장한다
-- 사원 번호, 사원 이름, 부서명 조회
SELECT employee_id,
first_name,
(SELECT department_name
FROM departments d
WHERE d.department_id = e.department_id) "department_name"
FROM employees e;

-- 부서별 평균급여보다 많은 급여를 받는 사원 정보 조회
SELECT department_id, employee_id, last_name, salary, job_id
FROM employees e1
WHERE salary > (SELECT AVG(salary)
                FROM employees e2
                WHERE e2.department_id = e1.department_id)
ORDER BY e1.department_id;




