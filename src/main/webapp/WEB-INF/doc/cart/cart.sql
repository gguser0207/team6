create table cart(
    cartno number(10) not null primary key,
    memberno not null,
    mno not null,
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

COMMENT ON TABLE cart is 'īƮ �׷�';
COMMENT ON COLUMN cart.cartno is 'īƮ �׷� ��ȣ ';
COMMENT ON COLUMN cart.mno is '��ȭ ��ȣ';
COMMENT ON COLUMN cart.memberno is '��� ��ȣ';

select * from member;
select * from movie;

insert into cart(cartno, memberno, mno) values(cart_seq.nextval, 4, 6);
insert into cart(cartno, memberno, mno) values(cart_seq.nextval, 4, 8);
insert into cart(cartno, memberno, mno) values(cart_seq.nextval, 5, 6);
insert into cart(cartno, memberno, mno) values(cart_seq.nextval, 6, 6);

commit;

select c.cartno, me.nickname, m.title, m.director, m.actor  from cart c, member me, movie m
where me.memberno = c.memberno and c.mno = m.mno and c.memberno = 4;