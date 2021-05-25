
DROP TABLE question;
CREATE TABLE question(
      surveyno NUMERIC(10),
      questionno NUMERIC(10) PRIMARY KEY,
      questionlist VARCHAR(100) NOT NULL,
      questioncnt                 NUMBER(7) DEFAULT 0  NOT NULL,
  FOREIGN KEY (surveyno) REFERENCES survey (surveyno)
);

DROP SEQUENCE question_seq;
CREATE SEQUENCE question_seq
  START WITH 1              -- 시작 번호
  INCREMENT BY 1          -- 증가값
  MAXVALUE 9999999999 -- 최대값: 9999999 --> NUMBER(7) 대응
  CACHE 2                       -- 2번은 메모리에서만 계산
  NOCYCLE;                     -- 다시 1부터 생성되는 것을 방지