DROP TABLE survey;


CREATE TABLE SURVEY(
		SURVEYNO                      		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		TITLE                         		VARCHAR2(100)		 NOT NULL,
		RDATE                         		DATE		 NOT NULL
);
CREATE SEQUENCE survey_seq
  START WITH 1              
  INCREMENT BY 1         
  MAXVALUE 9999999999 
  CACHE 2                      
  NOCYCLE;       
  
  INSERT INTO survey(surveyno, title, rdate)
VALUES(survey_seq.nextval, '¾È³ç', sysdate);

DROP SEQUENCE survey_seq; 