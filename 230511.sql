create table test_func(id number, num VARCHAR2(20));

insert into test_func values (1, '34.5678');

select * from test_func where id=1;

select round(num,2) from test_func where id=1;
-- round ; 반올림
-- 문자형태의 숫자일지라도 실질적인 형태의 숫자라면 혼용가능

select round(num/2,2) from test_func where id=1;

select trunc(num,2) from test_func where id=1;
-- trunc ; 버림
select mod(num,2) from test_func where id=1;
-- mod ; 나머지 값을 구함

insert into test_func values (2, '55');
select mod(num,2) from test_func where id=2;


--예제1
insert into test_func values (3, '51');
insert into test_func values (4, '52');
insert into test_func values (5, '53');
insert into test_func values (6, '54');
insert into test_func values (7, '55');
insert into test_func values (8, '56');
insert into test_func values (9, '57');
insert into test_func values (10, '58');

select * from test_func;
select* from test_func where mod(id,2)=1;
select id, round(num/2,2) from test_func where mod(id,2)=0;
--




insert into test_func values (11, 'welcome To oracle');
select * from test_func where id=11;
select upper(num) from test_func where id=11; 
-- 대문자
select lower(num) from test_func where id=11;
-- 소문자 




-- 예제2

create table test_company(
  name varchar2(20),
  연봉 varchar2(20),
  class varchar2(20)
);
insert into test_company values('hong gil dong_M','3600','Manager');
insert into test_company values('kim gea ddong_M','2555','ManaGer');
insert into test_company values('Go gil dong_M','2800','ManaGER');
insert into test_company values('hong gil dong_E','3111','EmpLoyee');
insert into test_company values('kim gea ddong_E','2600','EmpLoYee');
insert into test_company values('Go gil dong_E','2950','employee');

select * from test_company;
select * from test_company where lower(class)='manager';
select * from test_company where lower(class)='employee' and 연봉>=2800;
select initcap(name),trunc(연봉/12,0),class from test_company;
--


create table test_class(class varchar2(10), score number);
Insert into test_class values('A반',11);
insert into test_class values('A반',12);
insert into test_class values('A반',13);
insert into test_class values('B반',21);
insert into test_class values('B반',22);
insert into test_class values('B반',23);
insert into test_class values('1',31);
insert into test_class values('1',32);
insert into test_class values('1',33);
insert into test_class values('',40);

select sum(score) from test_class;
--총합을 구해주는 함수
select avg(score) from test_class;
--평균을 구해주는 함수
select max(score), min(score) from test_class;
select count(class) from test_class;
-- null값은 처리되지 않음
select count(*) from test_class;
-- null 포함 총 개수
select * from test_class;
select class,sum(score) from test_class group by class;
-- class 별 합을 구함 ; 컬럼별로 묶음
select class,sum(score) from test_class 
    group by class having sum(score)>60;
                    -- 조건절


-- 예제3
select class,count(*) from test_class group by class;
select class, avg(score) from test_class group by class 
    order by avg(score) desc;
select class, max(score), min(score) from test_class group by class;
--



create table testName(id varchar2(20), class varchar2(20));
insert into testName values('홍길동','A반');
insert into testName values('김개똥','B반');
insert into testName values('고길동','C반');

create table testLesson(id varchar2(20), lesson varchar2(20), score number);
insert into testLesson values('홍길동','python',80);
insert into testLesson values('홍길동','java',90);
insert into testLesson values('홍길동','c언어',70);
insert into testLesson values('김개똥','server2012',70);
insert into testLesson values('김개똥','linux',90);
insert into testLesson values('고길동','jsp',100);

select * from testname;
select * from testlesson;
select * from testname,testlesson;
select N.*, L.lesson, L.score from testname N, testlesson L;
-- n의 모든 값, 겹치는 것을 제외한 값        별칭부여

select * from testname n inner join testlesson L on N.id = L.id;
select N.*, L.lesson, L.score from testname n 
    inner join testlesson L on N.id = L.id;



-- 예제4
select N.*,N.class, L.lesson, L.score from testname n 
    inner join testlesson L on N.id = L.id where N.id='홍길동';

select N.id, N.CLASS, sum(L.score), avg(L.score) from 
        testName N inner join testlesson L on N.id=L.id 
        group by N.id,N.CLASS 
        order by class asc;

