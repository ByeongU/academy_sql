실습 16)
SELECT e.EMPNO "사번"
     , e.ENAME "이름"
     , e.SAL   "월 급여"
     , TO_CHAR (CASE e.JOB WHEN 'CLERK'     THEN    300
                           WHEN 'SALESMAN'  THEN    450
                           WHEN 'MANAGER'   THEN    600
                           WHEN 'ANALYST'   THEN    800
                           WHEN 'PRESIDENT' THEN    1000
                END,'$9,999') AS " 자기개발비"
  FROM emp e        
;

/*
사번, 이름, 월 급여,  자기개발비
----------------------------------
6666	JJ	    2800	
7369	SMITH	800	       $300
7499	ALLEN	1600	   $450
7521	WARD	1250	   $450
7566	JONES	2975	   $600
7654	MARTIN	1250	   $450
7698	BLAKE	2850	   $600
7782	CLARK	2450	   $600
7839	KING	5000	 $1,000
7844	TURNER	1500	   $450
7900	JAMES	950	       $300
7902	FORD	3000	   $800
7934	MILLER	1300	   $300
9999	J_JUNE	500	       $300
8888	J   	400	       $300
*/
실습 17)
SELECT e.EMPNO "사번"
     , e.ENAME "이름"
     , e.SAL   "월 급여"
     , TO_CHAR (CASE WHEN e.JOB = 'CLERK'     THEN    300
                     WHEN e.JOB = 'SALESMAN'  THEN    450
                     WHEN e.JOB = 'MANAGER'   THEN    600
                     WHEN e.JOB = 'ANALYST'   THEN    800
                     WHEN e.JOB = 'PRESIDENT' THEN    1000
                END,'$9,999') AS " 자기개발비"
  FROM emp e        
;

/*
사번, 이름, 월 급여,  자기개발비
6666	JJ	    2800	
7369	SMITH	800	       $300
7499	ALLEN	1600	   $450
7521	WARD	1250	   $450
7566	JONES	2975	   $600
7654	MARTIN	1250	   $450
7698	BLAKE	2850	   $600
7782	CLARK	2450	   $600
7839	KING	5000	 $1,000
7844	TURNER	1500	   $450
7900	JAMES	950	       $300
7902	FORD	3000	   $800
7934	MILLER	1300	   $300
9999	J_JUNE	500	       $300
8888	J	    400	       $300
*/

-- 실습 18)
SELECT COUNT(*)
  FROM emp e
;

/*
16
*/

-- 실습 19)
SELECT COUNT(DISTINCT e.JOB)
    FROM emp e
;

/*
5
*/

-- 실습 20)
SELECT COUNT(e.COMM) as "커미션 받는 사원"
  FROM emp e
;

/*
4
*/

-- 실습 21)
SELECT SUM(e.SAL) as "전 직원의 급여 합"
  FROM emp e
;

/*
28925
*/

-- 실습 22)
SELECT AVG(e.SAL) as "전 직원의 급여 평균"
  FROM emp e
;

/*
1807.8125
*/

-- 실습 23)
SELECT TO_CHAR(SUM(e.SAL), '$9,999.99') as " 급여의 총합"
     , TO_CHAR(AVG(e.SAL), '$9,999.99') as " 급여의 평균"
     , TO_CHAR(MAX(e.SAL), '$9,999.99') as " 최대 급여"
     , TO_CHAR(MIN(e.SAL), '$9,999.99') as " 최소 급여"
  FROM emp e
 WHERE e.DEPTNO = '20'
;

/*
 급여의 총합,  급여의 평균,  최대 급여,  최소 급여
-------------------------------------------------------------------
 $6,775.00	 $2,258.33	 $3,000.00	  $800.00
*/

-- 실습 24)
SELECT TO_CHAR(STDDEV(e.SAL), '9,999,99') as "급여의 표준 편차"
     , TO_CHAR(VARIANCE(e.SAL), '9,999,999.99') as "급여 분산"
  FROM emp e
;

/*
급여의 표준 편차, 급여 분산
    12,70	 1,612,809.90
*/

-- 실습 25)
SELECT TO_CHAR(STDDEV(e.SAL), '$9,999.99') as "급여의 표준 편차"
     , TO_CHAR(VARIANCE(e.SAL), '$9,999,999.99') as "급여 분산"
  FROM emp e
 WHERE e.JOB = 'SALESMAN'
;

/*
급여의 표준 편차, 급여 분산
   $177.95	    $31,666.67
*/

-- 실습 26)
SELECT nvl(e.DEPTNO ||'', '미배정') "부서 번호" 
     , SUM(DECODE(e.JOB, 'CLERK',       300
                       , 'SALESMAN',    450
                       , 'MANAGER',     600
                       , 'ANALYST',     800
                       , 'PRESIDENT',   1000)) AS "자기개발비"
  FROM emp e 
 GROUP BY e.DEPTNO
 ORDER BY "부서 번호"
;

/*
부서 번호, 자기개발비
-------------------
10	    1900
20	    1700
30	    2700
미배정	900
*/

-- 실습 27)
SELECT nvl(e.DEPTNO ||'', '미배정')                            "부서 번호" 
     , nvl(e.JOB ||'', '미배정')                               "직무"
     , nvl(SUM(DECODE(e.JOB, 'CLERK',   300
                       , 'SALESMAN',    450
                       , 'MANAGER',     600
                       , 'ANALYST',     800
                       , 'PRESIDENT',   1000))||'', '없음') AS "자기개발비"
  FROM emp e
 GROUP BY e.DEPTNO, e.JOB
;

/*
부서 번호, 직무, 자기개발비
------------------------------------------------
미배정	미배정	    없음
20	    CLERK	    300
30	    SALESMAN	1800
20	    MANAGER	    600
30	    CLERK	    300
10  	PRESIDENT	1000
미배정	CLERK	    900
30	    MANAGER 	600
10	    CLERK	    300
10  	MANAGER 	600
20	    ANALYST	    800
*/

-------------------------------------------------- 조인과 서브쿼리

-- 실습 1)
SELECT *
 FROM emp e NATURAL JOIN dept d
;

/*
DEPTNO, EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DNAME, LOC
-----------------------------------------------------------------------------------------
20	7369	SMITH	CLERK	    7902	80/12/17	800		        RESEARCH	DALLAS
30	7499	ALLEN	SALESMAN	7698	81/02/20	1600	300 	SALES	    CHICAGO
30	7521	WARD	SALESMAN	7698	81/02/22	1250	500 	SALES   	CHICAGO
20	7566	JONES	MANAGER 	7839	81/04/02	2975		    RESEARCH	DALLAS
30	7654	MARTIN	SALESMAN	7698	81/09/28	1250	1400	SALES   	CHICAGO
30	7698	BLAKE	MANAGER	    7839	81/05/01	2850	    	SALES   	CHICAGO
10	7782	CLARK	MANAGER	    7839	81/06/09	2450	    	ACCOUNTING	NEW YORK
10	7839	KING	PRESIDENT		    81/11/17	5000	    	ACCOUNTING	NEW YORK
30	7844	TURNER	SALESMAN	7698	81/09/08	1500	0	    SALES   	CHICAGO
30	7900	JAMES	CLERK	    7698	81/12/03	950		        SALES   	CHICAGO
20	7902	FORD	ANALYST	    7566	81/12/03	3000	    	RESEARCH	DALLAS
10	7934	MILLER	CLERK	    7782	82/01/23	1300		    ACCOUNTING	NEW YORK
*/  

-- 실습 2)
SELECT *
  FROM emp e JOIN dept d USING (DEPTNO)
;

/*
DEPTNO, EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DNAME, LOC
---------------------------------------------------------------------------------------------
20	7369	SMITH	CLERK	    7902	80/12/17	800		        RESEARCH	DALLAS
30	7499	ALLEN	SALESMAN	7698	81/02/20	1600	300	    SALES	    CHICAGO
30	7521	WARD	SALESMAN	7698	81/02/22	1250	500	    SALES	    CHICAGO
20	7566	JONES	MANAGER 	7839	81/04/02	2975		    RESEARCH	DALLAS
30	7654	MARTIN	SALESMAN	7698	81/09/28	1250	1400	SALES	    CHICAGO
30	7698	BLAKE	MANAGER 	7839	81/05/01	2850		    SALES	    CHICAGO
10	7782	CLARK	MANAGER 	7839	81/06/09	2450		    ACCOUNTING	NEW YORK
10	7839	KING	PRESIDENT		    81/11/17	5000		    ACCOUNTING	NEW YORK
30	7844	TURNER	SALESMAN	7698	81/09/08	1500	0   	SALES	    CHICAGO
30	7900	JAMES	CLERK	    7698	81/12/03	950		        SALES	    CHICAGO
20	7902	FORD	ANALYST 	7566	81/12/03	3000	    	RESEARCH	DALLAS
10	7934	MILLER	CLERK	    7782	82/01/23	1300	    	ACCOUNTING	NEW YORK
*/