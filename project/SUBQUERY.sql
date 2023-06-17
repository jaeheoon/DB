--SUBQUERY(�������� or ��������)---------------------------------------------------------
SELECT e.employee_id, e.last_name, e.hire_date
FROM employees e
WHERE hire_date < (SELECT hire_date FROM employees WHERE employee_id = 100);

-- ��� �߿� �̸��� Seo �� ����� ������ �޿�(salary)�� �޴� ����� ��ȸ
SELECT e.employee_id, e.last_name, e.hire_date
FROM employees e
WHERE salary = (
SELECT salary FROM employees WHERE last_name = 'Seo'
) AND last_name != 'Seo';

--������ ��������------------------------------------------------------------------------
--���� �ϳ��� ���´�
-- ���������� ������� ���� ���
SELECT salary
FROM employees
WHERE LOWER(last_name) = 'seo';

SELECT *
FROM employees
WHERE salary = 2700;

-- ������ ��������
SELECT *
FROM employees
WHERE salary = (SELECT salary
FROM employees
WHERE LOWER(last_name) = 'seo');

-- ��ü��� ��ձ޿����� �� ���� �޿��� �޴� ��� ��� ��ȸ
SELECT *
FROM employees
WHERE salary > (SELECT AVG(salary)
FROM employees); 

--������ ��������------------------------------------------------------------------------
--IN ������ : ���Ե� ��� �͵� ���
--30�� �μ��� �Ҽӵ� ������ ������ ������ ������ ��ü ������ ��ȸ
SELECT last_name, job_id, department_id
FROM employees
WHERE job_id IN (SELECT DISTINCT job_id
                FROM employees
                WHERE department_id = 30);
            
--ANY ������ : �� �߿��� �ּҰ��� ��� - ������ �������� MIN�� �ַ� ��
-- 30�� �μ��� �ּ� �޿��ں��� �� ���� �޿��� �޴� ��ü ������ ��ȸ
SELECT *
FROM employees
WHERE salary > ANY (SELECT salary
                    FROM employees
                    WHERE department_id = 30);
--���������� ����
SELECT *
FROM employees
WHERE salary > (SELECT min(salary)
                    FROM employees
                    WHERE department_id = 30);

--ALL ������ : �� �߿��� �ִ밪�� ��� - ������ �������� MAX�� �ַ� ��
-- 30�� �μ��� �ּ� �޿��ں��� �� ���� �޿��� �޴� ��ü ������ ��ȸ
SELECT *
FROM employees
WHERE salary > ALL (SELECT salary
                    FROM employees
                    WHERE department_id = 30);

--EXISTS ������ : ���������� ��� ������ ���� ��ȸ(�ϳ� �̻� ���� �� ����)
-- ���� ��� ���� ��� ���̺�� �����༭ ����� ����Ҷ� ���
SELECT *
FROM employees
WHERE EXISTS(SELECT *
              FROM departments
              WHERE department_id = 30)
    AND department_id = 30;
    
--2007�� ���� �Ի��� ����� �ִ� ����̸�, �μ���ȣ, �μ��� ��ȸ
--EXISTS ������ ���
SELECT department_id "�μ� ��ȣ", d.department_name "�μ���"
FROM departments d
WHERE EXISTS(SELECT d.department_id
             FROM employees e
             WHERE e.hire_date >= TO_DATE('2007/01/01') AND e.department_id = d.department_id);
--IN ������ ���
SELECT department_id "�μ� ��ȣ", d.department_name "�μ���"
FROM departments d
WHERE d.department_id IN(SELECT e.department_id
                         FROM employees e
                         WHERE e.hire_date >= TO_DATE('2007/01/01'));

--�����÷� ��������------------------------------------------------------------------------
-- �����ȣ�� 147�� ����� ���� �μ�, ���� �Ի������� ������� �����ȣ, �̸�, ����, �μ���ȣ�� ��ȸ
SELECT employee_id, last_name, job_id, department_id
FROM employees
WHERE (department_id, hire_date) = (SELECT department_id, hire_date
                                    FROM employees
                                    WHERE employee_id = 147);

-- �μ��� �ּұ޿��� �޴� ��� ����
SELECT *
FROM employees
WHERE (department_id, salary) IN(SELECT department_id, MIN(salary)
                                 FROM employees
                                 GROUP BY department_id)
ORDER BY department_id;

--�ζ��� ��---------------------------------------------------------------------------------
-- �μ��� �ִ� �޿��� ���� Ȯ��
SELECT e.employee_id, e.first_name, e.department_id, e.salary
FROM employees e
    JOIN (SELECT department_id, MAX(salary) maxsal
      FROM employees
      GROUP BY department_id) i
    ON e.department_id = i.department_id
WHERE e.salary = i.maxsal
ORDER BY department_id;

--��Į�� ��������--------------------------------------------------------------------------
--��Į�� ���������� �ึ�� ���������� ����Ǳ� ������ ������ ���� �ʴ�. �����ϸ� �������� ǥ�� �����ϴ� ���� ����� �����Ѵ�
-- ��� ��ȣ, ��� �̸�, �μ��� ��ȸ
SELECT employee_id,
first_name,
(SELECT department_name
FROM departments d
WHERE d.department_id = e.department_id) "department_name"
FROM employees e;

-- �μ��� ��ձ޿����� ���� �޿��� �޴� ��� ���� ��ȸ
SELECT department_id, employee_id, last_name, salary, job_id
FROM employees e1
WHERE salary > (SELECT AVG(salary)
                FROM employees e2
                WHERE e2.department_id = e1.department_id)
ORDER BY e1.department_id;




