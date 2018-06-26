-- �ǽ�1)
SELECT e.EMPNO
     , e.ENAME
     , e.JOB
     , e.SAL
  FROM emp e
 ORDER BY e.SAL DESC
;

-- �ǽ�2)
SELECT e.EMPNO
     , e.ENAME
     , e.HIREDATE
  FROM emp e
 ORDER BY e.HIREDATE
;

-- �ǽ�3) 
SELECT e.EMPNO
     , e.ENAME
     , e.COMM
  FROM emp e
 ORDER BY e.COMM
;

-- �ǽ�4) 
SELECT e.EMPNO
     , e.ENAME
     , e.COMM
  FROM emp e
 ORDER BY e.COMM DESC
;

-- �ǽ�5
SELECT e.EMPNO      ���
     , e.ENAME      �̸�
     , e.SAL        �޿�
     , e.HIREDATE   �Ի���
  FROM emp e
;  

-- �ǽ�6) 
SELECT *
  FROM emp e
;

SELECT e.EMPNO
     , e.ENAME
     , e.JOB
     , e.MGR
     , e.HIREDATE
     , e.SAL
     , e.COMM
     , e.DEPTNO
  FROM emp e
;

-- �ǽ�7) 
SELECT e.EMPNO
     , e.ENAME
     , e.JOB
     , e.MGR
     , e.HIREDATE
     , e.SAL
     , e.COMM
     , e.DEPTNO
  FROM emp e
 WHERE e.ENAME = 'ALLEN'
;

-- �ǽ�8)
SELECT e.EMPNO
     , e.ENAME
     , e.DEPTNO
  FROM emp e
 WHERE e.DEPTNO = 20
;

-- �ǽ�9)
SELECT e.EMPNO
     , e.ENAME
     , e.SAL
     , e.DEPTNO
  FROM emp e
 WHERE e.DEPTNO = 20
   AND e.SAL < 3000
;

-- �ǽ�10)
SELECT e.EMPNO ���
     , e.ENAME �̸�
     , e.SAL + e.COMM  "�޿� + Ŀ�̼�"
  FROM emp e
;

-- �ǽ�11)
SELECT e.EMPNO    ���
     , e.ENAME    �̸�
     , e.SAL * 12 ��޿�
  FROM emp e
;

-- �ǽ�12)
SELECT e.EMPNO ���
     , e.ENAME �̸�
     , e.JOB   ��å
     , e.SAL   �޿�
     , e.COMM  Ŀ�̼�
  FROM emp e
 WHERE e.ENAME = 'MARTIN' 
    OR e.ENAME = 'BLAKE'
;

-- �ǽ�13) 
SELECT e.EMPNO ���
     , e.ENAME �̸�
     , e.JOB   ��å
     , e.SAL + e.COMM "�޿� + Ŀ�̼�"
  FROM emp e
 WHERE e.ENAME = 'MARTIN'
    OR e.ENAME = 'BLAKE'
    
;
-- �ǽ�14)
SELECT e.EMPNO
     , e.ENAME
     , e.JOB
     , e.MGR
     , e.HIREDATE
     , e.SAL
     , e.COMM
     , e.DEPTNO
  FROM emp e
 WHERE e.COMM != 0
;

SELECT e.EMPNO
     , e.ENAME
     , e.JOB
     , e.MGR
     , e.HIREDATE
     , e.SAL
     , e.COMM
     , e.DEPTNO
  FROM emp e
 WHERE e.COMM > 0
;

SELECT e.EMPNO
     , e.ENAME
     , e.JOB
     , e.MGR
     , e.HIREDATE
     , e.SAL
     , e.COMM
     , e.DEPTNO
  FROM emp e
 WHERE e.COMM >= 1
;

-- �ǽ�15)
SELECT e.EMPNO
     , e.ENAME
     , e.JOB
     , e.MGR
     , e.HIREDATE
     , e.SAL
     , e.COMM
     , e.DEPTNO
  FROM emp e
 WHERE e.COMM != (null)
;
����� ��� �� : 0

-- �ǽ�16)
SELECT *
  FROM emp e
 WHERE e.DEPTNO = 20
   AND e.SAL > 2500
;
  
-- �ǽ�17)
SELECT *
  FROM emp e
 WHERE e.JOB = 'MANAGER'
    OR e.DEPTNO = 10
;
-- �ǽ�18)
SELECT *
  FROM emp e
 WHERE e.JOB IN ('MANAGER','CLERK','SALESMAN')
;
-- �ǽ�19)
SELECT *
  FROM emp e
 WHERE e.ENAME LIKE 'A%'
;
-- �ǽ�20)
SELECT *
  FROM emp e
 WHERE e.ENAME LIKE '%A%'
;
-- �ǽ�21)
SELECT *
  FROM emp e
 WHERE e.ENAME LIKE '%S'
;
-- �ǽ�22)
SELECT *
  FROM emp e
 WHERE e.ENAME LIKE '%E_'
;