
## DATE_FORMAT(date, format)

첫 번째 인수인 date에는 포맷을 변경하고 싶은 값을 지정합니다.

두 번째 인수인 format에는 변경하고 싶은 날짜 타입을 입력합니다.

--------

YYYY/mm/dd 포맷
    
    SELECT DATE_FORMAT('20200405','%Y/%m/%d')

> 2020/04/05


YYYY-mm-dd 포맷

    SELECT DATE_FORMAT('20200405','%Y-%m-%d')


%Y	년도 - Year(4자리 표기)
%y	년도 (뒤에 2자리 표기)


> 2020-04-05


    SELECT DATE_FORMAT('2020-04-05', '%W %M %Y');

> Sunday April 2020


%M	월 - 월 이름(January ~ December)
%m	월 - 월 숫자(00 ~ 12)
%d	일(00 ~ 31)



    SELECT DATE_FORMAT('2020-04-05', '%Y-%m-%d %H:%i:%s')

> 2020-04-05 09:09:18


%H	시간 24시간(00 ~ 23)
%h	시간 12시간(00 ~ 12)
%i	분 (00 ~ 59)
%s	초 (00 ~ 59)

//

%p	오전/오후	AM/PM
%T	시분초	24시간 형식 (hh:mm:ss)
%r	시분초 오전/오후	12시간 형식 (hh:mm:ss AM/PM)
