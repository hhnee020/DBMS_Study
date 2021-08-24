## 회원정보 관리 테이블 
 

1. 회원 기본정보


		CREATE TABLE memberInfo (

		userid varchar(20) not null,

		pass varchar(100) not null,

		name varchar(20) not null,

		gender enum('M','F'), 

		birthday  date not null,

		phone varchar(20),

		rdate  datetime,

		primary key(userid) );

 

2. 회원 기타정보

		CREATE TABLE memberOther (

		userid varchar(20) not null,

		job varchar(4),

		hobby varchar(4),

		blood enum('A','O','B','AB') );''




		insert into memberinfo(userid,pass,name,gender,birthday,phone,rdate)
		values('test1',md5('1234'),'홍길동','M','2000-12-25','010-777-7777','2021-01-10');

		insert into memberinfo(userid,pass,name,gender,birthday,phone,rdate)
		values('test2',md5('123456'),'이영희','F','1998-10-25','017-7777-1212','2021-02-01');

		insert into memberinfo(userid,pass,name,gender,birthday,phone,rdate)
		values('king1',md5('1111'),'이성계','M','2001-07-07','010-12564-2312','2021-05-01');

---

		insert into memberother(userid,job,hobby,blood)
		values('test1','j002','h003','O');

		insert into memberother(userid,job,hobby,blood)
		values('test2','j003','h002','AB');

		insert into memberother(userid,job,hobby,blood)
		values('king1','j001','h002','B');

---

1.  코드 테이블

(1) 테이블명 : code

(2) 컬럼명

* 구분    -  gubun
  코드    -  code_id
  코드값 -  code_name *

(3) 데이터

* h001 : 태권도, h002 : 야구,h003 : 축구
  j001 : 개발, j002 : 컨설팅,j003 : 디자인 *


		create table code(
		gubun char(1) not null,
		code_id varchar(10) not null,
		code_name varchar(20) not null
		);

	insert into code(gubun,code_id,code_name) values('h','h001','태권도');

	insert into code(gubun,code_id,code_name) values('h','h002','야구');

	insert into code(gubun,code_id,code_name) values('h','h003','축구');

	insert into code(gubun,code_id,code_name) values('j','j001','개발');

	insert into code(gubun,code_id,code_name) values('j','j002','컨설팅');

	insert into code(gubun,code_id,code_name) values('j','j003','디자인');


1.  아이디   이름     생년

    test1  홍길동  2000년생

		select	userid    '아이디',
		name      '이름',
        concat(substring(birthday,1,4),'년생') '생년'
		from 
			memberinfo;

    
2. 아이디    이름   성별   나이         등록일

    test1    홍길동   남     23세     2021-01-10

		select	userid      '아이디',
		name        '이름' ,
		if(gender='M','남','여')   '성별',
		 
		concat(left(now(),4)-left(birthday,4),'세')  '나이',
		
		left(rdate,10)   '등록일'
		from
				memberinfo;

3. 암호가 1234 로 되어 있는 데이터를 출력한다.

		select name from memberinfo  
		where pass=md5('1234');

4. 2021년 2월 이후 등록자들의 이름과 전번을 출력한다.

		select name,phone,left(rdate,10) from memberinfo
		where rdate >= '2021-02-01';

5.  핸드폰 번호가 010 이 아닌 데이터를 출력한다.

		select name,phone from memberinfo 
		where left(phone,3) != '010';

6. 아이디가 test로 시작되는 데이터를 출력한다.

		select * from memberinfo
		where userid like 'test%';

7. 아이디 이름 형액형을 출력한다.

>>[ JOIN ]

 >>물리적으로 나뉘어진 테이블들을 논리적인 SQL을 이용하여 연결하는 방법을 말함. 테이블간의 공통 컬럼값이 존재해야함



 (1) 조인을 사용안하는 경우
> 서브 쿼리

			select  userid,
					name,
	( select blood from memberother where userid=m1.userid ) blood
	from 
			memberinfo m1;


 (2) 조인을 사용하는 경우

      select  
	         memberinfo.userid, 
			 memberinfo.name, 
			 memberother.blood  
	    from 
		     memberinfo, memberother
	    where
		     memberinfo.userid=memberother.userid; 
	
> as 사용 
    
	  select  
	         m1.userid, 
			 m1.name, 
			 m2.blood  
	    from 
		     memberinfo  m1, memberother m2 
	    where
		     m1.userid=m2.userid; 




8. 아이디  직업  취미를 출력한다.

  (1)  아이디 직업
 		
		select 
				a1.userid,
				a1.job,
				a2.code_name
		from
				memberother a1, code a2    
		where
				a1.job = a2.code_id

  (2) 아이디 취미
		select 
			a1.userid,
			a1.hobby,
			a2.code_name
		from 
				memberother a1, code a2 
		where
				a1.hobby = a2.code_id

9. 홍길동의 취미를 출력한다.  

   (1) 
		select 
			m1.userid,
			m1.name,
			m2.hobby,
			c1.code_name
		from  
			memberinfo m1, memberother m2, code c1
		where 
				m1.userid = m2.userid 
				and m2.hobby  = c1.code_id 
				and
				m1.name='홍길동';


10. 홍길동의 직업을 출력한다.

 
		select 
				m1.userid,
				m1.name,
				m2.job,
				c1.code_name
		from  
				memberinfo m1, memberother m2, code c1
		where 
				m1.userid = m2.userid 
				and m2.job  = c1.code_id 
				and
				m1.name='홍길동';

11. 야구가 취미인 사람을 출력한다. 

		select 
			m1.name,
			m2.hobby,
			c1.code_name
		from 
				memberinfo m1, memberother m2, code c1 
		where 
					m1.userid = m2.userid 
				and m2.hobby  = c1.code_id
				and 
					c1.code_name='야구';
		
