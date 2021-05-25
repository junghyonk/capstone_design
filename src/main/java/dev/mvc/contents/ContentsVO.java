package dev.mvc.contents;

import org.springframework.web.multipart.MultipartFile;

public class ContentsVO {
  /**
   *  
   contentsno                            NUMBER(10)         NOT NULL         PRIMARY KEY,
    genreno                                NUMBER(10)         NOT NULL ,
    title                                 VARCHAR2(300)         NOT NULL,
    content                               CLOB                  NOT NULL,
    recom                                 NUMBER(7)         DEFAULT 0         NOT NULL,
    cnt                                   NUMBER(7)         DEFAULT 0         NOT NULL,
    replycnt                              NUMBER(7)         DEFAULT 0         NOT NULL,
    web                                   VARCHAR2(500)         NULL ,
    youtube                               VARCHAR2(1000)         NULL ,
    grpno                                 NUMBER(8)         DEFAULT 0         NOT NULL,
    indent                                NUMBER(2)         DEFAULT 0         NOT NULL,
    ansnum                                NUMBER(3)         DEFAULT 0         NOT NULL,
    word                                  VARCHAR2(300)         NULL ,
    rdate                                 DATE               NOT NULL,
    file1                                   VARCHAR(100)          NULL,
    thumb1                              VARCHAR(100)          NULL,
    size1                                 NUMBER(10)      DEFAULT 0 NULL,  
    passwd                                VARCHAR2(15)         NOT NULL,
   */
  /** 컨텐츠 번호 */
  private int contentsno;
  /** 장르 번호*/
  private int genreno;
  /** 제목 */
  private String title = "";
  /** 내용 */
  private String content = "";
  /** 추천수 */
  private int recom;
  /** 조회수 */
  int cnt = 0;
  /** 인터넷 주소*/
  private String web = "";
  /** Youtube */
  private String youtube = "";
  /** 패스워드 */
  private String passwd = "";
  /** 검색어 */
  private String word = "";
  /** 등록 날짜 */
  private String rdate = "";
  
  /** 이미지 */
  private String file1 = "";
  /** preview 이미지 preview */
  private String thumb1 = "";
  /** 저장된 파일 사이즈 */
  private long size1;
  
  /** 파일 사이즈 용량 레이블 */
  private String size1_label;
  
  // 답변 관련 시작
  // -----------------------------------------------------
  /** 그룹번호 */
  private int grpno;
  /** 답변 차수 */
  private int indent;
  /** 답변 출력 순서 */
  private int ansnum; 
  // -----------------------------------------------------  
  // 답변 관련 종료
  
  /** 
   이미지 MultipartFile 
   <input type='file' class="form-control" name='file1MF' id='file1MF' 
                    value='' placeholder="파일 선택" multiple="multiple">
   */
  private MultipartFile file1MF;
  
  public int getContentsno() {
    return contentsno;
  }
  public void setContentsno(int contentsno) {
    this.contentsno = contentsno;
  }
  public int getGenreno() {
    return genreno;
  }
  public void setGenreno(int genreno) {
    this.genreno = genreno;
  }
  public String getTitle() {
    return title;
  }
  public void setTitle(String title) {
    this.title = title;
  }
  public String getContent() {
    return content;
  }
  public void setContent(String content) {
    this.content = content;
  }
  public int getRecom() {
    return recom;
  }
  public void setRecom(int recom) {
    this.recom = recom;
  }
  public int getCnt() {
    return cnt;
  }
  public void setCnt(int cnt) {
    this.cnt = cnt;
  }
  public String getWeb() {
    return web;
  }
  public void setWeb(String web) {
    this.web = web;
  }
  public String getYoutube() {
    return youtube;
  }
  public void setYoutube(String youtube) {
    this.youtube = youtube;
  }
  public String getPasswd() {
    return passwd;
  }
  public void setPasswd(String passwd) {
    this.passwd = passwd;
  }
  public String getWord() {
    return word;
  }
  public void setWord(String word) {
    this.word = word;
  }
  public String getRdate() {
    return rdate;
  }
  public void setRdate(String rdate) {
    this.rdate = rdate;
  }
  public String getFile1() {
    return file1;
  }
  public void setFile1(String file1) {
    this.file1 = file1;
  }
  public String getThumb1() {
    return thumb1;
  }
  public void setThumb1(String thumb1) {
    this.thumb1 = thumb1;
  }
  public long getSize1() {
    return size1;
  }
  public void setSize1(long size1) {
    this.size1 = size1;
  }
  public String getSize1_label() {
    return size1_label;
  }
  public void setSize1_label(String size1_label) {
    this.size1_label = size1_label;
  }
  public MultipartFile getFile1MF() {
    return file1MF;
  }
  public void setFile1MF(MultipartFile file1mf) {
    file1MF = file1mf;
  }
  public int getGrpno() {
    return grpno;
  }
  public void setGrpno(int grpno) {
    this.grpno = grpno;
  }
  public int getIndent() {
    return indent;
  }
  public void setIndent(int indent) {
    this.indent = indent;
  }
  public int getAnsnum() {
    return ansnum;
  }
  public void setAnsnum(int ansnum) {
    this.ansnum = ansnum;
  }

}
