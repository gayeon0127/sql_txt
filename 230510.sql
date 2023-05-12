-- �⺻������ ���ӽÿ��� �����ͺ��̽��� ������ �����־�� ��
-- ������ ���̽� ���� ���̺� �̸�, �÷� �̸�, ������, ��ɾ ����
-- ��ҹ��ڸ� �������� ����. �ռ����� ���, '_' �� ������.

-- ����1
create table student(
    id varchar2(10) primary key,
    name varchar2(10),
    kor varchar2(5),
    eng varchar2(5),
    math varchar2(5)
);
insert into student values('1','ȫ�浿','80','90','100');
insert into student values('2','������','90','100','80');
insert into student values('3','�̸���','100','80','90');

select * from student;

update student set kor='85', eng='95', math='98' where id = '1';
commit;

delete from student;
rollback;
--




create table test_table(num number);
select * from test_table;
-- Ʋ ���濡 ���� commit x
-- create, uqdate, delete�� ���ؼ��� commit 

desc test_table; 
-- ���̺� ���� Ȯ��
-- ���̺��, �ڷ���

alter table test_table add(name varchar2(20));
desc test_table;
-- �÷� �߰� 
-- �ش� ����� ����ϴ� ���, java �ڵ� ��ü ���� �ʿ� => �ǻ�� low

alter table test_table modify(name number);
desc test_table; 
-- �ڷ��� ���� 

alter table test_table drop column name;
desc test_table;
-- �÷� ����

alter table test_table rename column num to num_b;
desc test_table;
-- �÷� �̸� ����

drop table test_table;
-- ���̺� ����

-- delete�� drop�� ����
-- delete ; ������ ���� ����, �α� ����, 
--          Storage ����X, commit �� rollback ����
-- drop ; ������ ���� �Ұ�, �α� �ȳ���, 
--        Storage ����-���̺� ��Ű�� ����, rollback �Ұ���


create user test_java identified by 1234; 
-- ���� ����
select * from all_users;
-- ���� Ȯ��
drop user test_java; 
-- ���� ����
drop user test_java cascade; 
-- ���̺��� �����ϴ� ��� cascade�� ����� ����

select * from student;

-- ������ ; < > = !=
select * from student where eng>90;
select * from student where kor!=90;
select * from student where math=80;

select math from student where name='ȫ�浿';
select math/2 from student where name='ȫ�浿';
select math+100 from student where name='ȫ�浿';
select math*20 from student where name='ȫ�浿';
-- �˻� ���뿡 ������ �߰� ����

-- �������� ; and, or, between
select * from student where kor>=90 and eng=100;
select * from student where kor>=90 or eng=90;
select * from student where not kor>=90;
select * from student where kor>=90 and kor<=100; 
-- between, ���̰�
select * from student where kor between 90 and 100;



create table test_number(
    numps number(5,2),
    -- (x,y) x�ڸ��� ��, �Ҽ��� y���� �ڸ����� ǥ��
    -- y+1��° �ڸ����� �ݿø���
    nump number(3),
    -- �� n�ڸ��� ��, �Ҽ��� ���X
    num number
);

insert into test_number values(1.12545, 1.12345, 1.12345);
select * from test_number;

insert into test_number values(123.12545, 123.12345, 123.12345);
select * from test_number;

insert into test_number values(1234.12545, 123.12345, 123.12345);
--ǥ�� �Ұ��� => �����߻�


-- ��¥ 
create table test_date(my_date date);

insert into test_date values(sysdate);
-- sysdate ; ���� �ý��ۻ��� ��¥ 
select * from test_date;

insert into test_date values('2000/01/17');
-- ������ ��¥�� ���� �Է�
select * from test_date;

alter session set nls_date_format = 'YYYY/MM/DD HH:MI:SS';
-- ǥ�� ���� ����
select * from test_date;

select * from test_date where my_date < '2019/12/12';
-- ��¥ ���굵 ������


-- ���ڿ� 
create table test_char(
    ch char(5), -- ���� ũ��
    vch varchar2(20) -- ���� ũ�� 
);

insert into test_char values('1','1');
select lengthb(ch), lengthb(vch) from test_char;
-- char ; ���� ũ��� �Է�
-- varchar2 ; ���� ũ�⺸�� ���� ���, �� ũ�⿡ ���� ��


-- ����2
create table employee(
    name varchar2(15),
    salary number,
    job varchar2(20),
    join_company date
);

alter session set nls_date_format='YYYY/MM/DD';
insert into employee values ('ȫ�浿', 20000000, '��ǻ��', '2222/12/24');
select * from employee;
--



insert into employee values('����ġ',1800000,'�Ｚ','2017/10/24');
insert into employee values('�ι�Ʈ',1850000,'����','2019/01/04');
insert into employee values('����',2200000,'����','2017/11/06');
insert into employee values('�谳��',2500000,'SK','2017/04/14');
insert into employee values('�����',2410000,'������','2018/01/09');
insert into employee values('����',1900000,'�Ｚ','2019/10/24');
insert into employee values('�Ҹ�',1800000,'����','2019/12/04');
insert into employee values('�ɽ���',4630000,'����','2015/04/02');
insert into employee values('�����',2770000,'SK','2017/01/24');
insert into employee values('�ո���',3650000,'������','2016/08/04');
insert into employee values('�Ӹ���',4210000,'�Ｚ','2015/03/18');
insert into employee values('������',2720000,'����','2017/01/04');
insert into employee values('��ġ��',4320000,'����','2015/06/07');
insert into employee values('�ȱ��',3490000,'SK','2015/09/07');
insert into employee values('��¯',2200000,'������','2017/05/04');
insert into employee values('����',1920000,'�Ｚ','2018/11/24');
insert into employee values('���',3420000,'����','2016/07/29');
insert into employee values('������',1800000,'����','2018/12/24');
insert into employee values('������',2230000,'SK','2018/01/05');
insert into employee values('�Ұ��',1800000,'������','2019/01/09');
insert into employee values('¥���',2100000,'�Ｚ','2017/10/24');
insert into employee values('�Ұ�â',2200000,'����','2017/11/04');
insert into employee values('���̽�',1950000,'����','2017/10/24');
insert into employee values('����',1800000,'SK','2018/10/24');
insert into employee values('������',1800000,'������','2019/12/07');
insert into employee values('�ϰ��',1880000,'�Ｚ','2018/11/14');
insert into employee values('���̽�',1970000,'����','2019/06/04');
insert into employee values('�ڵ���',7200000,'����','2010/01/27');
insert into employee values('�򽺺�',3570000,'SK','2015/02/17');
insert into employee values('�����',3200000,'������','2015/11/24');
insert into employee values('���̴�',2400000,'�Ｚ','2017/09/26');
insert into employee values('�踻��',7000000,'����','2010/01/21');
insert into employee values('������',6230000,'����','2011/08/19');
insert into employee values('������',3710000,'SK','2015/08/19');
insert into employee values('ȭ����',1770000,'������','2019/04/28');
insert into employee values('��ȭ��',1920000,'�Ｚ','2019/10/07');
insert into employee values('��ȿ��',2670000,'����','2017/11/24');
insert into employee values('�Ǻ���',3120000,'����','2016/05/19');
insert into employee values('�����',4190000,'SK','2015/01/02');
insert into employee values('������',4280000,'������','2015/01/02');
insert into employee values('���߱�',3700000,'�Ｚ','2016/02/17');
insert into employee values('��ȫ��',2220000,'����','2018/02/04');
insert into employee values('������',2760000,'����','2017/10/14');
insert into employee values('��â��',2620000,'SK','2017/09/04');
insert into employee values('���ڶ�',2500000,'������','2017/11/20');
insert into employee values('�߽���',1970000,'�Ｚ','2017/10/30');
insert into employee values('����',  2720000,'����','2018/11/11');
insert into employee values('������',2600000,'����','2015/11/19');
insert into employee values('������',5670000,'SK','2017/10/16');
insert into employee values('��ȿ��',3750000,'������','2015/09/15');
insert into employee values('��ä��',3400000,'�Ｚ','2016/02/09');
insert into employee values('�ְ��',8900000,'����','2010/01/04');
insert into employee values('��ȭ��',1860000,'����','2017/10/24');
insert into employee values('���빮',1790000,'SK','2017/10/24');
insert into employee values('���빮',2880000,'������','2016/02/27');
insert into employee values('�����',2320000,'�Ｚ','2016/05/24');
insert into employee values('������',1780000,'����','2019/01/09');
insert into employee values('���ҹ�',2900000,'����','2016/10/22');
insert into employee values('���ʿ�',3000000,'SK','2015/10/10');
insert into employee values('���ѱ�',3200000,'������','2015/11/11');
insert into employee values('���ѱ�',2500000,'�Ｚ','2016/12/19');
insert into employee values('¥����',1850000,'����','2018/04/03');
insert into employee values('�̽±�',1900000,'����','2018/01/01');
insert into employee values('������',1790000,'SK','2018/05/02');
insert into employee values('��Ÿ�',2700000,'������','2016/07/20');

-- ����3
select * from employee where salary*12>100000000;
select name,join_company from employee where join_company<'2015/01/01';
select * from employee where salary between 2800000 and 3000000;




--like ��
select * from employee;
select * from employee where name like '��%';
-- ������ �����ϴ� name �˻�
select * from employee where name like '%��';
-- ������ ������ name �˻�
select * from employee where name like '%��%';
-- ��ġ ������� ���� ���Ե� name �˻�


-- order by ; ����
select * from employee order by join_company desc; 
                                        -- ��������
select * from employee order by join_company asc; 
                                        -- ��������
select * from employee order by join_company asc, name desc; 
-- �Ի�⵵ ���� ��������, �ߺ���, name�� ��������


--����3
select * from employee 
 where join_company>='2015/01/01' and salary*12>=60000000;
select * from employee
 where(job='�Ｚ' or job ='����') and salary*12>=50000000; 

-- ����4
select * from employee where name like '%��%' and salary*12>=30000000
 order by job asc, salary desc ; 

