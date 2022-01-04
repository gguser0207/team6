DROP TABLE cart CASCADE CONSTRAINTS;
CREATE TABLE cart (
                      cartno                        NUMBER(10) NOT NULL PRIMARY KEY,
                      movieno                 NUMBER(10) NULL ,
                      memberno                 NUMBER(10) NOT NULL,
                      cnt                            NUMBER(10) DEFAULT 0 NOT NULL,
                      rdate                          DATE NOT NULL,
                      FOREIGN KEY (movieno) REFERENCES movie (mno),
                      FOREIGN KEY (memberno) REFERENCES member (memberno)
);

CREATE SEQUENCE cart_seq
    START WITH 1              -- 시작 번호
    INCREMENT BY 1          -- 증가값
    MAXVALUE 9999999999 -- 최대값: 9999999999
    CACHE 2                     -- 2번은 메모리에서만 계산
    NOCYCLE;

COMMENT ON TABLE cart is '카트 그룹';
COMMENT ON COLUMN cart.cartno is '카트 그룹 번호 ';
COMMENT ON COLUMN cart.movieno is '영화 번호';
COMMENT ON COLUMN cart.memberno is '멤버 번호';
COMMENT ON COLUMN cart.cnt is '수';
COMMENT ON COLUMN cart.rdate is '찜목록 저장일';