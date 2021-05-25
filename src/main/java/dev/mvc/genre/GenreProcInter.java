package dev.mvc.genre;

import java.util.List;

public interface GenreProcInter {

  /**
   * <Xmp>
   * 카테고리 그룹 등록
   * <insert id="create" parameterType="GenreVO"> 
   * </Xmp>
   * @param genreVO
   * @return 처리된 레코드 갯수
   */
  public int create(GenreVO genreVO);
  
  /**
   * 목록
   * <xmp>
   * <select id="list_Genreno_asc" resultType="GenreVO">
   * </xmp> 
   * @return 레코드 목록
   */
  public List<GenreVO> list_genreno_asc();
  
  /**
   * 조회
   * <xmp>
   *   <select id="read" resultType="GenreVO" parameterType="int">
   * </xmp>  
   * @param Genreno
   * @return
   */
  public GenreVO read(int genreno);
  
  /**
   * 수정 처리
   * <xmp>
   *   <update id="update" parameterType="GenreVO"> 
   * </xmp>
   * @param GenreVO
   * @return 처리된 레코드 갯수
   */
  public int update(GenreVO genreVO);
  
  /**
   * 삭제 처리
   * <xmp>
   *   <delete id="delete" parameterType="int">
   * </xmp> 
   * @param Genreno
   * @return 처리된 레코드 갯수
   */
  public int delete(int genreno);
  
  
  /**
   * visible 수정
   * @param GenreVO
   * @return
   */
  public int update_visible(GenreVO genreVO);
  
  /**
   * 글 수 증가
   * @return
   */
  public int increaseCnt(int genreno);    

  /**
   * 글 수 감소
   * @return
   */
  public int decreaseCnt(int genreno);
}
