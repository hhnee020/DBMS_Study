
>ROWNUM이란?

  - 오라클에서 제공을 해주는 내장 컬럼으로  WHERE 절 까지의 행번호 출력을 담당한다.

  - 1부터 시작하는 번호

 

1. 기본출력

  ( 행번호,사원명,입사일 )
  SELECT rownum, ename, hiredate FROM  emp;


2. 행번호를 이용한 제한 출력

    (1)  행번호 1번~5번까지 5개 출력

        SELECT rownum, ename, hiredate  FROM  emp  WHERE rownum <= 5 ;

    (2)  행번호 6번부터 끝까지 출력

        SELECT rownum, ename, hiredate  FROM  emp  WHERE rownum > 5;

rownum은  1번이 생성된 다음 증하는 형식으로 출력을 한다.
그러나 첫 출력 조건부터 조건에 맞지 않아 출력되지 않고
그 다음 출력 물에 1번을 붙여 출력하려고 해도 조건에 맞지 않아 출력이 되지 않으므로 모두 출력한되는 효과가 나온다.

3. 범위 출력의 해결 방법

    ※ ROWNUM의 컬럼화

    (1) 이중 SELECT 구조로 변환한다.

        SELECT  a.*  FROM 
        ( SELECT rownum rn, ename, hiredate  FROM  emp )
        WHERE  rn > 5;  

 

예제1) 입사일 기준으로 역순 정렬한다.  (행번호,사원명,입사일 출력)

    SELECT rownum, ename, hiredate  FROM  emp  
    ORDER  BY hiredate  DESC; 
    SELECT rownum, ename, hiredate  FROM  emp  
    ORDER  BY hiredate  DESC  
    WHERE rownum <= 5;   -- (x)

>(해결)  

    SELECT a.*  FROM  
            ( SELECT rownum rn, b.*  FROM  
            ( SELECT ename, hiredate  FROM  emp   ORDER  BY hiredate  DESC ) b 
            ) a
        WHERE   rn <= 5;      -- (ok)


>[ JOIN ]

 

- 서로 다른 테이블간의 연관성 있는 데이터를 통해 결합하여 데이터 결과를 얻어내는 일련의 작업을 조인이라한다.

- 조인의 조건은 WHERE절에 기술한다.

 

>[ 종류 ]

----------------------------------------------------

1. Equi Join (등가 조인)

- 테이블간에 필드 값들이 일치하는 경우에 사용한다.

- 가장 많이 사용되는 조인 방식이다.

 

2. Non-Equi Join (비등가 조인)

- 테이블간의 필드 값들이 일치하지 않는 경우에 사용한다.

 

3. Outer Join

- EquiJoin의 한 종류임 (Equi Join의 결과는 Outer Join의 부분집합에 해당)

- Equijoin 을 하였을 때 공통이외의 데이터 출력을 하기위해 '+' 연산자를 사용하는 조인

 

4. Self Join

- 하나의 테이블 즉 테이블 내부 컬럼들끼리 조인하는 방법

----------------------------------------------------

 

>[ 실습 ]

 

1. Equi Join (등가 조인)

(1) 사원번호 사원명 부서이름을 출력한다.

   (A) 부서테이블 확인

   - select deptno,dname,loc from dept;

   (B) 사원테이블 확인

   - select empno,ename,deptno from emp;

   (실행)

   select e.empno, e.ename, d.dname
    from emp e, dept d
    where e.deptno = d.deptno;

 

2. Non-equal Join (비 등가 조인)

(1) 사원명과 사원급여의 등급을 출력한다.

   (A) 등급테이블 확인

    - select * from salgrade;

   (B) 사원테이블 확인

   - select ename,sal from emp;

   (실행)

   select e.ename, e.sal, s.grade

   from emp e, salgrade s

    where e.sal between s.losal and s.hisal;

 

3. Outer Join

   - Equi Join의 결과를 통해 출력되지 않았던 데이터까지 모두 출력한다.

   (A) 부서테이블 확인

   - select deptno,dname,loc from dept;

   (B) 사원테이블 확인

   - select count(*)  from emp  where deptno='40';

   (실행)

   -- 출력 값이 작은 쪽에 (+)를 붙인다.

    select e.ename, d.deptno, d.dname 

    from emp e, dept d

    where e.deptno(+) = d.deptno;

   -- 일반조인에서는 나타나지 않은 부서가 출력되었다.

 

4. Self Join

   -- 하나의 테이블에서 서로 연관이 있는 컬럼을 갖고 있을 때 가능

   (1) 사원번호와 사원이름 출력

    - select empno, ename from emp;

   (2) 사원이름과 매니저를 출력

    - select ename, mgr from emp;

   (실행) 

    select a.ename || '의 상사는 ' || b.ename || ' 이다. '  as  직속상사관계
    from emp a, emp b
    where a.mgr = b.empno ;



1. 사원번호 사원명 부서번호를 5개만 출력한다.

select empno,ename,deptno from emp where rownum <= 5;

2. 급여가 가장 많은 사람부터 적은 사람 순으로 전체 데이터를 출력한다.

select * from emp order by sal desc;

3. 업무가 SALESMAN인 직원은 총 몇명인가?
    
    select count(*) from emp where upper(job) = upper('salesman');

4. 업무가 SALESMAN인 사원중 커미션이 NULL이 아닌 직원의 사원번호 사원명 커미션 출력을 출력한다.

    select empno,ename,comm from emp
                    where upper(job) = upper('salesman')
                    and comm is not null 
                    and comm > 0;
5. 사원명과 입사일을 출력한다. ( 입사일은 4자리-2자리-2자리 포맷으로 출력한다.).

select ename,to_char(hiredate,'yyyy-mm-dd') hiredate from emp;
6. 2010년도 이후에 입사한 사원의 사원번호 사원명 부서번호를 출력한다. 

select empno,ename,deptno,hiredate from emp where to_number(to_char(hiredate,'yyyy')) >= 2010;

7. SMITH의 사번 및 급여를 다음 내용처럼 출력한다.  ☞   SMITH(사번:000,급여:00)

select ename||'(사번:'||empno||',급여:'||sal||')' empinfo from emp where ename='SMITH';

8. 전 직원의 사원번호,사원명,입사일,부서명을 출력한다.

select  e.empno,
        e.ename,
        e.hiredate,
        d.dname 
        from emp e, dept d 
            where e.deptno=d.deptno;

9. SMITH와 같은 부서에 근무하는 사람들은 누구인지 전체 출력한다.
    
    select deptno from emp where ename='SMITH';
    select * from emp where deptno=(select deptno from emp where ename='SMITH');

    select empno,ename,dname from emp

10. SMITH가 속해 있는 부서의 평균 급여는 얼마인가?

select avg(sal) from emp where deptno=(select deptno from emp where ename='SMITH');

11. SMITH 보다 급여를 많이 받는 사람들을 전체 출력한다.

select * from emp where sal > (select sal from emp where ename='SMITH');

12. 사원 전체의 평균 급여보다 많이 받는 사원들을 출력

select * from emp where sal > (select avg(sal) from emp);

13. 급여를 가장 많이 받는 사원의 정보(사원번호,사원명,급여)를 출력한다.

select empno,ename,sal from emp where sal = (select max(sal) from emp); 

14. 급여를 많이 받는 사원 기준으로 순위 1등 ~ 5등까지 출력
   
   select b.* from
       ( select rownum rn,a.* from 
                 (select empno,ename,sal from emp order by sal desc) a ) b
      where rn >= 1 and rn <= 5;

15. 급여를 많이 받는 사원 기준으로 순위 6등 ~ 10등까지 출력
   select b.* from
       ( select rownum rn,a.* from 
                 (select empno,ename,sal from emp order by sal desc) a ) b
     where rn >= 6 and rn <= 10;



사원 테이블 – 사람이름 중에  S_  으로 시작되는 사람이름 출력
SELECT  ename,sal   FROM  emp   WHERE  ename LIKE '%S$_%' escape '$' ;


10.

select ename,deptno from emp 
where deptno=(select deptno from emp where ename='SMITH');

14.
select ename,deptno,sal  from emp where  sal = (select max(sal) from emp)
