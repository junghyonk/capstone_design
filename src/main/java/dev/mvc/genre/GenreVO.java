package dev.mvc.genre;

public class GenreVO {
  /*
   * genreno NUMERIC(10) NOT NULL PRIMARY KEY, 
   * name VARCHAR(50) NOT NULL, 
   * visibleCHAR(10) DEFAULT 'Y' NOT NULL, 
   * rdate DATE NOT NULL
   */
  
  /*  �帣��ȣ    */
  private  int genreno;
  
  /*  �帣 �̸�     */
  private String name;
  
  /*  ��¸��      */
  private String visible="";
  
  /** �׷� ������ */
  private String rdate = "";
  
  /** ������ �� */
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
