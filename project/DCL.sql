/* #1. HR 에게는 사용자 생성 권한이 없기 때문에 DBA 계정(sys or system)으로 연결 후 User 생성 */
-- sqlplus 사용시 : conn /as sysdba;
SELECT *
FROM hr.employees;

/* #2. User 생성 - 껍데기만 만들어짐 */
CREATE USER bangry IDENTIFIED BY bangry;

/* #3. 생성된 User에 시스템 권한 / 객체(테이블, 뷰 등)에 대한 권한 부여 */

-- 시스템 연결 권한 부여 - 로그인 할 수 있게끔 권한 부여
GRANT CREATE SESSION TO bangry;
-- 객체에 대한 권한 부여(sys가 bangry에게 hr스키마의 employees 테이블에 대한 CRUD 권한을 부여)
GRANT SELECT, INSERT, UPDATE, DELETE ON hr.employees
TO bangry;

/* #4. 필요에 따라 User에게 부여된 권한 회수 */
REVOKE SELECT, INSERT, UPDATE, DELETE ON hr.employees
FROM bangry;

/* 롤(ROLE) : 여러 권한들의 묶음(내장 롤 / 사용자 정의 롤) */--------------------------------
/* #1. User에 내장 롤 부여 */
GRANT CONNECT, RESOURCE, DBA TO bangry;

/* #2. 사용자 정의 롤 생성 */
CREATE ROLE some_role;
--DROP ROLE some_role;

/* #3. 시스템 권한과 객체 권한을 롤에 등록 */
GRANT CREATE SESSION TO some_role;
GRANT SELECT, INSERT, UPDATE, DELETE ON hr.employees TO some_role;

-- ※ 모든 권한을 롤에 부여
GRANT ALL ON hr.employees TO some_role;

/* #4. User에 사용자 정의 롤 부여 */
GRANT some_role TO bangry;

/* #5. User 잠금 및 해제 */
ALTER USER bangry ACCOUNT LOCK;
ALTER USER bangry ACCOUNT UNLOCK;

/* #6. User 비밀번호 변경 */
--ALTER USER bangry IDENTIFIED BY bbangry;
--ALTER USER hr IDENTIFIED BY hr ACCOUNT UNLOCK;

/* #7. User 삭제 */
DROP USER bangry CASCADE;

/* #8. 데이터 딕셔너리로부터 유저 목록 조회 */
SELECT * FROM dba_users;

/* #9. 사용자에게 부여된 시스템 권한 조회 */
SELECT *
FROM dba_sys_privs
WHERE grantee = 'BANGRY';

/* #10. 롤에 부여된 시스템 권한 조회 */
SELECT *
FROM dba_sys_privs
WHERE grantee = 'SOME_ROLE';

/* #11. 사용자에게 부여된 롤 조회 */
SELECT *
FROM dba_role_privs
WHERE grantee = 'BANGRY';

/* #12. 사용자에게 부여한 객체 권한 조회 */
SELECT *
FROM dba_tab_privs
WHERE grantee = 'BANGRY';

