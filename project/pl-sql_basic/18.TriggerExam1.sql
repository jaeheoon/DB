-- Ʈ����(Trigger)
-- Ư�� ���̺� DML�� ����Ǹ�(�̺�Ʈ �߻�) �ڵ����� ����Ǵ� ���ν��� (�̺�Ʈ ó��)
-- Ʈ���Ŵ� ����ڰ� ���� ������ �� ����.
CREATE OR REPLACE TRIGGER dept_insert_trigger
-- �̺�Ʈ ����: insert | update | delete
-- �̺�Ʈ ����: BEFORE | AFTER
 AFTER
    INSERT -- �μ�Ʈ �̺�Ʈ �߻� �Ŀ�..
     ON departments -- �̺�Ʈ �ҽ�
--FOR EACH ROW -- ���巹��Ʈ����
/*
 * Ʈ��������
   - ���巹��Ʈ����: DML �߻��� �ѹ��� Ʈ���� ����
   - �෹��Ʈ����  : DML �߻��� �� ���� ����� ������ Ʈ���� ����
  */
BEGIN
    dbms_output.put_line('�μ����̺� �� �߰��Ǿ����ϴ�.');
END;