-- sql day 01
-- 1. SCOTT 계정 활성화 : SYS 계정으로 접속하여 스크립트 실행
@C:\oraclexe\app\oracle\product\11.2.0\server\rdbms\admin\scott.sql
-- 2. 접속 유저 확인 명령
show user
-- 3. HR 계정 활성화 : sys 계정으로 접속하여
--                    다른 사용자 확장 후 HR 계정의
--                    계정잠김, 비밀번호 만료 상태 해제
---------------------------------------------------------------------
-- (1) EMP 테이블 내용 조회
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
-- (2) DEPT 테이블 내용 조회
SELECT *
  FROM DEPT
;

/*----------------------
10	ACCOUNTING	NEW YORK
20	RESEARCH	DALLAS
30	SALES	    CHICAGO
40	OPERATIONS	BOSTON
------------------------ */

-- (3) SALGRADE 테이블 내용 조회
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
SELECT 문   
5 SELECT [PREDICATE]                    적용된 값들중 필요 컬럼 선택 
1   FROM table1,table2                  대상 테이블에서 검색 시작
2  WHERE 조건                            조건에 맞는 행 선택
3  GROUP BY col1,coln[, ...]            지정 컬럼으로 그룹화
4 HAVING 조건                            그룹화 결과에 조건 적용
6  ORDER BY col1,[, ...] [ASC|DESC]     선택된 컬럼 정렬
------------------------------------*/

-- 01.DQL : SELECT
-- (1) SELECT 구문
-- emp 테이블에서 사번, 이름, 직무를 조회
SELECT e.EMPNO
     , e.ENAME
     , e.JOB
  FROM emp e --소문자 e는 alias(별칭)
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

-- emp 테이블에서 직무만 조회
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

-- (2) DISTINCT 문 : SELECT 문 사용시 중복을 배제하여 조회
-- emp 테이블에서 JOB 컬럼의 중복을 배제하여 조회
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

-- * SQL SELECT 구문의 작동 원리 : 테이블의 한 행을 기본 단위로 실행함.
--                               테이블 행의 개수만큼 반복 실핼.
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

-- emp 테이블에서 job, deptno 에 대해 중복을 제거하여 조회
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

-- (3) ORDER BY 절 : 정렬 (Ascending,Descending)
-- 5) emp 테이블에서 JOB 을 중복을 배제하여 조회하고 오름차순으로 정렬
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

-- 6) emp 테이블에서 job 을 중복을 배제하여 조회하고 내림차순으로 정렬
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

-- 7) emp 테이블에서 comm 을 가장 많이 받는 순서대로 출력
--    사번, 이름, 직무, 입사일, 커미션 순으로 조회
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

-- 8) emp 테이블에서 comm 이 적은 순서대로, 직무별 오름차순, 이름별 오름차순으로 정렬
--    사번, 이름, 직무, 입사일, 커미션을 조회
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

-- 9) emp 테이블에서 comm이 적은 순서대로, 직무별 오름차순, 이름별 내림차순으로 정렬
--    사번, 이름, 직무, 입사일, 커미션을 조회
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

