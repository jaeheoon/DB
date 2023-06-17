--����Ŭ �Լ�
SELECT *
FROM employees
WHERE 5 = length(last_name);

SELECT count(employee_id)
FROM employees;

--������ �Լ�----------------------------------------------------------------------
--����(��) ���� �Լ�
--�����Լ� ���� ����ϴ� �Լ�
--CONCAT : ����1, ����2�� �����ش�
SELECT CONCAT('Oracle', 'Java Developer') --'Oracle'||'Java Developer' ���� ����������� �Լ��� ����ϸ� ���� �ӵ��� �ξ� ������
FROM dual;     
--dual�� ���̺��� ���µ� ����ϴ� ��, ���� �Լ���� ��
--����ϴ� ���� : dual�� ���� �ϳ��ۿ� ���µ� �׳� employees ���̺� �ϸ� �����Լ��� ������ �Լ��̱� ������ 107���� ��µȴ�
--���� dual�� ����Ͽ� �� �Ѱ��� �����Ͽ� ������� �ϳ��� ���� ���� ����Ѵ�
--������� ��������� FROM�� dual ��� employees�� �־�� ���ذ� �� ���̴�
desc dual
SELECT *
FROM dual;

--INITCAP : �����̽��ٷ� ���еǾ��ִ� ���� ù��° ���ڸ� �빮�ڷ� �ٲ��ش�
SELECT INITCAP('kim ki jung')
FROM dual;
--employees�� ����
SELECT INITCAP(last_name)
FROM employees;

--LOWER/UPPER : ��ҹ��ڸ� �������� �ʰ������ �־��ش�
SELECT first_name, last_name
FROM employees
--WHERE first_name = 'james';   
--�� �Լ��� ����ϸ� ���� ���ٰ� ���´� ? ���� �빮��(James)�� ����Ǿ��ֱ⶧���� ��ҹ��ڸ� �����ϱ� ������ ���� �ȳ��´�
WHERE LOWER(first_name) = 'james';

SELECT UPPER('bangry')
FROM dual;

--LPAD/RPAD(char1, n ,[char2]) : char1�� n�ڸ��� Ȯ�� �� ���� ������ ����/�����ʿ� char2�� ä���ش�
SELECT LPAD('DataBase', 10, '*')    --**DataBase / RPAD�� DataBase**
FROM dual;

--SUBSTR(char, pos, length) : char�� �ִ� ���ڸ� pos��°���� length(����)��ŭ �߶� ��ȯ�Ѵ�, �ڹٿ����� �ٸ��� 0��°���Ͱ� �ƴ� 1������ ������
SELECT SUBSTR('Java Developer', 6, 9)
FROM dual;

SELECT SUBSTR('����ð��굿', 4)
FROM dual;

--����, SQL�� ������ ���⶧���� �ٷ� ���ڷ� �־��ش�
SELECT RPAD(SUBSTR('Java Developersdfjlksjdffenavnlinlkcvjisajelfnsklantdjflhsdfkjheawb', 1, 10), 13, '.')
FROM dual;

SELECT first_name, LENGTH(first_name)
FROM employees;

--REPLACE(char1, char2, char3) : char1 �ȿ��� char2�� char3���� �ٲ��ش�
SELECT REPLACE('�����ٺ�', '�ٺ�', '�ְ�')
FROM dual;

SELECT REPLACE('���� ��', ' ', '')
FROM dual;

--INSTR(char, char1, pos, index) : �־��� char���� char1���ڰ� pos ������ġ���� index��° �����ϴ� ��ġ ��ȯ
--SELECT INSTR('DataBase', 'B')
SELECT INSTR('DataBase', 'a', 1, 2)
FROM dual;

--LTRIM/RTRIM : ����/�����ʿ� �ִ� ������ �ڸ��� ��ȯ
--SELECT LTRIM(' JavaDeveloper')
--SELECT LTRIM(' JavaDeveloper', ' ')
SELECT LTRIM('JavaDeveloper', 'Java') -- ���ڵ� �ڸ� �� �ִ�
FROM dual;

--SELECT RTRIM('JavaDeveloper ')
--SELECT RTRIM('JavaDeveloper ', ' ')
SELECT RTRIM('JavaDeveloper', 'Developer')
FROM dual;

--TRIM : �¿��� ������ �ڸ��� ��ȯ
SELECT TRIM(' Java Developer ')
FROM dual;

--���� �Լ�----------------------------------------------------------------------
SELECT ROUND(45.923), ROUND(45.923, 0), ROUND(45.923, 2), ROUND(45.923, -1)
FROM dual;

--TRUNC(number, i) : �־��� number�� �Ҽ��� i+1��° �ڸ����� ���� �� ��ȯ (i�� �����ϸ� �⺻������ 0�� ���Ǿ� ��ȯ)
SELECT TRUNC(45.923), TRUNC(45.923, 0), TRUNC(45.923, 2), TRUNC(45.923, -1)
FROM dual;

--CEIL : �ø� �Լ�
SELECT CEIL(123.123)
FROM dual;

--FLOOR : ���� �Լ�
SELECT FLOOR(123.123)
FROM dual;

--ABS : ���밪
SELECT ABS(-500)
FROM dual;

SELECT POWER(5, 2), SQRT(5), SIN(30), COS(30), TAN(30)
FROM dual;

-- �ּҰ� ��ȯ
SELECT LEAST(10, 20, 30, 40)
FROM dual;

-- �ִ밪 ��ȯ
SELECT GREATEST(10, 20, 30, 40)
FROM dual;

--��¥ �Լ�----------------------------------------------------------------------
SELECT SYSDATE
FROM dual;

--��ü���� ��¥ ������
SELECT SYSTIMESTAMP
FROM dual;

-- DATE Ÿ�Կ� ���� ����
SELECT SYSDATE - 1 "����" , SYSDATE "����", SYSDATE + 1 "����"
FROM dual;

-- ����� �ٹ� �ϼ� �˻�
SELECT first_name, hire_date, SYSDATE, CEIL(SYSDATE - hire_date) "�ٹ��ϼ�"
FROM employees;

-- ����� �ٹ� ������ �˻�
SELECT first_name, TRUNC(MONTHS_BETWEEN(SYSDATE, hire_date)) "�ٹ�������"
FROM employees;

-- Ư���������� ���� ��¥ ��ȯ
SELECT SYSDATE, ADD_MONTHS(SYSDATE, 2) "���ú��� 2���� ��"
FROM dual;

-- �̹��� ����� ��¥
SELECT SYSDATE "����", NEXT_DAY(SYSDATE, 7) "�̹��� �����"
FROM dual;

-- �̹��� ������ ��¥
SELECT SYSDATE, LAST_DAY(SYSDATE) "�̹��� ��������"
FROM dual;

-- ������ ������ ��¥
SELECT SYSDATE, LAST_DAY(ADD_MONTHS(SYSDATE, 1)) "������ ��������"
FROM dual;

--ROUND(��¥, format('YEAR' or 'MONTH')) : �� or ���� �������� ���� - format�� ���� �ݿø� ��¥ ��ȯ
SELECT ROUND(SYSDATE, 'YEAR')
FROM dual;

--���� ����ȯ �Լ�----------------------------------------------------------------------
--TO_CHAR()
SELECT TO_CHAR(454545, '999,999')
FROM dual;

SELECT TO_CHAR(12345), TO_CHAR(12345.67)
FROM dual;

SELECT TO_CHAR(12345, '999,999'), TO_CHAR(12345.677, '999,999.99')
FROM dual;

SELECT TO_CHAR(12345, '000,000'), TO_CHAR(12345.677, '000,000.00')
FROM dual;

SELECT TO_CHAR(150, '$9999'), TO_CHAR(150, '$0000')
FROM dual;

SELECT TO_CHAR(150, 'S9999'), TO_CHAR(150, 'S0000')
FROM dual;

SELECT TO_CHAR(150, '9999MI'), TO_CHAR(-150, '9999MI')
FROM dual;

SELECT TO_CHAR(150, '9999EEEE'), TO_CHAR(150, '99999B')
FROM dual;

SELECT TO_CHAR(150, 'RN'), TO_CHAR(150, 'rn')
FROM dual;

SELECT TO_CHAR(10, 'X'), TO_CHAR(10, 'x'), TO_CHAR(15, 'X')
FROM dual;

SELECT TO_CHAR(SYSDATE, 'YYYY-MM-DD AM HH:MI:SS DAY')
FROM dual;

SELECT first_name, hire_date, TO_CHAR(hire_date, 'YYYY-MM-DD HH24:MI')
FROM employees;

-- �Ի�⵵�� 2002�⵵�� �����
SELECT first_name, hire_date
FROM employees
WHERE TO_CHAR(hire_date, 'YYYY') = '2002';

SELECT TO_DATE('2021/12/31 18:45:23', 'YYYY/MM/DD HH24:MI:SS')
FROM dual;

SELECT first_name, hire_date
FROM employees
WHERE hire_date = TO_DATE('2003-06-17', 'YYYY-MM-DD');

SELECT first_name, hire_date
FROM employees
WHERE hire_date = TO_DATE(20030617, 'YYYY-MM-DD');

--���� ���� �Լ�-----------------------------------------------------------------
SELECT TO_NUMBER('12345') + 1
FROM dual;

SELECT TO_NUMBER('12,345', '00,000') + 1
FROM dual;

SELECT TO_NUMBER('1000') + TO_NUMBER('2,000', '0,000') + 1
FROM dual;

--��¥ ����ȯ �Լ�-----------------------------------------------------------------
SELECT TO_DATE('2021/12/31 18:45:23', 'YYYY/MM/DD HH24:MI:SS')
FROM dual;

SELECT first_name, hire_date
FROM employees
WHERE hire_date = TO_DATE('2003-06-17', 'YYYY-MM-DD');

SELECT first_name, hire_date
FROM employees
WHERE hire_date = TO_DATE(20030617, 'YYYY-MM-DD');

--�Ϲ� �Լ�-----------------------------------------------------------------------
SELECT 10+NULL
FROM dual;

--NVL(char|number|date, expression) : �־��� char, number, date�� NULL �̸� expression ���� ��ȯ�Ѵ�
SELECT NVL(NULL, 10) FROM dual;

SELECT 10*NULL, 10*NVL(NULL, 1)
FROM dual;

SELECT first_name, salary, commission_pct, NVL(commission_pct, 0)
FROM employees;

--NVL�� ��� ���������� ����*Ŀ�̼��� ������ NULL�� ���´�
SELECT first_name, salary, commission_pct, ( salary + ( salary * commission_pct ) ) * 12 "����"
FROM employees;

--NVL�� ����Ͽ� ���������� ����
SELECT first_name, salary, commission_pct, ( salary + ( salary * NVL(commission_pct, 0) ) ) * 12 "����"
FROM employees;

--NVL2(char|number|date, expression1, expression2) : �־��� char, number, date�� NULL �̸� expression2 ����, NULL �� �ƴϸ� expression1 ���� ��ȯ�Ѵ�
--NVL2�� ����� ���� �������� Ÿ���� ���ƾ��� ��ȯ�� �����ϴ�, �ٸ��� ��������
SELECT first_name, salary, NVL2(commission_pct, commission_pct, 0)
FROM employees;

SELECT first_name, salary, NVL2(TO_CHAR(commission_pct), TO_CHAR(commission_pct), '���Ի��') "�μ�Ƽ��"
FROM employees;

--���� �Լ�---------------------------------------------------------------------------
--DECODE(���ذ�, ����1, ���1 [, ����2, ���2, ��] [, �⺻��])) : �ʿ信 ���� ��ø�Ͽ� ����� �� �ִ�
--���α׷��� ���� ����ϴ� swith ~ case���� ����ϴ�
SELECT first_name, job_id,
        DECODE(job_id, 'IT_PROG', '������',
                       'AC_MRG', '������',
                       'FI_ACCOUNT', 'ȸ���',
                       '����') "����"
FROM employees;

-- ȸ�� ������ �޿� �λ�
SELECT first_name, job_id, salary,
       DECODE(job_id, 'IT_PROG', salary * 1.5,
                      'AC_MRG', salary * 1.3,
                      'AC_ASST', salary * 1.1,
                      salary) "�λ�޿�"
FROM employees;

--������ �Լ�-------------------------------------------------------------------------
-- ��ü �����(NULL�� ���� �ȵ�)
SELECT COUNT(employee_id) 
FROM employees;

-- ��ü �����(NULL ����)
SELECT COUNT(*) 
FROM employees;

-- Ŀ�̼� �޴� ����� ��
SELECT COUNT(commission_pct)
FROM employees;

SELECT COUNT(*) "��ü�����", COUNT(commission_pct) "Ŀ�̼ǻ����"
FROM employees;

-- �޿� �Ѿ�(NULL�� ����)
SELECT SUM(salary)
FROM employees;

-- �޿� ���(NULL�� ����)
SELECT AVG(salary)
FROM employees;

-- Ŀ�̼� ���
SELECT AVG(commission_pct), AVG(NVL(commission_pct, 0))
FROM employees;

-- �ִ밪, �ּҰ�
SELECT MAX(salary), MIN(salary), MAX(commission_pct), MIN(commission_pct)
FROM employees;

SELECT MAX(hire_date), MIN(hire_date), MAX(hire_date) - MIN(hire_date) "«����"
FROM employees;

-- GROUP BY ��(Ư�� �÷��� �������� �׷���)
SELECT department_id
FROM employees
GROUP BY department_id;

-- �μ��� �޿��Ѿ�, ���
SELECT department_id, SUM(salary), AVG(salary)
FROM employees
GROUP BY department_id
ORDER BY department_id;

-- HAVING ��(�׷쿡 ���� ����)
SELECT department_id, SUM(salary), ROUND(AVG(salary), 2)
FROM employees
GROUP BY department_id
HAVING department_id IS NOT NULL;

SELECT department_id, SUM(salary), AVG(salary)
FROM employees
GROUP BY department_id
HAVING AVG(salary) >= 3000;

SELECT department_id, MAX(salary), MIN(salary)
FROM employees
GROUP BY department_id
HAVING MAX(salary) > 20000;

SELECT hire_date, COUNT(*)
FROM employees
GROUP BY hire_date
ORDER BY hire_date;
--ORDER BY COUNT(*);








