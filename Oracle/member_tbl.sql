
멤버 테이블 만들기 ;
create  , insert ;; 

create table member_tbl(
MEMBER_NO  number not null PRIMARY KEY,
member_id varchar2(20),
member_name varchar2(20),
member_grade char(1) not null,
member__hobby varchar2(100),
member_date date


);

INSERT INTO  member_tbl ( member_no, member_id, member_name ,
                                    member_grade, member__hobby ,member_date )
VALUES ( '1001' , 'hong','홍길동','S' ,'독서,운동,영화', '20180110' );


INSERT INTO  member_tbl ( member_no, member_id, member_name ,
                                    member_grade, member__hobby ,member_date )
VALUES ( '1002' , 'choi','최영문','A' ,'영화', '20180111' );


INSERT INTO  member_tbl ( member_no, member_id, member_name ,
                                    member_grade, member__hobby ,member_date )
VALUES ( '1003' , 'park', '박기자' ,'A' ,'독서', '20180112' );

INSERT INTO  member_tbl ( member_no, member_id, member_name ,
                                    member_grade, member__hobby ,member_date )
VALUES ( '1004' , 'lee','이은주','B' ,'운동', '20180113' );


INSERT INTO  member_tbl ( member_no, member_id, member_name ,
                                    member_grade, member_date )
VALUES ( '1005' , 'kang','강하나','S','20180114' );


create table friend_tbl(
unq number  PRIMARY KEY,
req_member_no number ,
res_member_no number ,
req_date date not null,
allow_yn char(1) not null

);

INSERT INTO friend_tbl ( unq,req_member_no, res_member_no ,
                                   req_date, allow_yn )
VALUES ( '1' , '1001','1003','20210101','Y' );


INSERT INTO  friend_tbl( unq,req_member_no, res_member_no ,
                                   req_date, allow_yn )
VALUES ( '2' , '1001','1002','20210203','Y' );


INSERT INTO  friend_tbl ( unq,req_member_no, res_member_no ,
                                   req_date, allow_yn )
VALUES ( '3' , '1003','1004','20211225','N' );


INSERT INTO friend_tbl( unq,req_member_no, res_member_no ,
                                   req_date, allow_yn )
VALUES ( '4' , '1003','1005','20201225','Y' );

INSERT INTO  friend_tbl ( unq,req_member_no, res_member_no ,
                                   req_date, allow_yn )
VALUES ( '5' , '1005','1004','20201117','Y' );
