DROP TABLE member; 
 
CREATE TABLE member (
  memberno NUMBER(10) NOT NULL, -- 회원 번호, 레코드를 구분하는 컬럼 
  id             VARCHAR(20)   NOT NULL UNIQUE, -- 아이디, 중복 불가, 레코드를 구분 
  pw      VARCHAR(60)   NOT NULL, -- 패스워드, 영숫자 조합
  nickname      VARCHAR(30)   NOT NULL, -- 성명, 한글 10자 저장 가능
  phone            NUMBER(11)   NOT NULL UNIQUE, -- 전화번호, 중복 불가
  address1    VARCHAR(80)       NOT NULL, -- 주소 1
  address2    VARCHAR(50)       NOT NULL, -- 주소 2
  rdate       DATE             NOT NULL, -- 가입일
  grade        NUMBER(2)     NOT NULL, -- 등급(1~10: 관리자, 11~20: 회원, 비회원: 30~39, 정지 회원: 40~49, 탈퇴 회원: 99)
  PRIMARY KEY (memberno)      
);

COMMENT ON TABLE member is '회원';
COMMENT ON COLUMN member.memberno is '회원 번호';
COMMENT ON COLUMN member.id is '아이디';
COMMENT ON COLUMN member.pw is '패스워드';
COMMENT ON COLUMN member.nickname is '이름';
COMMENT ON COLUMN member.phone is '전화번호';
COMMENT ON COLUMN member.address1 is '주소1';
COMMENT ON COLUMN member.address2 is '주소2';
COMMENT ON COLUMN member.rdate is '가입일';
COMMENT ON COLUMN member.grade is '등급';

DROP SEQUENCE member_seq;

CREATE SEQUENCE member_seq
  START WITH 1              -- 시작 번호
  INCREMENT BY 1          -- 증가값
  MAXVALUE 9999999999 -- 최대값: 9999999999
  CACHE 2                     -- 2번은 메모리에서만 계산
  NOCYCLE;                   -- 다시 1부터 생성되는 것을 방지
  commit;
  
 --등록
INSERT INTO member(memberno, id, pw, nickname, phone, address1, address2, rdate, grade) 
VALUES (member_seq.nextval, 'id1', '1234', '홍길동', 01000000000, '경기도 파주시 OOO로', 'OO동 OO호', sysdate, 1);

INSERT INTO member(memberno, id, pw, nickname, phone, address1, address2, rdate, grade) 
VALUES (member_seq.nextval, 'id2', '5678', '아무개', 01033300000, '서울특별시 강서구 OOO로', 'OO동 OO호', sysdate, 11);

INSERT INTO member(memberno, id, pw, nickname, phone, address1, address2, rdate, grade) 
VALUES (member_seq.nextval, 'id3', '1234', '아무나', 01001000000, '경상남도 OO시 OOO로', 'OO동 OO호', sysdate, 30);
commit;

 -- 조회
SELECT memberno, id, pw, nickname, phone, address1, address2, rdate, grade
FROM MEMBER
WHERE memberno = 1;

SELECT memberno, id, pw, nickname, phone, address1, address2, rdate, grade
FROM MEMBER
WHERE id = 'id1';

--수정
UPDATE MEMBER 
SET name='id2', phone='11111111111', address1='서울 특별시 OO로', address2='OOO동 OOO호', grade=2
WHERE memberno=1;

COMMIT;

--삭제
--모두 삭제
DELETE FROM MEMBER;

--회원 삭제
DELETE FROM MEMBER
WHERE memberno=1;

COMMIT;
