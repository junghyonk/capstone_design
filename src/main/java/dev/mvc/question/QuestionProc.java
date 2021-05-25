package dev.mvc.question;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("dev.mvc.question.QuestionProc")
public class QuestionProc implements QuestionProcInter {
  
  @Autowired
  private QuestionDAOInter questionDAO;

  @Override
  public int create(QuestionVO questionVO) {
    int cnt=this.questionDAO.create(questionVO);
    return cnt;
  }

  @Override
  public List<QuestionVO> list() {
    List<QuestionVO> list=this.questionDAO.list();
    return list;
  }

  @Override
  public int update(QuestionVO questionVO) {
    int cnt=this.questionDAO.update(questionVO);
    return cnt;
  }

  @Override
  public int delete(int questionno) {
   int cnt=this.questionDAO.delete(questionno);
   return cnt;
  }

  @Override
  public QuestionVO read(int questionno) {
    QuestionVO questionVO=this.questionDAO.read(questionno);
    return questionVO;
  }

  @Override
  public List<QuestionVO> list_by_surveyno(int surveyno) {
    List<QuestionVO> list=this.questionDAO.list_by_surveyno(surveyno);
    return list;
  }

  @Override
  public int pluscnt(Map map) {
    int cnt=this.questionDAO.pluscnt(map);
    return cnt;
  }

}
