
## Oracle TO_CHAR

TO_CHAR(숫자/날짜, 포맷)
- 숫자나 날짜를 특정 포맷의 문자로 변환하는 함수
- 첫 번째 매개변수로 숫자/날짜를, 두 번째 매개변수로 포맷을 지정한다.'

----

> 날짜 포맷 변경 (YYYY-MM-DD)

    SELECT TO_CHAR(SYSDATE, 'YYYYMMDD')              --20200723
            , TO_CHAR(SYSDATE, 'YYYY/MM/DD')            --2020/07/23
            , TO_CHAR(SYSDATE, 'YYYY-MM-DD')            --2020-07-23
            , TO_CHAR(SYSDATE, 'YYYY-MM-DD HH24:MI:SS') --2020-07-23 11:10:52
        FROM dual

    SELECT TO_DATE('20201108') FROM DUAL;
    -- 문자열을 날짜로 바꾼다.

    SELECT TO_DATE('20201108132408') FROM DUAL;
    -- 연월일 시분초까지 날짜로 변경

> 소수점 변경

    SELECT TO_CHAR(123.456, 'FM990.999') --123.456
        , TO_CHAR(1234.56, 'FM9990.99') --1234.56
        , TO_CHAR(0.12345, 'FM9990.99') --0.12
    FROM dual


- FM: 문자열의 공백제거

숫자의 최대 길이만큰 9999... 형식을 지정한다. (9 : 값이 없으면 표시안함, 0: 값이 없으면 "0"으로 처리)

정수은 지정한 형식보다 값의 길이가 길면 오류, 소수 지정한 길이보다 길면 반올림

> 천 단위 콤마 찍기
    
    SELECT TO_CHAR(123467, 'FM999,999')        --123,467
        , TO_CHAR(123467890, 'FM999,999,999') --123,467,890
        , TO_CHAR(123467, 'FML999,999')       --￦123,467
    FROM dual

> 날짜의 "0" 없애기

    SELECT TO_CHAR(SYSDATE, 'MM/DD')   --07/03
        , TO_CHAR(SYSDATE, 'FMMM/DD') --7/3
    FROM dual


> 임의의 구분자로 날짜 형식 만들기
    
    SELECT TO_CHAR(SYSDATE, '""YYYY"년 "MM"월 "DD"일"') --2020년 07월 23일
        , TO_CHAR(SYSDATE, '""HH24"시 "MI"분 "SS"초"') --11시 12분 20초
    FROM dual

> 시간의 오전, 오후 값 반환
    
    SELECT TO_CHAR(SYSDATE, 'AM')                    --오전
        , TO_CHAR(SYSDATE, 'AM HH:MI:SS')           --오전 11:44:31
        , TO_CHAR(SYSDATE, 'YYYY-MM-DD AMHH:MI:SS') --2020-07-23 오전11:44:31
    FROM dual
    

-오라클 언어 설정에 따라서 오전, 오후 또는 AM, PM으로 반환됨
