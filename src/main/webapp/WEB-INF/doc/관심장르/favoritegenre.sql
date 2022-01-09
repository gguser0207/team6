DROP TABLE fgenre CASCADE CONSTRAINTS;
CREATE TABLE fgenre (
    fgenreno                 NUMBER(10) NOT NULL,
  memberno                 NUMBER(10) NOT NULL,
  genreno                 NUMBER(10) NOT NULL,
  rdate         DATE             NOT NULL,
  PRIMARY KEY (fgenreno),
  FOREIGN KEY (memberno) REFERENCES member (memberno),
  FOREIGN KEY (genreno) REFERENCES genre (genreno)
);
 
COMMENT ON TABLE fgenre is '관심  장르';
COMMENT ON COLUMN fgenre.memberno is '회원 번호';
COMMENT ON COLUMN fgenre.genreno is '장르 번호';

DROP SEQUENCE fgenre_seq;
CREATE SEQUENCE fgenre_seq
  START WITH 1              -- 시작 번호
  INCREMENT BY 1          -- 증가값
  MAXVALUE 9999999999 -- 최대값: 9999999999
  CACHE 2                     -- 2번은 메모리에서만 계산
  NOCYCLE;                   -- 다시 1부터 생성되는 것을 방지
commit;
  
INSERT INTO fgenre(fgenreno, memberno, genreno, rdate)
VALUES (fgenre_seq.nextval, 1, 1, sysdate);

SELECT fgenreno, memberno, genreno, rdate
FROM fgenre
WHERE fgenreno = 1;


