
# 구우편번호 데이터관리 
1. 우편번호데이터 DB화
2. 엑셀(편집) -> MySQL 임포트
3. 엑셀 -> CSV(ANCI->UTF8) -> MySQL

	---   addr1.csv


>>(1)  테이블 전체 데이터(행 기준) 개수를 출력한다.
	SELECT count(*) FROM `post` 

>>(2) 서울 지역의 데이터 개수를 출력한다.
	SELECT * FROM `post` where a2 liKe '%서울%' AND  a4 like '%논현%';

>>(3) 서울 지역의 데이터를 20개 출력한다.
	SELECT * FROM `post` where a2 like '%서울%' limit 0,20 ;

>>(4) 서울 지역의 서초구를 출력한다.
	SELECT * FROM `post` where a2 like '%서울%' AND  a3 like '%서초구%';

>>(5) 양재동을 검색하여 출력한다.
	SELECT * FROM `post` where a4 like '%양재%';

>>(6) 신사동이 무슨구에 속해있는지 '구' 이름만 출력한다.

# Distinct  중복제거


	SELECT Distinct(a3) FROM `post` where a4 like '%신사%'

>>8. 대구지역의 전체 '구' 이름만 출력한다.  (단일 데이터로 출력, 중복불허)

	select  count(distinct(a3)) gu_count from post  where a2 like '%대구%';   


	select ( select  count(distinct(a3)) gu_count from post  where a2 like '%서울%'  ) gu_seoul_cnt, 
          
		  ( select  count(distinct(a3)) gu_count from post  where a2 like '%대구%'  ) gu_daegu_cnt ;


>> 9. 우편번호 : 306762 를 검색하여 아래와 같이 똑같이 출력한다. 즉, 결과값을 모두 연결(단일컬럼형태)하여 출력한다.

    select      
	concat(a1,' ',a2,' ',a3,' ',a4,' ',a8) as 'address' 
	   from post
     		where a1 = '306762';

>>10. 서울지역만 따로 추출하여  post_seoul  테이블을 생성한다.


(ex)
	create table post2 as select * from post;

	create table post_seoul as select * from post where a2 like '%서울%';

