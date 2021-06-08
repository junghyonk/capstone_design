/**********************************/
/* Table Name: 장르 */
/**********************************/
DROP TABLE genre;
CREATE TABLE genre(
		genreno NUMERIC(10) NOT NULL PRIMARY KEY,
		name VARCHAR(50) NOT NULL,
		visible CHAR(1) DEFAULT 'Y' NOT NULL,
		rdate DATE    NOT NULL,
       cnt   NUMBER(10)         DEFAULT 0         NOT NULL
);


DROP SEQUENCE genre_seq;
CREATE SEQUENCE genre_seq
  START WITH 1              -- 시작 번호
  INCREMENT BY 1          -- 증가값
  MAXVALUE 9999999999 -- 최대값: 9999999 --> NUMBER(7) 대응
  CACHE 2                       -- 2번은 메모리에서만 계산
  NOCYCLE;                     -- 다시 1부터 생성되는 것을 방지


--추가  
INSERT INTO genre(genreno,name,visible,rdate,cnt)
VALUES(genre_seq.nextval,'Action','Y',sysdate,0);

INSERT INTO genre(genreno,name,visible,rdate,cnt)
VALUES(genre_seq.nextval,'Comedy','Y',sysdate,0);

INSERT INTO genre(genreno,name,visible,rdate,cnt)
VALUES(genre_seq.nextval,'Drama','Y',sysdate,0);

INSERT INTO genre(genreno,name,visible,rdate,cnt)
VALUES(genre_seq.nextval,'Fantasy','Y',sysdate,0);

INSERT INTO genre(genreno,name,visible,rdate,cnt)
VALUES(genre_seq.nextval,'Horror','Y',sysdate,0);

INSERT INTO genre(genreno,name,visible,rdate,cnt)
VALUES(genre_seq.nextval,'Mystery','Y',sysdate,0);

INSERT INTO genre(genreno,name,visible,rdate,cnt)
VALUES(genre_seq.nextval,'Romance','Y',sysdate,0);

commit
--목록
SELECT genreno, name, visible, rdate,cnt
FROM genre
ORDER BY genreno ASC;

-- 조회 + 수정폼
SELECT genreno, name, visible, rdate,cnt
FROM genre
WHERE genreno = 2;

-- 수정
UPDATE genre
SET name='업무 양식',  visible='N'
WHERE genreno = 1;

-- 조회 + 수정폼 + 삭제폼
SELECT genreno, name,  visible, rdate,cnt
FROM genre
WHERE genreno = 1;

-- 삭제         
DELETE FROM genre
WHERE genreno = 2;

-- 출력 모드의 변경
UPDATE genre
SET visible='Y'
WHERE genreno=1;

UPDATE genre
SET visible='N'
WHERE genreno=1;

-- 개수 증가 감소
UPDATE genre 
SET cnt = cnt + 1 
WHERE genreno = 1;

UPDATE genre 
SET cnt = cnt - 1 
WHERE genreno = 1;

commit



