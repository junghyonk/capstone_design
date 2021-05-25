package dev.mvc.genre;

public class GenreVO {
  /*
   * genreno NUMERIC(10) NOT NULL PRIMARY KEY, 
   * name VARCHAR(50) NOT NULL, 
   * visibleCHAR(10) DEFAULT 'Y' NOT NULL, 
   * rdate DATE NOT NULL
   */
  
  /*  장르번호    */
  private  int genreno;
  
  /*  장르 이름     */
  private String name;
  
  /*  출력모드      */
  private String visible="";
  
  /** 그룹 생성일 */
  private String rdate = "";
  
  /** 컨텐츠 수 */
  private int cnt ;

  public int getCnt() {
    return cnt;
  }

  public void setCnt(int cnt) {
    this.cnt = cnt;
  }

  public int getGenreno() {
    return genreno;
  }

  public void setGenreno(int genreno) {
    this.genreno = genreno;
  }

  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }

  public String getVisible() {
    return visible;
  }

  public void setVisible(String visible) {
    this.visible = visible;
  }

  public String getRdate() {
    return rdate;
  }

  public void setRdate(String rdate) {
    this.rdate = rdate;
  }
}
