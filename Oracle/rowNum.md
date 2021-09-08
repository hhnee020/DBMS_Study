

>>rownum

기본출력

  ( 행번호,사원명,입사일 )

  SELECT rownum, ename, hiredate FROM  emp;

---

- 오라클에서 제공을 해주는 내장 컬럼으로  WHERE 절 까지의 행번호 출력을 담당한다.

- 1부터 시작하는 번호

- 진짜 컬럼이 아닌데 컬럼처럼 행동하는 요소

- 행번호 의사컬럼(현재행의 순서를 반환 의사컬럼)

- 오라클 전용.

- 서브쿼리를 잘하면 사용하기 쉬움

----

의사 컬럼으로 참조만 될 뿐 데이터베이스에 저장되지 않는다.

SELECT절에 의해 추출되는 데이터(ROW)에 붙는 순번이다.
다시 말해 WHERE절까지 만족 시킨 자료에 1부터 붙는 순번이다.

WHERE절에 ROWNUM을 이용하여 조건을 주면 다른 조건을
만족시킨 결과에 대해 조건이 반영된다.

SELECT 리스트에 ROWNUM을 이용하는 것도 가능하다.


---

ORDER BY를 사용한다면 WHERE절까지 만족 시킨 결과에 ROWNUM이
붙은 상태로 ORDER BY가 반영된다.
즉, ROWNUM은 ORDER BY전에 부여되며, ORDER BY는 맨 나중에 실행된다.

 (1)  행번호 1번~5번까지 5개 출력

        SELECT rownum, ename, hiredate  FROM  emp  WHERE rownum <= 5 ;

(2)  행번호 6번부터 끝까지 출력

        SELECT rownum, ename, hiredate  FROM  emp  WHERE rownum > 5 ;
         -- 출력안됨 

이유)

- rownum은  1번이 생성된 다음 증하는 형식으로 출력을 한다.
- 그러나 첫 출력 조건부터 조건에 맞지 않아 출력되지 않고
그 다음 출력 물에 1번을 붙여 출력하려고 해도 조건에 맞지 않아 출력이 되지 않으므로 모두 출력한되는 효과가 나온다.



역순 정렬한다.  (행번호,사원명,입사일 출력)

    SELECT rownum, ename, hiredate  FROM  emp  
    ORDER  BY hiredate  DESC; 


    SELECT rownum, ename, hiredate  FROM  emp  
    ORDER  BY hiredate  DESC  
    WHERE rownum <= 5;   -- (x)


----

    SELECT a.*  FROM  
    ( SELECT rownum rn, b.*  FROM  
    ( SELECT ename, hiredate  FROM  emp   ORDER  BY hiredate  DESC ) b ) a
        WHERE   rn <= 5;      -- (ok)
