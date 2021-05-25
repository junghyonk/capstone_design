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
  /** ������ ��ȣ */
  private int contentsno;
  /** �帣 ��ȣ*/
  private int genreno;
  /** ���� */
  private String title = "";
  /** ���� */
  private String content = "";
  /** ��õ�� */
  private int recom;
  /** ��ȸ�� */
  int cnt = 0;
  /** ���ͳ� �ּ�*/
  private String web = "";
  /** Youtube */
  private String youtube = "";
  /** �н����� */
  private String passwd = "";
  /** �˻��� */
  private String word = "";
  /** ��� ��¥ */
  private String rdate = "";
  
  /** �̹��� */
  private String file1 = "";
  /** preview �̹��� preview */
  private String thumb1 = "";
  /** ����� ���� ������ */
  private long size1;
  
  /** ���� ������ �뷮 ���̺� */
  private String size1_label;
  
  // �亯 ���� ����
  // -----------------------------------------------------
  /** �׷��ȣ */
  private int grpno;
  /** �亯 ���� */
  private int indent;
  /** �亯 ��� ���� */
  private int ansnum; 
  // -----------------------------------------------------  
  // �亯 ���� ����
  
  /** 
   �̹��� MultipartFile 
   <input type='file' class="form-control" name='file1MF' id='file1MF' 
                    value='' placeholder="���� ����" multiple="multiple">
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
