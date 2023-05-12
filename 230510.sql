-- 기본적으로 접속시에는 데이터베이스의 서버가 켜져있어야 함
-- 데이터 베이스 내의 테이블 이름, 컬럼 이름, 변수형, 명령어에 대해
-- 대소문자를 구분하지 않음. 합성어의 경우, '_' 로 구분함.

-- 예제1
create table student(
    id varchar2(10) primary key,
    name varchar2(10),
    kor varchar2(5),
    eng varchar2(5),
    math varchar2(5)
);
insert into student values('1','홍길동','80','90','100');
insert into student values('2','성춘향','90','100','80');
insert into student values('3','이몽룡','100','80','90');

select * from student;

update student set kor='85', eng='95', math='98' where id = '1';
commit;

delete from student;
rollback;
--




create table test_table(num number);
select * from test_table;
-- 틀 변경에 관한 commit x
-- create, uqdate, delete에 대해서만 commit 

desc test_table; 
-- 테이블 구조 확인
-- 테이블명, 자료형

alter table test_table add(name varchar2(20));
desc test_table;
-- 컬럼 추가 
-- 해당 기능을 사용하는 경우, java 코드 전체 수정 필요 => 실사용 low

alter table test_table modify(name number);
desc test_table; 
-- 자료형 수정 

alter table test_table drop column name;
desc test_table;
-- 컬럼 삭제

alter table test_table rename column num to num_b;
desc test_table;
-- 컬럼 이름 변경

drop table test_table;
-- 테이블 삭제

-- delete와 drop의 차이
-- delete ; 데이터 복구 가능, 로그 남김, 
--          Storage 삭제X, commit 전 rollback 가능
-- drop ; 데이터 복구 불가, 로그 안남김, 
--        Storage 삭제-테이블 스키마 삭제, rollback 불가능


create user test_java identified by 1234; 
-- 계정 생성
select * from all_users;
-- 계정 확인
drop user test_java; 
-- 계정 삭제
drop user test_java cascade; 
-- 테이블이 존재하는 경우 cascade를 사용해 삭제

select * from student;

-- 조건절 ; < > = !=
select * from student where eng>90;
select * from student where kor!=90;
select * from student where math=80;

select math from student where name='홍길동';
select math/2 from student where name='홍길동';
select math+100 from student where name='홍길동';
select math*20 from student where name='홍길동';
-- 검색 내용에 연산자 추가 가능

-- 논리연산자 ; and, or, between
select * from student where kor>=90 and eng=100;
select * from student where kor>=90 or eng=90;
select * from student where not kor>=90;
select * from student where kor>=90 and kor<=100; 
-- between, 사이값
select * from student where kor between 90 and 100;



create table test_number(
    numps number(5,2),
    -- (x,y) x자리의 수, 소수점 y번재 자리까지 표현
    -- y+1번째 자리에서 반올림함
    nump number(3),
    -- 총 n자리의 수, 소수점 사용X
    num number
);

insert into test_number values(1.12545, 1.12345, 1.12345);
select * from test_number;

insert into test_number values(123.12545, 123.12345, 123.12345);
select * from test_number;

insert into test_number values(1234.12545, 123.12345, 123.12345);
--표현 불가능 => 오류발생


-- 날짜 
create table test_date(my_date date);

insert into test_date values(sysdate);
-- sysdate ; 현재 시스템상의 날짜 
select * from test_date;

insert into test_date values('2000/01/17');
-- 현재의 날짜를 직접 입력
select * from test_date;

alter session set nls_date_format = 'YYYY/MM/DD HH:MI:SS';
-- 표기 형식 변경
select * from test_date;

select * from test_date where my_date < '2019/12/12';
-- 날짜 연산도 가능함


-- 문자열 
create table test_char(
    ch char(5), -- 고정 크기
    vch varchar2(20) -- 가변 크기 
);

insert into test_char values('1','1');
select lengthb(ch), lengthb(vch) from test_char;
-- char ; 지정 크기로 입력
-- varchar2 ; 지정 크기보다 작은 경우, 그 크기에 맞춰 들어감


-- 예제2
create table employee(
    name varchar2(15),
    salary number,
    job varchar2(20),
    join_company date
);

alter session set nls_date_format='YYYY/MM/DD';
insert into employee values ('홍길동', 20000000, '컴퓨터', '2222/12/24');
select * from employee;
--



insert into employee values('설까치',1800000,'삼성','2017/10/24');
insert into employee values('로버트',1850000,'애플','2019/01/04');
insert into employee values('고도리',2200000,'엘지','2017/11/06');
insert into employee values('김개똥',2500000,'SK','2017/04/14');
insert into employee values('리우뚱',2410000,'샤오미','2018/01/09');
insert into employee values('강민',1900000,'삼성','2019/10/24');
insert into employee values('할리',1800000,'애플','2019/12/04');
insert into employee values('심심해',4630000,'엘지','2015/04/02');
insert into employee values('놀아줘',2770000,'SK','2017/01/24');
insert into employee values('왕만두',3650000,'샤오미','2016/08/04');
insert into employee values('머리빨',4210000,'삼성','2015/03/18');
insert into employee values('마리오',2720000,'애플','2017/01/04');
insert into employee values('최치우',4320000,'엘지','2015/06/07');
insert into employee values('안깔쌈',3490000,'SK','2015/09/07');
insert into employee values('끝짱',2200000,'샤오미','2017/05/04');
insert into employee values('막장',1920000,'삼성','2018/11/24');
insert into employee values('드라마',3420000,'애플','2016/07/29');
insert into employee values('개똥이',1800000,'엘지','2018/12/24');
insert into employee values('마포구',2230000,'SK','2018/01/05');
insert into employee values('소고기',1800000,'샤오미','2019/01/09');
insert into employee values('짜장면',2100000,'삼성','2017/10/24');
insert into employee values('소곱창',2200000,'애플','2017/11/04');
insert into employee values('참이슬',1950000,'엘지','2017/10/24');
insert into employee values('뤼우뚱',1800000,'SK','2018/10/24');
insert into employee values('위메프',1800000,'샤오미','2019/12/07');
insert into employee values('북경시',1880000,'삼성','2018/11/14');
insert into employee values('스미스',1970000,'애플','2019/06/04');
insert into employee values('핸드폰',7200000,'엘지','2010/01/27');
insert into employee values('빅스비',3570000,'SK','2015/02/17');
insert into employee values('노라줘',3200000,'샤오미','2015/11/24');
insert into employee values('사이다',2400000,'삼성','2017/09/26');
insert into employee values('김말이',7000000,'애플','2010/01/21');
insert into employee values('오도독',6230000,'엘지','2011/08/19');
insert into employee values('쌈지돈',3710000,'SK','2015/08/19');
insert into employee values('화장지',1770000,'샤오미','2019/04/28');
insert into employee values('소화기',1920000,'삼성','2019/10/07');
insert into employee values('박효신',2670000,'애플','2017/11/24');
insert into employee values('판빙빙',3120000,'엘지','2016/05/19');
insert into employee values('김재욱',4190000,'SK','2015/01/02');
insert into employee values('송혜교',4280000,'샤오미','2015/01/02');
insert into employee values('송중기',3700000,'삼성','2016/02/17');
insert into employee values('손홍민',2220000,'애플','2018/02/04');
insert into employee values('백종원',2760000,'엘지','2017/10/14');
insert into employee values('오창석',2620000,'SK','2017/09/04');
insert into employee values('스텔라',2500000,'샤오미','2017/11/20');
insert into employee values('멕스웰',1970000,'삼성','2017/10/30');
insert into employee values('조현',  2720000,'애플','2018/11/11');
insert into employee values('류현진',2600000,'엘지','2015/11/19');
insert into employee values('은지원',5670000,'SK','2017/10/16');
insert into employee values('전효성',3750000,'샤오미','2015/09/15');
insert into employee values('이채은',3400000,'삼성','2016/02/09');
insert into employee values('최고봉',8900000,'애플','2010/01/04');
insert into employee values('광화문',1860000,'엘지','2017/10/24');
insert into employee values('동대문',1790000,'SK','2017/10/24');
insert into employee values('서대문',2880000,'샤오미','2016/02/27');
insert into employee values('대통령',2320000,'삼성','2016/05/24');
insert into employee values('예지원',1780000,'애플','2019/01/09');
insert into employee values('정소민',2900000,'엘지','2016/10/22');
insert into employee values('워너원',3000000,'SK','2015/10/10');
insert into employee values('북한군',3200000,'샤오미','2015/11/11');
insert into employee values('남한군',2500000,'삼성','2016/12/19');
insert into employee values('짜투리',1850000,'애플','2018/04/03');
insert into employee values('이승기',1900000,'엘지','2018/01/01');
insert into employee values('기차길',1790000,'SK','2018/05/02');
insert into employee values('길거리',2700000,'샤오미','2016/07/20');

-- 예제3
select * from employee where salary*12>100000000;
select name,join_company from employee where join_company<'2015/01/01';
select * from employee where salary between 2800000 and 3000000;




--like 절
select * from employee;
select * from employee where name like '김%';
-- 김으로 시작하는 name 검색
select * from employee where name like '%김';
-- 김으로 끝나는 name 검색
select * from employee where name like '%김%';
-- 위치 상관없이 김이 포함된 name 검색


-- order by ; 정렬
select * from employee order by join_company desc; 
                                        -- 내림차순
select * from employee order by join_company asc; 
                                        -- 오름차순
select * from employee order by join_company asc, name desc; 
-- 입사년도 먼저 오름차순, 중복시, name을 내림차순


--예제3
select * from employee 
 where join_company>='2015/01/01' and salary*12>=60000000;
select * from employee
 where(job='삼성' or job ='엘지') and salary*12>=50000000; 

-- 예제4
select * from employee where name like '%김%' and salary*12>=30000000
 order by job asc, salary desc ; 

