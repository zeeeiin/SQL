--1. ��� ����� �����ȣ, �̸�, �Ի���, �޿��� ����ϼ���.
SELECT EMPLOYEE_ID �����ȣ, 
       FIRST_NAME || ' ' || LAST_NAME �̸�,
       HIRE_DATE �Ի���,
       SALARY �޿�
FROM EMPLOYEES;  

--2. ��� ����� �̸��� ���� �ٿ� ����ϼ���. �� ��Ī�� name���� �ϼ���.
SELECT FIRST_NAME || ' ' || LAST_NAME name FROM EMPLOYEES;

--3. 50�� �μ� ����� ��� ������ ����ϼ���.
SELECT * FROM EMPLOYEES WHERE DEPARTMENT_ID IN 50; 

--4. 50�� �μ� ����� �̸�, �μ���ȣ, �������̵� ����ϼ���.
SELECT FIRST_NAME || ' ' || LAST_NAME �̸�,
       DEPARTMENT_ID �μ���ȣ,
       JOB_ID �������̵�
FROM EMPLOYEES WHERE DEPARTMENT_ID IN 50;

--5. ��� ����� �̸�, �޿� �׸��� 300�޷� �λ�� �޿��� ����ϼ���.
SELECT FIRST_NAME || ' ' || LAST_NAME �̸�,
       SALARY �޿�,
       SALARY + 300 �λ�ȱ޿�
FROM EMPLOYEES;

--6. �޿��� 10000���� ū ����� �̸��� �޿��� ����ϼ���.
SELECT FIRST_NAME || ' ' || LAST_NAME �̸�,
       SALARY �޿�
FROM EMPLOYEES WHERE SALARY > 10000;


--7. ���ʽ��� �޴� ����� �̸��� ����, ���ʽ����� ����ϼ���.
SELECT FIRST_NAME || ' ' || LAST_NAME �̸�,
       JOB_ID ����,
       COMMISSION_PCT ���ʽ���
FROM EMPLOYEES WHERE COMMISSION_PCT IS NOT NULL;

--8. 2003�⵵ �Ի��� ����� �̸��� �Ի��� �׸��� �޿��� ����ϼ���.(BETWEEN ������ ���)
SELECT FIRST_NAME || ' ' || LAST_NAME �̸�,
       HIRE_DATE �Ի���,
       SALARY �޿�
FROM EMPLOYEES WHERE HIRE_DATE BETWEEN '03/01/01' AND '03/12/31';

--9. 2003�⵵ �Ի��� ����� �̸��� �Ի��� �׸��� �޿��� ����ϼ���.(LIKE ������ ���)
SELECT FIRST_NAME || ' ' || LAST_NAME �̸�,
       HIRE_DATE �Ի���,
       SALARY �޿�
FROM EMPLOYEES WHERE HIRE_DATE LIKE '03%';

--10. ��� ����� �̸��� �޿��� �޿��� ���� ������� ���� ��������� ����ϼ���.
SELECT FIRST_NAME || ' ' || LAST_NAME �̸�,
       SALARY �޿�
FROM EMPLOYEES ORDER BY SALARY DESC;

--11. �� ���Ǹ� 60�� �μ��� ����� ���ؼ��� �����ϼ���. (�÷�: department_id)
SELECT FIRST_NAME || ' ' || LAST_NAME �̸�,
       SALARY �޿�
FROM EMPLOYEES WHERE DEPARTMENT_ID IN 60 ORDER BY SALARY DESC;

--12. �������̵� IT_PROG �̰ų�, SA_MAN�� ����� �̸��� �������̵� ����ϼ���.
SELECT FIRST_NAME || ' ' || LAST_NAME �̸�,
       JOB_ID �������̵�
FROM EMPLOYEES WHERE JOB_ID IN ('IT_PROG', 'SA_MAN');

--13. Steven King ����� ������ ��Steven King ����� �޿��� 24000�޷� �Դϴ١� �������� ����ϼ���.
SELECT FIRST_NAME || ' ' || LAST_NAME || 
       ' ����� �޿��� ' || SALARY || '�޷� �Դϴ�.'
FROM EMPLOYEES WHERE FIRST_NAME = 'Steven' and LAST_NAME = 'King';

--14. �Ŵ���(MAN) ������ �ش��ϴ� ����� �̸��� �������̵� ����ϼ���. (�÷�:job_id)
SELECT FIRST_NAME || ' ' || LAST_NAME �̸�,
       JOB_ID �������̵�
FROM EMPLOYEES WHERE JOB_ID LIKE '%MAN';

--15. �Ŵ���(MAN) ������ �ش��ϴ� ����� �̸��� �������̵� �������̵� ������� ����ϼ���.
SELECT FIRST_NAME || ' ' || LAST_NAME �̸�,
       JOB_ID �������̵�
FROM EMPLOYEES WHERE JOB_ID LIKE '%MAN' ORDER BY JOB_ID;

