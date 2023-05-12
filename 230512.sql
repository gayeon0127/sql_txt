CREATE TABLE membership(
    m_id       VARCHAR2(20)    NOT NULL, 
    m_pw       VARCHAR2(20)    NULL, 
    m_name     VARCHAR2(20)    NULL, 
    m_addrr    VARCHAR2(20)    NULL, 
     PRIMARY KEY (m_id)
);

CREATE TABLE board(
    b_num        INT             NOT NULL, 
    b_id         VARCHAR2(20)    NULL, 
    b_title      VARCHAR2(20)    NULL, 
    b_content    VARCHAR2(20)    NULL, 
    b_date       DATE            NULL, 
     PRIMARY KEY (b_num)
);

-- Auto Increment를 위한 Sequence 추가 SQL - board.b_num
CREATE SEQUENCE board_SEQ
START WITH 1
INCREMENT BY 1;

-- Foreign Key 설정 SQL - board(b_id) -> membership(m_id)
ALTER TABLE board
    ADD CONSTRAINT FK_board_b_id_membership_m_id FOREIGN KEY (b_id)
        REFERENCES membership (m_id) ;

insert into membership(m_id,m_pw,m_name,m_addrr)
    values ('aaa','aaa','홍길동','산골짜기');
select * from membership;

insert into board(b_num,b_id,b_title,b_content,b_date)
    values (BOARD_SEQ.nextval,'aaa','제목','내용',sysdate);
select * from board;
delete from board where b_num=2;
-- 중간 번호 삭제시, 마지막 번호에 이어서 번호 증가 

insert into board(b_num,b_id,b_title,b_content,b_date)
    values (BOARD_SEQ.nextval,'ccc','제목','내용',sysdate);
insert into membership(m_id,m_pw,m_name,m_addrr)
    values ('ccc','aaa','홍길동','산골짜기');
-- membership 추가 후 board 추가 가능
    
delete from membership where m_id='ccc';
delete from board where b_id='ccc';
-- 참조키의 경우, board가 먼저 삭제되어야 membership 삭제 가능

-- Foreign Key 삭제 SQL - board(b_id)
ALTER TABLE board
    DROP CONSTRAINT FK_board_b_id_membership_m_id;
    
select * from membership;
select * from board;

insert into board(b_num,b_id,b_title,b_content,b_date)
    values (BOARD_SEQ.nextval,'bbb','제목','내용',sysdate);
insert into membership(m_id,m_pw,m_name,m_addrr)
    values ('bbb','aaa','홍길동','산골짜기');
    
    
ALTER TABLE board
    ADD CONSTRAINT FK_b_id_m_id FOREIGN KEY (b_id)
        REFERENCES membership (m_id) on delete CASCADE;
-- membership의 데이터가 삭제되면 board의 내용도 삭제됨
insert into membership(m_id,m_pw,m_name,m_addrr)
    values ('bbb','aaa','홍길동','산골짜기');
insert into board(b_num,b_id,b_title,b_content,b_date)
    values (BOARD_SEQ.nextval,'bbb','제목','내용',sysdate);
select*from board;
select*from membership;
delete from membership where m_id='bbb';

drop table membership CASCADE CONSTRAINTS;
-- 종속되어 있는 조건을 입력하여 table 삭제
-- 조건 미입력시, 삭제 불가 = 오류 발생



--예제1

-- 테이블 생성 SQL - member
CREATE TABLE member(
    m_id      VARCHAR2(20)    NOT NULL, 
    m_pw      VARCHAR2(20)    NULL, 
    m_name    VARCHAR2(20)    NULL, 
    m_addr    VARCHAR2(20)    NULL, 
     PRIMARY KEY (m_id)
);


-- 테이블 생성 SQL - goods
CREATE TABLE goods(
    g_num          INT             NOT NULL, 
    g_id           VARCHAR2(20)    NULL, 
    g_name         VARCHAR2(20)    NULL, 
    g_price        INT             NULL, 
    g_count        INT             NULL, 
    g_price_num    INT             NULL, 
    g_date         DATE            NULL, 
     PRIMARY KEY (g_num)
);

-- Auto Increment를 위한 Sequence 추가 SQL - goods.g_num
CREATE SEQUENCE goods_SEQ
START WITH 1
INCREMENT BY 1;

-- Foreign Key 설정 SQL - goods(g_id) -> member(m_id)
ALTER TABLE goods
    ADD CONSTRAINT FK_g_id_m_id FOREIGN KEY (g_id)
        REFERENCES member (m_id) ;
        
insert into member(m_id,m_pw,m_name,m_addr) 
    values ('aaa','aaa','홍길동','산골짜기');
insert into member(m_id,m_pw,m_name,m_addr) 
    values ('bbb','bbb','김개똥','개똥별');
insert into member(m_id,m_pw,m_name,m_addr) 
    values ('ccc','ccc','고길동','마포구');
insert into member(m_id,m_pw,m_name,m_addr) 
    values ('ddd','ddd','김말이','분식집');
select * from member;

insert into goods (g_num,g_id,g_name,g_price,g_count,g_price_num,g_date)
 values (goods_SEQ.nextval,'aaa','운동화',75000,2,150000,sysdate);
insert into goods (g_num,g_id,g_name,g_price,g_count,g_price_num,g_date)
 values (goods_SEQ.nextval,'aaa','티셔츠',15000,5,75000,sysdate);
insert into goods (g_num,g_id,g_name,g_price,g_count,g_price_num,g_date)
 values (goods_SEQ.nextval,'bbb','가방',450000,1,450000,sysdate);
insert into goods (g_num,g_id,g_name,g_price,g_count,g_price_num,g_date)
 values (goods_SEQ.nextval,'bbb','책',35000,2,70000,sysdate);
select * from goods;

select M.*, G.* from member M inner join goods G ON M.m_id = G.g_id;
select M.m_id, M.m_name, G.g_name, G.g_price_num 
 from member M inner join goods G ON M.m_id = G.g_id;
select M.m_id, M.m_name, M.m_addr, 
 sum(G.g_price_num) 
 from member M inner join goods G ON M.m_id = G.g_id 
 GROUP BY M.m_id, M.m_name, M.m_addr;