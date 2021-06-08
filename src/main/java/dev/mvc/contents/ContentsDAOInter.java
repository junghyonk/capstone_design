package dev.mvc.contents;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

public interface ContentsDAOInter {
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
   * 수정 처리
   * @param contentsVO
   * @return
   */
  public int update(ContentsVO contentsVO);
  
  /**
   * 이미지 변경
   * @param contentsVO
   * @return
   */
  public int update_img(ContentsVO contentsVO);
  
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
   * 장르별 검색 목록
   * @param hashMap
   * @return
   */
  public List<ContentsVO> total_search(HashMap<String, Object> hashMap);

  /**
   * 장르별 검색 레코드 갯수
   * @param hashMap
   * @return
   */
  public int total_search_count(HashMap<String, Object> hashMap);
  
  

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
  public ArrayList<ContentsVO> list_by_genreno_search_paging(HashMap<String, Object> map);
  
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
