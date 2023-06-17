SELECT employee_is, first_name, last_name
FROM employees
WHERE department_id IS NULL;

SELECT employee_id, last_name, salary, TO_CHAR(hire_date, 'YYYY-MM-DD HH24:MI:SS DAY')
FROM employees;

-- ||���տ�����
SELECT first_name ||' '|| last_name
FROM employees;

SELECT last_name, hire_date
FROM employees
WHERE hire_date > '2002/01/01';

--ORDER BY��
SELECT first_name, last_name last, hire_date
FROM employees
WHERE salary >= 10000
ORDER BY last ASC, salary DESC; --ASC;  DESC - ����������, ASC - ��������

--GROUP BY�� - �μ����� �����ִ�
--HAVING�� - ������ �����ϴ� �׷츸�� �����Ѵ�
SELECT department_id, count(department_id) count
FROM employees
GROUP BY department_id
HAVING department_id IS NOT NULL
ORDER BY count ASC;

-- UNION �ǽ��� ���� ���̺� ����(����)
CREATE TABLE emp AS
SELECT *
FROM employees;

--UNION
SELECT *
FROM employees
UNION ALL         --������ ���� ����Ҷ� UNION, ��ü�� ������������� UNION ALL
--MINUS             --������ ���� ���������
--INTERSECT           --�ߺ��� ���� ������ش�
SELECT *
FROM emp;

SELECT first_name, last_name, employee_id, salary, TO_CHAR(hire_date, 'YYYY-MM-DD HH24:MI:SS DAY') hire_date
FROM employees
WHERE first_name LIKE '%ab%' OR last_name LIKE '%ab%';







