package dev.mvc.nmovie;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import dev.mvc.genre.GenreVO;



@Controller
public class NmovieCont {

  @Autowired
  @Qualifier("dev.mvc.nmovie.NmovieProc")
  private NmovieProc nmovieProc;
  
  
  
  /**
   * 카테고리별 목록 http://localhost:9090/movie/nmovie/list.do
   * 
   * @return
   */
  
  
    @RequestMapping(value = "/nmovie/list.do", method = RequestMethod.GET)
    public ModelAndView list_nmovieno_asc() { 
      ModelAndView mav = new ModelAndView(); 
    mav.setViewName("/nmovie/list_all");
    
    List <NmovieVO> list = this.nmovieProc.list_nmovieno_asc();
    mav.addObject("list", list);
    
    return mav; // forward }
    
    }
    
    /**
     * 조회 + 수정폼 http://localhost:9090/movie/nmovie/read_update.do
     * 
     * @return
     */
    @RequestMapping(value = "/nmovie/read.do", method = RequestMethod.GET)
    public ModelAndView read_update(int nos) {
      ModelAndView mav = new ModelAndView();
      
      mav.setViewName("/nmovie/read_img"); 
      NmovieVO nmovieVO = this.nmovieProc.read(nos);
      mav.addObject("nmovieVO", nmovieVO);

      List<NmovieVO> list = this.nmovieProc.list_nmovieno_asc();
      mav.addObject("list", list);

      return mav; // forward
    }
}
