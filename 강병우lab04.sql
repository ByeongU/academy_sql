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
SELECT e.EMPNO "사번"
     , e.ENAME "이름"
     , nvl((SELECT e1.ENAME
              FROM emp e1
             WHERE e1.EMPNO = e.MGR), '상사 없음')  "상사 이름"
  FROM emp e   
;

/*
사번,   이름,  상사 이름
------------------------
6666	JJ	    상사 없음
7369	SMITH	FORD
7499	ALLEN	BLAKE
7521	WARD	BLAKE
7566	JONES	KING
7654	MARTIN	BLAKE
7698	BLAKE	KING
7782	CLARK	KING
7839	KING	상사 없음
7844	TURNER	BLAKE
7900	JAMES	BLAKE
7902	FORD	JONES
7934	MILLER	CLARK
9999	J_JUNE	상사 없음
8888	J	    상사 없음
7777	J%JUNES	상사 없음
*/
-- 실습 7)
SELECT e.EMPNO
     , e.ENAME
     , e.JOB
     , e.SAL
     , nvl((SELECT d.DNAME
              FROM dept d
             WHERE d.DEPTNO = e.DEPTNO), '미배정') "DNAME"
     , nvl((SELECT d.LOC
              FROM dept d
             WHERE d.DEPTNO = e.DEPTNO), '미배정') "LOC"
  FROM emp e
;

/*
EMPNO,  ENAME,  JOB,        SAL,    DNAME,      LOC
-------------------------------------------------------
6666	JJ		2800	            미배정	    미배정
7369	SMITH	CLERK	    800	    RESEARCH	DALLAS
7499	ALLEN	SALESMAN	1600	SALES   	CHICAGO
7521	WARD	SALESMAN	1250	SALES	    CHICAGO
7566	JONES	MANAGER	    2975	RESEARCH	DALLAS
7654	MARTIN	SALESMAN	1250	SALES	    CHICAGO
7698	BLAKE	MANAGER 	2850	SALES	    CHICAGO
7782	CLARK	MANAGER 	2450	ACCOUNTING	NEW YORK
7839	KING	PRESIDENT	5000	ACCOUNTING	NEW YORK
7844	TURNER	SALESMAN	1500	SALES	    CHICAGO
7900	JAMES	CLERK	    950	    SALES	    CHICAGO
7902	FORD	ANALYST 	3000	RESEARCH	DALLAS
7934	MILLER	CLERK	    1300	ACCOUNTING	NEW YORK
9999	J_JUNE	CLERK	    500 	미배정	    미배정
8888	J	    CLERK	    400 	미배정	    미배정
7777	J%JUNES	CLERK	    300	    미배정	    미배정
*/
-------------------------------DDL
-- 실습 1)
CREATE TABLE CUSTOMER
(  userid    VARCHAR2(4)  PRIMARY KEY
 , name      VARCHAR2(30) NOT NULL
 , birthyear NUMBER(4)  
 , regdate   DATE         DEFAULT sysdate
 , address   VARCHAR2(30)
);

/*
Table CUSTOMER이(가) 생성되었습니다.
*/

-- 실습 2)
DESC CUSTOMER;

/*
이름        널?       유형           
--------- -------- ------------ 
USERID    NOT NULL VARCHAR2(4)  
NAME      NOT NULL VARCHAR2(30) 
BIRTHYEAR          NUMBER(4)    
REGDATE            DATE         
ADDRESS            VARCHAR2(30) 
*/

-- 실습 3)
CREATE TABLE NEW_CUST
AS
SELECT *
  FROM CUSTOMER
 WHERE 1 = 2 
;

/*
Table NEW_CUST이(가) 생성되었습니다
*/

-- 실습 4)
DESC NEW_CUST

/*
이름        널?       유형           
--------- -------- ------------ 
USERID             VARCHAR2(4)  
NAME      NOT NULL VARCHAR2(30) 
BIRTHYEAR          NUMBER(4)    
REGDATE            DATE         
ADDRESS            VARCHAR2(30) 
*/

-- 실습 5)
CREATE TABLE salesman
AS
SELECT *
  FROM emp e
 WHERE e.JOB = 'SALESMAN'
;

/*
Table SALESMAN이(가) 생성되었습니다.
*/

-- 실습 6)
SELECT s.*
  FROM SALESMAN s
;
/*
EMPNO,  ENAME,  JOB,        MGR,    HIREDATE,   SAL,    COMM,   DEPTNO
------------------------------------------------------------------
7499	ALLEN	SALESMAN	7698	81/02/20	1600	300 	30
7521	WARD	SALESMAN	7698	81/02/22	1250	500	    30
7654	MARTIN	SALESMAN	7698	81/09/28	1250	1400	30
7844	TURNER	SALESMAN	7698	81/09/08	1500	0	    30
*/

-- 실습 7)
ALTER TABLE CUSTOMER ADD
(  phone   VARCHAR2(11)
 , grade   VARCHAR2(30)    CHECK (grade IN ('VIP', 'GOLD', 'SILVER'))
);

/*
Table CUSTOMER이(가) 변경되었습니다.
*/

-- 실습 8)
ALTER TABLE CUSTOMER DROP COLUMN grade;
-- Table CUSTOMER이(가) 변경되었습니다.

ALTER TABLE CUSTOMER ADD
( grade   VARCHAR2(30)    CHECK (grade IN ('VIP', 'GOLD', 'SILVER'))
);
-- Table CUSTOMER이(가) 변경되었습니다.

-- 실습 9)
ALTER TABLE CUSTOMER MODIFY phone VARCHAR2(4);
-- Table CUSTOMER이(가) 변경되었습니다.
ALTER TABLE CUSTOMER MODIFY userid NUMBER(4);
-- Table CUSTOMER이(가) 변경되었습니다.
ALTER TABLE CUSTOMER MODIFY userid VARCHAR2(30);
-- Table CUSTOMER이(가) 변경되었습니다.
