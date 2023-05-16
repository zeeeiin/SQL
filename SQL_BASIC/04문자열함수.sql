--���ڿ� �Լ�
--LOWER(), INITCAP(), UPPER()
SELECT LOWER('HELLO'), INITCAP('HELLO'), UPPER('HELLO') FROM DUAL; --DUAL : ������� �� �ִ� �������̺�
SELECT LOWER(FIRST_NAME), INITCAP(FIRST_NAME), UPPER(FIRST_NAME) FROM EMPLOYEES;

--�Լ��� WHERE������ ����ȴ�.
SELECT FIRST_NAME FROM EMPLOYEES WHERE UPPER(FIRST_NAME) = 'STEVEN';

--LENGTH() - ����, INSTR() - ����ã��
SELECT FIRST_NAME, LENGTH(FIRST_NAME), INSTR(FIRST_NAME, 'e') FROM EMPLOYEES;

--SUBSTR() - ���ڿ� �ڸ���, CONCAT() - ���ڿ� ��ġ��
SELECT FIRST_NAME, SUBSTR(FIRST_NAME, 1, 3) FROM EMPLOYEES; --1��°���� 3���ڸ� �ڸ�
SELECT FIRST_NAME, CONCAT(FIRST_NAME, LAST_NAME), FIRST_NAME || LAST_NAME FROM EMPLOYEES;

--LPAD() - ���� ä���, RPAD() - ������ ä���
SELECT LPAD('HELLO', 10, '*') FROM DUAL; --10ĭ ���, ���ʺ��� ä��
SELECT LPAD(SALARY, 10, '*') FROM EMPLOYEES;
SELECT RPAD(SALARY, 10, '-') FROM EMPLOYEES;

--LTRIM() - ���� ����, RTRIM() - ������ ����, TRIM() - ��������
SELECT LTRIM('   HELLO') FROM DUAL;
SELECT LTRIM(FIRST_NAME, 'A') FROM EMPLOYEES; -- ���ʿ� ó�� �߰ߵǴ� ���� 8����
SELECT RTRIM ('  HELLO ') AS RESULT FROM DUAL; 
SELECT TRIM ('  HELLO ') AS RESULT FROM DUAL; 

--REPLACE() - ���ڿ� ����
SELECT REPLACE('HELLO WORLD', 'HELLO', 'BYE') FROM DUAL;
SELECT REPLACE('HELLO WORLD~!', ' ', '') AS RESULT FROM DUAL; --��� �������� 

--��ø
--SELECT REPLACE('HELLO WORLD ~!', 'HELLO', 'BYE' ) FROM DUAL;
SELECT REPLACE( REPLACE('HELLO WORLD ~!', 'HELLO', 'BYE' ), ' ', '') AS RESULT FROM DUAL;

----------------------------------------------------------------------------------
--��������
--���� 1.
--EMPLOYEES ���̺� ���� �̸�, �Ի����� �÷����� �����ؼ� �̸������� �������� ��� �մϴ�.
--���� 1) �̸� �÷��� first_name, last_name�� �ٿ��� ����մϴ�.
--���� 2) �Ի����� �÷��� xx/xx/xx�� ����Ǿ� �ֽ��ϴ�. xxxxxx���·� �����ؼ� ����մϴ�.
-- || �� �ٿ��� �Ǵµ� ���� Ȱ���غ���...
--�Ű����� 3���� ���� �� ����. �� ����Ѵٸ� �� �߰��� �����.

SELECT CONCAT(FIRST_NAME, ' ' || LAST_NAME),
       REPLACE(HIRE_DATE , '/', '') AS HIRE_DATE
       FROM EMPLOYEES;


--���� 2.
--EMPLOYEES ���̺� ���� phone_numbe�÷��� ###.###.####���·� ����Ǿ� �ִ�
--���⼭ ó�� �� �ڸ� ���� ��� ���� ������ȣ (02)�� �ٿ� ��ȭ ��ȣ�� ����ϵ��� ������ �ۼ��ϼ���.

--ó�� �߰ߵǴ� ������ ��ȭ��ȣ ���ڸ����� �ڸ���.=> ��ȭ��ȣ�� ����LENGTH���� �ڸ���. �׸��� 02�� �ٿ��ش�.
SELECT '(02)' || SUBSTR(PHONE_NUMBER, INSTR( PHONE_NUMBER, '.' ), LENGTH(PHONE_NUMBER) ) AS RESULT 
FROM EMPLOYEES;


--���� 3. 
--EMPLOYEES ���̺��� JOB_ID�� it_prog�� ����� �̸�(first_name)�� �޿�(salary)�� ����ϼ���.
--���� 1) ���ϱ� ���� ���� �ҹ��ڷ� �Է��ؾ� �մϴ�.(��Ʈ : lower �̿�)
--���� 2) �̸��� �� 3���ڱ��� ����ϰ� �������� *�� ����մϴ�. 
--�� ���� �� ��Ī�� name�Դϴ�.(��Ʈ : rpad�� substr �Ǵ� substr �׸��� length �̿�)
--���� 3) �޿��� ��ü 10�ڸ��� ����ϵ� ������ �ڸ��� *�� ����մϴ�. 
--�� ���� �� ��Ī�� salary�Դϴ�.(��Ʈ : lpad �̿�)

--��, �ڸ���, ä�� ���� => substr ���� 3���� �ڸ���, �ڸ����� length��.

SELECT RPAD( SUBSTR(FIRST_NAME, 1, 3), LENGTH(FIRST_NAME) , '*') AS NAME,
       LPAD(SALARY, 10, '*') 
       FROM EMPLOYEES WHERE LOWER(JOB_ID) = 'it_prog';


