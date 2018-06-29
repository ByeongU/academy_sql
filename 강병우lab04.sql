-- 실습 3)
SELECT e.ENAME "직원 이름"
     , nvl(e.MGR ||'', '없음') "관리자"
  FROM emp e
     , dept d
 WHERE e.DEPTNO = d.DEPTNO(+)
   AND e.MGR IS NULL
;

/*
직원 이름, 관리자
-------------
JJ	    없음
KING	없음
J_JUNE	없음
J	    없음
J%JUNES	없음			
*/

-- 실습 4)
SELECT e2.ENAME "직원 이름"
     , nvl(e1.EMPNO ||'', '없음') "부하 사번" 
     , nvl(e1.ENAME ||'', '없음') "부하 이름"
  FROM emp e1
     , emp e2
 WHERE e1.MGR(+) = e2.EMPNO
   AND e1.MGR IS NULL
;

/*
직원 이름, 부하 사번, 부하 이름
-------------------------------
J	     없음      	없음
TURNER	 없음	    없음
J%JUNES  없음	    없음
WARD	 없음	    없음
MARTIN   없음	    없음
JJ	     없음      	없음
ALLEN	 없음      	없음
MILLER	 없음      	없음
J_JUNE   없음      	없음
SMITH	 없음      	없음
JAMES	 없음      	없음
*/

-- 실습 5)
SELECT *
  FROM emp e
 WHERE e.JOB = (SELECT e.JOB
                  FROM emp e
                 WHERE e.ENAME = 'JAMES')
;

/*
EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO
--------------------------------------------------------------
7369	SMITH	CLERK	7902	80/12/17	800		    20
7900	JAMES	CLERK	7698	81/12/03	950		    30
7934	MILLER	CLERK	7782	82/01/23	1300		10
9999	J_JUNE	CLERK		    18/06/27	500		
8888	J	    CLERK		    18/06/27	400		
7777	J%JUNES	CLERK		    18/06/27	300		
*/

-- 실습 6)

-------------------------------DDL
-- 실습 1)
