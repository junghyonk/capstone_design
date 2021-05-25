package dev.mvc.genre;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;



@Component("dev.mvc.genre.GenreProc")
public class GenreProc implements GenreProcInter {

  @Autowired
  private GenreDAOInter genreDAO; 
  
  @Override
  public int create(GenreVO genreVO) {
    int cnt=this.genreDAO.create(genreVO);
    return cnt;
  }

  @Override
  public List<GenreVO> list_genreno_asc() {
    List<GenreVO> list=this.genreDAO.list_genreno_asc();
    return list;
  }

  @Override
  public GenreVO read(int genreno) {
   GenreVO genreVO=this.genreDAO.read(genreno);
   return genreVO;
  }

  @Override
  public int update(GenreVO genreVO) {
    int cnt=this.genreDAO.update(genreVO);
    return cnt;
  }

  @Override
  public int delete(int genreno) {
    int cnt=this.genreDAO.delete(genreno);
    return cnt;
  }

  @Override
  public int update_visible(GenreVO genreVO) {
    if (genreVO.getVisible().equalsIgnoreCase("Y")) {
      genreVO.setVisible("N");
    } else {
      genreVO.setVisible("Y");
    }
        
    int cnt = this.genreDAO.update_visible(genreVO);
    return cnt;
  }

  @Override
  public int increaseCnt(int genreno) {
    int cnt = this.genreDAO.increaseCnt(genreno);
    return cnt;
  }

  @Override
  public int decreaseCnt(int genreno) {
    int cnt = this.genreDAO.decreaseCnt(genreno);
    return cnt;
  }
  
}
