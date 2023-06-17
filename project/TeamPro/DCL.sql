/* #2. User ���� - �����⸸ ������� */
CREATE USER team IDENTIFIED BY team;

-- �ý��� ���� ���� �ο� - �α��� �� �� �ְԲ� ���� �ο�
GRANT CREATE SESSION TO team;

-- ��ü�� ���� ���� �ο�(sys�� bangry���� hr��Ű���� employees ���̺� ���� CRUD ������ �ο�)
GRANT SELECT, INSERT, UPDATE, DELETE ON hr.employees
TO team;

/* ��(ROLE) : ���� ���ѵ��� ����(���� �� / ����� ���� ��) */--------------------------------
/* #1. User�� ���� �� �ο� */
GRANT CONNECT, RESOURCE, DBA TO team;

/* #2. ����� ���� �� ���� */
CREATE ROLE team_role;

/* #3. �ý��� ���Ѱ� ��ü ������ �ѿ� ��� */
GRANT CREATE SESSION TO team_role;
GRANT SELECT, INSERT, UPDATE, DELETE ON hr.employees TO team_role;

-- �� ��� ������ �ѿ� �ο�
GRANT ALL ON hr.employees TO team_role;

COMMIT;

















