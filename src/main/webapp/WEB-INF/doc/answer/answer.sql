/**********************************/
/* Table Name: �亯 ���� */
/**********************************/
DROP TABLE answer CASCADE CONSTRAINTS;
CREATE TABLE answer (
        answerno                            NUMBER(10)         NOT NULL         PRIMARY KEY,
        title                                 VARCHAR2(50)         NOT NULL,
        grpno                                 NUMBER(8)         DEFAULT 0         NOT NULL,
        indent                                NUMBER(2)         DEFAULT 0         NOT NULL,
        ansnum                                NUMBER(3)         DEFAULT 0         NOT NULL
);

COMMENT ON TABLE contents is '�亯 ����';
COMMENT ON COLUMN contents.answerno is '�亯 ���� ��ȣ';
COMMENT ON COLUMN contents.title is '����';
COMMENT ON COLUMN contents.grpno is '�׷��ȣ';
COMMENT ON COLUMN contents.indent is '�鿩����/�亯����';
COMMENT ON COLUMN contents.ansnum is '�亯����';

DROP SEQUENCE answer_seq;
CREATE SEQUENCE answer_seq
  START WITH 1              -- ���� ��ȣ
  INCREMENT BY 1          -- ������
  MAXVALUE 9999999999 -- �ִ밪: 9999999 --> NUMBER(7) ����
  CACHE 2                       -- 2���� �޸𸮿����� ���
  NOCYCLE;                     -- �ٽ� 1���� �����Ǵ� ���� ����
  

INSERT INTO answer(answerno, title, grpno, indent, ansnum) VALUES(answer_seq.nextval, '�θ��1', 1,0,0);
commit;

SELECT title, grpno, indent, ansnum FROM answer ORDER BY answerno DESC;

TITLE                                                   GRPNO     INDENT     ANSNUM
-------------------------------------------------- ---------- ---------- ----------
�θ��1                                                     1          0          0

SELECT lpad(ansnum, (ansnum*3), '*') || title || ' / ' || grpno || ' / ' ||  indent || ' / ' ||  ansnum as list 
FROM answer ORDER BY answerno DESC;

�θ��1 / 1 / 0 / 0

INSERT INTO answer(answerno, title, grpno, indent, ansnum) VALUES(answer_seq.nextval, '�θ��2', 2,0,0);

SELECT lpad(ansnum, (ansnum*3), '*') || title || ' / ' || grpno || ' / ' ||  indent || ' / ' ||  ansnum as list 
FROM answer ORDER BY answerno DESC;

�θ��2 / 2 / 0 / 0
�θ��1 / 1 / 0 / 0

INSERT INTO answer(answerno, title, grpno, indent, ansnum) VALUES(answer_seq.nextval, '�θ��3', 3,0,0);

SELECT lpad(ansnum, (ansnum*3), '*') || title || ' / ' || grpno || ' / ' ||  indent || ' / ' ||  ansnum as list 
FROM answer ORDER BY answerno DESC;

�θ��3 / 3 / 0 / 0
�θ��2 / 2 / 0 / 0
�θ��1 / 1 / 0 / 0

��Ģ 1: ���ο� ��(�θ��)�� ����� ��� grpno = grpno + 1
          (SELECT NVL(MAX(grpno), 0) + 1 FROM contents)

��Ģ 2: �亯
INSERT INTO answer(answerno, title, grpno, indent, ansnum) VALUES(answer_seq.nextval, '�θ��3�� �亯1', 3,1,1);

SELECT lpad(' ', (indent*5), ' ') || title || ' / ' || grpno || ' / ' ||  indent || ' / ' ||  ansnum as list 
FROM answer ORDER BY grpno DESC, ansnum ASC;

�θ��3 / 3 / 0 / 0
     �θ��3�� �亯1 / 3 / 1 / 1
�θ��2 / 2 / 0 / 0
�θ��1 / 1 / 0 / 0

INSERT INTO answer(answerno, title, grpno, indent, ansnum) VALUES(answer_seq.nextval, '�θ��3�� �亯2', 3,1,2);

SELECT lpad(' ', (indent*5), ' ') || title || ' / ' || grpno || ' / ' ||  indent || ' / ' ||  ansnum as list 
FROM answer ORDER BY grpno DESC, ansnum ASC;

�θ��3 / 3 / 0 / 0
     �θ��3�� �亯1 / 3 / 1 / 1
     �θ��3�� �亯2 / 3 / 1 / 2
�θ��2 / 2 / 0 / 0
�θ��1 / 1 / 0 / 0

INSERT INTO answer(answerno, title, grpno, indent, ansnum) VALUES(answer_seq.nextval, '�θ��3�� �亯3', 3,1,3);

SELECT lpad(' ', (indent*5), ' ') || title || ' / ' || grpno || ' / ' ||  indent || ' / ' ||  ansnum as list 
FROM answer ORDER BY grpno DESC, ansnum ASC;

�θ��3 / 3 / 0 / 0
     �θ��3�� �亯1 / 3 / 1 / 1
     �θ��3�� �亯2 / 3 / 1 / 2
     �θ��3�� �亯3 / 3 / 1 / 3
�θ��2 / 2 / 0 / 0
�θ��1 / 1 / 0 / 0

�Ϲ������� �ֽ� �亯�� ���� ������� ����
DELETE FROM answer;
COMMIT;

INSERT INTO answer(answerno, title, grpno, indent, ansnum) VALUES(answer_seq.nextval, '�θ��1', 1,0,0);
INSERT INTO answer(answerno, title, grpno, indent, ansnum) VALUES(answer_seq.nextval, '�θ��2', 2,0,0);
INSERT INTO answer(answerno, title, grpno, indent, ansnum) VALUES(answer_seq.nextval, '�θ��3', 3,0,0);

SELECT lpad(' ', (indent*5), ' ') || title || ' / ' || grpno || ' / ' ||  indent || ' / ' ||  ansnum as list 
FROM answer ORDER BY grpno DESC, ansnum ASC;

�θ��3 / 3 / 0 / 0
�θ��2 / 2 / 0 / 0
�θ��1 / 1 / 0 / 0

������ �θ�ۿ� ���� �ڽĵ��߿� �亯�� �߰��Ǹ� �亯�� �߰��ϴ� �θ� �ٷ� �ڿ� ��µǵ��� ansnum�� update
UPDATE answer
SET ansnum = ansnum + 1
WHERE grpno = 3 AND ansnum > 0;

INSERT INTO answer(answerno, title, grpno, indent, ansnum) VALUES(answer_seq.nextval, '�θ��3�� �亯1', 3,1,1);

SELECT lpad(' ', (indent*5), ' ') || title || ' / ' || grpno || ' / ' ||  indent || ' / ' ||  ansnum as list 
FROM answer ORDER BY grpno DESC, ansnum ASC;

�θ��3 / 3 / 0 / 0
     �θ��3�� �亯1 / 3 / 1 / 1
�θ��2 / 2 / 0 / 0
�θ��1 / 1 / 0 / 0

UPDATE answer
SET ansnum = ansnum + 1
WHERE grpno = 3 AND ansnum > 0;

INSERT INTO answer(answerno, title, grpno, indent, ansnum) VALUES(answer_seq.nextval, '�θ��3�� �亯2', 3,1,1);

SELECT lpad(' ', (indent*5), ' ') || title || ' / ' || grpno || ' / ' ||  indent || ' / ' ||  ansnum as list 
FROM answer ORDER BY grpno DESC, ansnum ASC;

�θ��3 / 3 / 0 / 0
     �θ��3�� �亯2 / 3 / 1 / 1
     �θ��3�� �亯1 / 3 / 1 / 2
�θ��2 / 2 / 0 / 0
�θ��1 / 1 / 0 / 0

UPDATE answer
SET ansnum = ansnum + 1
WHERE grpno = 3 AND ansnum > 0;

INSERT INTO answer(answerno, title, grpno, indent, ansnum) VALUES(answer_seq.nextval, '�θ��3�� �亯3', 3,1,1);

SELECT lpad(' ', (indent*5), ' ') || title || ' / ' || grpno || ' / ' ||  indent || ' / ' ||  ansnum as list 
FROM answer ORDER BY grpno DESC, ansnum ASC;

�θ��3 / 3 / 0 / 0
     �θ��3�� �亯3 / 3 / 1 / 1
     �θ��3�� �亯2 / 3 / 1 / 2
     �θ��3�� �亯1 / 3 / 1 / 3
�θ��2 / 2 / 0 / 0
�θ��1 / 1 / 0 / 0

UPDATE answer
SET ansnum = ansnum + 1
WHERE grpno = 3 AND ansnum > 1; -- 1���� �θ������� 1�� �������� ��.

INSERT INTO answer(answerno, title, grpno, indent, ansnum) VALUES(answer_seq.nextval, '�θ��3�� �亯3�� �亯1', 3,2,2);

SELECT lpad(' ', (indent*5), ' ') || title || ' / ' || grpno || ' / ' ||  indent || ' / ' ||  ansnum as list 
FROM answer ORDER BY grpno DESC, ansnum ASC;

�θ��3 / 3 / 0 / 0
     �θ��3�� �亯3 / 3 / 1 / 1
          �θ��3�� �亯3�� �亯1 / 3 / 2 / 2
     �θ��3�� �亯2 / 3 / 1 / 3
     �θ��3�� �亯1 / 3 / 1 / 4
�θ��2 / 2 / 0 / 0
�θ��1 / 1 / 0 / 0