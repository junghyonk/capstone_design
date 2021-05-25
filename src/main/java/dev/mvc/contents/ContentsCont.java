package dev.mvc.contents;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import dev.mvc.attachfile.AttachfileProcInter;
import dev.mvc.attachfile.AttachfileVO;
import dev.mvc.genre.GenreProcInter;
import dev.mvc.genre.GenreVO;
import dev.mvc.tool.Tool;
import dev.mvc.tool.Upload;



@Controller
public class ContentsCont {

  @Autowired
  @Qualifier("dev.mvc.contents.ContentsProc")
  private ContentsProcInter contentsProc;
  
  @Autowired
  @Qualifier("dev.mvc.genre.GenreProc")
  private GenreProcInter genreProc;
  
  @Autowired
  @Qualifier("dev.mvc.attachfile.AttachfileProc")
  private AttachfileProcInter attachfileProc;
  
  
  
  /**
   * ����� http://localhost:9090/movie/contents/create.do
   * 
   * @return
   */
  @RequestMapping(value = "/contents/create.do", method = RequestMethod.GET)
  public ModelAndView create(int genreno) {
    ModelAndView mav = new ModelAndView();
    
    GenreVO genreVO = this.genreProc.read(genreno);
    
    mav.addObject("genreVO", genreVO);
    
    
    mav.setViewName("/contents/create"); 

    return mav; // forward
  }
  
  /**
   * ��� ó�� http://localhost:9090/movie/contents/create.do
   * 
   * @return
   */
  @RequestMapping(value = "/contents/create.do", method = RequestMethod.POST)
  public ModelAndView create(HttpServletRequest request, ContentsVO contentsVO) {

    
    ModelAndView mav = new ModelAndView();
    // -------------------------------------------------------------------
    // ���� ���� �ڵ� ����
    // -------------------------------------------------------------------
    String file1 = "";     // main image
    String thumb1 = ""; // preview image
        
    String upDir = Tool.getRealPath(request, "/contents/storage/main_images"); // ���� ���
    //C:\ai7\ws_frame\.metadata\.plugins\org.eclipse.wst.server.core\tmp1\wtpwebapps\movie_design\contents\storage\main_images
    // ���� ������ ����� fnamesMF ��ü�� ������.
    // <input type='file' class="form-control" name='file1MF' id='file1MF' 
    //           value='' placeholder="���� ����" multiple="multiple">
    MultipartFile mf = contentsVO.getFile1MF();
    
    long size1 = mf.getSize();  // ���� ũ��
    if (size1 > 0) { // ���� ũ�� üũ
      // mp3 = mf.getOriginalFilename(); // ���� ���ϸ�, spring.jpg
      // ���� ���� �� ���ε�� ���ϸ��� ���ϵ�, spring.jsp, spring_1.jpg...
      file1 = Upload.saveFileSpring(mf, upDir); 
      
      if (Tool.isImage(file1)) { // �̹������� �˻�
        // thumb �̹��� ������ ���ϸ� ���ϵ�, width: 200, height: 150
        thumb1 = Tool.preview(upDir, file1, 200, 150); 
      }
      
    }    
    
    contentsVO.setFile1(file1);
    contentsVO.setThumb1(thumb1);
    contentsVO.setSize1(size1);
    // -------------------------------------------------------------------
    // ���� ���� �ڵ� ����
    // -------------------------------------------------------------------
    // Call By Reference: �޸� ����, Hashcode ����
    int cnt = this.contentsProc.create(contentsVO); 
    
    // -------------------------------------------------------------------
    // PK�� return
    // -------------------------------------------------------------------
    System.out.println("--> contentsno: " + contentsVO.getContentsno());
    mav.addObject("contentsno", contentsVO.getContentsno()); // redirect parameter ����
    // -------------------------------------------------------------------
    
    if (cnt == 1) {
      genreProc.increaseCnt(contentsVO.getGenreno());
    }
    mav.addObject("cnt", cnt); // request.setAttribute("cnt", cnt)

    // <c:import> ���� �۵��ȵ�.
    // mav.setViewName("/contents/create_msg"); // /webapp/contents/create_msg.jsp
    
    // System.out.println("--> genreno: " + contentsVO.getGenreno());
    // redirect�ÿ� hidden tag�� �����͵��� ������ �ȵ����� request�� �ٽ� ����
    mav.addObject("genreno", contentsVO.getGenreno()); // redirect parameter ����
    mav.addObject("url", "create_continue"); // create_continue.jsp, redirect parameter ����
    mav.setViewName("redirect:/contents/msg.do"); 
    
    return mav; // forward
  }
  
  
  /**
   * ��� http://localhost:9090/movie/contents/list_all.do
   * 
   * @return
   */
  @RequestMapping(value = "/contents/list_all.do", method = RequestMethod.GET)
  public ModelAndView list() {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/contents/list_all"); // /webapp/contents/list_all.jsp

    List<ContentsVO> list = this.contentsProc.list_all();
    mav.addObject("list", list);

    return mav; // forward
  }

  /**
   * ���ΰ�ħ�� �����ϴ� �޽��� ���
   * @return
   */
  @RequestMapping(value="/contents/msg.do", method=RequestMethod.GET)
  public ModelAndView msg(String url){
    ModelAndView mav = new ModelAndView();
    
    // ��� ó�� �޽���: create_msg --> /contents/create_msg.jsp
    // ���� ó�� �޽���: update_msg --> /contents/update_msg.jsp
    // ���� ó�� �޽���: delete_msg --> /contents/delete_msg.jsp
    mav.setViewName("/contents/" + url); // forward
    
    return mav; // forward
  }
  
//http://localhost:9090/movie/contents/read.do
 /**
  * contents �б�
  * @return
  */
 @RequestMapping(value="/contents/read.do", method=RequestMethod.GET )
 public ModelAndView read(int contentsno) {
   ModelAndView mav = new ModelAndView();

   ContentsVO contentsVO = this.contentsProc.read(contentsno);
   mav.addObject("contentsVO", contentsVO); // request.setAttribute("contentsVO", contentsVO);
   GenreVO genreVO = this.genreProc.read(contentsVO.getGenreno());
   mav.addObject("genreVO", genreVO); 
   
   // ÷�� ���� ���
   List<AttachfileVO> attachfile_list = this.attachfileProc.list_by_contentsno(contentsno);
   mav.addObject("attachfile_list", attachfile_list); 
   
   mav.setViewName("/contents/read_img_attachfile_reply_add_pg"); // /webapp/contents/read.jsp
   return mav;
 }
 
//http://localhost:9090/movie/contents/update.do
/**
 * ���� ��
 * @return
 */
@RequestMapping(value="/contents/update.do", method=RequestMethod.GET )
public ModelAndView update(int contentsno) {
  ModelAndView mav = new ModelAndView();
  
  ContentsVO contentsVO = this.contentsProc.read_update(contentsno); // ������ �б�
  mav.addObject("contentsVO", contentsVO); // request.setAttribute("contentsVO", contentsVO);
  
  mav.setViewName("/contents/update"); // webapp/contents/update.jsp
  
  return mav;
}

// http://localhost:9090/movie/contents/update.do
/**
 * ���� ó��
 * @param contentsVO
 * @return
 */
@RequestMapping(value="/contents/update.do", method=RequestMethod.POST )
public ModelAndView update(ContentsVO contentsVO) {
  ModelAndView mav = new ModelAndView();
  
  GenreVO genreVO = this.genreProc.read(contentsVO.getGenreno());

  
  mav.addObject("genre_name", genreVO.getName());
  mav.addObject("genreno", genreVO.getGenreno());
  mav.addObject("contentsno", contentsVO.getContentsno());
  
  HashMap<String, Object> hashMap = new HashMap<String, Object>();
  hashMap.put("contentsno", contentsVO.getContentsno());
  hashMap.put("passwd", contentsVO.getPasswd());
  
  int passwd_cnt = 0; // �н����� ��ġ ���ڵ� ����
  int cnt = 0;             // ������ ���ڵ� ���� 
  
  passwd_cnt = this.contentsProc.passwd_check(hashMap);
  
  if (passwd_cnt == 1) { // �н����尡 ��ġ�� ��� �� ����
    cnt = this.contentsProc.update(contentsVO);
  }

  mav.addObject("cnt", cnt); // request�� ����
  mav.addObject("passwd_cnt", passwd_cnt); // request�� ����
      
  mav.setViewName("/contents/update_msg"); // webapp/contents/update_msg.jsp
  
  return mav;
}

/**
 * ���� �̹��� ��� �� http://localhost:9090/movie/contents/img_create.do
 * 
 * @return
 */
@RequestMapping(value = "/contents/img_create.do", method = RequestMethod.GET)
public ModelAndView img_create(int contentsno) {
  ModelAndView mav = new ModelAndView();
  mav.setViewName("/contents/img_create"); // /webapp/contents/img_create.jsp

  ContentsVO contentsVO = this.contentsProc.read(contentsno);
  mav.addObject("contentsVO", contentsVO);
  
  GenreVO genreVO = this.genreProc.read(contentsVO.getGenreno());
  mav.addObject("genreVO", genreVO); 
  
  return mav; // forward
}

/**
 * ���� �̹��� ��� ó�� http://localhost:9090/movie/contents/create.do
 * 
 * @return
 */
@RequestMapping(value = "/contents/img_create.do", method = RequestMethod.POST)
public ModelAndView img_create(HttpServletRequest request, ContentsVO contentsVO) {
  ModelAndView mav = new ModelAndView();
  
  HashMap<String, Object> hashMap = new HashMap<String, Object>();
  hashMap.put("contentsno", contentsVO.getContentsno());
  hashMap.put("passwd", contentsVO.getPasswd());
  
  int passwd_cnt = 0; // �н����� ��ġ ���ڵ� ����
  int cnt = 0;             // ������ ���ڵ� ���� 
  
  passwd_cnt = this.contentsProc.passwd_check(hashMap);
  
  if (passwd_cnt == 1) { // �н����尡 ��ġ�� ��� ���� ���ε�
    // -------------------------------------------------------------------
    // ���� ���� �ڵ� ����
    // -------------------------------------------------------------------
    String file1 = "";     // main image
    String thumb1 = ""; // preview image
        
    String upDir = Tool.getRealPath(request, "/contents/storage/main_images"); // ���� ���
    // ���� ������ ����� fnamesMF ��ü�� ������.
    // <input type='file' class="form-control" name='file1MF' id='file1MF' 
    //           value='' placeholder="���� ����" multiple="multiple">
    MultipartFile mf = contentsVO.getFile1MF();
    long size1 = mf.getSize();  // ���� ũ��
    if (size1 > 0) { // ���� ũ�� üũ
      // mp3 = mf.getOriginalFilename(); // ���� ���ϸ�, spring.jpg
      // ���� ���� �� ���ε�� ���ϸ��� ���ϵ�, spring.jsp, spring_1.jpg...
      file1 = Upload.saveFileSpring(mf, upDir); 
      
      if (Tool.isImage(file1)) { // �̹������� �˻�
        // thumb �̹��� ������ ���ϸ� ���ϵ�, width: 200, height: 150
        thumb1 = Tool.preview(upDir, file1, 200, 150); 
      }
    }    
    
    contentsVO.setFile1(file1);
    contentsVO.setThumb1(thumb1);
    contentsVO.setSize1(size1);
    // -------------------------------------------------------------------
    // ���� ���� �ڵ� ����
    // -------------------------------------------------------------------
    
    mav.setViewName("redirect:/contents/read.do?contentsno=" + contentsVO.getContentsno());
    
    cnt = this.contentsProc.img_create(contentsVO);
    // mav.addObject("cnt", cnt); // request.setAttribute("cnt", cnt)
    
  } else {
    mav.setViewName("/contents/update_msg"); // webapp/contents/update_msg.jsp
    
  }

  mav.addObject("cnt", cnt); // request�� ����
  mav.addObject("passwd_cnt", passwd_cnt); // request�� ����
          
  return mav;    
}
/**
 * ���� �̹��� ����/���� �� http://localhost:9090/movie/contents/img_update.do
 * 
 * @return
 */
@RequestMapping(value = "/contents/img_update.do", method = RequestMethod.GET)
public ModelAndView img_update(int contentsno) {
  ModelAndView mav = new ModelAndView();
  mav.setViewName("/contents/img_update"); // /webapp/contents/img_update.jsp

  ContentsVO contentsVO = this.contentsProc.read(contentsno);
  mav.addObject("contentsVO", contentsVO);
  
  GenreVO genreVO = this.genreProc.read(contentsVO.getGenreno());
  mav.addObject("genreVO", genreVO); 

  
  return mav; // forward
}

/**
 * ���� �̹��� ���� ó�� http://localhost:9090/movie/contents/img_delete.do
 * 
 * @return
 */
@RequestMapping(value = "/contents/img_delete.do", method = RequestMethod.POST)
public ModelAndView img_delete(HttpServletRequest request,
                                     int contentsno, 
                                     int genreno, 
                                     String passwd
                                     ) {
  ModelAndView mav = new ModelAndView();
  
  HashMap<String, Object> hashMap = new HashMap<String, Object>();
  hashMap.put("contentsno", contentsno);
  hashMap.put("passwd", passwd);
  
  int passwd_cnt = 0; // �н����� ��ġ ���ڵ� ����
  int cnt = 0;             // ������ ���ڵ� ���� 
  
  passwd_cnt = this.contentsProc.passwd_check(hashMap);
  
  if (passwd_cnt == 1) { // �н����尡 ��ġ�� ��� ���� ���ε�
    // -------------------------------------------------------------------
    // ���� ���� �ڵ� ����
    // -------------------------------------------------------------------
    // ������ ���� ������ �о��.
    ContentsVO contentsVO = contentsProc.read(contentsno);
    // System.out.println("file1: " + contentsVO.getFile1());
    
    String file1 = contentsVO.getFile1().trim();
    String thumb1 = contentsVO.getThumb1().trim();
    long size1 = contentsVO.getSize1();
    boolean sw = false;
    
    String upDir = Tool.getRealPath(request, "/contents/storage/main_images"); // ���� ���
    sw = Tool.deleteFile(upDir, contentsVO.getFile1());  // Folder���� 1���� ���� ����
    sw = Tool.deleteFile(upDir, contentsVO.getThumb1());  // Folder���� 1���� ���� ����
    // System.out.println("sw: " + sw);
    
    file1 = "";
    thumb1 = "";
    size1 = 0;
    
    contentsVO.setFile1(file1);
    contentsVO.setThumb1(thumb1);
    contentsVO.setSize1(size1);
    // -------------------------------------------------------------------
    // ���� ���� ���� ����
    // -------------------------------------------------------------------
    
    mav.addObject("contentsno", contentsno);
    mav.setViewName("redirect:/contents/read.do");
    
    cnt = this.contentsProc.img_delete(contentsVO);
    // mav.addObject("cnt", cnt); // request.setAttribute("cnt", cnt)
    
  } else {
    mav.setViewName("/contents/update_msg"); // webapp/contents/update_msg.jsp
    
  }

  mav.addObject("cnt", cnt); // request�� ����
  mav.addObject("passwd_cnt", passwd_cnt); // request�� ����
          
  return mav;    
}
/**
 * ������ ����
 * @param contentsno
 * @return
 */
  @RequestMapping(value="/contents/delete.do", method=RequestMethod.GET )
 public ModelAndView delete(int contentsno) { 
    ModelAndView mav = new  ModelAndView();
 
 ContentsVO contentsVO = this.contentsProc.read_update(contentsno); // ������ �б�
  mav.addObject("contentsVO", contentsVO); 
  
  mav.setViewName("/contents/delete"); // webapp/contents/delete.jsp
 
  return mav; 
  }
//http://localhost:9090/resort/contents/delete.do
 /**
  * ���� ó�� +  ���� ����
  * @param contentsVO
  * @return
  */
 @RequestMapping(value="/contents/delete.do", method=RequestMethod.POST )
 public ModelAndView delete(HttpServletRequest request,
                                          int genreno, 
                                          int contentsno, 
                                          String passwd,
                                          @RequestParam(value="word", defaultValue="") String word,
                                          @RequestParam(value="nowPage", defaultValue="1") int nowPage) {
   ModelAndView mav = new ModelAndView();
  
   ContentsVO contentsVO = this.contentsProc.read(contentsno);
   String title = contentsVO.getTitle();
   mav.addObject("title", title);
   
   HashMap<String, Object> hashMap = new HashMap<String, Object>();
   hashMap.put("contentsno", contentsno);
   hashMap.put("passwd", passwd);
   
   int passwd_cnt = 0; // �н����� ��ġ ���ڵ� ����
   int cnt = 0;             // ������ ���ڵ� ���� 
   
   passwd_cnt = this.contentsProc.passwd_check(hashMap);
   boolean sw = false;
   
   if (passwd_cnt == 1) { // �н����尡 ��ġ�� ��� �� ����
     cnt = this.contentsProc.delete(contentsno);
     if (cnt == 1) {
       genreProc.decreaseCnt(genreno);
       
       // -------------------------------------------------------------------------------------
       // ������ �������� ���ڵ� �������� ������ ��ȣ -1 ó��
       HashMap<String, Object> map = new HashMap<String, Object>();
       map.put("genreno", genreno);
       map.put("word", word);
       // �ϳ��� �������� 3���� ���ڵ�� �����Ǵ� ��� ���� 9���� ���ڵ尡 ���� ������
       if (contentsProc.search_count(map) % Contents.RECORD_PER_PAGE == 0) {
         nowPage = nowPage - 1;
         if (nowPage < 1) {
           nowPage = 1; // ���� ������
         }
       }
       // -------------------------------------------------------------------------------------
     }
     
     String upDir = Tool.getRealPath(request, "/contents/storage/main_images"); // ���� ���
     sw = Tool.deleteFile(upDir, contentsVO.getFile1());  // Folder���� 1���� ���� ����
     sw = Tool.deleteFile(upDir, contentsVO.getThumb1());  // Folder���� 1���� ���� ����

   }

   mav.addObject("cnt", cnt); // request�� ����
   mav.addObject("passwd_cnt", passwd_cnt); // request�� ����
   mav.addObject("nowPage", nowPage); // request�� ����
   // System.out.println("--> ContentsCont.java nowPage: " + nowPage);
   
   mav.addObject("genreno", contentsVO.getGenreno()); // redirect parameter ����
   mav.addObject("url", "delete_msg"); // delete_msg.jsp, redirect parameter ����
   
   // mav.setViewName("/contents/delete_msg"); // webapp/contents/delete_msg.jsp
   mav.setViewName("redirect:/contents/msg.do"); 
   
   return mav;
 }
  /**
   * ī�װ��� ��� http://localhost:9090/movie/contents/list.do
   * 
   * @return
   */
  
  /*
   * @RequestMapping(value = "/contents/list.do", method = RequestMethod.GET)
   * public ModelAndView list_by_genreno(int genreno) { ModelAndView mav = new
   * ModelAndView(); // /webapp/contents/list_by_genreno.jsp // //
   * mav.setViewName("/contents/list_by_genreno");
   * 
   * // ���̺� �̹��� ���, /webapp/contents/list_by_genreno.jsp
   * mav.setViewName("/contents/list_by_genreno_table_img1");
   * 
   * GenreVO genreVO = this.genreProc.read(genreno); mav.addObject("genreVO",
   * genreVO);
   * 
   * 
   * List<ContentsVO> list = this.contentsProc.list_by_genreno(genreno);
   * mav.addObject("list", list);
   * 
   * return mav; // forward }
   * 
   * }
   */
 /**
  * ��� + �˻� + ����¡ ����
  * http://localhost:9090/resort/contents/list.do
  * http://localhost:9090/resort/contents/list.do?genreno=1&word=������&nowPage=1
  * @param genreno
  * @param word
  * @param nowPage
  * @return
  */
 @RequestMapping(value = "/contents/list_by_genreno_grid1.do", 
                                      method = RequestMethod.GET)
 public ModelAndView list_by_genreno_grid1(
     @RequestParam(value="genreno", defaultValue="1") int genreno,
     @RequestParam(value="word", defaultValue="") String word,
     @RequestParam(value="nowPage", defaultValue="1") int nowPage
     ) { 
   System.out.println("--> nowPage: " + nowPage);
   
   ModelAndView mav = new ModelAndView();
   
   // ���ڿ� ���ڿ� Ÿ���� �����ؾ������� Obejct ���
   HashMap<String, Object> map = new HashMap<String, Object>();
   map.put("genreno", genreno); // #{genreno}
   map.put("word", word);     // #{word}
   map.put("nowPage", nowPage);  // �������� ����� ���ڵ��� ������ �����ϱ����� ���     
   
   // �˻� ���
   List<ContentsVO> list = contentsProc.list_by_genreno_search_paging(map);
   mav.addObject("list", list);
   
   // �˻��� ���ڵ� ����
   int search_count = contentsProc.search_count(map);
   mav.addObject("search_count", search_count);
 
   GenreVO genreVO = genreProc.read(genreno);
   mav.addObject("genreVO", genreVO);
   


   /*
    * SPAN�±׸� �̿��� �ڽ� ���� ����, 1 ���������� ���� 
    * ���� ������: 11 / 22   [����] 11 12 13 14 15 16 17 18 19 20 [����] 
    * 
    * @param listFile ��� ���ϸ� 
    * @param genreno ī�װ���ȣ 
    * @param search_count �˻�(��ü) ���ڵ�� 
    * @param nowPage     ���� ������
    * @param word �˻���
    * @return ����¡ ���� ���ڿ�
    */ 
   String paging = contentsProc.pagingBox("list.do", genreno, search_count, nowPage, word);
   mav.addObject("paging", paging);
 
   mav.addObject("nowPage", nowPage);

   mav.setViewName("/contents/list_by_genreno_grid1");   
   
   return mav;
 }    
    
    // http://localhost:9090/resort/contents/youtube_create.do?genreno=25&contentsno=28
    /**
     * Youtube ��� ��
     * @return
     */
    @RequestMapping(value="/contents/youtube_create.do", method=RequestMethod.GET )
    public ModelAndView youtube_create(int genreno, int contentsno) {
      ModelAndView mav = new ModelAndView();
      
      GenreVO genreVO = this.genreProc.read(genreno);
      mav.addObject("genreVO", genreVO);
      

      
      ContentsVO contentsVO = this.contentsProc.read(contentsno);
      mav.addObject("contentsVO", contentsVO);

      mav.setViewName("/contents/youtube_create"); // webapp/contents/youtube_create.jsp
      
      return mav;
    }
    
    // http://localhost:9090/resort/contents/youtube_create.do
    /**
     * Youtube ���
     * @param genreno ī�װ� ��ȣ
     * @param contentsno �۹�ȣ
     * @param youtube ���� ��ũ��Ʈ
     * @return
     */
    @RequestMapping(value="/contents/youtube_create.do", method=RequestMethod.POST )
    public ModelAndView youtube_create(int genreno, int contentsno, String youtube, String passwd) {
      ModelAndView mav = new ModelAndView();

      HashMap<String, Object> hashMap = new HashMap<String, Object>();
      hashMap.put("youtube", youtube);
      hashMap.put("contentsno", contentsno);
      hashMap.put("passwd", passwd);
      
      this.contentsProc.youtube(hashMap); // ���� ���
      
      mav.addObject("contentsno", contentsno);
      
      mav.setViewName("redirect:/contents/read.do"); // webapp/contents/read.jsp
      
      return mav;
    }

    // http://localhost:9090/resort/contents/youtube_delete.do
    /**
     * Youtube ���� ó��
     * @param genreno ī�װ� ��ȣ
     * @param contentsno �۹�ȣ
     * @param paswd �н�����  
     * @param map ���� ��ũ��Ʈ
     * @return
     */
    @RequestMapping(value="/contents/youtube_delete.do", method=RequestMethod.POST )
    public ModelAndView youtube_delete_proc(int genreno, int contentsno, String passwd) {
      ModelAndView mav = new ModelAndView();

      // System.out.println("map: " + map);
      // System.out.println("contentsno: " + contentsno);
      
      HashMap<String, Object> hashMap = new HashMap<String, Object>();
      hashMap.put("youtube", ""); // map ����
      hashMap.put("contentsno", contentsno);
      hashMap.put("passwd", passwd);
      
      this.contentsProc.youtube(hashMap); // ���� ���� ó��
      
      mav.addObject("contentsno", contentsno);
      
      mav.setViewName("redirect:/contents/read.do"); // webapp/contents/read.jsp
      
      return mav;
    }
    // http://localhost:9090/resort/contents/passwd.do?contentsno=28&passwd=123
    /**
     * ���� �н����� üũ, JSON ���
     * @return
     */
    @ResponseBody
    @RequestMapping(value="/contents/passwd.do", method=RequestMethod.GET ,
                                produces = "text/plain;charset=UTF-8" )
    public String passwd(int contentsno, String passwd) {
      HashMap<String, Object> hashMap = new HashMap<String, Object>();
      hashMap.put("contentsno", contentsno);
      hashMap.put("passwd", passwd);
      
      int cnt = this.contentsProc.passwd_check(hashMap);
      
      JSONObject json = new JSONObject();
      json.put("cnt", cnt);
      
      return json.toString(); 
    }

    /**
     * ��� + �˻� ����
     * http://localhost:9090/resort/contents/list.do
     * http://localhost:9090/resort/contents/list.do?genreno=1&word=������
     * @param genreno
     * @param word
     * @return
     */
    /*
     * @RequestMapping(value = "/contents/list.do", method = RequestMethod.GET)
     * public ModelAndView list_by_genreno_search(
     * 
     * @RequestParam(value="genreno", defaultValue="1") int genreno,
     * 
     * @RequestParam(value="word", defaultValue="") String word ) {
     * 
     * ModelAndView mav = new ModelAndView(); //
     * /contents/list_by_genreno_table_img1_search.jsp
     * mav.setViewName("/contents/list_by_genreno_table_img1_search");
     * 
     * // ���ڿ� ���ڿ� Ÿ���� �����ؾ������� Obejct ��� HashMap<String, Object> map = new
     * HashMap<String, Object>(); map.put("genreno", genreno); // #{genreno}
     * map.put("word", word); // #{word}
     * 
     * // �˻� ��� List<ContentsVO> list = contentsProc.list_by_genreno_search(map);
     * mav.addObject("list", list);
     * 
     * // �˻��� ���ڵ� ���� int search_count = contentsProc.search_count(map);
     * mav.addObject("search_count", search_count);
     * 
     * GenreVO genreVO = genreProc.read(genreno); mav.addObject("genreVO", genreVO);
     * 
     * 
     * 
     * return mav; }
     */
    
    /**
     * ��� + �˻� + ����¡ ����
     * http://localhost:9090/resort/contents/list.do
     * http://localhost:9090/resort/contents/list.do?genreno=1&word=������&nowPage=1
     * @param genreno
     * @param word
     * @param nowPage
     * @return
     */
    @RequestMapping(value = "/contents/list.do", 
                                         method = RequestMethod.GET)
    public ModelAndView list_by_genreno_search_paging(
        @RequestParam(value="genreno", defaultValue="1") int genreno,
        @RequestParam(value="word", defaultValue="") String word,
        @RequestParam(value="nowPage", defaultValue="1") int nowPage
        ) { 
      System.out.println("--> nowPage: " + nowPage);
      
      ModelAndView mav = new ModelAndView();
      
      // ���ڿ� ���ڿ� Ÿ���� �����ؾ������� Obejct ���
      HashMap<String, Object> map = new HashMap<String, Object>();
      map.put("genreno", genreno); // #{genreno}
      map.put("word", word);     // #{word}
      map.put("nowPage", nowPage);  // �������� ����� ���ڵ��� ������ �����ϱ����� ���     
      
      // �˻� ���
      List<ContentsVO> list = contentsProc.list_by_genreno_search_paging(map);
      mav.addObject("list", list);
      
      // �˻��� ���ڵ� ����
      int search_count = contentsProc.search_count(map);
      mav.addObject("search_count", search_count);
    
      GenreVO genreVO = genreProc.read(genreno);
      mav.addObject("genreVO", genreVO);
      


      /*
       * SPAN�±׸� �̿��� �ڽ� ���� ����, 1 ���������� ���� 
       * ���� ������: 11 / 22   [����] 11 12 13 14 15 16 17 18 19 20 [����] 
       * 
       * @param listFile ��� ���ϸ� 
       * @param genreno ī�װ���ȣ 
       * @param search_count �˻�(��ü) ���ڵ�� 
       * @param nowPage     ���� ������
       * @param word �˻���
       * @return ����¡ ���� ���ڿ�
       */ 
      String paging = contentsProc.pagingBox("list.do", genreno, search_count, nowPage, word);
      mav.addObject("paging", paging);
    
      mav.addObject("nowPage", nowPage);

      // /contents/list_by_genreno_table_img1_search_paging.jsp
      mav.setViewName("/contents/list_by_genreno_table_img1_search_paging");   
      
      return mav;
    }    
    
    // http://localhost:9090/resort/contents/reply.do?genreno=1&contentsno=1
    /**
     * �亯 ��
     * @return
     */
    @RequestMapping(value="/contents/reply.do", method=RequestMethod.GET )
    public ModelAndView reply(int genreno, int contentsno) {
      ModelAndView mav = new ModelAndView();
      System.out.println("�亯 ���: " + contentsno);
      
      GenreVO genreVO = this.genreProc.read(genreno);
      mav.addObject("genreVO", genreVO);
      

      mav.setViewName("/contents/reply"); // webapp/contents/reply.jsp
      
      return mav;
    }

    // http://localhost:9090/resort/contents/reply.do
    /**
     * �亯 ��� ó��
     * @return
     */
    @RequestMapping(value="/contents/reply.do", 
                                method=RequestMethod.POST )
    public ModelAndView reply(HttpServletRequest request, ContentsVO contentsVO) {
      ModelAndView mav = new ModelAndView();
      // -------------------------------------------------------------------
      // ���� ���� �ڵ� ����
      // -------------------------------------------------------------------
      String file1 = "";     // main image
      String thumb1 = ""; // preview image
          
      String upDir = Tool.getRealPath(request, "/contents/storage/main_images"); // ���� ���
      // ���� ������ ����� fnamesMF ��ü�� ������.
      MultipartFile mf = contentsVO.getFile1MF();
      long size1 = mf.getSize();  // ���� ũ��
      if (size1 > 0) { // ���� ũ�� üũ
        // mp3 = mf.getOriginalFilename(); // ���� ���ϸ�, spring.jpg
        // ���� ���� �� ���ε�� ���ϸ��� ���ϵ�, spring.jsp, spring_1.jpg...
        file1 = Upload.saveFileSpring(mf, upDir); 
        
        if (Tool.isImage(file1)) { // �̹������� �˻�
          // thumb �̹��� ������ ���ϸ� ���ϵ�, width: 120, height: 80
          thumb1 = Tool.preview(upDir, file1, 250, 200); 
        }
        
      }    
      // -------------------------------------------------------------------
      // ���� ���� �ڵ� ����
      // -------------------------------------------------------------------
      

      // PK return ��
      contentsVO.setFile1(file1);
      contentsVO.setThumb1(thumb1);
      contentsVO.setSize1(size1);
      
       // --------------------------- �亯 ���� �ڵ� ���� --------------------------
       ContentsVO parentVO = contentsProc.read(contentsVO.getContentsno()); // �θ�� ���� ����
       
       HashMap<String, Object> map = new HashMap<String, Object>();
       map.put("grpno", parentVO.getGrpno());
       map.put("ansnum",  parentVO.getAnsnum());
       contentsProc.increaseAnsnum(map); // ���� ��ϵ� �θ�� ansnum�� 1 ������Ŵ.

       contentsVO.setGrpno(parentVO.getGrpno()); // �θ��� �׷��ȣ �Ҵ�
       contentsVO.setIndent(parentVO.getIndent() + 1); // �亯 ���� ����
       contentsVO.setAnsnum(parentVO.getAnsnum() + 1); // �θ� �ٷ� �Ʒ� ���
       // --------------------------- �亯 ���� �ڵ� ���� --------------------------
       
      int cnt = this.contentsProc.reply(contentsVO); // Call By Reference�� ����
      
      System.out.println("cnt: " + cnt);
      mav.addObject("cnt", cnt);
      
      // ---------------------------------------------------------------------------------------
      // cnt, contentsno return 
      // ---------------------------------------------------------------------------------------
      // Spring <-----> contentsVO <-----> MyBATIS
      // Spring�� MyBATIS�� ContentsVO�� �����ϰ� ����.
      // MyBATIS�� insert�� PK �÷��� contentsno������ ���� ������ PK�� �Ҵ���.
      int contentsno = contentsVO.getContentsno();  // MyBATIS ���ϵ� PK
      System.out.println("contentsno: " + contentsno);
      mav.addObject("contentsno", contentsno); // request�� ����
      // ---------------------------------------------------------------------------------------
      
      mav.addObject("genreno", contentsVO.getGenreno());
      mav.addObject("url", "reply_msg"); // // webapp/contents/reply_msg.jsp
      
      if (cnt == 1) {  // ���������� ���� ��ϵ� ��츸 �� �� ����
        this.genreProc.increaseCnt(contentsVO.getGenreno()); // �ۼ� ����
      }
      /*
       * // mav.setViewName("/contents/create_msg"); //
       * mav.setViewName("redirect:/contents/list.do"); // spring ��ȣ��
       * mav.setViewName("redirect:/contents/msg.do"); } else { //
       * mav.setViewName("/contents/create_msg"); // webapp/contents/create_msg.jsp }
       */    
      
      mav.setViewName("redirect:/contents/msg.do");
      
      return mav;
    }

}
