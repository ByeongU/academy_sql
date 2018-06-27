-- 실습 23)
SELECT *
  FROM emp e
 WHERE e.SAL BETWEEN 2500 AND 3000
;

/*
7566	JONES	MANAGER	7839	81/04/02	2975		20
7698	BLAKE	MANAGER	7839	81/05/01	2850		30
7902	FORD	ANALYST	7566	81/12/03	3000		20
*/

-- 실습 24)
SELECT *
  FROM emp e
 WHERE e.COMM IS NULL
;

/*
7369	SMITH	CLERK	    7902	80/12/17	800	    	20
7566	JONES	MANAGER	    7839	81/04/02	2975		20
7698	BLAKE	MANAGER	    7839	81/05/01	2850		30
7782	CLARK	MANAGER	    7839	81/06/09	2450		10
7839	KING	PRESIDENT	    	81/11/17	5000		10
7900	JAMES	CLERK	    7698	81/12/03	950 		30
7902	FORD	ANALYST	    7566	81/12/03	3000		20
7934	MILLER	CLERK	    7782	82/01/23	1300		10
9999	J_JUNE	CLERK	        	18/06/27	500		
8888	J	    CLERK		        18/06/27	400		
7777	J%JUNES	CLERK	        	18/06/27	300		
*/  

-- 실습 25)
SELECT *
  FROM emp e
 WHERE e.COMM IS NOT NULL
;
/*
7499	ALLEN	SALESMAN	7698	81/02/20	1600	300	    30
7521	WARD	SALESMAN	7698	81/02/22	1250	500	    30
7654	MARTIN	SALESMAN	7698	81/09/28	1250	1400	30
7844	TURNER	SALESMAN	7698	81/09/08	1500	0	    30
*/  
-- 실습 26)
SELECT e.EMPNO "사번"
     , e.ENAME || '의 월급은 $' || e.SAL || ' 입니다' AS "월급여"
  FROM emp e
;

/*
사번, 월급여
7369	SMITH의 월급은 $800 입니다
7499	ALLEN의 월급은 $1600 입니다
7521	WARD의 월급은 $1250 입니다
7566	JONES의 월급은 $2975 입니다
7654	MARTIN의 월급은 $1250 입니다
7698	BLAKE의 월급은 $2850 입니다
7782	CLARK의 월급은 $2450 입니다
7839	KING의 월급은 $5000 입니다
7844	TURNER의 월급은 $1500 입니다
7900	JAMES의 월급은 $950 입니다
7902	FORD의 월급은 $3000 입니다
7934	MILLER의 월급은 $1300 입니다
9999	J_JUNE의 월급은 $500 입니다
8888	J의 월급은 $400 입니다
7777	J%JUNES의 월급은 $300 입니다
*/

--------------------함수 실습

-- 실습 1)
SELECT INITCAP('ward') 
  FROM dual
; 

/*
Ward
*/

-- 실습 2)
SELECT LOWER('WARD') 
  FROM dual
; 

/*
ward
*/

-- 실습 3)
SELECT UPPER('ward') 
  FROM dual
; 

/*
WARD
*/

-- 실습 4)
SELECT LENGTH('korea')
  FROM dual
;

SELECT LENGTHB('korea')
  FROM dual
;

/*
5
*/

-- 실습 5)
SELECT LENGTH('강병우')
  FROM dual
;

/*
3
*/

SELECT LENGTHB('강병우')
  FROM dual
;

/*
9
*/

-- 실습 6)
SELECT CONCAT('SQL', '배우기')
  FROM dual
;

/*
SQL배우기
*/

-- 실습 7)
SELECT SUBSTR('SQL 배우기', 5, 2)
  FROM dual
;

/*
배우
*/

-- 실습 8)
SELECT LPAD('SQL', 7, '$') 
  FROM dual
;

/*
$$$$SQL
*/

-- 실습 9)
SELECT RPAD('SQL', 7, '$') 
  FROM dual
;

/*
SQL$$$$
*/

-- 실습 10)
SELECT LTRIM('        sql 배우기  ')
  FROM dual
;

/*
sql 배우기  
*/

-- 실습 11)
SELECT RTRIM('        sql 배우기  ')
  FROM dual
;

/*
        sql 배우기
*/

-- 실습 12)
SELECT TRIM('        sql 배우기  ')
  FROM dual
;

/*
sql 배우기
*/

-- 실습 13)
SELECT nvl(e.COMM, '0') 
  FROM emp e
;

/*
0
300
500
0
1400
0
0
0
0
0
0
0
0
0
0
*/

-- 실습 14
SELECT nvl2(e.SAL + e.COMM,'급여 + 커미션', '0')
  FROM emp e
;

/*
0
급여 + 커미션
급여 + 커미션
0
급여 + 커미션
0
0
0
급여 + 커미션
0
0
0
0
0
0
*/

-- 실습 15)
SELECT e.EMPNO "사번"
     , e.ENAME "이름"
     , e.SAL   "월 급여"
     , TO_CHAR (DECODE(e.JOB, 'CLERK' ,300
                   , 'SALESMAN', 450
                   , 'MANAGER', 600
                   , 'ANALYST', 800
                   , 'PRESIDENT', 1000),'$9,999') " 자기개발비"
  FROM emp e
;

/*
사번, 이름, 월 급여,  자기개발비
--------------------------------
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
7777	J%JUNES	300	       $300
*/