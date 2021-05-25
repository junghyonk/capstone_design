package dev.mvc.nmovie;

import java.util.List;

public interface NmovieProcInter {

  public List<NmovieVO>  list_nmovieno_asc();
  
  public NmovieVO read(int nos);
  
}
