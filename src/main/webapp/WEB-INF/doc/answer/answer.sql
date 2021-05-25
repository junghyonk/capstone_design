/**********************************/
/* Table Name: 답변 원리 */
/**********************************/
DROP TABLE answer CASCADE CONSTRAINTS;
CREATE TABLE answer (
        answerno                            NUMBER(10)         NOT NULL         PRIMARY KEY,
        title                                 VARCHAR2(50)         NOT NULL,
        grpno                                 NUMBER(8)         DEFAULT 0         NOT NULL,
        indent                                NUMBER(2)         DEFAULT 0         NOT NULL,
        ansnum                                NUMBER(3)         DEFAULT 0         NOT NULL
);

COMMENT ON TABLE contents is '답변 원리';
COMMENT ON COLUMN contents.answerno is '답변 원리 번호';
COMMENT ON COLUMN contents.title is '제목';
COMMENT ON COLUMN contents.grpno is '그룹번호';
COMMENT ON COLUMN contents.indent is '들여쓰기/답변차수';
COMMENT ON COLUMN contents.ansnum is '답변순서';

DROP SEQUENCE answer_seq;
CREATE SEQUENCE answer_seq
  START WITH 1              -- 시작 번호
  INCREMENT BY 1          -- 증가값
  MAXVALUE 9999999999 -- 최대값: 9999999 --> NUMBER(7) 대응
  CACHE 2                       -- 2번은 메모리에서만 계산
  NOCYCLE;                     -- 다시 1부터 생성되는 것을 방지
  

INSERT INTO answer(answerno, title, grpno, indent, ansnum) VALUES(answer_seq.nextval, '부모글1', 1,0,0);
commit;

SELECT title, grpno, indent, ansnum FROM answer ORDER BY answerno DESC;

TITLE                                                   GRPNO     INDENT     ANSNUM
-------------------------------------------------- ---------- ---------- ----------
부모글1                                                     1          0          0

SELECT lpad(ansnum, (ansnum*3), '*') || title || ' / ' || grpno || ' / ' ||  indent || ' / ' ||  ansnum as list 
FROM answer ORDER BY answerno DESC;

부모글1 / 1 / 0 / 0

INSERT INTO answer(answerno, title, grpno, indent, ansnum) VALUES(answer_seq.nextval, '부모글2', 2,0,0);

SELECT lpad(ansnum, (ansnum*3), '*') || title || ' / ' || grpno || ' / ' ||  indent || ' / ' ||  ansnum as list 
FROM answer ORDER BY answerno DESC;

부모글2 / 2 / 0 / 0
부모글1 / 1 / 0 / 0

INSERT INTO answer(answerno, title, grpno, indent, ansnum) VALUES(answer_seq.nextval, '부모글3', 3,0,0);

SELECT lpad(ansnum, (ansnum*3), '*') || title || ' / ' || grpno || ' / ' ||  indent || ' / ' ||  ansnum as list 
FROM answer ORDER BY answerno DESC;

부모글3 / 3 / 0 / 0
부모글2 / 2 / 0 / 0
부모글1 / 1 / 0 / 0

규칙 1: 새로운 글(부모글)을 등록할 경우 grpno = grpno + 1
          (SELECT NVL(MAX(grpno), 0) + 1 FROM contents)

규칙 2: 답변
INSERT INTO answer(answerno, title, grpno, indent, ansnum) VALUES(answer_seq.nextval, '부모글3의 답변1', 3,1,1);

SELECT lpad(' ', (indent*5), ' ') || title || ' / ' || grpno || ' / ' ||  indent || ' / ' ||  ansnum as list 
FROM answer ORDER BY grpno DESC, ansnum ASC;

부모글3 / 3 / 0 / 0
     부모글3의 답변1 / 3 / 1 / 1
부모글2 / 2 / 0 / 0
부모글1 / 1 / 0 / 0

INSERT INTO answer(answerno, title, grpno, indent, ansnum) VALUES(answer_seq.nextval, '부모글3의 답변2', 3,1,2);

SELECT lpad(' ', (indent*5), ' ') || title || ' / ' || grpno || ' / ' ||  indent || ' / ' ||  ansnum as list 
FROM answer ORDER BY grpno DESC, ansnum ASC;

부모글3 / 3 / 0 / 0
     부모글3의 답변1 / 3 / 1 / 1
     부모글3의 답변2 / 3 / 1 / 2
부모글2 / 2 / 0 / 0
부모글1 / 1 / 0 / 0

INSERT INTO answer(answerno, title, grpno, indent, ansnum) VALUES(answer_seq.nextval, '부모글3의 답변3', 3,1,3);

SELECT lpad(' ', (indent*5), ' ') || title || ' / ' || grpno || ' / ' ||  indent || ' / ' ||  ansnum as list 
FROM answer ORDER BY grpno DESC, ansnum ASC;

부모글3 / 3 / 0 / 0
     부모글3의 답변1 / 3 / 1 / 1
     부모글3의 답변2 / 3 / 1 / 2
     부모글3의 답변3 / 3 / 1 / 3
부모글2 / 2 / 0 / 0
부모글1 / 1 / 0 / 0

일반적으로 최신 답변을 먼저 출력으로 변경
DELETE FROM answer;
COMMIT;

INSERT INTO answer(answerno, title, grpno, indent, ansnum) VALUES(answer_seq.nextval, '부모글1', 1,0,0);
INSERT INTO answer(answerno, title, grpno, indent, ansnum) VALUES(answer_seq.nextval, '부모글2', 2,0,0);
INSERT INTO answer(answerno, title, grpno, indent, ansnum) VALUES(answer_seq.nextval, '부모글3', 3,0,0);

SELECT lpad(' ', (indent*5), ' ') || title || ' / ' || grpno || ' / ' ||  indent || ' / ' ||  ansnum as list 
FROM answer ORDER BY grpno DESC, ansnum ASC;

부모글3 / 3 / 0 / 0
부모글2 / 2 / 0 / 0
부모글1 / 1 / 0 / 0

동일한 부모글에 속한 자식들중에 답변이 추가되면 답변을 추가하는 부모 바로 뒤에 출력되도록 ansnum을 update
UPDATE answer
SET ansnum = ansnum + 1
WHERE grpno = 3 AND ansnum > 0;

INSERT INTO answer(answerno, title, grpno, indent, ansnum) VALUES(answer_seq.nextval, '부모글3의 답변1', 3,1,1);

SELECT lpad(' ', (indent*5), ' ') || title || ' / ' || grpno || ' / ' ||  indent || ' / ' ||  ansnum as list 
FROM answer ORDER BY grpno DESC, ansnum ASC;

부모글3 / 3 / 0 / 0
     부모글3의 답변1 / 3 / 1 / 1
부모글2 / 2 / 0 / 0
부모글1 / 1 / 0 / 0

UPDATE answer
SET ansnum = ansnum + 1
WHERE grpno = 3 AND ansnum > 0;

INSERT INTO answer(answerno, title, grpno, indent, ansnum) VALUES(answer_seq.nextval, '부모글3의 답변2', 3,1,1);

SELECT lpad(' ', (indent*5), ' ') || title || ' / ' || grpno || ' / ' ||  indent || ' / ' ||  ansnum as list 
FROM answer ORDER BY grpno DESC, ansnum ASC;

부모글3 / 3 / 0 / 0
     부모글3의 답변2 / 3 / 1 / 1
     부모글3의 답변1 / 3 / 1 / 2
부모글2 / 2 / 0 / 0
부모글1 / 1 / 0 / 0

UPDATE answer
SET ansnum = ansnum + 1
WHERE grpno = 3 AND ansnum > 0;

INSERT INTO answer(answerno, title, grpno, indent, ansnum) VALUES(answer_seq.nextval, '부모글3의 답변3', 3,1,1);

SELECT lpad(' ', (indent*5), ' ') || title || ' / ' || grpno || ' / ' ||  indent || ' / ' ||  ansnum as list 
FROM answer ORDER BY grpno DESC, ansnum ASC;

부모글3 / 3 / 0 / 0
     부모글3의 답변3 / 3 / 1 / 1
     부모글3의 답변2 / 3 / 1 / 2
     부모글3의 답변1 / 3 / 1 / 3
부모글2 / 2 / 0 / 0
부모글1 / 1 / 0 / 0

UPDATE answer
SET ansnum = ansnum + 1
WHERE grpno = 3 AND ansnum > 1; -- 1번이 부모임으로 1을 기준으로 함.

INSERT INTO answer(answerno, title, grpno, indent, ansnum) VALUES(answer_seq.nextval, '부모글3의 답변3의 답변1', 3,2,2);

SELECT lpad(' ', (indent*5), ' ') || title || ' / ' || grpno || ' / ' ||  indent || ' / ' ||  ansnum as list 
FROM answer ORDER BY grpno DESC, ansnum ASC;

부모글3 / 3 / 0 / 0
     부모글3의 답변3 / 3 / 1 / 1
          부모글3의 답변3의 답변1 / 3 / 2 / 2
     부모글3의 답변2 / 3 / 1 / 3
     부모글3의 답변1 / 3 / 1 / 4
부모글2 / 2 / 0 / 0
부모글1 / 1 / 0 / 0