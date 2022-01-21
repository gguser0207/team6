package dev.mvc.movie;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public interface MovieProcInter {
    /**
     * 등록
     * insert id="create" parameterType="dev.mvc.movie.MovieVO"
     * @param movieVO
     * @return 등록된 레코드 갯수
     */
    public int create(MovieVO movieVO);
    
    public List<MovieVO> list();
    
    /**
     * 조회
     * select id="read" resultType="dev.mvc.movie.MovieVO" parameterType="int"
     * @param mno 영화 번호, PK
     * @return MovieVO
     */
    public MovieVO read(int mno);
    

    /**
     * 수정 폼
     * update id="read_update_text" parameterType="dev.mvc.movie.MovieVO"
     * @param movieVO
     * @return 수정된 레코드 갯수
     */
    public MovieVO read_update_text(int mno);
    /**
     * 텍스트 수정 처리
     * update id="update_text" parameterType="dev.mvc.movie.MovieVO"
     * @param movieVO
     * @return 수정된 레코드 갯수
     */
    public int update_text(MovieVO movieVO);
    /**
     * 파일 수정 처리
     * update id="update_file" parameterType="dev.mvc.movie.MovieVO"
     * @param movieVO
     * @return 수정된 레코드 갯수
     */
    public int update_file(MovieVO movieVO);

    /**
     * 삭제 처리
     * delete id="delete" parameterType="int"
     * @param mno
     * @return 처리된 레코드 갯수
     */
    public int delete(int mno);

    /**
     * 패스워드 체크
     * @param hashMap
     * @return
     */
    public int passwd_check(HashMap<String, Object> map);
    
    /**
     * movie 검색 갯수
     * @param hashmap
     * @return
     */
    public int search_count(HashMap<String, Object> hashmap);
    
}