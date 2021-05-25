
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
  START WITH 1              -- ���� ��ȣ
  INCREMENT BY 1          -- ������
  MAXVALUE 9999999999 -- �ִ밪: 9999999 --> NUMBER(7) ����
  CACHE 2                       -- 2���� �޸𸮿����� ���
  NOCYCLE;                     -- �ٽ� 1���� �����Ǵ� ���� ����