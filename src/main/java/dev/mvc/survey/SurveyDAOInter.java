package dev.mvc.survey;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;





public interface SurveyDAOInter {

  public int create(SurveyVO surveyVO);
  
  public  List<SurveyVO> list();
  
  public int update(SurveyVO surveyVO);
  
  public int delete(int surveyno);
  
  public SurveyVO read(int surveyno);
  
  public ArrayList<SurveyVO> paging(HashMap<String, Object> map);
  
  public int search_count();
  
  public List<SurveyVO> search(HashMap<String, Object> hashMap);
  
}
