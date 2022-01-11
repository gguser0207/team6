package dev.mvc.movie;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import dev.mvc.tool.Tool;

@Component("dev.mvc.movie.MovieProc")
public class MovieProc implements MovieProcInter {
    @Autowired
    private MovieDAOInter movieDAO;
    // private MovieDAOInter movieDAO = new MovieDAO();
    
    public MovieProc() {
        System.out.println("-> MovieProc created.");
    }
    
    // 등록
    @Override
    public int create(MovieVO movieVO) {
        int cnt = this.movieDAO.create(movieVO);
        
        return cnt;
    }
    
    // 목록
    @Override
    public List<MovieVO> list() {
        List<MovieVO> list = this.movieDAO.list();

        for (MovieVO movieVO : list) {
            String title = movieVO.getTitle();

            title = Tool.convertChar(title); // 특수 문자 처리

            movieVO.setTitle(title);
        }

        return list;
    }

    /**
     * 조회
     */
    @Override
    public MovieVO read(int mno) {
        MovieVO movieVO = this.movieDAO.read(mno);

        String title = movieVO.getTitle();
        
        title = Tool.convertChar(title); // 특수 문자 처리

        movieVO.setTitle(title);

        long size1 = movieVO.getSize1();
        movieVO.setSize1_label(Tool.unit(size1));

        return movieVO;
    }
    
    @Override
    public int update(MovieVO movieVO) {
        int cnt = this.movieDAO.update(movieVO);
        return cnt;
    }

    @Override
    public int delete(int mno) {
        int cnt = this.movieDAO.delete(mno);
        return cnt;
    }

}