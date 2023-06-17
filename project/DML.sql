DESC departments;

--������ �������� �ľ�
SELECT *
FROM user_constraints
WHERE table_name = 'DEPARTMENTS';

--���� ������ DESC�� ������ Ȯ���ϸ鼭 �־����
INSERT INTO departments(department_id, department_name)
VALUES(7777, '�����п�');

--�÷� 4�� �� �ֱ�
INSERT INTO departments(department_id, department_name, manager_id, location_id)
VALUES(7778, '�����п�2', 100, 1000);

--location_id FK�� Ȯ���ϱ� ���� �����̼� �ʵ� Ȯ��
SELECT *
FROM locations;

--�������� �̿��� �μ���ȣ �ڵ� ���� �̿�
INSERT INTO departments(department_id, department_name, manager_id, location_id)
VALUES(departments_seq.NEXTVAL, '����', 100, 1000);

--���� ���� �� ������ Ȯ��
SELECT *
FROM departments
ORDER BY department_id;

-- ���������� �̿��� ���̺� �� ����/�ٿ��ֱ�
-- �׽�Ʈ�� ���� dept ���̺� ����
-- ���������� �̿��� ���̺� ������ ���� - �ȿ� ������ ����
CREATE TABLE dept
AS SELECT *
FROM departments
WHERE 0 = 1;

-- ���������� �̿��� ����/�ٿ��ֱ��ؼ� �� �ֱ�
INSERT INTO dept
SELECT * FROM departments;

--���� ���� �� ������ Ȯ��
SELECT *
FROM departments;

--�� ����
UPDATE employees
SET department_id = 30
WHERE employee_id = 127;

--��� ������ �޿� ����
UPDATE emp
SET salary = salary * 1.1;

--�� ����
DELETE FROM employees
WHERE employee_id = 210;

DELETE FROM departments
WHERE department_name LIKE '%����%';

-- �������� Ȱ���Ͽ� ����
DELETE FROM emp
WHERE salary > (SELECT AVG(salary)
                FROM emp) ;
                
COMMIT;     --���Ͽ� �Ű��ش�
--ROLLBACK; --�޸𸮿� ����Ǿ��ִ� �����͸� ���󺹱� �����ش�/�ٳ���

--JAVA���� Ŭ������ �߻�ȭ �ϱ� ���� �÷��� ���
DESC employees;

INSERT INTO employees(employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, department_id)
VALUES(employees_seq.NEXTVAL, '����', '��', 'kkkk@kkk.co.kr', '011.123.4567', sysdate, 'IT_PROG', 5000, 10);

SELECT * FROM employees
WHERE department_id = 100;

UPDATE employees
SET salary = salary + 500
--WHERE employee_id = employees_seq.CURRVAL;      --employees_seq.CURRVAL : ���� ���� ������
WHERE department_id = 10;

commit;

rollback;










