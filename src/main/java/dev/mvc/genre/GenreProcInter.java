package dev.mvc.genre;

import java.util.List;

public interface GenreProcInter {

  /**
   * <Xmp>
   * ī�װ� �׷� ���
   * <insert id="create" parameterType="GenreVO"> 
   * </Xmp>
   * @param genreVO
   * @return ó���� ���ڵ� ����
   */
  public int create(GenreVO genreVO);
  
  /**
   * ���
   * <xmp>
   * <select id="list_Genreno_asc" resultType="GenreVO">
   * </xmp> 
   * @return ���ڵ� ���
   */
  public List<GenreVO> list_genreno_asc();
  
  /**
   * ��ȸ
   * <xmp>
   *   <select id="read" resultType="GenreVO" parameterType="int">
   * </xmp>  
   * @param Genreno
   * @return
   */
  public GenreVO read(int genreno);
  
  /**
   * ���� ó��
   * <xmp>
   *   <update id="update" parameterType="GenreVO"> 
   * </xmp>
   * @param GenreVO
   * @return ó���� ���ڵ� ����
   */
  public int update(GenreVO genreVO);
  
  /**
   * ���� ó��
   * <xmp>
   *   <delete id="delete" parameterType="int">
   * </xmp> 
   * @param Genreno
   * @return ó���� ���ڵ� ����
   */
  public int delete(int genreno);
  
  
  /**
   * visible ����
   * @param GenreVO
   * @return
   */
  public int update_visible(GenreVO genreVO);
  
  /**
   * �� �� ����
   * @return
   */
  public int increaseCnt(int genreno);    

  /**
   * �� �� ����
   * @return
   */
  public int decreaseCnt(int genreno);
}
