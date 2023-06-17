-- #1 Account 계좌 DB를 위한 테이블 생성(복사)

CREATE TABLE account (
    accountnum   VARCHAR2(10),
    passwd       NUMBER(10) NOT NULL,
    accountowner VARCHAR2(10) NOT NULL,
    restmoney    NUMBER(30) NOT NULL,
    borrowmoney  NUMBER(30)
);

DROP TABLE account;

-- #2 NOT NULL 제약조건을 제외한 제약조건 추가
ALTER TABLE account ADD (
    CONSTRAINT accountnum_pk PRIMARY KEY ( accountnum )
);
    
-- #3 개발의 편의성을 위해 제약조건 활성화/비활성화 
ALTER TABLE account DISABLE CONSTRAINT accountnum_pk;

--다시 배포할때 제약조건 활성화
--ALTER TABLE account ENABLE CONSTRAINT accountnum_pk;

--계좌번호 자동 생성을 위해 시퀀스 생성
CREATE SEQUENCE accountnum_seq START WITH 1000 INCREMENT BY 1;

DROP SEQUENCE accountnum_seq;

-- #4 더미데이터 추가, 수정, 삭제
DESC account;

SELECT COUNT(*) cnt
FROM account;

SELECT
    accountnum,
    accountowner,
    passwd,
    restmoney,
    borrowmoney
FROM
    account
GROUP BY
    accountnum,
    accountowner,
    passwd,
    restmoney,
    borrowmoney
ORDER BY accountnum;


--더미 데이터 생성
INSERT INTO account (accountnum, accountowner, passwd, restmoney) 
VALUES ( TO_CHAR(SYSDATE, 'YYYY')|| '-' || accountnum_seq.NEXTVAL, '김기정', 1111, 1000000);
INSERT INTO account (accountnum, accountowner, passwd, restmoney) 
VALUES ( TO_CHAR(SYSDATE, 'YYYY')|| '-' || accountnum_seq.NEXTVAL, '홍재헌', 1111, 1000000);
INSERT INTO account (accountnum, accountowner, passwd, restmoney) 
VALUES ( TO_CHAR(SYSDATE, 'YYYY')|| '-' || accountnum_seq.NEXTVAL, '김재헌', 1111, 1000000);
INSERT INTO account (accountnum, accountowner, passwd, restmoney) 
VALUES ( TO_CHAR(SYSDATE, 'YYYY')|| '-' || accountnum_seq.NEXTVAL, '최재헌', 1111, 1000000);
INSERT INTO account (accountnum, accountowner, passwd, restmoney) 
VALUES ( TO_CHAR(SYSDATE, 'YYYY')|| '-' || accountnum_seq.NEXTVAL, '양재헌', 1111, 1000000);
INSERT INTO account (accountnum, accountowner, passwd, restmoney, borrowmoney) 
VALUES ( TO_CHAR(SYSDATE, 'YYYY')|| '-' || accountnum_seq.NEXTVAL, '양재헌', 1111, 1000000, 10000000);
INSERT INTO account (accountnum, accountowner, passwd, restmoney, borrowmoney) 
VALUES ( TO_CHAR(SYSDATE, 'YYYY')|| '-' || accountnum_seq.NEXTVAL, '양재헌', 1111, 1000000, 10000000);
INSERT INTO account (accountnum, accountowner, passwd, restmoney) 
VALUES ( TO_CHAR(SYSDATE, 'YYYY')|| '-' || accountnum_seq.NEXTVAL, '양재헌', 1111, 1000000);

-- 행 삭제
DELETE FROM account
WHERE
    accountowner LIKE '%재%';

-- 행 수정
UPDATE account
SET
    accountnum = 1000
WHERE
    accountowner = '홍재헌';

COMMIT;

ROLLBACK;