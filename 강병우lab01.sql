-- 실습1)
SELECT e.EMPNO
     , e.ENAME
     , e.JOB
     , e.SAL
  FROM emp e
 ORDER BY e.SAL DESC
;

/*
7839	KING	PRESIDENT	5000
7902	FORD	ANALYST	3000
7566	JONES	MANAGER	2975
7698	BLAKE	MANAGER	2850
7782	CLARK	MANAGER	2450
7499	ALLEN	SALESMAN	1600
7844	TURNER	SALESMAN	1500
7934	MILLER	CLERK	1300
7654	MARTIN	SALESMAN	1250
7521	WARD	SALESMAN	1250
7900	JAMES	CLERK	950
7369	SMITH	CLERK	800
*/

-- 실습2)
SELECT e.EMPNO
     , e.ENAME
     , e.HIREDATE
  FROM emp e
 ORDER BY e.HIREDATE
;

/*
7369	SMITH	80/12/17
7499	ALLEN	81/02/20
7521	WARD	81/02/22
7566	JONES	81/04/02
7698	BLAKE	81/05/01
7782	CLARK	81/06/09
7844	TURNER	81/09/08
7654	MARTIN	81/09/28
7839	KING	81/11/17
7900	JAMES	81/12/03
7902	FORD	81/12/03
7934	MILLER	82/01/23
*/

-- 실습3) 
SELECT e.EMPNO
     , e.ENAME
     , e.COMM
  FROM emp e
 ORDER BY e.COMM
;

/*
7844	TURNER	0
7499	ALLEN	300
7521	WARD	500
7654	MARTIN	1400
7839	KING	
7900	JAMES	
7902	FORD	
7782	CLARK	
7934	MILLER	
7566	JONES	
7369	SMITH	
7698	BLAKE	
*/
-- 실습4) 
SELECT e.EMPNO
     , e.ENAME
     , e.COMM
  FROM emp e
 ORDER BY e.COMM DESC
;

-- 실습5
SELECT e.EMPNO      사번
     , e.ENAME      이름
     , e.SAL        급여
     , e.HIREDATE   입사일
  FROM emp e
;  

/*
7369	SMITH	800	80/12/17
7499	ALLEN	1600	81/02/20
7521	WARD	1250	81/02/22
7566	JONES	2975	81/04/02
7654	MARTIN	1250	81/09/28
7698	BLAKE	2850	81/05/01
7782	CLARK	2450	81/06/09
7839	KING	5000	81/11/17
7844	TURNER	1500	81/09/08
7900	JAMES	950	81/12/03
7902	FORD	3000	81/12/03
7934	MILLER	1300	82/01/23
*/

-- 실습6) 
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

/*
7369	SMITH	CLERK	    7902	80/12/17	800		20
7499	ALLEN	SALESMAN	7698	81/02/20	1600	300 	30
7521	WARD	SALESMAN	7698	81/02/22	1250	500 	30
7566	JONES	MANAGER	    7839	81/04/02	2975		    20
7654	MARTIN	SALESMAN	7698	81/09/28	1250	1400	30
7698	BLAKE	MANAGER 	7839	81/05/01	2850		    30
7782	CLARK	MANAGER	    7839	81/06/09	2450		    10
7839	KING	PRESIDENT	    	81/11/17	5000	    	10
7844	TURNER	SALESMAN	7698	81/09/08	1500	   0	30
7900	JAMES	CLERK	    7698	81/12/03	950		        30
7902	FORD	ANALYST	    7566	81/12/03	3000	    	20
7934	MILLER	CLERK	    7782	82/01/23	1300	    	10
*/
-- 실습7) 
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

-- 실습8)
SELECT e.EMPNO
     , e.ENAME
     , e.DEPTNO
  FROM emp e
 WHERE e.DEPTNO = 20
;

-- 실습9)
SELECT e.EMPNO
     , e.ENAME
     , e.SAL
     , e.DEPTNO
  FROM emp e
 WHERE e.DEPTNO = 20
   AND e.SAL < 3000
;

-- 실습10)
SELECT e.EMPNO 사번
     , e.ENAME 이름
     , e.SAL + e.COMM  "급여 + 커미션"
  FROM emp e
;

-- 실습11)
SELECT e.EMPNO    사번
     , e.ENAME    이름
     , e.SAL * 12 년급여
  FROM emp e
;

-- 실습12)
SELECT e.EMPNO 사번
     , e.ENAME 이름
     , e.JOB   직책
     , e.SAL   급여
     , e.COMM  커미션
  FROM emp e
 WHERE e.ENAME = 'MARTIN' 
    OR e.ENAME = 'BLAKE'
;

-- 실습13) 
SELECT e.EMPNO 사번
     , e.ENAME 이름
     , e.JOB   직책
     , e.SAL + e.COMM "급여 + 커미션"
  FROM emp e
 WHERE e.ENAME = 'MARTIN'
    OR e.ENAME = 'BLAKE'
    
;
-- 실습14)
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

-- 실습15)
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
인출된 모든 행 : 0

-- 실습16)
SELECT *
  FROM emp e
 WHERE e.DEPTNO = 20
   AND e.SAL > 2500
;
  
-- 실습17)
SELECT *
  FROM emp e
 WHERE e.JOB = 'MANAGER'
    OR e.DEPTNO = 10
;
-- 실습18)
SELECT *
  FROM emp e
 WHERE e.JOB IN ('MANAGER','CLERK','SALESMAN')
;
-- 실습19)
SELECT *
  FROM emp e
 WHERE e.ENAME LIKE 'A%'
;
-- 실습20)
SELECT *
  FROM emp e
 WHERE e.ENAME LIKE '%A%'
;
-- 실습21)
SELECT *
  FROM emp e
 WHERE e.ENAME LIKE '%S'
;
-- 실습22)
SELECT *
  FROM emp e
 WHERE e.ENAME LIKE '%E_'
;