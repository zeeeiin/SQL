--���տ�����
--UNION - ������, UNION ALL - ������, INTERSECT - ������, MINUS - ������


SELECT FIRST_NAME, HIRE_DATE FROM EMPLOYEES WHERE HIRE_DATE LIKE '04%'
UNION
SELECT FIRST_NAME, HIRE_DATE FROM EMPLOYEES WHERE DEPARTMENT_ID = 20;
--���� ��ġ�� �ʹٸ� -> �� ������ �� ������ �Ǿ����. �����ݷ� ����� �߰��� UNION�̶�� ����

SELECT FIRST_NAME, HIRE_DATE FROM EMPLOYEES WHERE HIRE_DATE LIKE '04%'
UNION ALL
SELECT FIRST_NAME, HIRE_DATE FROM EMPLOYEES WHERE DEPARTMENT_ID = 20;


SELECT FIRST_NAME, HIRE_DATE FROM EMPLOYEES WHERE HIRE_DATE LIKE '04%'
INTERSECT
SELECT FIRST_NAME, HIRE_DATE FROM EMPLOYEES WHERE DEPARTMENT_ID = 20; --������


SELECT FIRST_NAME, HIRE_DATE FROM EMPLOYEES WHERE HIRE_DATE LIKE '04%'
MINUS
SELECT FIRST_NAME, HIRE_DATE FROM EMPLOYEES WHERE DEPARTMENT_ID = 20; --������

--���� �����ڴ� �÷� ���� ��ġ�ؾ� �Ѵ�.
--�÷� ���� ��ġ�Ѵٸ�, �پ��� ���·� ����� �ȴ�.
SELECT 'ȫ�浿', TO_CHAR(SYSDATE) FROM DUAL
UNION ALL
SELECT '�̼���', '05/01/01' FROM DUAL
UNION ALL
SELECT 'ȫ����', '06/02/02' FROM DUAL
UNION ALL
SELECT LAST_NAME, TO_CHAR(HIRE_DATE) FROM EMPLOYEES;


------------------------------------------------------------------
--�м��Լ� - �࿡ ���� ����� ����ϴ� ���, OVER() �� �Բ� ���ȴ�.
SELECT  FIRST_NAME,
        SALARY, 
        RANK() OVER(ORDER BY SALARY DESC) AS �ߺ����� ,
        DENSE_RANK() OVER (ORDER BY SALARY DESC) AS �ߺ�����X,
        ROW_NUMBER() OVER (ORDER BY SALARY DESC) AS �����͹�ȣ, --�������� ��ȣ
        COUNT(*) OVER(), --��ü ������ ���� ��ü ���ȣ�� �÷����� ����ִ� ��
        ROWNUM AS ��ȸ����--��ȸ�� �Ͼ ����
FROM EMPLOYEES 


