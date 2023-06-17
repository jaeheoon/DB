--오라클 함수
SELECT *
FROM employees
WHERE 5 = length(last_name);

SELECT count(employee_id)
FROM employees;

--단일행 함수----------------------------------------------------------------------
--문자(열) 관련 함수
--문자함수 자주 사용하는 함수
--CONCAT : 인자1, 인자2를 합쳐준다
SELECT CONCAT('Oracle', 'Java Developer') --'Oracle'||'Java Developer' 같은 결과값이지만 함수를 사용하면 실행 속도가 훨씬 빠르다
FROM dual;     
--dual은 테이블이 없는데 사용하는 것, 가상 함수라고도 함
--사용하는 이유 : dual은 행이 하나밖에 없는데 그냥 employees 테이블에 하면 문자함수는 단일행 함수이기 때문에 107개가 출력된다
--따라서 dual을 사용하여 행 한개에 적용하여 결과값을 하나만 보기 위해 사용한다
--원래대로 보고싶으면 FROM에 dual 대신 employees를 넣어보면 이해가 될 것이다
desc dual
SELECT *
FROM dual;

--INITCAP : 스페이스바로 구분되어있는 영문 첫번째 글자를 대문자로 바꿔준다
SELECT INITCAP('kim ki jung')
FROM dual;
--employees에 적용
SELECT INITCAP(last_name)
FROM employees;

--LOWER/UPPER : 대소문자를 구분하지 않고싶을때 넣어준다
SELECT first_name, last_name
FROM employees
--WHERE first_name = 'james';   
--이 함수로 사용하면 값이 없다고 나온다 ? 값이 대문자(James)로 저장되어있기때문에 대소문자를 구분하기 때문에 값이 안나온다
WHERE LOWER(first_name) = 'james';

SELECT UPPER('bangry')
FROM dual;

--LPAD/RPAD(char1, n ,[char2]) : char1에 n자리를 확보 후 생긴 공백을 왼쪽/오른쪽에 char2로 채워준다
SELECT LPAD('DataBase', 10, '*')    --**DataBase / RPAD는 DataBase**
FROM dual;

--SUBSTR(char, pos, length) : char에 있는 문자를 pos번째부터 length(갯수)만큼 잘라서 반환한다, 자바에서와 다르게 0번째부터가 아닌 1번부터 시작함
SELECT SUBSTR('Java Developer', 6, 9)
FROM dual;

SELECT SUBSTR('서울시가산동', 4)
FROM dual;

--응용, SQL은 변수가 없기때문에 바로 인자로 넣어준다
SELECT RPAD(SUBSTR('Java Developersdfjlksjdffenavnlinlkcvjisajelfnsklantdjflhsdfkjheawb', 1, 10), 13, '.')
FROM dual;

SELECT first_name, LENGTH(first_name)
FROM employees;

--REPLACE(char1, char2, char3) : char1 안에서 char2를 char3으로 바꿔준다
SELECT REPLACE('기정바보', '바보', '최고')
FROM dual;

SELECT REPLACE('서울 시', ' ', '')
FROM dual;

--INSTR(char, char1, pos, index) : 주어진 char에서 char1문자가 pos 시작위치에서 index번째 출현하는 위치 반환
--SELECT INSTR('DataBase', 'B')
SELECT INSTR('DataBase', 'a', 1, 2)
FROM dual;

--LTRIM/RTRIM : 왼쪽/오른쪽에 있는 공백을 자르고 반환
--SELECT LTRIM(' JavaDeveloper')
--SELECT LTRIM(' JavaDeveloper', ' ')
SELECT LTRIM('JavaDeveloper', 'Java') -- 문자도 자를 수 있다
FROM dual;

--SELECT RTRIM('JavaDeveloper ')
--SELECT RTRIM('JavaDeveloper ', ' ')
SELECT RTRIM('JavaDeveloper', 'Developer')
FROM dual;

--TRIM : 좌우측 공백을 자르고 반환
SELECT TRIM(' Java Developer ')
FROM dual;

--숫자 함수----------------------------------------------------------------------
SELECT ROUND(45.923), ROUND(45.923, 0), ROUND(45.923, 2), ROUND(45.923, -1)
FROM dual;

--TRUNC(number, i) : 주어진 number를 소수점 i+1번째 자리에서 버린 후 반환 (i를 생략하면 기본값으로 0이 사용되어 반환)
SELECT TRUNC(45.923), TRUNC(45.923, 0), TRUNC(45.923, 2), TRUNC(45.923, -1)
FROM dual;

--CEIL : 올림 함수
SELECT CEIL(123.123)
FROM dual;

--FLOOR : 내림 함수
SELECT FLOOR(123.123)
FROM dual;

--ABS : 절대값
SELECT ABS(-500)
FROM dual;

SELECT POWER(5, 2), SQRT(5), SIN(30), COS(30), TAN(30)
FROM dual;

-- 최소값 반환
SELECT LEAST(10, 20, 30, 40)
FROM dual;

-- 최대값 반환
SELECT GREATEST(10, 20, 30, 40)
FROM dual;

--날짜 함수----------------------------------------------------------------------
SELECT SYSDATE
FROM dual;

--구체적인 날짜 스탬프
SELECT SYSTIMESTAMP
FROM dual;

-- DATE 타입에 연산 가능
SELECT SYSDATE - 1 "어제" , SYSDATE "오늘", SYSDATE + 1 "내일"
FROM dual;

-- 사원별 근무 일수 검색
SELECT first_name, hire_date, SYSDATE, CEIL(SYSDATE - hire_date) "근무일수"
FROM employees;

-- 사원별 근무 개월수 검색
SELECT first_name, TRUNC(MONTHS_BETWEEN(SYSDATE, hire_date)) "근무개월수"
FROM employees;

-- 특정개월수를 더한 날짜 반환
SELECT SYSDATE, ADD_MONTHS(SYSDATE, 2) "오늘부터 2개월 후"
FROM dual;

-- 이번주 토요일 날짜
SELECT SYSDATE "오늘", NEXT_DAY(SYSDATE, 7) "이번주 토요일"
FROM dual;

-- 이번달 마지막 날짜
SELECT SYSDATE, LAST_DAY(SYSDATE) "이번달 마지막날"
FROM dual;

-- 다음달 마지막 날짜
SELECT SYSDATE, LAST_DAY(ADD_MONTHS(SYSDATE, 1)) "다음달 마지막날"
FROM dual;

--ROUND(날짜, format('YEAR' or 'MONTH')) : 연 or 달을 기준으로 내림 - format에 따라 반올림 날짜 반환
SELECT ROUND(SYSDATE, 'YEAR')
FROM dual;

--문자 형변환 함수----------------------------------------------------------------------
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

-- 입사년도가 2002년도인 사원들
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

--숫자 관련 함수-----------------------------------------------------------------
SELECT TO_NUMBER('12345') + 1
FROM dual;

SELECT TO_NUMBER('12,345', '00,000') + 1
FROM dual;

SELECT TO_NUMBER('1000') + TO_NUMBER('2,000', '0,000') + 1
FROM dual;

--날짜 형변환 함수-----------------------------------------------------------------
SELECT TO_DATE('2021/12/31 18:45:23', 'YYYY/MM/DD HH24:MI:SS')
FROM dual;

SELECT first_name, hire_date
FROM employees
WHERE hire_date = TO_DATE('2003-06-17', 'YYYY-MM-DD');

SELECT first_name, hire_date
FROM employees
WHERE hire_date = TO_DATE(20030617, 'YYYY-MM-DD');

--일반 함수-----------------------------------------------------------------------
SELECT 10+NULL
FROM dual;

--NVL(char|number|date, expression) : 주어진 char, number, date가 NULL 이면 expression 값을 반환한다
SELECT NVL(NULL, 10) FROM dual;

SELECT 10*NULL, 10*NVL(NULL, 1)
FROM dual;

SELECT first_name, salary, commission_pct, NVL(commission_pct, 0)
FROM employees;

--NVL을 사용 안했을때는 연봉*커미션을 했을때 NULL로 나온다
SELECT first_name, salary, commission_pct, ( salary + ( salary * commission_pct ) ) * 12 "연봉"
FROM employees;

--NVL을 사용하여 정상적으로 나옴
SELECT first_name, salary, commission_pct, ( salary + ( salary * NVL(commission_pct, 0) ) ) * 12 "연봉"
FROM employees;

--NVL2(char|number|date, expression1, expression2) : 주어진 char, number, date가 NULL 이면 expression2 값을, NULL 이 아니면 expression1 값을 반환한다
--NVL2를 사용할 때는 전달인자 타입이 같아야지 반환이 가능하다, 다르면 오류나옴
SELECT first_name, salary, NVL2(commission_pct, commission_pct, 0)
FROM employees;

SELECT first_name, salary, NVL2(TO_CHAR(commission_pct), TO_CHAR(commission_pct), '신입사원') "인센티브"
FROM employees;

--조건 함수---------------------------------------------------------------------------
--DECODE(기준값, 조건1, 결과1 [, 조건2, 결과2, …] [, 기본값])) : 필요에 따라 중첩하여 사용할 수 있다
--프로그래밍 언어에서 사용하는 swith ~ case문과 비슷하다
SELECT first_name, job_id,
        DECODE(job_id, 'IT_PROG', '개발자',
                       'AC_MRG', '관리자',
                       'FI_ACCOUNT', '회계사',
                       '직원') "직종"
FROM employees;

-- 회사 직종별 급여 인상
SELECT first_name, job_id, salary,
       DECODE(job_id, 'IT_PROG', salary * 1.5,
                      'AC_MRG', salary * 1.3,
                      'AC_ASST', salary * 1.1,
                      salary) "인상급여"
FROM employees;

--다중행 함수-------------------------------------------------------------------------
-- 전체 사원수(NULL은 포함 안됨)
SELECT COUNT(employee_id) 
FROM employees;

-- 전체 사원수(NULL 포함)
SELECT COUNT(*) 
FROM employees;

-- 커미션 받는 사원의 수
SELECT COUNT(commission_pct)
FROM employees;

SELECT COUNT(*) "전체사원수", COUNT(commission_pct) "커미션사원수"
FROM employees;

-- 급여 총액(NULL은 무시)
SELECT SUM(salary)
FROM employees;

-- 급여 평균(NULL은 무시)
SELECT AVG(salary)
FROM employees;

-- 커미션 평균
SELECT AVG(commission_pct), AVG(NVL(commission_pct, 0))
FROM employees;

-- 최대값, 최소값
SELECT MAX(salary), MIN(salary), MAX(commission_pct), MIN(commission_pct)
FROM employees;

SELECT MAX(hire_date), MIN(hire_date), MAX(hire_date) - MIN(hire_date) "짬밥차"
FROM employees;

-- GROUP BY 절(특정 컬럼을 기준으로 그룹핑)
SELECT department_id
FROM employees
GROUP BY department_id;

-- 부서별 급여총액, 평균
SELECT department_id, SUM(salary), AVG(salary)
FROM employees
GROUP BY department_id
ORDER BY department_id;

-- HAVING 절(그룹에 대한 조건)
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








