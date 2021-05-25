package dev.mvc.nmovie;

import java.util.List;



public interface NmovieDAOInter {
  
  
  public List<NmovieVO>  list_nmovieno_asc();
  
  
  public NmovieVO read(int nos);
}
