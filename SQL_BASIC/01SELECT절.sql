-- ����Ŭ �ּ���

/*
������ �ּ�
����Ŭ�� ��ҹ��� �������� �ʽ��ϴ�
*/

SELECT * FROM EMPLOYEES;
SELECT FIRST_NAME, EMAIL, HIRE_DATE FROM EMPLOYEES;
SELECT JOB_ID, SALARY, DEPARTMENT_ID FROM EMPLOYEES;

SELECT * FROM DEPARTMENTS;

-- ����
-- �ķ��� ��ȸ�ϴ� ��ġ���� * / + -

SELECT FIRST_NAME, SALARY, SALARY*SALARY*0.1 FROM EMPLOYEES;

--NULL
SELECT FIRST_NAME, COMMISSION_PCT FROM EMPLOYEES;

--����� as
SELECT FIRST_NAME AS �̸�, 
       LAST_NAME AS ��, 
       SALARY �޿�, 
       SALARY*0.1 �ѱ޿� 
FROM EMPLOYEES;

--���ڿ��� ���� ||
--����Ŭ�� ���ڸ� ''�� ǥ���մϴ�
--���ڿ� �ȿ��� '�� ����ϰ� ������ �ι����� �˴ϴ� ''
SELECT FIRST_NAME || ' ' || LAST_NAME || '''s salary $' || SALARY AS �޿�����
FROM EMPLOYEES;

--DISTINCT �ߺ��� ����
SELECT DISTINCT FIRST_NAME, DEPARTMENT_ID FROM EMPLOYEES; --�̸�, �μ����� ������ �ߺ��� ����
SELECT DISTINCT DEPARTMENT_ID FROM EMPLOYEES;

--ROWID(�������� �ּ�), ROWNUM (��ȸ�� ����)
SELECT ROWNUM, ROWID, EMPLOYEE_ID, FIRST_NAME FROM EMPLOYEES;