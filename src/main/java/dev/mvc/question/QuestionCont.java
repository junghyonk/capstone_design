package dev.mvc.question;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import dev.mvc.admin.AdminProcInter;
import dev.mvc.genre.GenreVO;
import dev.mvc.survey.SurveyProcInter;
import dev.mvc.survey.SurveyVO;

import dev.mvc.tool.Tool;
import dev.mvc.tool.Upload;

@Controller
public class QuestionCont {

  @Autowired
  @Qualifier("dev.mvc.question.QuestionProc")
  private QuestionProcInter questionProc;
  
  @Autowired
  @Qualifier("dev.mvc.survey.SurveyProc")
  private SurveyProcInter surveyProc;
  
  @Autowired
  @Qualifier("dev.mvc.admin.AdminProc") // 이름 지정
  private AdminProcInter adminProc;
  

  
  public QuestionCont() {
    
  }
  
  /**
   * 
   * @return
   */
  @RequestMapping(value = "/question/create.do", method = RequestMethod.GET)
  public ModelAndView create(int surveyno) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/question/create");
    
    return mav;
  }


  @RequestMapping(value = "/question/create.do", method = RequestMethod.POST)
  public ModelAndView create(QuestionVO questionVO, HttpServletRequest request,int surveyno) {
    ModelAndView mav = new ModelAndView();
    
    
    mav.setViewName("/question/create_msg");
    int cnt = this.questionProc.create(questionVO);
    mav.addObject("cnt", cnt);

    return mav; 
  }
  
  // Ajax 모음
  /**
   * Ajax 생성
   * 
   * @return
   */
  @ResponseBody
  @RequestMapping(value = "/question/create_ajax.do", method = RequestMethod.POST,
  produces = "text/plain;charset=UTF-8")
  public String create_ajax(QuestionVO questionVO) {
    try {
      Thread.sleep(3000);
    } catch (InterruptedException e) {
      e.printStackTrace();
    }

    int cnt = this.questionProc.create(questionVO); // 등록 처리

    JSONObject json = new JSONObject();
    json.put("cnt", cnt);

    return json.toString();
  }
  
  /**
   * Ajax +읽기
   * 
   * @return
   */
  @ResponseBody
  @RequestMapping(value = "/question/read_ajax.do", method = RequestMethod.GET,
                          produces = "text/plain;charset=UTF-8")
  public String read_ajax(int questionno) {
    try {
      Thread.sleep(3000);
    } catch (InterruptedException e) {
      e.printStackTrace();
    }
    
    QuestionVO questionVO = this.questionProc.read(questionno);

    JSONObject json = new JSONObject();
    json.put("questionno", questionno);
    json.put("questionlist", questionVO.getQuestionlist());
    json.put("surveyno", questionVO.getSurveyno());


    return json.toString();
  }
  
  /**
   * Ajax 수정
   * 
   * @return
   */
  @ResponseBody
  @RequestMapping(value = "/question/update_ajax.do", method = RequestMethod.POST,
                          produces = "text/plain;charset=UTF-8")
  public String update_ajax(QuestionVO questionVO) {
    try {
      Thread.sleep(3000);
    } catch (InterruptedException e) {
      e.printStackTrace();
    }
    
    int cnt = this.questionProc.update(questionVO); // 등록 처리
    
    JSONObject json = new JSONObject();
    json.put("cnt", cnt);

    return json.toString();
  }
  
  /**
   * 삭제 처리 + Ajax
   * @param genreno
   * @return
   */
  @ResponseBody
  @RequestMapping(value = "/question/delete_ajax.do", method = RequestMethod.POST,
                          produces = "text/plain;charset=UTF-8")
  public String delete_ajax(int questionno) {
    try {
      Thread.sleep(3000);
    } catch (InterruptedException e) {
      e.printStackTrace();
    }
    
    int cnt = this.questionProc.delete(questionno);
    
    JSONObject json = new JSONObject();
    json.put("cnt", cnt);
    
    return json.toString();
  }
  
  
  
  
  /**
   *  
   * 
   * @return
   */
  @RequestMapping(value = "/question/list.do", method = RequestMethod.GET)
  public ModelAndView vote(int surveyno,HttpSession session) {
    ModelAndView mav = new ModelAndView();

    
    
    
    if (adminProc.isAdmin(session)) { // 관리자 로그인인 경우
      mav.setViewName("/question/list_by_surveyno_ajax_admin"); 

      SurveyVO surveyVO=this.surveyProc.read(surveyno);
      mav.addObject("surveyVO",surveyVO);
      
      List<QuestionVO> list = this.questionProc.list_by_surveyno(surveyno);
      mav.addObject("list", list);
      
    } else {
      mav.setViewName("/question/list_by_surveyno_ajax_member"); 

      SurveyVO surveyVO=this.surveyProc.read(surveyno);
      mav.addObject("surveyVO",surveyVO);
      
      List<QuestionVO> list = this.questionProc.list_by_surveyno(surveyno);
      mav.addObject("list", list);
      
    }


    
    
    
    
    return mav; // forward
  }
  /**
   * 
   * 
   * @return
   */
  @RequestMapping(value = "/question/result.do", method = RequestMethod.GET)
  public ModelAndView result(int surveyno) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/question/result"); 


    SurveyVO surveyVO=this.surveyProc.read(surveyno);
    mav.addObject("surveyVO",surveyVO);
    
    
    List<QuestionVO> list = this.questionProc.list_by_surveyno(surveyno);
    mav.addObject("list", list);

    return mav; // forward
  }
  
  /**
   * �뙆�씠 李⑦듃
   * 
   * @return
   */
  @RequestMapping(value = "/question/piechart.do", method = RequestMethod.GET)
  public ModelAndView piechart(int surveyno) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/question/piechart"); 


    SurveyVO surveyVO=this.surveyProc.read(surveyno);
    mav.addObject("surveyVO",surveyVO);
    
    
    List<QuestionVO> list = this.questionProc.list_by_surveyno(surveyno);
    mav.addObject("list", list);

    return mav; // forward
  }
  

  /**
   * ajax �삎�떇 pie 異쒕젰
   * 
   * @return
   */
  @ResponseBody
  @RequestMapping(value = "/question/pie.do", 
  method = RequestMethod.GET,produces = "text/plain;charset=UTF-8")
  public String result_pie(int surveyno) {


    List<QuestionVO> list = this.questionProc.list_by_surveyno(surveyno);

    JSONObject json = new JSONObject();
    json.put("list",list);

    
    return json.toString(); // forward
  }
  

  


  /**
   * �닾�몴 泥섎━ msg
   * 
   * @return
   */
  @RequestMapping(value = "/question/voted.do", method = RequestMethod.GET)
  public ModelAndView voted(int questionno,int surveyno) {
    ModelAndView mav = new ModelAndView();
    
    Map<String, Object> map = new HashMap<String, Object>();
    map.put("questionno", questionno);
    map.put("surveyno", surveyno); 
    mav.setViewName("/question/voted"); 
    
    QuestionVO questionVO=this.questionProc.read(questionno);

    
    int cnt= this.questionProc.pluscnt(map);
    if(cnt==1) {
      int a= questionVO.getQuestioncnt();
      mav.addObject("a",a);
    }
 
    
    mav.addObject("questionVO",questionVO);
    mav.addObject("cnt",cnt);


    

    return mav; // forward
  }
  
  /**
   * 議고쉶 + �닔�젙�뤌
   * 
   * @return
   */
  @RequestMapping(value = "/question/read_update.do", method = RequestMethod.GET)
  public ModelAndView read_update(int questionno) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/question/read_update"); // /webapp/cate/read_update.jsp

    QuestionVO questionVO = this.questionProc.read(questionno);
    mav.addObject("questionVO", questionVO);

    List<QuestionVO> list = this.questionProc.list();
    mav.addObject("list", list);

    return mav; 
  }
  
  /**
   * �닔�젙 泥섎━
   * 
   * @param 
   * @return
   */
  @RequestMapping(value = "/question/update.do", method = RequestMethod.POST)
  public ModelAndView update(QuestionVO questionVO) {
    ModelAndView mav = new ModelAndView();

    int cnt = this.questionProc.update(questionVO);
    mav.addObject("cnt", cnt); 

    mav.setViewName("/question/update_msg"); 

    return mav;
  }
  
  /**
   * 議고쉶 + �궘�젣�뤌 
   * 
   * @return
   */
  @RequestMapping(value = "/question/read_delete.do", method = RequestMethod.GET)
  public ModelAndView read_delete(int questionno) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/question/read_delete"); 

    QuestionVO questionVO = this.questionProc.read(questionno);
    mav.addObject("questionVO", questionVO);

    List<QuestionVO> list = this.questionProc.list();
    mav.addObject("list", list);


    return mav; // forward
  }
  
  /**
   * �궘�젣 泥섎━
   * 
   * @param
   * @return
   */
  @RequestMapping(value = "/question/delete.do", method = RequestMethod.POST)
  public ModelAndView delete(int questionno) {
    ModelAndView mav = new ModelAndView();

    int cnt = this.questionProc.delete(questionno);
    mav.addObject("cnt", cnt); // request�뿉 ���옣

    mav.setViewName("/question/delete_msg"); 

    return mav;
  }
}
