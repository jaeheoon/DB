--������ ����(����Ŭ ����) : where ���� �� ���ǰ� ���� ������ ���� �ֱ� ������ ������ ��������
--e.department_id = d.department_id �̷������� PK�� FK�� ���� ���� �߰��Ѵ�
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

--����� ����(ANSI ����) : From ���� JOIN Ű����� �Բ� ���� ���̺��� ���
--employees e JOIN departments d ON e.department_id = d.department_id �̷� ������ JOIN�� ON�� ����Ͽ� ��������� ǥ�����ش�
SELECT
    employee_id,
    salary,
    department_name
FROM
         employees e
    JOIN departments d ON e.department_id = d.department_id
WHERE
    e.employee_id = 104;

--3�� �̻� ����� ����(��ųʸ�(���̺�)�κ��� ���̺� ���� ��ȸ)
--��ųʸ� ���̺� : ���� ���̺� - ������Ʈ��ó�� ���̺� ����� �������ִ� �� - ������ ���ص� �ڵ����� �������ش�
SELECT
    *
FROM
    user_tables;

--���� ����(EQUI ����) : �����ϰ��� �ϴ� �� ���̺��� ���������� �����ϴ� �÷�(department_id)�� ���� ��ġ�ϴ� ��� ���� �����Ѵ�
SELECT
    e.employee_id     "��� ��ȣ",
    e.last_name       "��� �̸�",
    d.department_name "�μ���",
    l.city            "���ø�",
    l.state_province  "��",
    c.country_name    "������",
    r.region_name     "�����"
FROM
         employees e
    JOIN departments d ON e.department_id = d.department_id
    JOIN locations   l ON d.location_id = l.location_id
    JOIN countries   c ON l.country_id = c.country_id
    JOIN regions     r ON c.region_id = r.region_id;
  
--���� ����(NON-EQUI ����) : ���� ���ǿ�����=�� �����ڸ� �̿��� ����񱳰� �ƴ� �ٸ� �񱳿����ڸ� ����Ͽ� Ư�������� ��� ���� �����Ͽ� ����
--#1 �׽�Ʈ �޿����(salgrade) ���̺� ����
CREATE TABLE salgrade (
    grade NUMBER,
    losal NUMBER,
    hisal NUMBER
);

--#2 ������ �Է�
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

-- ����� �����Ǿ����� ��ȸ
SELECT
    *
FROM
    salgrade;

--#3 ANSI ǥ�� NON-EQUI JOIN
SELECT
    e.employee_id "��� ��ȣ",
    e.last_name   "�̸�",
    e.salary      "�޿�",
    s.grade       "�޿����"
FROM
         employees e
    JOIN salgrade s ON e.salary BETWEEN s.losal AND s.hisal
ORDER BY
    s.grade ASC;

--�ܺ� ���� : �� ���̺��� ���� ������ �������� �ʴ� ��鵵 ��� ���̺� ���Խ�Ű�� �����̴�
--���� LEFT�� ������ ���� ��� 106���� ��ȸ������ ��� ������ ���ʿ� �ٿ��� ��ȸ�ƴ�
--employees�� �ִ� ������ �ٿ��ִ� ��
SELECT
    employee_id,
    salary,
    department_name
FROM
    employees   e
    LEFT JOIN departments d ON e.department_id = d.department_id;
  
--���� RIGHT�� ������ ���� ��� 106���� ��ȸ������ �μ��� �����ʿ� �ٿ��� ��ȸ�ƴ�
--departments�� �ִ� ������ �ٿ��ִ� ��
SELECT
    employee_id,
    salary,
    department_name
FROM
    employees   e
    RIGHT JOIN departments d ON e.department_id = d.department_id;
  
--���� FULL�� ������ ���� ��� 106���� ��ȸ������ �μ��� ��� ������ �پ ��ȸ�ƴ�
--employees�� departments �ΰ��� �ٿ��ִ� ��
SELECT
    employee_id,
    salary,
    department_name
FROM
    employees   e
    FULL JOIN departments d ON e.department_id = d.department_id;

--����Ŭ ������ �ܺ� ���� ���(�������, ������ ���� ������ ���� ����� ������ ��� ����)
--����Ŭ������ LEFT OUT ���� ��� : �����ʿ� (+)�� �ٿ��ش�, FULL�� �ȵ�
SELECT
    employee_id,
    salary,
    department_name
FROM
    employees   e,
    departments d
WHERE
    e.department_id = d.department_id (+);

--���� ����
SELECT
    e1.employee_id "��� ��ȣ",
    e1.last_name   "�̸�",
    e2.last_name   "��� �̸�"
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










