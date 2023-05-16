--형변환 함수
--자동형변환
SELECT * FROM EMPLOYEES WHERE DEPARTMENT_ID = '30'; --어찌보면 이것도 자동형변환. 문자를 숫자로!
SELECT SYSDATE - 5, SYSDATE - '5' FROM EMPLOYEES; -- 자동형변환
--숫자를 빼도 날짜가, 문자를 빼도 날짜가 나온다. 숫자,문자가 날짜로 자동 형변환 된 것!

--강제형변환
--TO_CHAR(날짜, 날짜 포맷)
SELECT TO_CHAR(SYSDATE, 'YYYY-MM-DD HH:MI:SS' ) FROM DUAL; --문자
--날짜형을 문자형으로, 날짜는 대소문자 가린다.
SELECT TO_CHAR(SYSDATE, 'YY/MM/DD HH24/MI/SS' ) FROM DUAL; --문자

SELECT TO_CHAR(SYSDATE, 'YYYY년MM월DD일') FROM DUAL; --문자. 날짜 포맷 형식이 아니라고 뜸
--이런 경우 쌍따옴표로 바꿔주면 날짜 포맷과 같이 사용할 수 있다.
SELECT TO_CHAR(SYSDATE, 'YYYY"년"MM"월"DD"일"') FROM DUAL; --포맷문자가 아닌 경우 ""로 묶어준다.

SELECT TO_CHAR(HIRE_DATE, 'YYYY-MM-DD') FROM EMPLOYEES; --날짜의 문자 변환.문자형식으로 변경됨

--TO_CHAR(숫자, 숫자포맷)
SELECT TO_CHAR(200000, '$999,999,999') FROM DUAL;
SELECT TO_CHAR(200000.1234, '999999.999') FROM DUAL; --소수점자리표현
SELECT TO_CHAR(SALARY * 1300, 'L999,999,999') FROM EMPLOYEES;--지역화폐
SELECT FIRST_NAME, TO_CHAR( SALARY *1300, 'L0999,999,999') FROM EMPLOYEES; --자리수를 0으로 채움


--TO NUMBER(문자, 숫자포맷)
SELECT '3.14' + 2000 FROM DUAL; --자동형변환
--형변환이 됐을때 숫자가 되니까 자동으로 더해준다.

SELECT TO_NUMBER('3.14') + 2000 FROM DUAL; --명시적형변환(강제형변환)

SELECT '$3,300' +2000  FROM DUAL; --ERROR
--자동으로 바뀔 수 없는 문자라 이렇게 입력하면 안 됨.

SELECT TO_NUMBER('$3,300', '$999,999') +2000  FROM DUAL; --명시적 형변환
--달러제거하고 자리는 6자리수.

--TO_DATE(문자, 날짜포맷)
SELECT SYSDATE - '2023-05-16' FROM DUAL; --ERROR
SELECT SYSDATE - TO_DATE('2023-05-16', 'YYYY-MM-DD') FROM DUAL;
SELECT SYSDATE - TO_DATE('2023/05/16 11:31:23', 'YYYY/MM/DD HH:MI:SS') FROM DUAL;
--날짜 형식으로 변하게 된다.


--아래 값을 YYYY년MM월DD일 형태로 출력
SELECT '20050105' FROM DUAL; --문자 >>  YYYY년MM월DD일 형식의 문자로 바꾸라는 것. 

--문자를 날짜로바꿨다가 다시 저 형식의 문자로..
SELECT TO_CHAR( TO_DATE('20050105', 'YYYYMMDD'), 'YYYY"년"MM"월"DD"일"') FROM DUAL;


SELECT TO_DATE('20050105', 'YYYY"년"MM"월"DD"일"') FROM DUAL;


--아래 값과 현재 날짜의 일수 차이를 출력
SELECT '2005년01월05일' FROM DUAL;
--년월일은 날짜 포맷이 아님. 날짜 형으로의 변환을 해줘야함.

SELECT SYSDATE - TO_DATE('2005년01월05일', 'YYYY"년"MM"월"DD"일"') FROM DUAL;
--뭘 바꾸는지 보고 형식을 잘 체크해야한다.

--------------------------------------------------------------------------------
--NULL값에 대한 변환
--NVL(컬럼, NULL일 경우 처리)
SELECT NVL(NULL,  0) FROM DUAL;
SELECT FIRST_NAME, COMMISSION_PCT FROM EMPLOYEES; --NULL연산시 => NULL
SELECT FIRST_NAME, NVL(COMMISSION_PCT, 0) * 100 FROM EMPLOYEES;

--NVL2(컬럼, NULL이 아닌경우 처리, NULL인 경우 처리)
SELECT NVL2(NULL, '널이 아닙니다', '널입니다') FROM DUAL;
SELECT FIRST_NAME,
       SALARY,
       COMMISSION_PCT,
       NVL2(COMMISSION_PCT, SALARY + (SALARY *COMMISSION_PCT), SALARY) AS 급여 
       FROM EMPLOYEES; --총 월급이 얼마인가


--DECODE() = else if문을 대체하는 함수. 매개변수가 여러개 들어갈 수 있다.
SELECT DECODE('C', 'A', 'A입니다', 
                    'B', 'B입니다', 
                    'C', 'C입니다',
                    'ABC가 아닙니다') FROM DUAL; --비교해서 맞으면 3번째 매개변수 출력. 아니면 그 다음 다음 다음....
                    
SELECT JOB_ID,
        DECODE(JOB_ID, 'IT_PROG', SALARY *0.3,
                        'FI_MGR', SALARY * 0.2,
                        SALARY)
FROM EMPLOYEES;


--CASE WHEN THEN ELSE
--1ST
SELECT JOB_ID,
        CASE JOB_ID WHEN 'IT_PROG' THEN SALARY * 0.3
                    WHEN 'FI_MGR'  THEN SALARY * 0.2
        END        
FROM EMPLOYEES;

--2ND (대소비교 OR 다른 컬럼의 비교가능)
SELECT JOB_ID,
        CASE WHEN JOB_ID = 'IT_PROG' THEN SALARY * 0.3
             WHEN JOB_ID = 'FI_MGR' THEN SALARY * 0.2
             ELSE SALARY
        END
FROM EMPLOYEES;


--COALESCE(A, B) - NVL이랑 유사 (NULL일 경우, 0으로 치환)
SELECT COALESCE( COMMISSION_PCT, 0) FROM EMPLOYEES;


---------------------------------------------------------------------------

--문제 1.

--현재일자를 기준으로 EMPLOYEE테이블의 입사일자(hire_date)를 참조해서 근속년수가 10년 이상인
--사원을 다음과 같은 형태의 결과를 출력하도록 쿼리를 작성해 보세요. 
--조건 1) 근속년수가 높은 사원 순서대로 결과가 나오도록 합니다

SELECT EMPLOYEE_ID AS 사원번호, 
       FIRST_NAME || ' ' || LAST_NAME AS 이름, 
       HIRE_DATE AS 입사일자, 
       TRUNC((SYSDATE - HIRE_DATE) / 365) AS 근속년수 
FROM EMPLOYEES 
WHERE TRUNC((SYSDATE - HIRE_DATE) / 365) >= 10
ORDER BY 근속년수 DESC;

--WHERE 에 조건이 붙으려면...찾음과 동시에 필터링 하는게 효율적임
--WHERE 절에 TRUNC((SYSDATE - HIRE_DATE) / 365) >= 10 연산처리한 값 자체가 들어가야한다.
--함수 구문 자체를 넣을 수 있다.
--WHERE 절엔 변칙 사용 불가. ORDER 절엔 사용가능. ORDER는 가장 마지막에 정렬이 들어감1
--넣고싶다면 아예 다 넣어야함 => TRUNC((SYSDATE - HIRE_DATE) / 365) >= 10

--문제 2.
--EMPLOYEE 테이블의 manager_id컬럼을 확인하여 first_name, manager_id, 직급을 출력합니다.
--100이라면 ‘사원’, 
--120이라면 ‘주임’
--121이라면 ‘대리’
--122라면 ‘과장’
--나머지는 ‘임원’ 으로 출력합니다.
--조건 1) DEPARTMENT_ID가 50인 사람들을 대상으로만 조회합니다

SELECT FIRST_NAME, 
       MANAGER_ID,      
        DECODE(MANAGER_ID, 100, '사원',
                           120, '주임',
                           121, '대리',
                           122, '과장',
                           '임원') AS 직급,
        CASE  MANAGER_ID  WHEN 100 THEN '사원'
                          WHEN 120 THEN '주임'
                          WHEN 121 THEN '대리'
                          WHEN 122 THEN '과장'
					      ELSE '임원'                     
                           
        END AS 직급
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 50;
