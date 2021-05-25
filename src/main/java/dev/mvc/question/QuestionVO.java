package dev.mvc.question;


public class QuestionVO {
  

  private int surveyno;
  
  private int questionno;
  

  private String questionlist;
  
  private int questioncnt=0;
  

  
  public String getQuestionlist() {
    return questionlist;
  }

  public void setQuestionlist(String questionlist) {
    this.questionlist = questionlist;
  }

  
  public int getSurveyno() {
    return surveyno;
  }

  public void setSurveyno(int surveyno) {
    this.surveyno = surveyno;
  }

  public int getQuestionno() {
    return questionno;
  }

  public void setQuestionno(int questionno) {
    this.questionno = questionno;
  }
  public int getQuestioncnt() {
    return questioncnt;
  }

  public void setQuestioncnt(int questioncnt) {
    this.questioncnt = questioncnt;
  }


}
