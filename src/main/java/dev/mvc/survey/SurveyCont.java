package dev.mvc.survey;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import dev.mvc.admin.AdminProcInter;
import dev.mvc.genre.GenreVO;

@Controller
public class SurveyCont {

  @Autowired
  @Qualifier("dev.mvc.survey.SurveyProc")
  private SurveyProcInter surveyProc;
  
  @Autowired
  @Qualifier("dev.mvc.admin.AdminProc") // 이름 지정
  private AdminProcInter adminProc;
  
  public SurveyCont() {
  System.out.println("-->SurveyCont created");
  }

  /**
   * 등록폼
   * @return
   */
  @RequestMapping(value = "/survey/create.do", method = RequestMethod.GET)
  public ModelAndView create(HttpSession session) {
    ModelAndView mav = new ModelAndView();
    
    
    if (adminProc.isAdmin(session)) {
      mav.setViewName("/survey/create");
    } else {
      mav.setViewName("redirect:/admin/login_need.jsp"); // /webapp/admin/login_need.jsp
    }

    
    return mav;
  }

  /**
   * 등록 처리
   * 
   * @return
   */
  @RequestMapping(value = "/survey/create.do", method = RequestMethod.POST)
  public ModelAndView create(SurveyVO surveyVO) {


    ModelAndView mav = new ModelAndView();

    int cnt = this.surveyProc.create(surveyVO); // 등록 처리
    
    if (cnt == 0) {
      mav.addObject("cnt", cnt);

      mav.addObject("url", "create_msg"); 
      mav.setViewName("redirect:/survey/msg.do"); 
      
    } else {
      mav.setViewName("redirect:/survey/list.do");
    }
    
    return mav;
  }
  
  /**
   * Ajax 기반 등록 처리 
   * 
   * @return
   */
  @ResponseBody
  @RequestMapping(value = "/survey/create_ajax.do", method = RequestMethod.POST,
                          produces = "text/plain;charset=UTF-8")
  public String create_ajax(SurveyVO surveyVO) {
    try {
      Thread.sleep(3000);
    } catch (InterruptedException e) {
      e.printStackTrace();
    }
    
    int cnt = this.surveyProc.create(surveyVO); // 등록 처리
    
    JSONObject json = new JSONObject();
    json.put("cnt", cnt);

    return json.toString();
  }

  
  /**
   * 목록 ajax
   * 
   * @return
   */
  @RequestMapping(value="/survey/list11.do", method=RequestMethod.GET)
  public ModelAndView list() {
    ModelAndView mav = new ModelAndView();
    

      List<SurveyVO> list = surveyProc.list();
      
      mav.addObject("list", list);

      mav.setViewName("/survey/list_ajax"); 



        
    return mav;
  }

  /**
   * 목록 + 검색 + 페이징 지원
   * @param nowPage
   * @return
   */
  @RequestMapping(value = "/survey/list.do", method = RequestMethod.GET)
  public ModelAndView paging(
      @RequestParam(value="nowPage", defaultValue="1") int nowPage,
      HttpSession session
      ) { 

    
    ModelAndView mav = new ModelAndView();
    
    if (adminProc.isAdmin(session)) { // 관리자 로그인인 경우
    // 숫자와 문자열 타입을 저장해야함으로 Obejct 사용
    HashMap<String, Object> map = new HashMap<String, Object>();
    map.put("nowPage", nowPage);  // 페이지에 출력할 레코드의 범위를 산출하기위해 사용     
    
    // 검색 목록
    List<SurveyVO> list = surveyProc.paging(map);
    mav.addObject("list", list);
    
    // 검색된 레코드 갯수
    int search_count = surveyProc.search_count();
    mav.addObject("search_count", search_count);

    String paging = surveyProc.pagingBox("list.do", search_count, nowPage);
    mav.addObject("paging", paging);
  
    mav.addObject("nowPage", nowPage);

    mav.setViewName("/survey/admin_list_paging");   
    }else {
      // 숫자와 문자열 타입을 저장해야함으로 Obejct 사용
      HashMap<String, Object> map = new HashMap<String, Object>();
      map.put("nowPage", nowPage);  // 페이지에 출력할 레코드의 범위를 산출하기위해 사용     
      
      // 검색 목록
      List<SurveyVO> list = surveyProc.paging(map);
      mav.addObject("list", list);
      
      // 검색된 레코드 갯수
      int search_count = surveyProc.search_count();
      mav.addObject("search_count", search_count);

      String paging = surveyProc.pagingBox("list.do", search_count, nowPage);
      mav.addObject("paging", paging);
    
      mav.addObject("nowPage", nowPage);


      mav.setViewName("/survey/member_list_paging");   
    }
    return mav;
  }    
 
  
 

  /**
   * 조회 + 수정폼
   * 
   * @return
   */
  @RequestMapping(value = "/survey/read_update.do", method = RequestMethod.GET)
  public ModelAndView read_update(int surveyno,HttpSession session) {
    ModelAndView mav = new ModelAndView();
    
    if (adminProc.isAdmin(session)) {
      mav.setViewName("/survey/read_update"); 
      
      SurveyVO surveyVO = this.surveyProc.read(surveyno);
      mav.addObject("surveyVO", surveyVO);

      List<SurveyVO> list = this.surveyProc.list();
      mav.addObject("list", list);

    } else {
      mav.setViewName("redirect:/admin/login_need.jsp"); // /webapp/admin/login_need.jsp
    }


    return mav; // forward
  }

  /**
   * Ajax + read 
   * 
   * @return
   */
  @ResponseBody
  @RequestMapping(value = "/survey/read_ajax.do", method = RequestMethod.GET,
                          produces = "text/plain;charset=UTF-8")
  public String read_ajax(int surveyno) {
    try {
      Thread.sleep(3000);
    } catch (InterruptedException e) {
      e.printStackTrace();
    }
    
    SurveyVO surveyVO = this.surveyProc.read(surveyno);

    JSONObject json = new JSONObject();
    json.put("surveyno", surveyno);
    json.put("title", surveyVO.getTitle());


    return json.toString();
  }

  
  /**
   * 수정 처리
   * 
   * @param 
   * @return
   */
  @RequestMapping(value = "/survey/update.do", method = RequestMethod.POST)
  public ModelAndView update(SurveyVO surveyVO) {


    ModelAndView mav = new ModelAndView();

    int cnt = this.surveyProc.update(surveyVO);
    mav.addObject("cnt", cnt); 

    mav.setViewName("/survey/update_msg"); 

    return mav;
  }
  
  /**
   * Ajax 기반 수정 처리
   * 
   * @return
   */
  @ResponseBody
  @RequestMapping(value = "/survey/update_ajax.do", method = RequestMethod.POST,
                          produces = "text/plain;charset=UTF-8")
  public String update_ajax(SurveyVO surveyVO) {
    try {
      Thread.sleep(3000);
    } catch (InterruptedException e) {
      e.printStackTrace();
    }
    
    int cnt = this.surveyProc.update(surveyVO); // 등록 처리
    
    JSONObject json = new JSONObject();
    json.put("cnt", cnt);

    return json.toString();
  }

  /**
   * 삭제폼
   * @return
   */
  @RequestMapping(value = "/survey/read_delete.do", method = RequestMethod.GET)
  public ModelAndView read_delete(int surveyno,HttpSession session) {
    ModelAndView mav = new ModelAndView();
    
    if (adminProc.isAdmin(session)) {
      mav.setViewName("/survey/read_delete"); 

      SurveyVO surveyVO = this.surveyProc.read(surveyno);
      mav.addObject("surveyVO", surveyVO);

      List<SurveyVO> list = this.surveyProc.list();
      mav.addObject("list", list);
    } else {
      mav.setViewName("redirect:/admin/login_need.jsp"); // /webapp/admin/login_need.jsp
    }
    
 

    return mav; // forward
  }

  /**
   * 삭제 처리
   * @param
   * @return
   */
  @RequestMapping(value = "/survey/delete.do", method = RequestMethod.POST)
  public ModelAndView delete(int surveyno) {
    ModelAndView mav = new ModelAndView();

    int cnt = this.surveyProc.delete(surveyno);

    if (cnt == 0) {
      mav.addObject("cnt", cnt);

      mav.addObject("url", "delete_msg"); 
      mav.setViewName("redirect:/survey/msg.do"); 
      
    } else {
      mav.setViewName("redirect:/survey/list.do");
    }
    
    return mav;
  }
  
  /**
   * 삭제 처리 + Ajax
   * @param
   * @return
   */
  @ResponseBody
  @RequestMapping(value = "/survey/delete_ajax.do", method = RequestMethod.POST,
                          produces = "text/plain;charset=UTF-8")
  public String delete_ajax(int surveyno) {
    try {
      Thread.sleep(3000);
    } catch (InterruptedException e) {
      e.printStackTrace();
    }
    
    int cnt = this.surveyProc.delete(surveyno);
    
    JSONObject json = new JSONObject();
    json.put("cnt", cnt);
    
    return json.toString();
  }
 
  
  /**
   * 새로고침을 방지하는 메시지 출력
   * @return
   */
  @RequestMapping(value="/survey/msg.do", method=RequestMethod.GET)
  public ModelAndView msg(String url){
    ModelAndView mav = new ModelAndView();

    mav.setViewName("/survey/" + url); 
    
    return mav; 
  }
  
}
