--�����Լ�
--ROUND() - �ݿø�
SELECT ROUND(45.523, 2), ROUND(45.523), ROUND(45.523, -1) FROM DUAL;

--TRUNC() - ����
SELECT ROUND(45.523, 2), ROUND(45.523), ROUND(45.523, -1) FROM DUAL;

--CEIL(), FLOOR()
SELECT CEIL(3.14), FLOOR(3.14) FROM DUAL;

--MOD() - ������
SELECT 5 / 3 AS ��, MOD(5, 3) AS ������ FROM DUAL;
--2�ڸ� ���� �߶������ �ʹٸ� ROUND OR TRUNC ���

---------------------------------------------------------------------------

--��¥ �Լ�
SELECT SYSDATE FROM DUAL; --��/��/��
SELECT SYSTIMESTAMP FROM DUAL; --�ú��� �и������� ������ ���� �ð�Ÿ��

--��¥�� ���� = ������ �ϼ�
SELECT SYSDATE + 10 FROM DUAL; -- +10��
SELECT SYSDATE - 10 FROM DUAL; -- -10��
SELECT SYSDATE - HIRE_DATE FROM EMPLOYEES; -- �ϼ�
SELECT (SYSDATE - HIRE_DATE) / 7 AS WEEK FROM EMPLOYEES;
--�� �ְ� �������� Ȯ���ϰڴ� => �� ������ �� �� �ִ�.

SELECT (SYSDATE - HIRE_DATE) / 365 AS YEAR FROM EMPLOYEES; -- ����
SELECT TRUNC ( (SYSDATE - HIRE_DATE) / 365 )* 12 AS MONTH FROM EMPLOYEES; -- ���� ���ϱ� 12����

--��¥�� �ݿø�, ����
SELECT ROUND(SYSDATE) FROM DUAL; -- �׳� ������ �ݿø� ��, ���� ������ �ĺ��� �Ϸ� ������ ����;
SELECT ROUND(SYSDATE, 'DAY') FROM DUAL; -- �ش� ���� �Ͽ��Ϸ� 
SELECT ROUND(SYSDATE, 'MONTH') FROM DUAL; -- ���� ���� �ݿø�
SELECT ROUND(SYSDATE, 'YEAR') FROM DUAL; --�⿡ ���� �ݿø�


SELECT TRUNC(SYSDATE) FROM DUAL; -- ���� ���� ���� �����̶� �㿡 �ĵ� ���� ���� ��
SELECT TRUNC(SYSDATE, 'DAY') FROM DUAL; --�ش����� �Ͽ���
SELECT TRUNC(SYSDATE, 'MONTH') FROM DUAL; --���� ���� ����
SELECT TRUNC(SYSDATE, 'YEAR') FROM DUAL; --�⿡ ���� ����

