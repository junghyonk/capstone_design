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
   * ��� �帣�� ��ϵ� �۸��
   * @return
   */
  public List<ContentsVO> list_all();
  
  /**
   * ��ȸ
   * @param contentsno
   * @return
   */
  public ContentsVO read(int contentsno);
  
  
  /**
   * ���� ó��
   * @param contentsVO
   * @return
   */
  public int update(ContentsVO contentsVO);
  
  /**
   * �̹��� ����
   * @param contentsVO
   * @return
   */
  public int update_img(ContentsVO contentsVO);
  
  /**
   * �н����� �˻�
   * @param hashMap
   * @return
   */
  public int passwd_check(HashMap<String, Object> hashMap);
  
  
  /**
   * ����
   * @param contentsno
   * @return
   */
  public int delete(int contentsno);
  
  /**
   * Ư�� �帣�� ��ϵ� �۸��
   * @return
   */
  public List<ContentsVO> list_by_genreno(int genreno);
  
  /**
   * ��ü ���ڵ� ����
   * @return
   */
  public int total_count();
  
  /**
   * ������ ����
   * @return
   */
  public int youtube(HashMap<String,Object> hashMap);
  
  /**
   * �帣�� �˻� ���
   * @param hashMap
   * @return
   */
  public List<ContentsVO> list_by_genreno_search(HashMap<String, Object> hashMap);
  
  
  /**
   * �帣�� �˻� ���
   * @param hashMap
   * @return
   */
  public List<ContentsVO> total_search(HashMap<String, Object> hashMap);

  /**
   * �帣�� �˻� ���ڵ� ����
   * @param hashMap
   * @return
   */
  public int total_search_count(HashMap<String, Object> hashMap);
  
  

  /**
   * �帣�� �˻� ���ڵ� ����
   * @param hashMap
   * @return
   */
  public int search_count(HashMap<String, Object> hashMap);
  
  /**
   * �˻� + ����¡ ���
   * @param map
   * @return
   */
  public ArrayList<ContentsVO> list_by_genreno_search_paging(HashMap<String, Object> map);
  
  /**
   * �亯 ���� ����
   * @param map
   * @return
   */
  public int increaseAnsnum(HashMap<String, Object> map);
   
  /**
   * �亯
   * @param contentsVO
   * @return
   */
  public int reply(ContentsVO contentsVO);

}
