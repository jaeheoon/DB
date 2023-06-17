/* #2. User 생성 - 껍데기만 만들어짐 */
CREATE USER team IDENTIFIED BY team;

-- 시스템 연결 권한 부여 - 로그인 할 수 있게끔 권한 부여
GRANT CREATE SESSION TO team;

-- 객체에 대한 권한 부여(sys가 bangry에게 hr스키마의 employees 테이블에 대한 CRUD 권한을 부여)
GRANT SELECT, INSERT, UPDATE, DELETE ON hr.employees
TO team;

/* 롤(ROLE) : 여러 권한들의 묶음(내장 롤 / 사용자 정의 롤) */--------------------------------
/* #1. User에 내장 롤 부여 */
GRANT CONNECT, RESOURCE, DBA TO team;

/* #2. 사용자 정의 롤 생성 */
CREATE ROLE team_role;

/* #3. 시스템 권한과 객체 권한을 롤에 등록 */
GRANT CREATE SESSION TO team_role;
GRANT SELECT, INSERT, UPDATE, DELETE ON hr.employees TO team_role;

-- ※ 모든 권한을 롤에 부여
GRANT ALL ON hr.employees TO team_role;

COMMIT;

















