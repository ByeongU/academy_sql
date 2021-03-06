--1. employees 테이블에서 job_id 를 중복 배제하여 조회 하고
--   job_title 같이 출력
--19건
SELECT DISTINCT(e.JOB_ID)
     , j.JOB_TITLE
  FROM employees e
     , jobs j
 WHERE e.JOB_ID = j.JOB_ID
;

--2. employees 테이블에서 사번, 라스트네임, 급여, 커미션 팩터,
--   급여x커미션팩터(null 처리) 조회
--   커미션 컬럼에 대해 null 값이면 0으로 처리하도록 함
--107건
SELECT e.EMPLOYEE_ID "사번"
     , e.LAST_NAME   "라스트 네임"
     , e.SALARY      "급여"
     , nvl(e.COMMISSION_PCT, '0') "커미션 팩터"
     , nvl(e.SALARY * e.COMMISSION_PCT, '0') "급여x커미션팩터"
  FROM employees e
; 
 
 
--3. employees 테이블에서 사번, 라스트네임, 급여, 커미션 팩터(null 값 처리) 조회
--   단, 2007년 이 후 입사자에 대하여 조회, 고용년도 순 오름차순 정렬
--30건
SELECT e.EMPLOYEE_ID "사번"
     , e.LAST_NAME   "라스트 네임"
     , e.SALARY      "급여"
     , nvl(e.COMMISSION_PCT, '0') "커미션 팩터"
       FROM employees e
 WHERE TO_CHAR(e.HIRE_DATE, 'YYYY') >= 2007
 ORDER BY e.HIRE_DATE
; 
--4. Finance 부서에 소속된 직원의 목록 조회
--조인으로 해결
SELECT e.FIRST_NAME
     , e.LAST_NAME
     , d.DEPARTMENT_NAME
  FROM employees e
     , departments d 
 WHERE e.DEPARTMENT_ID = d.DEPARTMENT_ID
   AND d.DEPARTMENT_NAME = 'Finance'
;


--서브쿼리로 해결
SELECT e.FIRST_NAME
     , e.LAST_NAME
  FROM employees e
 WHERE e.DEPARTMENT_ID = (SELECT d.DEPARTMENT_ID
                            FROM departments d
                           WHERE d.DEPARTMENT_NAME = 'Finance')
;
  

--6건
 
--5. Steven King 의 직속 부하직원의 모든 정보를 조회
--14건
-- 조인 이용
<<<<<<< HEAD
SELECT e.*
=======
SELECT *
>>>>>>> a54e888cf26f7c0df4251a19598cef57637682d9
  FROM employees e
     , DEPARTMENTS d
 WHERE e.DEPARTMENT_ID = d.DEPARTMENT_ID
   AND e.MANAGER_ID = 100
;

-- 서브쿼리 이용
<<<<<<< HEAD
SELECT e.*
  FROM employees e
 WHERE e.MANAGER_ID = (SELECT d.MANAGER_ID
                         FROM DEPARTMENTS d
                        WHERE d.MANAGER_ID = 100)
;
--6. Steven King의 직속 부하직원 중에서 Commission_pct 값이 null이 아닌 직원 목록
--5건
SELECT e.*
  FROM employees e
 WHERE e.MANAGER_ID = 100
   AND e.COMMISSION_PCT IS NOT NULL
;

--7. 각 job 별 최대급여를 구하여 출력 job_id, job_title, job별 최대급여 조회
--19건
SELECT e.JOB_ID
     , j.JOB_TITLE
     , MAX(e.SALARY) "최대 급여"
  FROM employees e
     , jobs j
 WHERE e.JOB_ID = j.JOB_ID
 GROUP BY e.JOB_ID, j.JOB_TITLE
;
=======
 
--6. Steven King의 직속 부하직원 중에서 Commission_pct 값이 null이 아닌 직원 목록
--5건

--7. 각 job 별 최대급여를 구하여 출력 job_id, job_title, job별 최대급여 조회
--19건

>>>>>>> a54e888cf26f7c0df4251a19598cef57637682d9

 
--8. 각 Job 별 최대급여를 받는 사람의 정보를 출력,
--  급여가 높은 순서로 출력
----서브쿼리 이용
<<<<<<< HEAD

=======
 
>>>>>>> a54e888cf26f7c0df4251a19598cef57637682d9
----join 이용


--20건

--9. 7번 출력시 job_id 대신 Job_name, manager_id 대신 Manager의 last_name, department_id 대신 department_name 으로 출력
--20건


--10. 전체 직원의 급여 평균을 구하여 출력


--11. 전체 직원의 급여 평균보다 높은 급여를 받는 사람의 목록 출력. 급여 오름차순 정렬
--51건

--12. 각 부서별 평균 급여를 구하여 출력
--12건

--13. 12번의 결과에 department_name 같이 출력
--12건


--14. employees 테이블이 각 job_id 별 인원수와 job_title을 같이 출력하고 job_id 오름차순 정렬
-- 19건

--15. employees 테이블의 job_id별 최저급여,
--   최대급여를 job_title과 함께 출력 job_id 알파벳순 오름차순 정렬
-- 19건

 
--16. Employees 테이블에서 인원수가 가장 많은 job_id를 구하고
--   해당 job_id 의 job_title 과 그 때 직원의 인원수를 같이 출력




--17.사번,last_name, 급여, 직책이름(job_title), 부서명(department_name), 부서매니저이름
--  부서 위치 도시(city), 나라(country_name), 지역(region_name) 을 출력
----------- 부서가 배정되지 않은 인원 고려 ------
-- 107건

--18.부서 아이디, 부서명, 부서에 속한 인원숫자를 출력
-- 27건


--19.인원이 가장 많은 상위 다섯 부서아이디, 부서명, 인원수 목록 출력
-- 5건

 
--20. 부서별, 직책별 평균 급여를 구하여라.
--   부서이름, 직책이름, 평균급여 소수점 둘째자리에서 반올림으로 구하여라.
-- 19건


--21.각 부서의 정보를 부서매니저 이름과 함께 출력(부서는 모두 출력되어야 함)
-- 27건

 
--22. 부서가 가장 많은 도시이름을 출력



--23. 부서가 없는 도시 목록 출력
-- 16건
--조인사용

--집합연산 사용

--서브쿼리 사용

  
--24.평균 급여가 가장 높은 부서명을 출력



--25. Finance 부서의 평균 급여보다 높은 급여를 받는 직원의 목록 출력
-- 28건

-- 26. 각 부서별 인원수를 출력하되, 인원이 없는 부서는 0으로 나와야 하며
--     부서는 정식 명칭으로 출력하고 인원이 많은 순서로 정렬.
-- 27건


--27. 지역별 등록된 나라의 갯수 출력(지역이름, 등록된 나라의 갯수)
-- 4건


 
--28. 가장 많은 나라가 등록된 지역명 출력
-- 1건