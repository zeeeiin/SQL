--�׷��Լ� : �����࿡ ���Ͽ� �������
--AVG, SUM, MIN, MAX, COUNT
SELECT AVG(SALARY), SUM(SALARY), MIN(SALARY), MAX(SALARY), COUNT(SALARY) FROM EMPLOYEES;
SELECT MIN(HIRE_DATE), MAX(HIRE_DATE) FROM EMPLOYEES;
SELECT MIN(FIRST_NAME), MAX(FIRST_NAME) FROM EMPLOYEES;
-- => ���� �ؿ� ���� ����


--COUNT (�÷�) :  NULL�� �ƴ� ������ ����
--COUNT(*) : ��ü ���� ����
SELECT COUNT(FIRST_NAME) FROM EMPLOYEES;
SELECT COUNT(DEPARTMENT_ID) FROM EMPLOYEES;
--(�� ���� ��ȸ�غ��� �� ������ ���̰� ����.
SELECT COUNT(COMMISSION_PCT) FROM EMPLOYEES;
NULL���� �ƴ� ������ ���� ���ڰ����̱� ������...?
SELECT COUNT(*) FROM EMPLOYEES;


--�׷��Լ�: �׷��Լ��� �Ϲ��÷��� ���ÿ� ����� �� ����.(����Ŭ��)
SELECT FIRST_NAME, SUM(SALARY) FROM EMPLOYEES;




