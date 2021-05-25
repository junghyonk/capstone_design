package dev.mvc.genre;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import dev.mvc.admin.AdminProcInter;



@Controller
public class GenreCont {

  @Autowired
  @Qualifier("dev.mvc.genre.GenreProc")
  private GenreProc genreProc;
  
  @Autowired
  @Qualifier("dev.mvc.admin.AdminProc") // 이름 지정
  private AdminProcInter adminProc;


  /**
   * 등록폼 http://localhost:9090/movie/genre/create.do
   * 
   * @return
   */
  @RequestMapping(value = "/genre/create.do", method = RequestMethod.GET)
  public ModelAndView create() {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/genre/create"); // /webapp/genre/create.jsp

    return mav; // forward
  }

  /**
   * 등록 처리 http://localhost:9090/movie/genre/create.do
   * movie
   * @return
   */
  @RequestMapping(value = "/genre/create.do", method = RequestMethod.POST)
  public ModelAndView create(GenreVO genreVO) {
    // request.setAttribute("genreVO", genreVO) 자동 실행

    ModelAndView mav = new ModelAndView();
    // mav.setViewName("/genre/create_msg"); // /webapp/genre/create_msg.jsp

    int cnt = this.genreProc.create(genreVO); // 등록 처리

    if (cnt == 0) {
      mav.addObject("cnt", cnt); // request.setAttribute("cnt", cnt)

      mav.addObject("url", "create_msg"); // create_msg.jsp, redirect parameter 적용
      mav.setViewName("redirect:/genre/msg.do"); 

    } else {
      mav.setViewName("redirect:/genre/list.do");
    }

    return mav;
  }

  /**
   * Ajax 기반 등록 처리 http://localhost:9090/movie/genre/create_ajax.do
   * 
   * @return
   */
  @ResponseBody
  @RequestMapping(value = "/genre/create_ajax.do", method = RequestMethod.POST,
  produces = "text/plain;charset=UTF-8")
  public String create_ajax(GenreVO genreVO) {
    try {
      Thread.sleep(3000);
    } catch (InterruptedException e) {
      e.printStackTrace();
    }

    int cnt = this.genreProc.create(genreVO); // 등록 처리

    JSONObject json = new JSONObject();
    json.put("cnt", cnt);

    return json.toString();
  }

  
  /**
   * 목록 http://localhost:9090/movie/genre/list.do
   * 
   * @return
   */
  @RequestMapping(value="/genre/list.do", method=RequestMethod.GET)
  public ModelAndView list(HttpSession session) {
    ModelAndView mav = new ModelAndView();


    if (adminProc.isAdmin(session)) { // 관리자 로그인인 경우
      List<GenreVO> list = genreProc.list_genreno_asc();
      mav.addObject("list", list);
      mav.setViewName("/genre/list_ajax_admin"); 
    } else {
      List<GenreVO> list = genreProc.list_genreno_asc();
      mav.addObject("list", list);
      mav.setViewName("/genre/list_ajax_member"); 
    }

        

    return mav;
  }
  /**
   * 조회 + 수정폼 http://localhost:9090/movie/genre/read_update.do
   * 
   * @return
   */
  @RequestMapping(value = "/genre/read_update.do", method = RequestMethod.GET)
  public ModelAndView read_update(int genreno) {
    ModelAndView mav = new ModelAndView();
    
    mav.setViewName("/genre/read_update"); // /webapp/genre/read_update.jsp

    GenreVO genreVO = this.genreProc.read(genreno);
    mav.addObject("genreVO", genreVO);

    List<GenreVO> list = this.genreProc.list_genreno_asc();
    mav.addObject("list", list);

    return mav; // forward
  }
  /**
   * Ajax + read http://localhost:9090/movie/genre/read_ajax.do
   * 
   * @return
   */
  @ResponseBody
  @RequestMapping(value = "/genre/read_ajax.do", method = RequestMethod.GET,
                          produces = "text/plain;charset=UTF-8")
  public String read_ajax(int genreno) {
    try {
      Thread.sleep(3000);
    } catch (InterruptedException e) {
      e.printStackTrace();
    }
    
    GenreVO genreVO = this.genreProc.read(genreno);

    JSONObject json = new JSONObject();
    json.put("genreno", genreno);
    json.put("name", genreVO.getName());
    json.put("visible", genreVO.getVisible());

    return json.toString();
  }
  
  /**
   * 수정 처리
   * 
   * @param genreVO
   * @return
   */
  @RequestMapping(value = "/genre/update.do", method = RequestMethod.POST)
  public ModelAndView update(GenreVO genreVO) {
    // genreVO genreVO <FORM> 태그의 값으로 자동 생성됨.
    // request.setAttribute("genreVO", genreVO); 자동 실행

    ModelAndView mav = new ModelAndView();

    int cnt = this.genreProc.update(genreVO);
    mav.addObject("cnt", cnt); // request에 저장

    mav.setViewName("/genre/update_msg"); // webapp/genre/update_msg.jsp

    return mav;
  }
  
  /**
   * Ajax 기반 등록 처리 http://localhost:9090/movie/genre/update_ajax.do
   * 
   * @return
   */
  @ResponseBody
  @RequestMapping(value = "/genre/update_ajax.do", method = RequestMethod.POST,
                          produces = "text/plain;charset=UTF-8")
  public String update_ajax(GenreVO genreVO) {
    try {
      Thread.sleep(3000);
    } catch (InterruptedException e) {
      e.printStackTrace();
    }
    
    int cnt = this.genreProc.update(genreVO); // 등록 처리
    
    JSONObject json = new JSONObject();
    json.put("cnt", cnt);

    return json.toString();
  }
  /**
   * 삭제폼 http://localhost:9090/movie/genre/read_delete.do
   * @return
   */
  @RequestMapping(value = "/genre/read_delete.do", method = RequestMethod.GET)
  public ModelAndView read_delete(int genreno) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/genre/read_delete"); // /webapp/genre/read_delete.jsp

    GenreVO genreVO = this.genreProc.read(genreno);
    mav.addObject("genreVO", genreVO);

    List<GenreVO> list = this.genreProc.list_genreno_asc();
    mav.addObject("list", list);

    return mav; // forward
  }

  /**
   * 삭제 처리
   * @param genreno
   * @return
   */
  @RequestMapping(value = "/genre/delete.do", method = RequestMethod.POST)
  public ModelAndView delete(int genreno) {
    ModelAndView mav = new ModelAndView();

    int cnt = this.genreProc.delete(genreno);
    // mav.addObject("cnt", cnt); // request에 저장

    // mav.setViewName("/genre/delete_msg"); // /webapp/genre/delete_msg.jsp

    if (cnt == 0) {
      mav.addObject("cnt", cnt); // request.setAttribute("cnt", cnt)

      mav.addObject("url", "delete_msg"); // create_msg.jsp, redirect parameter 적용
      mav.setViewName("redirect:/genre/msg.do"); 
      
    } else {
      mav.setViewName("redirect:/genre/list.do");
    }
    
    return mav;
  }
  
  /**
   * 삭제 처리 + Ajax
   * @param genreno
   * @return
   */
  @ResponseBody
  @RequestMapping(value = "/genre/delete_ajax.do", method = RequestMethod.POST,
                          produces = "text/plain;charset=UTF-8")
  public String delete_ajax(int genreno) {
    try {
      Thread.sleep(3000);
    } catch (InterruptedException e) {
      e.printStackTrace();
    }
    
    int cnt = this.genreProc.delete(genreno);
    
    JSONObject json = new JSONObject();
    json.put("cnt", cnt);
    
    return json.toString();
  }
  /**
   * 출력모드 변경
   * 
   * @param genreVO
   * @return
   */
  @RequestMapping(value = "/genre/update_visible.do", method = RequestMethod.GET)
  public ModelAndView update_visible(GenreVO genreVO) {
    ModelAndView mav = new ModelAndView();

        
    int cnt = this.genreProc.update_visible(genreVO);
    mav.addObject("cnt", cnt); // request에 저장

    mav.setViewName("redirect:/genre/list.do"); // request 객체가 전달이 안됨. 

    return mav;
  }
  
  /**
   * 새로고침을 방지하는 메시지 출력
   * @return
   */
  @RequestMapping(value="/genre/msg.do", method=RequestMethod.GET)
  public ModelAndView msg(String url){
    ModelAndView mav = new ModelAndView();
    
    // 등록 처리 메시지: create_msg --> /genre/create_msg.jsp
    // 수정 처리 메시지: update_msg --> /genre/update_msg.jsp
    // 삭제 처리 메시지: delete_msg --> /genre/delete_msg.jsp
    mav.setViewName("/genre/" + url); // forward
    
    return mav; // forward
  }
  
}








