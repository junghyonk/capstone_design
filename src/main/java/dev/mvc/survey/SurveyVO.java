package dev.mvc.survey;

public class SurveyVO {
  
  
  public int getSurveyno() {
    return surveyno;
  }

  public void setSurveyno(int surveyno) {
    this.surveyno = surveyno;
  }

  public String getTitle() {
    return title;
  }

  public void setTitle(String title) {
    this.title = title;
  }

  public String getRdate() {
    return rdate;
  }

  public void setRdate(String rdate) {
    this.rdate = rdate;
  }

  private int surveyno; 
  
  private String title;
 
  private String rdate;

 
}
