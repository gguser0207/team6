drop table cart;
create table cart(
    cartno number(10) not null primary key,
    memberno not null,
    mno not null,
    buy  CHAR(1)
        constraint BUY_VERIFIED_CK
            check (buy = '0' or buy = '1')
        not null,
    foreign key(memberno) references member(memberno)
    on delete cascade,
    foreign key(mno) references movie(mno)
    on delete cascade
);

drop sequence cart_seq;

create sequence cart_seq
    start with 1
    increment by 1
    maxvalue 9999999999
    cache 2
    nocycle;

COMMENT ON TABLE cart is '카트 그룹';
COMMENT ON COLUMN cart.cartno is '카트 그룹 번호 ';
COMMENT ON COLUMN cart.mno is '영화 번호';
COMMENT ON COLUMN cart.memberno is '멤버 번호';

select * from member;
select * from movie;

delete cart;
insert into cart(cartno, memberno, mno, buy) values(cart_seq.nextval, 4, 25, 0);
insert into cart(cartno, memberno, mno, buy) values(cart_seq.nextval, 4, 26, 0);
insert into cart(cartno, memberno, mno, buy) values(cart_seq.nextval, 4, 49, 1);
insert into cart(cartno, memberno, mno, buy) values(cart_seq.nextval, 4, 50, 1);
insert into cart(cartno, memberno, mno, buy) values(cart_seq.nextval, 4, 51, 1);


commit;

select c.cartno, me.nickname, m.title, m.director, m.actor, m.THUMB1 from cart c, member me, movie m
where me.memberno = c.memberno and c.mno = m.mno and c.memberno = 4;

select * from cart;


update cart set buy = '1' where cartno = 111;
commit;
