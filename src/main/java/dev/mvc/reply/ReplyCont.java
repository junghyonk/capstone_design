package dev.mvc.reply;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import dev.mvc.member.MemberVO;

@Controller
public class ReplyCont {
  @Autowired
  @Qualifier("dev.mvc.reply.ReplyProc") // 이름 지정
  private ReplyProcInter replyProc;
  
  @Autowired
  @Qualifier("dev.mvc.admin.AdminProc") // 이름 지정
  private AdminProcInter adminProc;
  
  public ReplyCont(){
    System.out.println("--> ReplyCont created.");
  }
  
  /**
   * 댓글 등록 처리
   * @param replyVO
   * @return
   */
  @ResponseBody
  @RequestMapping(value = "/reply/create.do",
                            method = RequestMethod.POST,
                            produces = "text/plain;charset=UTF-8")
  public String create(ReplyVO replyVO) {
    int cnt = replyProc.create(replyVO);
    
    JSONObject obj = new JSONObject();
    obj.put("cnt",cnt);
 
    return obj.toString(); // {"cnt":1}

  }
  
//  /**
//   * 관리자만 목록 확인 가능
//   * @param session
//   * @return
//   */
//  @RequestMapping(value="/reply/list.do", method=RequestMethod.GET)
//  public ModelAndView list(HttpSession session) {
//    ModelAndView mav = new ModelAndView();
//    
//    if (adminProc.isAdmin(session)) {
//      List<ReplyVO> list = replyProc.list();
//      
//      mav.addObject("list", list);
//      mav.setViewName("/reply/list"); // /webapp/reply/list.jsp
//
//    } else {
//      mav.setViewName("redirect:/admin/login_need.jsp"); // /webapp/admin/login_need.jsp
//    }
//    
//    return mav;
//  }

  /**
   * 관리자만 목록 확인 가능
   * @param session
   * @return
   */
  @RequestMapping(value="/reply/list.do", method=RequestMethod.GET)
  public ModelAndView list(HttpSession session) {
    ModelAndView mav = new ModelAndView();
    
    if (adminProc.isAdmin(session)) {
      List<ReplyMemberVO> list = replyProc.list_member_join();
      
      mav.addObject("list", list);
      mav.setViewName("/reply/list_join"); // /webapp/reply/list_join.jsp

    } else {
      mav.setViewName("redirect:/admin/login_need.jsp"); // /webapp/admin/login_need.jsp
    }
    
    return mav;
  }
  
  /**
   <xmp>
   http://localhost:9090/ojt/reply/list_by_contentsno.do?contentsno=1
   글이 없는 경우: {"list":[]}
   글이 있는 경우
   {"list":[
            {"memberno":1,"rdate":"2019-12-18 16:46:43","passwd":"123","replyno":3,"content":"댓글 3","contentsno":1}
            ,
            {"memberno":1,"rdate":"2019-12-18 16:46:39","passwd":"123","replyno":2,"content":"댓글 2","contentsno":1}
            ,
            {"memberno":1,"rdate":"2019-12-18 16:46:35","passwd":"123","replyno":1,"content":"댓글 1","contentsno":1}
            ] 
   }
   </xmp>  
   * @param contentsno
   * @return
   */
  @ResponseBody
  @RequestMapping(value = "/reply/list_by_contentsno.do",
                            method = RequestMethod.GET,
                            produces = "text/plain;charset=UTF-8")
  public String list_by_contentsno(int contentsno) {
    List<ReplyVO> list = replyProc.list_by_contentsno(contentsno);
    
    JSONObject obj = new JSONObject();
    obj.put("list", list);
 
    return obj.toString(); 

  }
  
  /**
   컨텐츠별 댓글 목록 
   {
   "list":[
            {
              "memberno":1,
              "rdate":"2019-12-18 16:46:35",
               "passwd":"123",
              "replyno":1,
              "id":"user1",
               "content":"댓글 1",
              "contentsno":1
            }
            ,
            {
              "memberno":1,
              "rdate":"2019-12-18 16:46:35",
              "passwd":"123",
              "replyno":1,
              "id":"user1",
              "content":"댓글 1",
              "contentsno":1
            }
          ]
   }
   * http://localhost:9090/movie/reply/list_by_contentsno_join.do?contentsno=53
   * @param contentsno
   * @return
   */
  @ResponseBody
  @RequestMapping(value = "/reply/list_by_contentsno_join.do",
                              method = RequestMethod.GET,
                              produces = "text/plain;charset=UTF-8")
  public String list_by_contentsno_join(int contentsno) {
    // String msg="JSON 출력";
    // return msg;
    
    List<ReplyMemberVO> list = replyProc.list_by_contentsno_join(contentsno);
    
    JSONObject obj = new JSONObject();
    obj.put("list", list);
 
    return obj.toString();     
  }
  
  /**
   * 패스워드를 검사한 후 삭제 
   * http://localhost:9090/movie/reply/delete.do?replyno=1&passwd=1234
   * {"delete_cnt":0,"passwd_cnt":0}
   * {"delete_cnt":1,"passwd_cnt":1}
   * @param replyno
   * @param passwd
   * @return
   */
  @ResponseBody
  @RequestMapping(value = "/reply/delete.do", 
                              method = RequestMethod.POST,
                              produces = "text/plain;charset=UTF-8")
  public String delete(int replyno,String passwd) {
    HashMap<String, Object> hashMap = new HashMap<String, Object>();
    hashMap.put("replyno", replyno);
    hashMap.put("passwd", passwd);

    int passwd_cnt = 0; // 패스워드 일치 레코드 갯수
    int cnt = 0;             // 수정된 레코드 갯수 
    
    passwd_cnt = this.replyProc.checkPasswd(hashMap);
    
    if (passwd_cnt == 1) { // 패스워드가 일치할 경우 글 수정
      cnt = this.replyProc.delete(replyno);
    }
    JSONObject obj = new JSONObject();

    obj.put("cnt", cnt); // 삭제된 댓글
    obj.put("passwd_cnt", passwd_cnt); // 삭제된 댓글
    
    return obj.toString();
  }
  
  /**
   * 패스워드를 검사한 후 삭제 
   * http://localhost:9090/movie/reply/delete.do?replyno=1&passwd=1234
   * {"delete_cnt":0,"passwd_cnt":0}
   * {"delete_cnt":1,"passwd_cnt":1}
   * @param replyno
   * @param passwd
   * @return
   */
  @ResponseBody
  @RequestMapping(value = "/reply/delete_list.do", 
                              method = RequestMethod.POST,
                              produces = "text/plain;charset=UTF-8")
  public String delete_list(int replyno) {
 

    int cnt = 0;             // 수정된 레코드 갯수 
    


      cnt = this.replyProc.delete(replyno);
   
    JSONObject obj = new JSONObject();

    obj.put("cnt", cnt); // 삭제된 댓글
 
    
    return obj.toString();
  }
  
  
  
  /**
   * 더보기 버튼 페이징 목록
   * http://localhost:9090/movie/reply/list_by_contentsno_join_add.do?contentsno=53&replyPage=1
   * @param contentsno 댓글 부모글 번호
   * @param replyPage 댓글 페이지
   * @return
   */
  @ResponseBody
  @RequestMapping(value = "/reply/list_by_contentsno_join_add.do",
                              method = RequestMethod.GET,
                              produces = "text/plain;charset=UTF-8")
  public String list_by_contentsno_join(int contentsno, int replyPage) {
  //    System.out.println("contentsno: " + contentsno);
  //    System.out.println("replyPage: " + replyPage);
    
    HashMap<String, Object> map = new HashMap<String, Object>();
    map.put("contentsno", contentsno); 
    map.put("replyPage", replyPage);    
    
    List<ReplyMemberVO> list = replyProc.list_by_contentsno_join_add(map);
    
    JSONObject obj = new JSONObject();
    obj.put("list", list);
 
    return obj.toString();     
  }
  
}


