/**********************************/
/* Table Name: ������ */
/**********************************/
DROP TABLE attachfile;
DROP TABLE contents CASCADE CONSTRAINTS;
CREATE TABLE contents(
    contentsno                            NUMBER(10)         NOT NULL         PRIMARY KEY,
    genreno                                NUMBER(10)         NOT NULL ,
    title                                 VARCHAR2(300)         NOT NULL,
    content                               CLOB                  NOT NULL,
    recom                                 NUMBER(7)         DEFAULT 0         NOT NULL,
    cnt                                   NUMBER(7)         DEFAULT 0         NOT NULL,
    replycnt                              NUMBER(7)         DEFAULT 0         NOT NULL,
    web                                   VARCHAR2(500)         NULL ,
    youtube                               VARCHAR2(1000)         NULL ,
    grpno                                 NUMBER(8)         DEFAULT 0         NOT NULL,
    indent                                NUMBER(2)         DEFAULT 0         NOT NULL,
    ansnum                                NUMBER(3)         DEFAULT 0         NOT NULL,
    word                                  VARCHAR2(300)         NULL ,
    rdate                                 DATE               NOT NULL,
    file1                                   VARCHAR(100)          NULL,
    thumb1                              VARCHAR(100)          NULL,
    size1                                 NUMBER(10)      DEFAULT 0 NULL,  
    passwd                                VARCHAR2(15)         NOT NULL,
        FOREIGN KEY (genreno) REFERENCES genre (genreno)
);

COMMENT ON TABLE contents is '������';
COMMENT ON COLUMN contents.contentsno is '������ ��ȣ';
COMMENT ON COLUMN contents.genreno is 'ī�װ� ��ȣ';
COMMENT ON COLUMN contents.title is '����';
COMMENT ON COLUMN contents.content is '����';
COMMENT ON COLUMN contents.recom is '��õ��';
COMMENT ON COLUMN contents.cnt is '��ȸ��';
COMMENT ON COLUMN contents.replycnt is '��ۼ�';
COMMENT ON COLUMN contents.web is '���ͳ� �ּ�';
COMMENT ON COLUMN contents.youtube is 'Youtube';
COMMENT ON COLUMN contents. is '��� ���';
COMMENT ON COLUMN contents.passwd is '�н�����';
COMMENT ON COLUMN contents.grpno is '�׷��ȣ';
COMMENT ON COLUMN contents.indent is '�鿩����/�亯����';
COMMENT ON COLUMN contents.ansnum is '�亯����';
COMMENT ON COLUMN contents.word is '�˻���';
COMMENT ON COLUMN contents.rdate is '�����';
COMMENT ON COLUMN contents.file1 is '���� �̹���';
COMMENT ON COLUMN contents.thumb1 is '���� �̹��� Preview';
COMMENT ON COLUMN contents.size1 is ' ���� �̹��� ũ��';

DROP SEQUENCE contents_seq;
CREATE SEQUENCE contents_seq
  START WITH 1              -- ���� ��ȣ
  INCREMENT BY 1          -- ������
  MAXVALUE 9999999999 -- �ִ밪: 9999999 --> NUMBER(7) ����
  CACHE 2                       -- 2���� �޸𸮿����� ���
  NOCYCLE;                     -- �ٽ� 1���� �����Ǵ� ���� ����
  
1) �� ���(�̹��� ���� �÷� �߰�)
-- : 1, genreno: 1�� ������ ����̵Ǿ� �־�� INSERT ����
INSERT INTO contents(contentsno, , genreno, title, content, web, , passwd, word, rdate,
                              file1, thumb1, size1)
VALUES(contents_seq.nextval, 1, 1, '�ű�Ȯ�� 2��', '���� �Ա��˿��� Ȯ��', 'http://www.daum.net',
            '127.0.0.1', '123', '�ڷγ�', sysdate, 'spring.jpg', 'spring_t.jpg', 23657);

INSERT INTO contents(contentsno, , genreno, title, content, web, , passwd, word, rdate,
                              file1, thumb1, size1)
VALUES(contents_seq.nextval, 1, 1, '�ű�Ȯ�� 2��', '���� �Ա��˿��� Ȯ��', 'http://www.daum.net',
            '127.0.0.1', '123', '�ڷγ�', sysdate, 'summer.jpg', 'summer_t.jpg', 23657);
            
INSERT INTO contents(contentsno, , genreno, title, content, web, , passwd, word, rdate,
                              file1, thumb1, size1)
VALUES(contents_seq.nextval, 1, 2, '������', '���� ����', 'http://www.daum.net',
            '127.0.0.1', '123', '�ڷγ�', sysdate, 'le.jpg', 'le_t.jpg', 23657);

COMMIT;

SELECT contentsno, , genreno, title, content, web, , passwd, word, rdate, file1, thumb1, size1
FROM contents 
ORDER BY contentsno ASC;    

-- ���� sequence�� Ȯ��
SELECT contents_seq.nextval FROM dual;
SELECT contents_seq.currval FROM dual;

--2) ��ü���
SELECT contentsno, , genreno, title, content, web, , passwd, word, rdate, file1, thumb1, size1 
FROM contents 
ORDER BY contentsno DESC;

--2-1) contentsno�� ���
SELECT contentsno, genreno, title, content, web,  passwd, word, rdate, file1, thumb1, size1
FROM contents 
WHERE contentsno = 6


--2-1) genreno�� ���
SELECT contentsno, , genreno, title, content, web, , passwd, word, rdate, file1, thumb1, size1
FROM contents 
WHERE genreno = 1
ORDER BY contentsno DESC;

2-2) genreno�� �˻� ���
1) �˻�
�� genreno�� �˻� ���
SELECT contentsno, , genreno, title, content, 
           recom, cnt, replycnt, rdate, word, file1, thumb1, size1
FROM contents
WHERE genreno=4 AND word LIKE '%������%'
ORDER BY contentsno DESC;

SELECT contentsno, , genreno, title, content, 
           recom, cnt, replycnt, rdate, word, file1, thumb1, size1
FROM contents
WHERE genreno=4 AND word LIKE '%���ǽ�%'
ORDER BY contentsno DESC;

SELECT contentsno, , genreno, title, content, 
           recom, cnt, replycnt, rdate, word, file1, thumb1, size1
FROM contents
WHERE genreno=4 AND word LIKE '%���ǽ�%'
ORDER BY contentsno DESC;

SELECT contentsno, , genreno, title, content, 
           recom, cnt, replycnt, rdate, word, file1, thumb1, size1
FROM contents
WHERE genreno=4 AND word LIKE '%swiss%'
ORDER BY contentsno DESC;

SELECT contentsno, , genreno, title, content, 
           recom, cnt, replycnt, rdate, word, file1, thumb1, size1
FROM contents
WHERE genreno=4 AND word LIKE '%����%'
ORDER BY contentsno DESC;

-- title, content, word column search
SELECT contentsno, , genreno, title, content, 
           recom, cnt, replycnt, rdate, word, file1, thumb1, size1
FROM contents
WHERE genreno=4 AND (title LIKE '%����%' OR content LIKE '%����%' OR word LIKE '%����%')
ORDER BY contentsno DESC;


�� �˻� ���ڵ� ����
-- ��ü ���ڵ� ����
SELECT COUNT(*) as cnt
FROM contents
WHERE genreno=4;

-- genreno �� �˻��� ���ڵ� ����
SELECT COUNT(*) as cnt
FROM contents
WHERE genreno=4 AND word LIKE '%������%';

SELECT COUNT(*) as cnt
FROM contents
WHERE genreno=4 AND (title LIKE '%����%' OR content LIKE '%����%' OR word LIKE '%����%')


3) 1�� ��ȸ
SELECT contentsno, , genreno, title, content, recom, web, , youtube, , , , passwd,
          word, rdate, file1, thumb1, size1
FROM contents
WHERE contentsno = 1;

4) ����
UPDATE contents 
SET title='����', content='����', web='http://', word='�˻���'
WHERE contentsno = 5;

COMMIT;

5) �н����� �˻�
SELECT COUNT(*) as passwd_cnt
FROM contents
WHERE contentsno=5 AND passwd='1234';

SELECT contentsno, passwd
FROM contents 
ORDER BY contentsno DESC;    

6) ����
-- ��ü ���ڵ� ����
DELETE FROM contents;
COMMIT;  

DELETE FROM contents
WHERE contentsno=13;

COMMIT;  


7) ��� ���ڵ� ����
SELECT COUNT(*) as cnt
FROM contents;
 
 COUNT
 -----
     5
     
8) Ư�� ȸ���� �ۼ��� �۸� ���: cate + contents + member
SELECT c.genreno as c_genreno, c.name as c_name, c.rdate as c_rdate,
          t.contentsno as t_contentsno, t.title as t_title, t.web as t_web, t. as t_, t.rdate as t_rdate,
          m. as m_, m.mname as m_mname          
FROM cate c, contents t, member m
WHERE c.genreno = t.genreno AND t. = m. AND m. = 1
ORDER BY c.genreno ASC, t.contentsno DESC;

-- ANSI
SELECT c.genreno as c_genreno, c.name as c_name, c.rdate as c_rdate,
          t.contentsno as t_contentsno, t.title as t_title, t.web as t_web, t. as t_, t.rdate as t_rdate,
          m. as m_, m.mname as m_mname          
FROM cate c
INNER JOIN contents t
ON c.genreno = c.genreno
INNER JOIN member m
ON t. = m.
WHERE m. = 1
ORDER BY c.genreno ASC, t.contentsno DESC;

-- Ư�� ȸ���� �� ����� ���� cate, contents join
SELECT c.genreno as c_genreno, c.name as c_name, c.rdate as c_rdate,
          t.contentsno as t_contentsno, t.title as t_title, t.web as t_web, t. as t_, t.rdate as t_rdate        
FROM cate c, contents t, member m
WHERE c.genreno = t.genreno AND t. = m. AND m. = 1
ORDER BY c.genreno ASC, t.contentsno DESC;

9) 
--                                    VARCHAR2(1000)         NULL ,
UPDATE contents
SET ='��â ������ ����'
WHERE contentsno=1 AND passwd='123'; 
  
SELECT contentsno, , genreno, web, 
FROM contents 
ORDER BY contentsno ASC;    

SELECT contentsno, , genreno, web, 
FROM contents 
WHERE contentsno=11;    

10) Youtube
--                                    VARCHAR2(1000)         NULL ,
UPDATE contents
SET youtube='youtube URL'
WHERE contentsno=13 AND passwd='123'; 

SELECT contentsno, , genreno, web, , youtube
FROM contents 
WHERE contentsno=1 

11) 
UPDATE contents
SET =' file name'
WHERE contentsno=1 AND passwd='123'; 
  
SELECT contentsno, , genreno, web, , youtube, 
FROM contents 
ORDER BY contentsno ASC;

12) ÷�� ���� ����(���, ����, ����, ����)
UPDATE contents
SET file1='file name', thumb1='thumb file name', size1=5000
WHERE contentsno=7; 
  
SELECT contentsno, , genreno, file1, thumb1, size1
FROM contents 
ORDER BY contentsno ASC; 

COMMIT;

13) �˻� + ����¡ + ���� �̹���
-- step 1
SELECT contentsno, , genreno, title, content, recom, cnt, replycnt, rdate, word, ,
          file1, thumb1, size1
FROM contents
WHERE genreno=27 AND word LIKE '%��ǳ%'
ORDER BY contentsno DESC;

-- step 2
SELECT contentsno, , genreno, title, content, recom, cnt, replycnt, rdate, word, ,
          file1, thumb1, size1, rownum as r
FROM (
          SELECT contentsno, , genreno, title, content, recom, cnt, replycnt, rdate, word, ,
                    file1, thumb1, size1
          FROM contents
          WHERE genreno=27 AND word LIKE '%��ǳ%'
          ORDER BY contentsno DESC
);

-- step 3, 1 page
SELECT contentsno, , genreno, title, content, recom, cnt, replycnt, rdate, word, ,
          file1, thumb1, size1, r
FROM (
           SELECT contentsno, , genreno, title, content, recom, cnt, replycnt, rdate, word, ,
                     file1, thumb1, size1, rownum as r
           FROM (
                     SELECT contentsno, , genreno, title, content, recom, cnt, replycnt, rdate, word, ,
                               file1, thumb1, size1
                     FROM contents
                     WHERE genreno=27 AND word LIKE '%��ǳ%'
                     ORDER BY contentsno DESC
           )          
)
WHERE r >= 1 AND r <= 10;

-- step 3, 2 page
SELECT contentsno, , genreno, title, content, recom, cnt, replycnt, rdate, word, ,
          file1, thumb1, size1, r
FROM (
           SELECT contentsno, , genreno, title, content, recom, cnt, replycnt, rdate, word, ,
                     file1, thumb1, size1, rownum as r
           FROM (
                     SELECT contentsno, , genreno, title, content, recom, cnt, replycnt, rdate, word, ,
                               file1, thumb1, size1
                     FROM contents
                     WHERE genreno=27 AND word LIKE '%��ǳ%'
                     ORDER BY contentsno DESC
           )          
)
WHERE r >= 11 AND r <= 20;


----------------------------------------------------------------------------------------------
�亯 ���� ����
----------------------------------------------------------------------------------------------
-- 1���� ���� �亯 ��Ͽ�: grpno: 1, indent: 1, ansnum: 1
SELECT * FROM member;
SELECT * FROM categrp;
SELECT * FROM genreno;

DROP TABLE contents  CASCADE CONSTRAINTS;

1) ��� ����
- grpno: ���Ӱ� ���� ����ϸ� �ϳ��� �ű� �׷��� ������, (SELECT NVL(MAX(grpno), 0) + 1 FROM contents), 0, 0)
- indent: �鿩 ����, n�� �亯�� ���� ȿ��
- ansnum: �亯 ���� ����
INSERT INTO contents(contentsno, , genreno, title, content, web, , passwd, word, rdate,
                              file1, thumb1, size1,
                              grpno, indent, ansnum)
VALUES(contents_seq.nextval, 1, 1, '�ű�Ȯ�� 2��', '���� �Ա��˿��� Ȯ��', 'http://www.daum.net',
           '127.0.0.1', '123', '�ڷγ�', sysdate, 'spring.jpg', 'spring_t.jpg', 23657,
           (SELECT NVL(MAX(grpno), 0) + 1 FROM contents), 0, 0);
            
2) 1�� ��ȸ ����
SELECT contentsno, , genreno, title, content, recom, web,
          , youtube, , , , passwd, word, rdate,
          file1, thumb1, size1, grpno, indent, ansnum
FROM contents
WHERE contentsno = 1;

3) ���ο� �亯�� �ֽ����� ����ϱ����� ���� �亯�� �ڷ� �̷�ϴ�.
-- ��� ���� �켱 ������ 1�� ������, 1�� -> 2��
UPDATE contents
SET ansnum = ansnum + 1
WHERE grpno = 1 AND ansnum > 0;
 
-- 2����� �켱 ������ 1�� ������, 2�� -> 3��
UPDATE contents
SET ansnum = ansnum + 1
WHERE grpno = 1 AND ansnum > 1;
 
-- 3����� �켱 ������ 1�� ������, 3�� -> 4��
UPDATE contents
SET ansnum = ansnum + 1
WHERE grpno = 1 AND ansnum > 2;
 
-- 6����� �켱 ������ 1�� ������, 6�� -> 7��
UPDATE contents
SET ansnum = ansnum + 1
WHERE grpno = 1 AND ansnum > 5;
 
 
4) �亯 ���
- genrenono: FK, mno: FK
 
INSERT INTO contents(contentsno,
                          genreno, mno, title, content, web, , passwd, good, thumbs, files, sizes, cnt, replycnt, rdate, 
                          grpno, indent, ansnum, word)  
VALUES((SELECT NVL(MAX(contentsno), 0) + 1 as contentsno FROM contents),
            1, 1, '����', '����','�ּ�','172.0.0.1','1234', 0, 'summer_m.jpg', 'summer.jpg', 0, 0, 0, sysdate,
            1, 1, 1,'');
 
 
5) �亯�� ���� ���� ���� ����    
-- ORDER BY grpno DESC, ansnum ASC
SELECT contentsno, , genreno, title, content, recom, cnt, replycnt, rdate, word, ,
          file1, thumb1, size1,
          grpno, indent, ansnum, r
FROM (
           SELECT contentsno, , genreno, title, content, recom, cnt, replycnt, rdate, word, ,
                     file1, thumb1, size1,
                     grpno, indent, ansnum, rownum as r
           FROM (
                     SELECT contentsno, , genreno, title, content, recom, cnt, replycnt, rdate, word, ,
                               file1, thumb1, size1,
                               grpno, indent, ansnum
                     FROM contents
                     WHERE genreno=29 AND (title LIKE '%swiss%' OR content LIKE '%swiss%' OR word LIKE '%swiss%')
                     ORDER BY grpno DESC, ansnum ASC
           )          
)
WHERE r >= 1 AND r <= 10;        
   
----------------------------------------------------------------------------------------------
�亯 ���� ����
----------------------------------------------------------------------------------------------

----------------------------------------------------------------------------------------------
�亯 + member join start
----------------------------------------------------------------------------------------------
SELECT c.contentsno, c., c.genreno, m.id
FROM contents c, member m
WHERE c. = m.;

CONTENTSNO        genreno ID                  
---------- ---------- ---------- --------------------
        35          3                  27        user1               
        40          3                  27        user1               
        41          3                  27        user1               
        42          3                  27        user1       

-- 2���� �÷��� �ߺ��Ǵ°��� as�� ����Ͽ� �÷����� ����, id�� mid�� ����
SELECT contentsno, , genreno, title, content, recom, cnt, replycnt, rdate, word, ,
          file1, thumb1, size1, grpno, indent, ansnum, mid, r
FROM (
           SELECT contentsno, , genreno, title, content, recom, cnt, replycnt, rdate, word, ,
                     file1, thumb1, size1, grpno, indent, ansnum, mid, rownum as r
           FROM (
                     SELECT c.contentsno, c., c.genreno, c.title, c.content, c.recom, c.cnt, c.replycnt, c.rdate, c.word, c.,
                               c.file1, c.thumb1, c.size1, c.grpno, c.indent, c.ansnum,
                               m.id as mid
                     FROM contents c, member m
                     WHERE genreno=29 
                               AND c. = m. 
                               AND (title LIKE '%swiss%' OR content LIKE '%swiss%' OR word LIKE '%swiss%')
                     ORDER BY grpno DESC, ansnum ASC
           )          
)
WHERE r >= 1 AND r <= 10;        
   
----------------------------------------------------------------------------------------------
�亯 + member join end
----------------------------------------------------------------------------------------------


1) ��ۼ� ����
UPDATE contents
SET replycnt = replycnt + 1
WHERE contentsno = 1;

2) ��ۼ� ����
UPDATE contents
SET replycnt = replycnt - 1
WHERE contentsno = 1;   







  
  