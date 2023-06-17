--���̺� ����
--DDL�� ����� ���ÿ� Auto Commit�ȴ�
CREATE TABLE dept2(
  dept_id NUMBER(4), 
  dept_name VARCHAR2(30)
);

SELECT *
FROM user_tables;

--���̺� ����(�����) : ������ ���������� ���� �����
--Default : ���� ���� �� ���̺� ���� �Է� ���� �ʾƵ� ������ ���� ����Ʈ�� �Էµȴ�
--NOT NULL : ���̺� ���� �� �÷� ���� NOT NULL �������� �߰�
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

--��� ���̺� ��ȸ
SELECT *
FROM user_constraints
WHERE table_name = 'MEMBER';

--��� ����
INSERT INTO member(member_id, passwd, name, email, gender, manager_id)
VALUES('bangry313', '1111', '�����', 'bangry313@gmail.com', 'M', 100);
--��� �ϳ� �� ����
INSERT INTO member(member_id, passwd, name, email, gender, manager_id)
VALUES('bangry314', '1111', '�����', 'bangry314@gmail.com', 'M', 100);
--��¥ �����ϱ�
INSERT INTO member(member_id, passwd, name, email, regdate, gender, manager_id)
VALUES('bangry315', '1111', '�����', 'bangry315@gmail.com', TO_DATE('2023-06-08', 'YYYY-MM-DD'), 'M', 100);
--�� ���� Ŀ�� �������
COMMIT;

SELECT * FROM member;

--���� ���� ���̺� ����
DROP TABLE member;

--���̺� ������ �������� �и�(����)
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

--������ ���Ǽ��� ���� �������� ��Ȱ��ȭ
ALTER TABLE member
  DISABLE CONSTRAINT member_id_pk
  DISABLE CONSTRAINT member_email_uk
  DISABLE CONSTRAINT member_gender_ck
  DISABLE CONSTRAINT member_manager_fk;

--�ٽ� �����Ҷ� �������� Ȱ��ȭ
ALTER TABLE member
  ENABLE CONSTRAINT member_id_pk
  ENABLE CONSTRAINT member_email_uk
  ENABLE CONSTRAINT member_gender_ck
  ENABLE CONSTRAINT member_manager_fk;

--���̺� ���� �� �������� ���� ����
--DROP TABLE member [CASCADE CONSTRAINTS];

--���̺��� ������ �� �ҹ��ڷ� �����ص� �ڵ����� �빮�ڷ� �Ǵµ� "���̺��"�� �ϸ� �ҹ��ڷε� ������
CREATE TABLE "abc"(
 num NUMBER(10)
);

--������ ����---------------------------------------------------------------------
CREATE SEQUENCE member_id_seq
  START WITH 100
  INCREMENT BY 10;

--��ųʸ� ��ȸ
SELECT *
FROM user_sequences;

SELECT member_id_seq.NEXTVAL
FROM dual;

SELECT member_id_seq.CURRVAL
FROM dual;

--�� ���� ------------------------------------------------------------------------
-- ��ȸ�� �� �ִ� �� ����
CREATE OR REPLACE VIEW emp_view
AS SELECT employee_id, last_name, department_id
FROM employees;

-- �� ��ȸ
SELECT * FROM emp_view;

-- ��ųʸ� ��ȸ
SELECT * FROM user_views;

-- ������ ������ ��� ����
CREATE OR REPLACE VIEW dept_detail_view
AS SELECT e.employee_id "��� ��ȣ", e.last_name "��� �̸�", d.department_name "�μ���", l.city "���ø�", l.state_province "��", c.country_name "������", r.region_name "�����"
FROM employees e 
  JOIN departments d ON e.department_id = d.department_id
  JOIN locations l ON d.location_id = l.location_id
  JOIN countries c ON l.country_id = c.country_id
  JOIN regions r ON c.region_id = r.region_id;

SELECT * FROM dept_detail_view;

-- 10�� �μ��� ����� ���ؼ��� INSERT, UPDATE �� �� �ִ� �� ����
CREATE OR REPLACE VIEW emp_view
AS SELECT employee_id, last_name, email, hire_date, job_id, department_id
FROM employees
WHERE department_id = 10
WITH CHECK OPTION;

INSERT INTO emp_view (employee_id, last_name, email, hire_date, job_id, department_id)
VALUES (employees_seq.nextval, 'jack', 'jack@korea.com', sysdate, 'AD_VP', 10);

-- INSERT ERROR - department_id�� �ٸ��⶧���� ������ �ȵȴ�
INSERT INTO emp_view (employee_id, last_name, email, hire_date, job_id, department_id)
VALUES (employees_seq.nextval, 'king', 'jack@korea.com', sysdate, 'AD_VP', 20);

-- �б� ���� �� ����
CREATE OR REPLACE VIEW emp_view
AS SELECT employee_id, last_name, email, hire_date, job_id, department_id
FROM employees
WHERE department_id = 10
WITH READ ONLY;

-- INSERT ERROR - �б� ���� ���̱� ������ ������ �ȵȴ�
INSERT INTO emp_view (employee_id, last_name, email, hire_date, job_id, department_id)
VALUES (employees_seq.nextval, 'jack', 'jack@korea.com', sysdate, 'AD_VP', 10);

SELECT rowid, employee_id
FROM employees;

--�ε���-----------------------------------------------------------------------------
-- �ε������� ����ϴ� �����÷�(rowid) ��ȸ
SELECT rowid, employee_id
FROM employees;

-- ��ųʸ��κ��� �ε��� ��ȸ
SELECT *
FROM user_indexes
WHERE table_name = 'EMPLOYEES';

-- ���� �ε��� ����
CREATE INDEX emp_salary_idx
ON employees(salary);
 
-- ���� �ε��� ���
SELECT employee_id, last_name, salary
FROM employees
WHERE salary BETWEEN 10000 AND 12000;

-- �ڵ� �ε��� ��� - �̸����� ����ũ Ű�̱� ������ ���� ���� ���ϰ� ����
SELECT employee_id, last_name, salary
FROM employees
WHERE email = 'JSEO';

-- ROWNUM
SELECT ROWNUM, employee_id, first_name
FROM employees;

-- ���̺��� ���� ���̶� ���� �ٸ� ROWNUM�� ���� �� �ִ�
SELECT ROWNUM, employee_id
FROM employees;

SELECT ROWNUM, employee_id
FROM employees
ORDER BY employee_id DESC;

-- ��� 5�� ��ȸ
SELECT ROWNUM, employee_id, first_name
FROM employees
WHERE ROWNUM <= 5;

-- ����
-- ù��° ���� rownum�� 1�̹Ƿ�
-- 1 > 1�� false�� �Ǿ� rownum�� ���̻� �������� ������, �ϳ��� �൵ ��ȯ���� ����
SELECT ROWNUM, employee_id, first_name
FROM employees
WHERE ROWNUM > 1;

-- ��� 10�� ��ȸ
SELECT ROWNUM, employee_id, first_name
FROM employees
WHERE ROWNUM <= 10;

/* Ư�� �÷��� �������� �����Ͽ� ���� 5��(����)�� ��ȸ�ϰ��� �Ѵٸ� */
-- ��)��ü ����� �޿������� 5�� ��ȸ�ϱ�
SELECT first_name, salary
FROM employees
WHERE ROWNUM <=5
ORDER BY salary DESC;
-- �߸��� query : ��ü �޿� ������ �ƴ� ó�� 5��ȿ����� �޿� ���� ���ĵ�

-- ���� �ذ�) FROM������ ��������(Inline View)�� ����ؾ� �Ѵ�
SELECT * 
FROM (SELECT * 
      FROM employees 
      ORDER BY salary DESC) --��ü���� �������� ���� �� 5���� �����´�
WHERE ROWNUM <= 5;

-- �޿������� ����¡ ó�� (10���� �߶� ��ȸ�ϱ�) - �������� �� �� ����Ͽ� ������
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
             -- �ʿ信 ���� �˻� ���� �߰�
             ORDER BY salary DESC)) 
WHERE page = 2; 

-- �ó�� ����-----------------------------------------------------------------------
CREATE SYNONYM emps
FOR HR.employees;

SELECT * FROM emps;

-- �ó�� ����
DROP SYNONYM emps;












