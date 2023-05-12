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

-- Auto Increment�� ���� Sequence �߰� SQL - board.b_num
CREATE SEQUENCE board_SEQ
START WITH 1
INCREMENT BY 1;

-- Foreign Key ���� SQL - board(b_id) -> membership(m_id)
ALTER TABLE board
    ADD CONSTRAINT FK_board_b_id_membership_m_id FOREIGN KEY (b_id)
        REFERENCES membership (m_id) ;

insert into membership(m_id,m_pw,m_name,m_addrr)
    values ('aaa','aaa','ȫ�浿','���¥��');
select * from membership;

insert into board(b_num,b_id,b_title,b_content,b_date)
    values (BOARD_SEQ.nextval,'aaa','����','����',sysdate);
select * from board;
delete from board where b_num=2;
-- �߰� ��ȣ ������, ������ ��ȣ�� �̾ ��ȣ ���� 

insert into board(b_num,b_id,b_title,b_content,b_date)
    values (BOARD_SEQ.nextval,'ccc','����','����',sysdate);
insert into membership(m_id,m_pw,m_name,m_addrr)
    values ('ccc','aaa','ȫ�浿','���¥��');
-- membership �߰� �� board �߰� ����
    
delete from membership where m_id='ccc';
delete from board where b_id='ccc';
-- ����Ű�� ���, board�� ���� �����Ǿ�� membership ���� ����

-- Foreign Key ���� SQL - board(b_id)
ALTER TABLE board
    DROP CONSTRAINT FK_board_b_id_membership_m_id;
    
select * from membership;
select * from board;

insert into board(b_num,b_id,b_title,b_content,b_date)
    values (BOARD_SEQ.nextval,'bbb','����','����',sysdate);
insert into membership(m_id,m_pw,m_name,m_addrr)
    values ('bbb','aaa','ȫ�浿','���¥��');
    
    
ALTER TABLE board
    ADD CONSTRAINT FK_b_id_m_id FOREIGN KEY (b_id)
        REFERENCES membership (m_id) on delete CASCADE;
-- membership�� �����Ͱ� �����Ǹ� board�� ���뵵 ������
insert into membership(m_id,m_pw,m_name,m_addrr)
    values ('bbb','aaa','ȫ�浿','���¥��');
insert into board(b_num,b_id,b_title,b_content,b_date)
    values (BOARD_SEQ.nextval,'bbb','����','����',sysdate);
select*from board;
select*from membership;
delete from membership where m_id='bbb';

drop table membership CASCADE CONSTRAINTS;
-- ���ӵǾ� �ִ� ������ �Է��Ͽ� table ����
-- ���� ���Է½�, ���� �Ұ� = ���� �߻�



--����1

-- ���̺� ���� SQL - member
CREATE TABLE member(
    m_id      VARCHAR2(20)    NOT NULL, 
    m_pw      VARCHAR2(20)    NULL, 
    m_name    VARCHAR2(20)    NULL, 
    m_addr    VARCHAR2(20)    NULL, 
     PRIMARY KEY (m_id)
);


-- ���̺� ���� SQL - goods
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

-- Auto Increment�� ���� Sequence �߰� SQL - goods.g_num
CREATE SEQUENCE goods_SEQ
START WITH 1
INCREMENT BY 1;

-- Foreign Key ���� SQL - goods(g_id) -> member(m_id)
ALTER TABLE goods
    ADD CONSTRAINT FK_g_id_m_id FOREIGN KEY (g_id)
        REFERENCES member (m_id) ;
        
insert into member(m_id,m_pw,m_name,m_addr) 
    values ('aaa','aaa','ȫ�浿','���¥��');
insert into member(m_id,m_pw,m_name,m_addr) 
    values ('bbb','bbb','�谳��','���˺�');
insert into member(m_id,m_pw,m_name,m_addr) 
    values ('ccc','ccc','��浿','������');
insert into member(m_id,m_pw,m_name,m_addr) 
    values ('ddd','ddd','�踻��','�н���');
select * from member;

insert into goods (g_num,g_id,g_name,g_price,g_count,g_price_num,g_date)
 values (goods_SEQ.nextval,'aaa','�ȭ',75000,2,150000,sysdate);
insert into goods (g_num,g_id,g_name,g_price,g_count,g_price_num,g_date)
 values (goods_SEQ.nextval,'aaa','Ƽ����',15000,5,75000,sysdate);
insert into goods (g_num,g_id,g_name,g_price,g_count,g_price_num,g_date)
 values (goods_SEQ.nextval,'bbb','����',450000,1,450000,sysdate);
insert into goods (g_num,g_id,g_name,g_price,g_count,g_price_num,g_date)
 values (goods_SEQ.nextval,'bbb','å',35000,2,70000,sysdate);
select * from goods;

select M.*, G.* from member M inner join goods G ON M.m_id = G.g_id;
select M.m_id, M.m_name, G.g_name, G.g_price_num 
 from member M inner join goods G ON M.m_id = G.g_id;
select M.m_id, M.m_name, M.m_addr, 
 sum(G.g_price_num) 
 from member M inner join goods G ON M.m_id = G.g_id 
 GROUP BY M.m_id, M.m_name, M.m_addr;