package dev.mvc.survey;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;



public interface SurveyProcInter {

  public int create(SurveyVO surveyVO);
  
  public  List<SurveyVO> list();
  
  public int update(SurveyVO surveyVO);
  
  public int delete(int surveyno);

  public SurveyVO read(int surveyno);

  public int search_count();
  
  public List<SurveyVO> search(HashMap<String, Object> hashMap);
  
  public List<SurveyVO> paging(HashMap<String, Object> map);
  
  public String pagingBox(String listFile, int search_count, int nowPage);
}
