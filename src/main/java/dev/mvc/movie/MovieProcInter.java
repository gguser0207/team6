package dev.mvc.movie;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import dev.mvc.movie.MovieVO;

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
     * 수정 처리
     * update id="update" parameterType="dev.mvc.movie.MovieVO"
     * @param movieVO
     * @return 수정된 레코드 갯수
     */
    public int update(MovieVO movieVO);

    /**
     * 삭제 처리
     * delete id="delete" parameterType="int"
     * @param mno
     * @return 처리된 레코드 갯수
     */
    public int delete(int mno);
    
}