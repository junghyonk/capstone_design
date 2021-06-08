/**********************************/
/* Table Name: �帣 */
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
  START WITH 1              -- ���� ��ȣ
  INCREMENT BY 1          -- ������
  MAXVALUE 9999999999 -- �ִ밪: 9999999 --> NUMBER(7) ����
  CACHE 2                       -- 2���� �޸𸮿����� ���
  NOCYCLE;                     -- �ٽ� 1���� �����Ǵ� ���� ����


--�߰�  
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
--���
SELECT genreno, name, visible, rdate,cnt
FROM genre
ORDER BY genreno ASC;

-- ��ȸ + ������
SELECT genreno, name, visible, rdate,cnt
FROM genre
WHERE genreno = 2;

-- ����
UPDATE genre
SET name='���� ���',  visible='N'
WHERE genreno = 1;

-- ��ȸ + ������ + ������
SELECT genreno, name,  visible, rdate,cnt
FROM genre
WHERE genreno = 1;

-- ����         
DELETE FROM genre
WHERE genreno = 2;

-- ��� ����� ����
UPDATE genre
SET visible='Y'
WHERE genreno=1;

UPDATE genre
SET visible='N'
WHERE genreno=1;

-- ���� ���� ����
UPDATE genre 
SET cnt = cnt + 1 
WHERE genreno = 1;

UPDATE genre 
SET cnt = cnt - 1 
WHERE genreno = 1;

commit



