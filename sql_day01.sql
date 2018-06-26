-- sql day 01
-- 1. SCOTT ���� Ȱ��ȭ : SYS �������� �����Ͽ� ��ũ��Ʈ ����
@C:\oraclexe\app\oracle\product\11.2.0\server\rdbms\admin\scott.sql
-- 2. ���� ���� Ȯ�� ���
show user
-- 3. HR ���� Ȱ��ȭ : sys �������� �����Ͽ�
--                    �ٸ� ����� Ȯ�� �� HR ������
--                    �������, ��й�ȣ ���� ���� ����
---------------------------------------------------------------------
-- (1) EMP ���̺� ���� ��ȸ
SELECT *
  FROM EMP
;

/*----------------------------------------------------------------
7369	SMITH	CLERK	    7902	80/12/17	800		        20
7499	ALLEN	SALESMAN	7698	81/02/20	1600	300	    30
7521	WARD	SALESMAN	7698	81/02/22	1250	500	    30
7566	JONES	MANAGER	    7839	81/04/02	2975		    20
7654	MARTIN	SALESMAN	7698	81/09/28	1250	1400	30
7698	BLAKE	MANAGER	    7839	81/05/01	2850	    	30
7782	CLARK	MANAGER	    7839	81/06/09	2450	    	10
7839	KING	PRESIDENT	     	81/11/17	5000	    	10
7844	TURNER	SALESMAN	7698	81/09/08	1500	0   	30
7900	JAMES	CLERK	    7698	81/12/03	950		        30
7902	FORD	ANALYST	    7566	81/12/03	3000		    20
7934	MILLER	CLERK	    7782	82/01/23	1300		    10
------------------------------------------------------------------ */
-- (2) DEPT ���̺� ���� ��ȸ
SELECT *
  FROM DEPT
;

/*----------------------
10	ACCOUNTING	NEW YORK
20	RESEARCH	DALLAS
30	SALES	    CHICAGO
40	OPERATIONS	BOSTON
------------------------ */

-- (3) SALGRADE ���̺� ���� ��ȸ
SELECT *
  FROM SALGRADE 
;

/*----------------------
GRADE, LOSAL, HISAL
1	   700	  1200
2	   1201	  1400
3	   1401   2000
4	   2001	  3000
5	   3001	  9999
------------------------ */

/*---------------------------------
SELECT ��   
5 SELECT [PREDICATE]                    ����� ������ �ʿ� �÷� ���� 
1   FROM table1,table2                  ��� ���̺��� �˻� ����
2  WHERE ����                            ���ǿ� �´� �� ����
3  GROUP BY col1,coln[, ...]            ���� �÷����� �׷�ȭ
4 HAVING ����                            �׷�ȭ ����� ���� ����
6  ORDER BY col1,[, ...] [ASC|DESC]     ���õ� �÷� ����
------------------------------------*/

-- 01.DQL : SELECT
-- (1) SELECT ����
-- emp ���̺��� ���, �̸�, ������ ��ȸ
SELECT e.EMPNO
     , e.ENAME
     , e.JOB
  FROM emp e --�ҹ��� e�� alias(��Ī)
;

/*---------------------------------------
7369	SMITH	CLERK
7499	ALLEN	SALESMAN
7521	WARD	SALESMAN
7566	JONES	MANAGER
7654	MARTIN	SALESMAN
7698	BLAKE	MANAGER
7782	CLARK	MANAGER
7839	KING	PRESIDENT
7844	TURNER	SALESMAN
7900	JAMES	CLERK
7902	FORD	ANALYST
7934	MILLER	CLERK
---------------------------------------*/

-- emp ���̺��� ������ ��ȸ
SELECT e.JOB
  FROM emp e
;

/*
CLERK
SALESMAN
SALESMAN
MANAGER
SALESMAN
MANAGER
MANAGER
PRESIDENT
SALESMAN
CLERK
ANALYST
CLERK
*/

-- (2) DISTINCT �� : SELECT �� ���� �ߺ��� �����Ͽ� ��ȸ
-- emp ���̺��� JOB �÷��� �ߺ��� �����Ͽ� ��ȸ
SELECT DISTINCT e.JOB
  FROM emp e
;

/* ---------
CLERK
SALESMAN
PRESIDENT
MANAGER
ANALYST
--------- */

-- * SQL SELECT ������ �۵� ���� : ���̺��� �� ���� �⺻ ������ ������.
--                               ���̺� ���� ������ŭ �ݺ� ����.
SELECT 'Hello, SQL~'
  FROM emp e
;
/* --------------
Hello, SQL~
Hello, SQL~
Hello, SQL~
Hello, SQL~
Hello, SQL~
Hello, SQL~
Hello, SQL~
Hello, SQL~
Hello, SQL~
Hello, SQL~
Hello, SQL~
Hello, SQL~
-------------- */

-- emp ���̺��� job, deptno �� ���� �ߺ��� �����Ͽ� ��ȸ
SELECT DISTINCT
       e.JOB
     , e.DEPTNO
  FROM emp e
;

/* -----------------
MANAGER 	20
PRESIDENT	10
CLERK   	10
SALESMAN	30
ANALYST	    20
MANAGER	    30
MANAGER 	10
CLERK   	30
CLERK   	20
----------------- */

-- (3) ORDER BY �� : ���� (Ascending,Descending)
-- 5) emp ���̺��� JOB �� �ߺ��� �����Ͽ� ��ȸ�ϰ� ������������ ����
SELECT DISTINCT 
       e.JOB
  FROM emp e
 ORDER BY e.JOB -- [ASC]
;

/* --------
ANALYST
CLERK
MANAGER
PRESIDENT
SALESMAN
-------- */

-- 6) emp ���̺��� job �� �ߺ��� �����Ͽ� ��ȸ�ϰ� ������������ ����
SELECT DISTINCT 
       e.JOB
  FROM emp e
 ORDER BY e.JOB DESC
;

/* --------
SALESMAN
PRESIDENT
MANAGER
CLERK
ANALYST
-------- */

-- 7) emp ���̺��� comm �� ���� ���� �޴� ������� ���
--    ���, �̸�, ����, �Ի���, Ŀ�̼� ������ ��ȸ
SELECT e.EMPNO
     , e.ENAME
     , e.JOB
     , e.HIREDATE
     , e.COMM
  FROM emp e
 ORDER BY e.COMM DESC
;

/* --------------------------------------------------------
7369	SMITH	CLERK	80/12/17	
7698	BLAKE	MANAGER	81/05/01	
7902	FORD	ANALYST	81/12/03	
7900	JAMES	CLERK	81/12/03	
7839	KING	PRESIDENT	81/11/17	
7566	JONES	MANAGER	81/04/02	
7934	MILLER	CLERK	82/01/23	
7782	CLARK	MANAGER	81/06/09	
7654	MARTIN	SALESMAN	81/09/28	1400
7521	WARD	SALESMAN	81/02/22	500
7499	ALLEN	SALESMAN	81/02/20	300
7844	TURNER	SALESMAN	81/09/08	0
-------------------------------------------------------- */

-- 8) emp ���̺��� comm �� ���� �������, ������ ��������, �̸��� ������������ ����
--    ���, �̸�, ����, �Ի���, Ŀ�̼��� ��ȸ
SELECT e.EMPNO
     , e.ENAME
     , e.JOB
     , e.HIREDATE
     , e.COMM
  FROM emp e
 ORDER BY e.COMM, e.JOB, e.ENAME
;

/* -------------------------------------------------
7844	TURNER	SALESMAN	81/09/08	0
7499	ALLEN	SALESMAN	81/02/20	300
7521	WARD	SALESMAN	81/02/22	500
7654	MARTIN	SALESMAN	81/09/28	1400
7902	FORD	ANALYST	    81/12/03	
7900	JAMES	CLERK	    81/12/03	
7934	MILLER	CLERK	    82/01/23	
7369	SMITH	CLERK	    80/12/17	
7698	BLAKE	MANAGER 	81/05/01	
7782	CLARK	MANAGER 	81/06/09	
7566	JONES	MANAGER 	81/04/02	
7839	KING	PRESIDENT	81/11/17	
------------------------------------------------- */

-- 9) emp ���̺��� comm�� ���� �������, ������ ��������, �̸��� ������������ ����
--    ���, �̸�, ����, �Ի���, Ŀ�̼��� ��ȸ
SELECT e.EMPNO
     , e.ENAME
     , e.JOB
     , e.HIREDATE
     , e.COMM
  FROM emp e
 ORDER BY e.COMM, e.JOB, e.EMPNO DESC
;

/* ---------------------------------------------------
7844	TURNER	SALESMAN	81/09/08	0
7499	ALLEN	SALESMAN	81/02/20	300
7521	WARD	SALESMAN	81/02/22	500
7654	MARTIN	SALESMAN	81/09/28	1400
7902	FORD	ANALYST	    81/12/03	
7934	MILLER	CLERK	    82/01/23	
7900	JAMES	CLERK   	81/12/03	
7369	SMITH	CLERK	    80/12/17	
7782	CLARK	MANAGER 	81/06/09	
7698	BLAKE	MANAGER 	81/05/01	
7566	JONES	MANAGER 	81/04/02	
7839	KING	PRESIDENT	81/11/17	
--------------------------------------------------- */

-- (4)ALIAS : ��Ī
-- 10) emp ���̺��� �Ʒ� �� �÷��� ��Ī�� Ǯ������ �־ ��ȸ
--      empno --> Employee No.
--      ename --> Employee Name
--      job   --> Job Name
SELECT e.EMPNO as "Employee No."
     , e.ENAME  as "Employee Name"
     , e.JOB   as "Job Name"
  FROM emp e
;

-- 11) 10���� ���� AS Ű���� �����Ͽ� ��ȸ
SELECT e.EMPNO  "Employee No."
     , e.ENAME  "Employee Name"
     , e.JOB    "Job Name"
  FROM emp e
;

--      �÷��� ��Ī�� �ѱ۷� ������ ��ȸ
--      empno --> ���
--      ename --> ��� �̸�
--      job   --> ����
SELECT e.EMPNO ��� 
     , e.ENAME "��� �̸�"
     , e.JOB   "����"
  FROM emp e
;

-- 12) ���̺� ���̴� ��Ī�� ���� �ʾ��� ��
SELECT empno
  FROM emp
;

SELECT emp.empno
  FROM emp
;

SELECT e.empno --FROM ������ ������ ���̺� ��Ī�� SELECT ������ ����.
  FROM emp e -- �ҹ��� e�� emp ���̺��� ��Ī�̸� ���̺� ��Ī�� FROM ���� �����
;

SELECT d.DEPTNO
  FROM dept d
;

-- 13) ������Ī ���� Ư����ȣ _ ����ϴ� ���
SELECT e.EMPNO Employee_No -- ������ ��Ī�� ""�� ����������� ��� ��� �빮�ڷ� ��µ�
     , e.ENAME "Employee Name"
  FROM emp e
;

-- 14) ��Ī�� ������ ���� : SELECT ���� ��Ī�� �� ��� ORDER BY ������ ��밡��
--     emp ���̺��� ���, �̸�, ����, �Ի���, Ŀ�̼��� ��ȸ�� ��
--     �� �÷��� ���ؼ� �ѱۺ�Ī�� �־� ��ȸ
--     ������ Ŀ�̼�, ����, �̸��� �������� ����
SELECT e.EMPNO ���
     , e.ENAME �̸�
     , e.JOB   ����
     , e.HIREDATE �Ի���
     , e.COMM Ŀ�̼�
  FROM emp e
 ORDER BY Ŀ�̼� , ����, �̸�
;

-- 15) DISTINCT, ��Ī, ������ ����
--     job�� �ߺ��� �����Ͽ� ���� ��� ��Ī�� ��ȸ�ϰ�
--     ������������ ����
SELECT DISTINCT e.JOB ����
  FROM emp e
 ORDER BY ���� DESC
;
/*
����
----------
SALESMAN
PRESIDENT
MANAGER
CLERK
ANALYST
*/

-- (5) WHERE ���� ��
-- 16) emp ���̺��� EMPNO �� 7900�� �����
--     ���, �̸�, ����, �Ի���, �޿�, �μ���ȣ
SELECT e.EMPNO
     , e.ENAME
     , e.JOB
     , e.HIREDATE
     , e.SAL
     , e.DEPTNO
  FROM emp e
 WHERE e.EMPNO = 7900
;

/*
EMPNO, ENAME, JOB, HIREDATE, SAL, DEPTNO
-----------------------------------------------
7900	JAMES	CLERK	81/12/03	950	30
*/

-- 17) emp ���̺��� empno �� 7900 �̰ų� deptno �� 20�� ������ ������
--     ���, �̸�, ����, �Ի���, �޿�, �μ���ȣ�� ��ȸ
SELECT e.EMPNO
     , e.ENAME
     , e.JOB
     , e.HIREDATE
     , e.SAL
     , e.DEPTNO
  FROM emp e
 WHERE e.EMPNO = 7900
    OR e.DEPTNO = 20
;

/*
EMPNO, ENAME, JOB, HIREDATE, SAL, DEPTNO
-------------------------------------------------
7369	SMITH	CLERK	80/12/17	800	    20
7566	JONES	MANAGER	81/04/02	2975	20
7900	JAMES	CLERK	81/12/03	950	    30
7902	FORD	ANALYST	81/12/03	3000	20
*/

-- 18) 17���� ��ȸ������ AND �������� ����
--     
SELECT e.EMPNO
     , e.ENAME
     , e.JOB
     , e.HIREDATE
     , e.SAL
     , e.DEPTNO
  FROM emp e
 WHERE e.EMPNO = 7900
   AND e.DEPTNO = 20
;
-- ����� ��� �� : 0

-- 19) job �� 'CLERK' �̸鼭 deptno �� 10�� ������
--     ���, �̸�, ����, �μ���ȣ�� ��ȸ
SELECT e.EMPNO
     , e.ENAME
     , e.JOB
     , e.DEPTNO
  FROM emp e
 WHERE e.JOB = 'CLERK' -- ���ڰ� �񱳽� ''���, ���ڰ��� ��ҹ��� ����
   AND e.DEPTNO = 10   -- ���ڰ� �񱳽� ����ǥ ������
;

/*
EMPNO, ENAME, JOB, DEPTNO
------------------------------
7934	MILLER	CLERK	10
*/

-- 20) 19������ ���� �� ���� �ҹ��� clerk �� ���Ͽ� ����� Ȯ��

SELECT e.EMPNO
     , e.ENAME
     , e.JOB
     , e.DEPTNO
  FROM emp e
 WHERE e.JOB = 'clerk'
   AND e.DEPTNO = 10  
;

-- �ҹ��� clerk �� ����� ������ �������� �����Ƿ� ���ǿ� �´� ���� ����
-- ����� ��� �� : 0 ����� �߻���

-- (6) ������ 1. ���������
-- 21) ���, �̸�, �޿��� ��ȸ�ϰ�, �޿��� 3.3%�� �ش��ϴ� ��õ¡�� ������ ����Ͽ� ��ȸ
SELECT e.EMPNO ���
     , e.ENAME �̸�
     , e.SAL   �޿�
     , e.SAL * 0.033 ��õ¡������
  FROM emp e
;

/*
���, �̸�, �޿�, ��õ¡������
------------------------------
7369	SMITH	800	    26.4
7499	ALLEN	1600	52.8
7521	WARD	1250	41.25
7566	JONES	2975	98.175
7654	MARTIN	1250	41.25
7698	BLAKE	2850	94.05
7782	CLARK	2450	80.85
7839	KING	5000	165
7844	TURNER	1500	49.5
7900	JAMES	950 	31.35
7902	FORD	3000	99
7934	MILLER	1300	42.9
*/

-- �Ǽ��ɾ׿� �ش��ϴ� 96.7%�� �޿��� ����Ͽ� ��ȸ
SELECT e.EMPNO ���
     , e.ENAME �̸�
     , e.SAL   �޿�
     , e.SAL * 0.033 ��õ¡������
     , e.SAL * 0.967 �Ǽ��ɾ�
  FROM emp e
;

/*
���, �̸�, �޿�, ��õ¡������, �Ǽ��ɾ�
-----------------------------------------------
7369	SMITH	800	    26.4	773.6
7499	ALLEN	1600	52.8	1547.2
7521	WARD	1250	41.25	1208.75
7566	JONES	2975	98.175	2876.825
7654	MARTIN	1250	41.25	1208.75
7698	BLAKE	2850	94.05	2755.95
7782	CLARK	2450	80.85	2369.15
7839	KING	5000	165 	4835
7844	TURNER	1500	49.5	1450.5
7900	JAMES	950	    31.35	918.65
7902	FORD	3000	99	    2901
7934	MILLER	1300	42.9	1257.1
*/

--���ϰ���� ���� �ٸ� ���
SELECT e.EMPNO ���
     , e.ENAME �̸�
     , e.SAL   �޿�
     , e.SAL * 0.033 ��õ¡������
     , e.SAL - (e.SAL * 0.033) �Ǽ��ɾ�
  FROM emp e
;

-- (6) ������ 2. �񱳿�����
--     �񱳿����ڴ� SELECT ���� ����� �� ����
--     WHERE, HAVING ������ �����

-- 22) �޿��� 2000�� �Ѵ� ����� ���, �̸�, �޿��� ��ȸ
SELECT e.EMPNO
     , e.ENAME
     , e.SAL
  FROM emp e
 WHERE e.SAL > 2000
;

-- �޿��� 1000�̻��� ������ ���, �̸�, �޿��� ��ȸ
SELECT e.EMPNO
     , e.ENAME
     , e.SAL
  FROM emp e
 WHERE e.SAL >= 1000
;

-- �޿��� 1000�̻��̸� 2000�̸��� ������ ���, �̸�, �޿��� ��ȸ
SELECT e.EMPNO
     , e.ENAME
     , e.SAL
  FROM emp e
 WHERE e.SAL >= 1000
   AND e.SAL < 2000
;

-- COMM ���� 0���� ū ������ ���, �̸�, �޿��� ��ȸ
SELECT e.EMPNO
     , e.ENAME
     , e.SAL
  FROM emp e
 WHERE e.COMM > 0
;
/*
 ���� ���� ������� comm �� (null)�� ������� ����
 ó������ �񱳴�� ���� ������ �����ؾ� �Ѵ�.
 (null) ���� �񱳿����ڷ� ���� �� ���� ���̴�.
*/

-- 23) �������(SALESMAN) ������ ���� ������� �޿��� ������ �Բ� �����Ǹ�
--     ��������� ���� ���ɱ��� ����غ���
SELECT e.EMPNO
     , e.ENAME
     , e.JOB
     , e.SAL + e.COMM "�޿� + ����"
  FROM emp e
;

/*
7369	SMITH	CLERK	
7499	ALLEN	SALESMAN	1900
7521	WARD	SALESMAN	1750
7566	JONES	MANAGER	
7654	MARTIN	SALESMAN	2650
7698	BLAKE	MANAGER	
7782	CLARK	MANAGER	
7839	KING	PRESIDENT	
7844	TURNER	SALESMAN	1500
7900	JAMES	CLERK	
7902	FORD	ANALYST	
7934	MILLER	CLERK	
*/

==> ���� ���� (null) ���� ��� ���� ����� �ᱹ (null) ���� ��������

-- (6) ������ 3. ��������
-- NOT ������

-- 24) �޿��� 2000���� ���� ���� ������ ���, �̸�, �޿��� ��ȸ
SELECT e.EMPNO
     , e.ENAME
     , e.SAL
  FROM emp e
 WHERE NOT e.SAL < 2000
;
-- ���� ����� ���� �ٸ� ���� NOT ������� ����
SELECT e.EMPNO
     , e.ENAME
     , e.SAL
  FROM emp e
 WHERE e.SAL >= 2000
 ;

-- (6) ������ 4. SQL ������
-- IN ������ : ���ϰ��� �ϴ� ���� ���� ���õ� �׸� ��Ͽ� �����ϸ� ������ �Ǵ�

-- 25) �޿��� 800, 3000, 5000�߿� �ϳ��� ������ ���, �̸�, �޿��� ��ȸ
SELECT e.EMPNO
     , e.ENAME
     , e.SAL
  FROM emp e
 WHERE e.SAL = 800
    OR e.SAL = 3000
    OR e.SAL = 5000
;
-- IN �����ڸ� ����Ͽ� �ذ�
SELECT e.EMPNO
     , e.ENAME
     , e.SAL
  FROM emp e
 WHERE e.SAL IN (800, 3000, 5000)
;

-- LIKE ������ : ���� ���� �˻��ϴµ� ���
/* LIKE �����ڴ� ���� �� �˻��� ���� �Բ� ����ϴ� ���� �ν� ���ڰ� �ִ�.
   % : 0�ڸ��� �̻��� ��� ���� ������ �� �� ����
   _ : 1�ڸ��� ��� ���� ������ �� �� ����
*/

-- 26) �̸��� J �� �����ϴ� ������ ���, �̸� ��ȸ
SELECT e.EMPNO
     , e.ENAME
  FROM emp e
 WHERE e.ENAME LIKE 'J%'
;

-- �̸��� M���� �����ϴ� ������ ���, �̸� ��ȸ
SELECT e.EMPNO
     , e.ENAME
  FROM emp e
 WHERE e.ENAME LIKE 'M%'
;

-- �̸���  M�� ���� ������ ���, �̸� ��ȸ
SELECT e.EMPNO
     , e.ENAME
  FROM emp e
 WHERE e.ENAME LIKE '%M%'
;
     
-- �̸��� �ι�° �ڸ��� M�� ���� ������ ���, �̸� ��ȸ
SELECT e.EMPNO
     , e.ENAME
  FROM emp e
 WHERE e.ENAME LIKE '_M%' -- ���� ���� �ν� ���ڸ� _�� ����Ͽ� �ѱ��ڷ� ����
;

-- �̸��� ����° �ڸ��� M�� ���� ������ ���, �̸� ��ȸ
SELECT e.EMPNO
     , e.ENAME
  FROM emp e
 WHERE e.ENAME LIKE '__M%' -- ���� ���� �ν� ���ڸ� _�� �ι� ����Ͽ� ���ڸ��� 2���ڷ� ����;
;

-- �̸��� ��°�ڸ����� LA�� ���� �̸��� ���� ������ ���, �̸� ��ȸ
SELECT e.EMPNO
     , e.ENAME
  FROM emp e
 WHERE e.ENAME LIKE '_LA%'
;

-- �̸��� j_��  �����ϴ� ������ ���, �̸� ��ȸ
-- : ��ȸ ���� �����ν� ���ڰ� ����ִ� �������� ��� ��� ��ȸ�� ���ΰ�?
SELECT e.EMPNO
     , e.ENAME
  FROM emp e
 WHERE e.ENAME LIKE 'J\_%' ESCAPE '\'
;
-- ��ȸ�Ϸ��� ���� ����ִ� �����ν� ���ڸ� ��ȿȭ �Ϸ��� ESCAPE ��� �����Ѵ�

-- �̸��� J%�� �����ϴ� ������ ���, �̸� ��ȸ
SELECT e.EMPNO
     , e.ENAME
  FROM emp e
 WHERE e.ENAME LIKE 'J\%%' ESCAPE '\'
;











