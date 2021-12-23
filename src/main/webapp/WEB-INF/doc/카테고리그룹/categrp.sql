영화관 예약 [카테고리 그룹] 테이블
---------------------------------------------------------------------------------------------------

select * from tab;

DROP TABLE categrp;
CREATE TABLE categrp (
    categrp_no    NUMBER(7,0)  NOT NULL     PRIMARY KEY,
    categrp_name  VARCHAR(30) NOT NULL ,
    visible       CHAR        DEFAULT 'Y'   NOT NULL,
    seqno         NUMBER(7,0) NOT NULL,
    rdate         DATE        NOT NULL
);

COMMENT ON TABLE categrp is '카테고리 그룹';
COMMENT ON COLUMN categrp.categrp_no is '카테고리 그룹 번호 ';
COMMENT ON COLUMN categrp.categrp_name is '이름';
COMMENT ON COLUMN categrp.seqno is '출력 순서';
COMMENT ON COLUMN categrp.visible is '출력 모드';
COMMENT ON COLUMN categrp.rdate is '그룹 생성일';

CREATE SEQUENCE categrp_seq
  START WITH 1                -- 시작 번호
  INCREMENT BY 1            -- 증가값
  MAXVALUE 9999999999    -- 최대값: 9999999999 --> NUMBER(10) 대응
  CACHE 2                       -- 2번은 메모리에서만 계산
  NOCYCLE;           

INSERT INTO categrp (categrp_no, categrp_name, visible, seqno, rdate)
VALUES(categrp_seq.nextval, '영화예매', 'Y', 0, sysdate);

INSERT INTO categrp (categrp_no, categrp_name, visible, seqno, rdate)
VALUES(categrp_seq.nextval, '영화정보', 'Y', 0, sysdate);

INSERT INTO categrp (categrp_no, categrp_name, visible, seqno, rdate)
VALUES(categrp_seq.nextval, '회원가입', 'Y', 0, sysdate);

INSERT INTO categrp (categrp_no, categrp_name, visible, seqno, rdate)
VALUES(categrp_seq.nextval, '마이페이지', 'Y', 3, sysdate);

UPDATE categrp
SET seqno = 1
WHERE categrp_no = 1;

UPDATE categrp
SET seqno = 2
WHERE categrp_no = 3;

UPDATE categrp
SET seqno = 3
WHERE categrp_no = 5;

SELECT * FROM categrp;

DELETE categrp
WHERE categrp_no = 4;
