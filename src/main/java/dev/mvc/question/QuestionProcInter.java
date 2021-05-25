package dev.mvc.question;

import java.util.List;
import java.util.Map;

public interface QuestionProcInter {

  public int create(QuestionVO questionVO);
  
  public  List<QuestionVO> list();
  
  public  List<QuestionVO> list_by_surveyno(int surveyno);
  
  public int update(QuestionVO questionVO);
  
  public int pluscnt(Map map);
  
  public int delete(int questionno);
  
  public QuestionVO read(int questionno);
}
