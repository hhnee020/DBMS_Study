    step1.테이블생성(4개)

- subway1
- subway2
- subway3
- subway4

    step2.데이터 분류별 저장
- 저장 후 저장건 수 출력


    step3.컬럼 추가 및 데이터 입력 
 컬럼 추가 -> tgrp varchar2

 - 시간대  5~10까지 -> 오전
 - 시간대 11~16까지 -> 오후
 - 시간대 17~20까지 -> 저녁
 - 시간대 21~24까지 -> 밤

step4.데이터 출력 ------------------

1.승차인원 전체출력
  >>호선입력:1 (or 2,3,4)
2.하차인원 전체출력
  >>호선입력:1
3.시간대별 조회
  >>호선입력:3
  >>시간입력:12 (시간대의 앞 자리만 입력)
4.승차인원수별 출력(많은순서)
  >>호선입력:2
5.승차인원수별 출력(적은순서)
  >>호선입력:3
6.각 호선별 가장 많은 시간대와 승차인원
  >>호선입력:4 (or 2,3,4,0(전체) )


    create table subway1 ( 
    line varchar2(10) not null,
    time varchar2(5) not null,
    enter int not null,
    getoff int not null
    );

    create table subway2 ( 
    line varchar2(10) not null,
    time varchar2(5) not null,
    enter int not null,
    getoff int not null
    );

    create table subway3 ( 
    line varchar2(10) not null,
    time varchar2(5) not null,
    enter int not null,
    getoff int not null
    );

    create table subway4 ( 
    line varchar2(10) not null,
    time varchar2(5) not null,
    enter int not null,
    getoff int not null
    );
 
