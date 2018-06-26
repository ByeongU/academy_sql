-- 실습1)
SELECT e.EMPNO
     , e.ENAME
     , e.JOB
     , e.SAL
  FROM emp e
 ORDER BY e.SAL DESC
;

-- 실습2)
SELECT e.EMPNO
     , e.ENAME
     , e.HIREDATE
  FROM emp e
 ORDER BY e.HIREDATE
;

-- 실습3) 
SELECT e.EMPNO
     , e.ENAME
     , e.COMM
  FROM emp e
 ORDER BY e.COMM
;

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