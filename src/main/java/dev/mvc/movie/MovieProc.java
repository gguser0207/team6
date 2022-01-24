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
     */
    @Override
    public MovieVO read(int mno) {
    	MovieVO movieVO = this.movieDAO.read(mno);
    	
    	String title = movieVO.getTitle();
    	String plot = movieVO.getPlot();
    	
    	title = Tool.convertChar(title);
    	plot = Tool.convertChar(plot);
    	
    	movieVO.setTitle(title);;
    	movieVO.setPlot(plot);
    	
    	long size1 = movieVO.getSize2();
    	movieVO.setSize1_label(Tool.unit(size1));
    	
    	return movieVO;
    }
    @Override
    public MovieVO read_update_text(int mno) {
    	MovieVO movieVO = this.movieDAO.read(mno);
    	return movieVO;
    }
    
    @Override
    public int update_text(MovieVO movieVO) {
        int cnt = this.movieDAO.update_text(movieVO);
        return cnt;
    }
    @Override
    public int update_file(MovieVO movieVO) {
        int cnt = this.movieDAO.update_file(movieVO);
        return cnt;
    }

    @Override
    public int delete(int mno) {
        int cnt = this.movieDAO.delete(mno);
        return cnt;
    }
    
    public int passwd_check(HashMap<String, Object> map) {
        int cnt = this.movieDAO.passwd_check(map);
        return cnt;
    }

	@Override
	public int search_count(HashMap<String, Object> hashmap) {
		int count = movieDAO.search_count(hashmap);
		return count;
	}

	@Override
	public List<MovieVO> list_by_search(HashMap<String, Object> hashMap) {
		List<MovieVO> list = movieDAO.list_by_search(hashMap);
		
		for (MovieVO movieVO : list) {
			String plot = movieVO.getPlot();
			if(plot.length() > 150) {
				plot = plot.substring(0, 150) + "...";
				movieVO.setPlot(plot);
				
			}
		}
		
		return list;
	}
}