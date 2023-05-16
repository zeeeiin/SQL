--����ȯ �Լ�
--�ڵ�����ȯ
SELECT * FROM EMPLOYEES WHERE DEPARTMENT_ID = '30'; --����� �̰͵� �ڵ�����ȯ. ���ڸ� ���ڷ�!
SELECT SYSDATE - 5, SYSDATE - '5' FROM EMPLOYEES; -- �ڵ�����ȯ
--���ڸ� ���� ��¥��, ���ڸ� ���� ��¥�� ���´�. ����,���ڰ� ��¥�� �ڵ� ����ȯ �� ��!

--��������ȯ
--TO_CHAR(��¥, ��¥ ����)
SELECT TO_CHAR(SYSDATE, 'YYYY-MM-DD HH:MI:SS' ) FROM DUAL; --����
--��¥���� ����������, ��¥�� ��ҹ��� ������.
SELECT TO_CHAR(SYSDATE, 'YY/MM/DD HH24/MI/SS' ) FROM DUAL; --����

SELECT TO_CHAR(SYSDATE, 'YYYY��MM��DD��') FROM DUAL; --����. ��¥ ���� ������ �ƴ϶�� ��
--�̷� ��� �ֵ���ǥ�� �ٲ��ָ� ��¥ ���˰� ���� ����� �� �ִ�.
SELECT TO_CHAR(SYSDATE, 'YYYY"��"MM"��"DD"��"') FROM DUAL; --���˹��ڰ� �ƴ� ��� ""�� �����ش�.

SELECT TO_CHAR(HIRE_DATE, 'YYYY-MM-DD') FROM EMPLOYEES; --��¥�� ���� ��ȯ.������������ �����

--TO_CHAR(����, ��������)
SELECT TO_CHAR(200000, '$999,999,999') FROM DUAL;
SELECT TO_CHAR(200000.1234, '999999.999') FROM DUAL; --�Ҽ����ڸ�ǥ��
SELECT TO_CHAR(SALARY * 1300, 'L999,999,999') FROM EMPLOYEES;--����ȭ��
SELECT FIRST_NAME, TO_CHAR( SALARY *1300, 'L0999,999,999') FROM EMPLOYEES; --�ڸ����� 0���� ä��


--TO NUMBER(����, ��������)
SELECT '3.14' + 2000 FROM DUAL; --�ڵ�����ȯ
--����ȯ�� ������ ���ڰ� �Ǵϱ� �ڵ����� �����ش�.

SELECT TO_NUMBER('3.14') + 2000 FROM DUAL; --���������ȯ(��������ȯ)

SELECT '$3,300' +2000  FROM DUAL; --ERROR
--�ڵ����� �ٲ� �� ���� ���ڶ� �̷��� �Է��ϸ� �� ��.

SELECT TO_NUMBER('$3,300', '$999,999') +2000  FROM DUAL; --����� ����ȯ
--�޷������ϰ� �ڸ��� 6�ڸ���.

--TO_DATE(����, ��¥����)
SELECT SYSDATE - '2023-05-16' FROM DUAL; --ERROR
SELECT SYSDATE - TO_DATE('2023-05-16', 'YYYY-MM-DD') FROM DUAL;
SELECT SYSDATE - TO_DATE('2023/05/16 11:31:23', 'YYYY/MM/DD HH:MI:SS') FROM DUAL;
--��¥ �������� ���ϰ� �ȴ�.


--�Ʒ� ���� YYYY��MM��DD�� ���·� ���
SELECT '20050105' FROM DUAL; --���� >>  YYYY��MM��DD�� ������ ���ڷ� �ٲٶ�� ��. 

--���ڸ� ��¥�ιٲ�ٰ� �ٽ� �� ������ ���ڷ�..
SELECT TO_CHAR( TO_DATE('20050105', 'YYYYMMDD'), 'YYYY"��"MM"��"DD"��"') FROM DUAL;


SELECT TO_DATE('20050105', 'YYYY"��"MM"��"DD"��"') FROM DUAL;


--�Ʒ� ���� ���� ��¥�� �ϼ� ���̸� ���
SELECT '2005��01��05��' FROM DUAL;
--������� ��¥ ������ �ƴ�. ��¥ �������� ��ȯ�� �������.

SELECT SYSDATE - TO_DATE('2005��01��05��', 'YYYY"��"MM"��"DD"��"') FROM DUAL;
--�� �ٲٴ��� ���� ������ �� üũ�ؾ��Ѵ�.

--------------------------------------------------------------------------------
--NULL���� ���� ��ȯ
--NVL(�÷�, NULL�� ��� ó��)
SELECT NVL(NULL,  0) FROM DUAL;
SELECT FIRST_NAME, COMMISSION_PCT FROM EMPLOYEES; --NULL����� => NULL
SELECT FIRST_NAME, NVL(COMMISSION_PCT, 0) * 100 FROM EMPLOYEES;

--NVL2(�÷�, NULL�� �ƴѰ�� ó��, NULL�� ��� ó��)
SELECT NVL2(NULL, '���� �ƴմϴ�', '���Դϴ�') FROM DUAL;
SELECT FIRST_NAME,
       SALARY,
       COMMISSION_PCT,
       NVL2(COMMISSION_PCT, SALARY + (SALARY *COMMISSION_PCT), SALARY) AS �޿� 
       FROM EMPLOYEES; --�� ������ ���ΰ�


--DECODE() = else if���� ��ü�ϴ� �Լ�. �Ű������� ������ �� �� �ִ�.
SELECT DECODE('C', 'A', 'A�Դϴ�', 
                    'B', 'B�Դϴ�', 
                    'C', 'C�Դϴ�',
                    'ABC�� �ƴմϴ�') FROM DUAL; --���ؼ� ������ 3��° �Ű����� ���. �ƴϸ� �� ���� ���� ����....
                    
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

--2ND (��Һ� OR �ٸ� �÷��� �񱳰���)
SELECT JOB_ID,
        CASE WHEN JOB_ID = 'IT_PROG' THEN SALARY * 0.3
             WHEN JOB_ID = 'FI_MGR' THEN SALARY * 0.2
             ELSE SALARY
        END
FROM EMPLOYEES;


--COALESCE(A, B) - NVL�̶� ���� (NULL�� ���, 0���� ġȯ)
SELECT COALESCE( COMMISSION_PCT, 0) FROM EMPLOYEES;


---------------------------------------------------------------------------

--���� 1.

--�������ڸ� �������� EMPLOYEE���̺��� �Ի�����(hire_date)�� �����ؼ� �ټӳ���� 10�� �̻���
--����� ������ ���� ������ ����� ����ϵ��� ������ �ۼ��� ������. 
--���� 1) �ټӳ���� ���� ��� ������� ����� �������� �մϴ�

SELECT EMPLOYEE_ID AS �����ȣ, 
       FIRST_NAME || ' ' || LAST_NAME AS �̸�, 
       HIRE_DATE AS �Ի�����, 
       TRUNC((SYSDATE - HIRE_DATE) / 365) AS �ټӳ�� 
FROM EMPLOYEES 
WHERE TRUNC((SYSDATE - HIRE_DATE) / 365) >= 10
ORDER BY �ټӳ�� DESC;

--WHERE �� ������ ��������...ã���� ���ÿ� ���͸� �ϴ°� ȿ������
--WHERE ���� TRUNC((SYSDATE - HIRE_DATE) / 365) >= 10 ����ó���� �� ��ü�� �����Ѵ�.
--�Լ� ���� ��ü�� ���� �� �ִ�.
--WHERE ���� ��Ģ ��� �Ұ�. ORDER ���� ��밡��. ORDER�� ���� �������� ������ ��1
--�ְ�ʹٸ� �ƿ� �� �־���� => TRUNC((SYSDATE - HIRE_DATE) / 365) >= 10

--���� 2.
--EMPLOYEE ���̺��� manager_id�÷��� Ȯ���Ͽ� first_name, manager_id, ������ ����մϴ�.
--100�̶�� �������, 
--120�̶�� �����ӡ�
--121�̶�� ���븮��
--122��� �����塯
--�������� ���ӿ��� ���� ����մϴ�.
--���� 1) DEPARTMENT_ID�� 50�� ������� ������θ� ��ȸ�մϴ�

SELECT FIRST_NAME, 
       MANAGER_ID,      
        DECODE(MANAGER_ID, 100, '���',
                           120, '����',
                           121, '�븮',
                           122, '����',
                           '�ӿ�') AS ����,
        CASE  MANAGER_ID  WHEN 100 THEN '���'
                          WHEN 120 THEN '����'
                          WHEN 121 THEN '�븮'
                          WHEN 122 THEN '����'
					      ELSE '�ӿ�'                     
                           
        END AS ����
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 50;
