--숫자함수
--ROUND() - 반올림
SELECT ROUND(45.523, 2), ROUND(45.523), ROUND(45.523, -1) FROM DUAL;

--TRUNC() - 절삭
SELECT ROUND(45.523, 2), ROUND(45.523), ROUND(45.523, -1) FROM DUAL;

--CEIL(), FLOOR()
SELECT CEIL(3.14), FLOOR(3.14) FROM DUAL;

--MOD() - 나머지
SELECT 5 / 3 AS 몫, MOD(5, 3) AS 나머지 FROM DUAL;
--2자리 까지 잘라버리고 싶다면 ROUND OR TRUNC 사용

---------------------------------------------------------------------------

--날짜 함수
SELECT SYSDATE FROM DUAL; --년/월/일
SELECT SYSTIMESTAMP FROM DUAL; --시분초 밀리세컨을 포함한 상세한 시간타입

--날짜의 연산 = 기준이 일수
SELECT SYSDATE + 10 FROM DUAL; -- +10일
SELECT SYSDATE - 10 FROM DUAL; -- -10일
SELECT SYSDATE - HIRE_DATE FROM EMPLOYEES; -- 일수
SELECT (SYSDATE - HIRE_DATE) / 7 AS WEEK FROM EMPLOYEES;
--몇 주가 지났는지 확인하겠다 => 주 단위를 알 수 있다.

SELECT (SYSDATE - HIRE_DATE) / 365 AS YEAR FROM EMPLOYEES; -- 연도
SELECT TRUNC ( (SYSDATE - HIRE_DATE) / 365 )* 12 AS MONTH FROM EMPLOYEES; -- 연도 곱하기 12개월

--날짜의 반올림, 절삭
SELECT ROUND(SYSDATE) FROM DUAL; -- 그냥 넣으면 반올림 됨, 정오 지나서 쳐보만 하루 지나가 있음;
SELECT ROUND(SYSDATE, 'DAY') FROM DUAL; -- 해당 주의 일요일로 
SELECT ROUND(SYSDATE, 'MONTH') FROM DUAL; -- 월에 대한 반올림
SELECT ROUND(SYSDATE, 'YEAR') FROM DUAL; --년에 대한 반올림


SELECT TRUNC(SYSDATE) FROM DUAL; -- 오늘 일자 기준 절삭이라 밤에 쳐도 값을 같을 것
SELECT TRUNC(SYSDATE, 'DAY') FROM DUAL; --해당주의 일요일
SELECT TRUNC(SYSDATE, 'MONTH') FROM DUAL; --월에 대한 절삭
SELECT TRUNC(SYSDATE, 'YEAR') FROM DUAL; --년에 대한 절삭

