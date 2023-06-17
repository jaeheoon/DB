SELECT employee_is, first_name, last_name
FROM employees
WHERE department_id IS NULL;

SELECT employee_id, last_name, salary, TO_CHAR(hire_date, 'YYYY-MM-DD HH24:MI:SS DAY')
FROM employees;

-- ||결합연산자
SELECT first_name ||' '|| last_name
FROM employees;

SELECT last_name, hire_date
FROM employees
WHERE hire_date > '2002/01/01';

--ORDER BY절
SELECT first_name, last_name last, hire_date
FROM employees
WHERE salary >= 10000
ORDER BY last ASC, salary DESC; --ASC;  DESC - 역오름차순, ASC - 오름차순

--GROUP BY절 - 부서별로 묶여있다
--HAVING절 - 조건을 만족하는 그룹만을 선택한다
SELECT department_id, count(department_id) count
FROM employees
GROUP BY department_id
HAVING department_id IS NOT NULL
ORDER BY count ASC;

-- UNION 실습을 위한 테이블 생성(복사)
CREATE TABLE emp AS
SELECT *
FROM employees;

--UNION
SELECT *
FROM employees
UNION ALL         --동일한 값을 출력할땐 UNION, 전체를 가져오고싶을때 UNION ALL
--MINUS             --동일한 값을 빼고싶을때
--INTERSECT           --중복된 값을 출력해준다
SELECT *
FROM emp;

SELECT first_name, last_name, employee_id, salary, TO_CHAR(hire_date, 'YYYY-MM-DD HH24:MI:SS DAY') hire_date
FROM employees
WHERE first_name LIKE '%ab%' OR last_name LIKE '%ab%';







