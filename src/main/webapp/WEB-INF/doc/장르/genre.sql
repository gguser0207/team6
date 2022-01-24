DROP TABLE genre CASCADE CONSTRAINTS;
CREATE TABLE genre (
  genreno                 NUMBER(10) NOT NULL,
  genrename             VARCHAR(20) NOT NULL,
  PRIMARY KEY (genreno)      
);
 
COMMENT ON TABLE genre is '장르';
COMMENT ON COLUMN genre.genreno is '장르 번호';
COMMENT ON COLUMN genre.genrename is '장르명';

DROP SEQUENCE genre_seq;
CREATE SEQUENCE genre_seq
  START WITH 1              -- 시작 번호
  INCREMENT BY 1          -- 증가값
  MAXVALUE 9999999999 -- 최대값: 9999999999
  CACHE 2                     -- 2번은 메모리에서만 계산
  NOCYCLE;                   -- 다시 1부터 생성되는 것을 방지
commit;

INSERT INTO genre(genreno, genrename)
VALUES (genre_seq.nextval , 'SF');

INSERT INTO genre(genreno, genrename)
VALUES (genre_seq.nextval , '공포');

INSERT INTO genre(genreno, genrename)
VALUES (genre_seq.nextval , '멜로/로맨스');

INSERT INTO genre(genreno, genrename)
VALUES (genre_seq.nextval , '액션');

INSERT INTO genre(genreno, genrename)
VALUES (genre_seq.nextval , '코메디');

INSERT INTO genre(genreno, genrename)
VALUES (genre_seq.nextval , '드라마');

INSERT INTO genre(genreno, genrename)
VALUES (genre_seq.nextval , '시대극/사극');

SELECT genreno, genrename
FROM genre
WHERE genreno = 1;

SELECT genreno, genrename
FROM genre;

SELECT genreno, genrename
FROM genre
WHERE genrename = '코메디';

DELETE FROM genre 
WHERE  genreno = 5;
