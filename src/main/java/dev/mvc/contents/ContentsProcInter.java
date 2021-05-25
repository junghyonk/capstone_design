package dev.mvc.contents;

import java.util.HashMap;
import java.util.List;

public interface ContentsProcInter {

  /**
   * 
   * @param contentsVO
   * @return
   */
  public int create(ContentsVO contentsVO);

  /**
   * 모든 장르의 등록된 글목록
   * @return
   */
  public List<ContentsVO> list_all();
  
  /**
   * 조회
   * @param contentsno
   * @return
   */
  public ContentsVO read(int contentsno);
  
  /**
   * 수정용 조회
   * @param contentsno
   * @return
   */
  public ContentsVO read_update(int contentsno);
  
  
  /**
   * 수정 처리
   * @param contentsVO
   * @return
   */
  public int update(ContentsVO contentsVO);
  
  /**
   * 이미지 등록
   * @param contentsVO
   * @return
   */
  public int img_create(ContentsVO contentsVO);
  
  /**
   * 이미지 수정
   * @param contentsVO
   * @return
   */
  public int img_update(ContentsVO contentsVO);

  /**
   * 이미지 삭제
   * @param contentsVO
   * @return
   */
  public int img_delete(ContentsVO contentsVO);
  
  /**
   * 패스워드 검사
   * @param hashMap
   * @return
   */
  public int passwd_check(HashMap<String, Object> hashMap);
  
  
  /**
   * 삭제
   * @param contentsno
   * @return
   */
  public int delete(int contentsno);
  
  /**
   * 특정 장르의 등록된 글목록
   * @return
   */
  public List<ContentsVO> list_by_genreno(int genreno);
  
  /**
   * 전체 레코드 갯수
   * @return
   */
  public int total_count();
  
  /**
   * 유투브 제작
   * @return
   */
  public int youtube(HashMap<String,Object> hashMap);
  
  /**
   * 장르별 검색 목록
   * @param hashMap
   * @return
   */
  public List<ContentsVO> list_by_genreno_search(HashMap<String, Object> hashMap);

  /**
   * 장르별 검색 레코드 갯수
   * @param hashMap
   * @return
   */
  public int search_count(HashMap<String, Object> hashMap);
  
  /**
   * 검색 + 페이징 목록
   * @param map
   * @return
   */
  public List<ContentsVO> list_by_genreno_search_paging(HashMap<String, Object> map);

  /**
   * 페이지 목록 문자열 생성, Box 형태
   * @param listFile 목록 파일명 
   * @param categrpno 카테고리번호
   * @param search_count 검색 갯수
   * @param nowPage 현재 페이지, nowPage는 1부터 시작
   * @param word 검색어
   * @return
   */
  public String pagingBox(String listFile, int genreno, int search_count, int nowPage, String word);
  
  /**
   * 답변 순서 증가
   * @param map
   * @return
   */
  public int increaseAnsnum(HashMap<String, Object> map);
   
  /**
   * 답변
   * @param contentsVO
   * @return
   */
  public int reply(ContentsVO contentsVO);
 

}
