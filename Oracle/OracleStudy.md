1. 데이터 기본 출력

   (1) 각 테이블의 구조를 출력한다.
    
     -desc emp;
   
   (2) 각 테이블의 전체 데이터를 출력한다.
    
    -select * from emp;
   
   (3) 10번 부서에서 근무하는 사원들을 출력한다.
    
    -select * from emp where deptno=10;
   
   (4) 급여가 1500 이상인 직원들을 출력한다.
    
    -select * from emp where sal >= 1500;
    
    -select * from emp where sal > 1500 or sal = 1500;
   
   (5) 급여가 1500인 경우 어떤 등급에 속하는지 출력한다. - 급여 등급테이블 조회 -
    
    -select * from salgrade where losal <= 1500 and hisal >= 1500;
   
   (6) 사원테이블에서 매니저 값이 NULL로 되어있는 사원을 출력한다.
    
    -select * from emp where mgr is null;
   
   (7) 사원이름을 출력하는데 앞 2자리만 노출하고 나머지는 * 처리를 한다. 예)AD***
    
    -select ename from emp;
    
    -select substr(ename,1,2)||'**'   from emp;
    
    -select rpad('ab',7,'*') from dual;
    
    -select rpad( substr(ename,1,2),length(ename),'*' ) from emp;
    
    -select rownum,empno,ename,sal from emp where rownum<=5

※ 사원 테이블에 행번호 붙여 출력한다.

      - rownum :  쿼리 내에서 사용하는 가상컬럼, 행번호 컬럼

 

2. 자주쓰이는 함수 적용

(1) 최고/최저 급여 출력하기

   - select max(sal) from emp;

   - select min(sal) from emp;

(2) 급여합계/급여평균 출력하기

   - select sum(sal) from emp;

   - select avg(sal) from emp;

(3) 반올림으로 출력 - 급여평균

   - select round(avg(sal)) from emp;  -- 정수표현

   - select round(avg(sal),2) from emp;  -- 소수점 2자리까지 표현(마지막은 반올림)

(4) 올림함수/내림함수 적용하여 출력

   - select ceil(avg(sal)) from emp;

   - select floor(avg(sal)) from emp;

(5) 커미션 필드 데이터들을 이용하여 합계와 평균을 출력한다.

   - select sum(comm) from emp;  -- null 값을 제외한 합계 (null값을 제외하여 연산)

   - select avg(comm) from emp;  -- null 값을 제외한 평균 (null값을 제외하여 연산)

(6) 전체 사원 수 출력하기

   - select count(*) from emp;

(7) 업무 종류 출력하기 

   - select  distinct(job) from emp;

 

(풀어보기)

1. 10번부서에 근무하는 직원들 중 최고 급여를 출력한다.

    select max(sal) from emp where deptno=10;

2. 급여 기준 1000 ~ 2000 사이의 데이터를 출력한다.
    select * from emp where sal>=1000 and sal<=2000;
    select * from emp where sal between 1000 and 2000;

3. 부서번호로 10번과 20번에 해당하는 데이터를 출력한다.

    select * from emp where deptno=10 or deptno=20;
    select * from emp where deptno in(10,20);

4. 사원번호 7566이 메니저로써 관리하고 있는 사원은 몇명인가?
    
    select count(*) from emp where mgr='7839';

5. ANALYS로 일하는 사원의 수는 몇명인가?
    
    SELECT * FROM emp WHERE upper(job)=upper('Salesman');

6. 사원명,입사일(년/월/일) 출력
    
    select ename,to_char(hiredate,'yyyy-mm-dd') from emp;

7. 사원명,입사일(년-월-일) 출력   (조건:2000년 이후에 입사한 직원)

 select ename,hiredate from emp where to_char(hiredate,'yyyy') >= 2000;

※ 연결 연산자 ( || ) - 파이프 2개

(1) select ename || ',' || job as 사원별업무 from emp;

(2) select ename || ',' || job as 사원별업무 from emp where rownum < 10 ;

 

3.  IN함수

(1) 부서번호가 10 또는 20으로 되어있는 사원명,부서번호 출력   -- OR 연산자

   (A) 일반 조건 

   - SELECT ename,deptno FROM emp WHERE deptno=10 OR deptno=20;

   (B) IN() 함수 사용

   - SELECT ename,deptno FROM emp WHERE deptno  IN(10,20);

 


 

4. BETWEEN 연산자

(1) 부서번호,사원명 출력(조건:부서번호가 10 ~ 20)

   (A) 일반 조건 

   - select  deptno,ename from emp where  deptno >= 10 and deptno<=20;

   (B) BETWEEN 연산자 사용

   - select  deptno,ename from emp where  deptno between  10 and 20; 

 

(풀어보기) 

   사원명, 급여, 부서번호 출력 (조건: 급여 1000~1500)

    select ename,sal,deptno from emp where sal>=1000 and sal<=1500;
    select ename,sal,deptno from emp where sal between 1000 and 1500;
