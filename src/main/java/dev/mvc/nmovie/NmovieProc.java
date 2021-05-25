package dev.mvc.nmovie;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("dev.mvc.nmovie.NmovieProc")
public class NmovieProc implements NmovieProcInter {

  @Autowired
  private NmovieDAOInter nmovieDAO;
  
  
  @Override
  public List<NmovieVO> list_nmovieno_asc() {
    List<NmovieVO> list=this.nmovieDAO.list_nmovieno_asc();
    return list;
  }


  @Override
  public NmovieVO read(int nos) {
    NmovieVO nmovieVO=this.nmovieDAO.read(nos);
    return nmovieVO;
  }

}
