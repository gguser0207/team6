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
	
    @Override
    public List<MovieVO> list_by_search_paging(HashMap<String, Object> map) {
      /*
      페이지당 10개의 레코드 출력
      1 page: WHERE r >= 1 AND r <= 10
      2 page: WHERE r >= 11 AND r <= 20
      3 page: WHERE r >= 21 AND r <= 30
        
      페이지에서 출력할 시작 레코드 번호 계산 기준값, nowPage는 1부터 시작
      1 페이지 시작 rownum: now_page = 1, (1 - 1) * 10 --> 0 
      2 페이지 시작 rownum: now_page = 2, (2 - 1) * 10 --> 10
      3 페이지 시작 rownum: now_page = 3, (3 - 1) * 10 --> 20
      */
      int begin_of_page = ((Integer)map.get("now_page") - 1) * Movie.RECORD_PER_PAGE;
     
      // 시작 rownum 결정
      // 1 페이지 = 0 + 1: 1
      // 2 페이지 = 10 + 1: 11
      // 3 페이지 = 20 + 1: 21 
      int start_num = begin_of_page + 1;
      
      //  종료 rownum
      // 1 페이지 = 0 + 10: 10
      // 2 페이지 = 0 + 20: 20
      // 3 페이지 = 0 + 30: 30
      int end_num = begin_of_page + Movie.RECORD_PER_PAGE;   
      /*
      1 페이지: WHERE r >= 1 AND r <= 10
      2 페이지: WHERE r >= 11 AND r <= 20
      3 페이지: WHERE r >= 21 AND r <= 30
      */
      map.put("start_num", start_num);
      map.put("end_num", end_num);
     
      List<MovieVO> list = this.movieDAO.list_by_search_paging(map);
      
      for (MovieVO movieVO : list) { // 내용이 160자 이상이면 160자만 선택
        String plot = movieVO.getPlot();
        if (plot.length() > 160) {
          plot = plot.substring(0, 160) + "...";
          movieVO.setPlot(plot);
        }
        
        String title = Tool.convertChar(movieVO.getTitle());  // 특수 문자 변환
        movieVO.setTitle(title);
        
        plot = Tool.convertChar(plot);
        movieVO.setPlot(plot);
      }
      
      return list;
    }
    
    @Override
    public String pagingBox(int cateno, int search_count, int now_page, String word){ 
      int total_page = (int)(Math.ceil((double)search_count/Movie.RECORD_PER_PAGE)); // 전체 페이지 수 
      int total_grp = (int)(Math.ceil((double)total_page/Movie.PAGE_PER_BLOCK)); // 전체 그룹  수
      int now_grp = (int)(Math.ceil((double)now_page/Movie.PAGE_PER_BLOCK));  // 현재 그룹 번호
      
      // 1 group: 1, 2, 3 ... 9, 10
      // 2 group: 11, 12 ... 19, 20
      // 3 group: 21, 22 ... 29, 30
      int start_page = ((now_grp - 1) * Movie.PAGE_PER_BLOCK) + 1; // 특정 그룹의 시작  페이지  
      int end_page = (now_grp * Movie.PAGE_PER_BLOCK);               // 특정 그룹의 마지막 페이지   
       
      StringBuffer str = new StringBuffer(); 
       
      str.append("<style type='text/css'>"); 
      str.append("  #paging {text-align: center; margin-top: 15px; font-size: 1em;}"); 
      str.append("  #paging A:link {text-decoration:none; color:black; font-size: 1em;}"); 
      str.append("  #paging A:hover{text-decoration:none; background-color: #FFFFFF; color:black; font-size: 1em;}"); 
      str.append("  #paging A:visited {text-decoration:none;color:black; font-size: 1em;}"); 
      str.append("  .span_box_1{"); 
      str.append("    text-align: center;");    
      str.append("    background-color: #668db4;"); 
      str.append("    color: #FFFFFF;"); 
      str.append("    font-size: 1em;"); 
      str.append("    border: 1px;"); 
      str.append("    border-style: solid;"); 
      str.append("    border-color: #cccccc;"); 
      str.append("    padding:1px 6px 1px 6px; /*위, 오른쪽, 아래, 왼쪽*/"); 
      str.append("    margin:1px 2px 1px 2px; /*위, 오른쪽, 아래, 왼쪽*/"); 
      str.append("  }"); 
      str.append("  .span_box_2{"); 
      str.append("    text-align: center;");    
      str.append("    background-color: #668db4;"); 
      str.append("    color: #FFFFFF;"); 
      str.append("    font-size: 1em;"); 
      str.append("    border: 1px;"); 
      str.append("    border-style: solid;"); 
      str.append("    border-color: #cccccc;"); 
      str.append("    padding:1px 6px 1px 6px; /*위, 오른쪽, 아래, 왼쪽*/"); 
      str.append("    margin:1px 2px 1px 2px; /*위, 오른쪽, 아래, 왼쪽*/"); 
      str.append("  }"); 
      str.append("</style>"); 
      str.append("<DIV id='paging'>"); 
//      str.append("현재 페이지: " + nowPage + " / " + totalPage + "  "); 
   
      // 이전 10개 페이지로 이동
      // now_grp: 1 (1 ~ 10 page)
      // now_grp: 2 (11 ~ 20 page)
      // now_grp: 3 (21 ~ 30 page) 
      // 현재 2그룹일 경우: (2 - 1) * 10 = 1그룹의 마지막 페이지 10
      // 현재 3그룹일 경우: (3 - 1) * 10 = 2그룹의 마지막 페이지 20
      int _now_page = (now_grp - 1) * Movie.PAGE_PER_BLOCK;  
      if (now_grp >= 2){ // 현재 그룹번호가 2이상이면 페이지수가 11페이 이상임으로 이전 그룹으로 갈수 있는 링크 생성 
        str.append("<span class='span_box_1'><A href='"+Movie.LIST_FILE+"?&word="+word+"&now_page="+_now_page+"&cateno="+cateno+"'>이전</A></span>"); 
      } 
   
      // 중앙의 페이지 목록
      for(int i=start_page; i<=end_page; i++){ 
        if (i > total_page){ // 마지막 페이지를 넘어갔다면 페이 출력 종료
          break; 
        } 
    
        if (now_page == i){ // 목록에 출력하는 페이지가 현재페이지와 같다면 CSS 강조(차별을 둠)
          str.append("<span class='span_box_2'>"+i+"</span>"); // 현재 페이지, 강조 
        }else{
          // 현재 페이지가 아닌 페이지는 이동이 가능하도록 링크를 설정
          str.append("<span class='span_box_1'><A href='"+Movie.LIST_FILE+"?word="+word+"&now_page="+i+"&cateno="+cateno+"'>"+i+"</A></span>");   
        } 
      } 
   
      // 10개 다음 페이지로 이동
      // nowGrp: 1 (1 ~ 10 page),  nowGrp: 2 (11 ~ 20 page),  nowGrp: 3 (21 ~ 30 page) 
      // 현재 페이지 5일경우 -> 현재 1그룹: (1 * 10) + 1 = 2그룹의 시작페이지 11
      // 현재 페이지 15일경우 -> 현재 2그룹: (2 * 10) + 1 = 3그룹의 시작페이지 21
      // 현재 페이지 25일경우 -> 현재 3그룹: (3 * 10) + 1 = 4그룹의 시작페이지 31
      _now_page = (now_grp * Movie.PAGE_PER_BLOCK)+1; //  최대 페이지수 + 1 
      if (now_grp < total_grp){ 
        str.append("<span class='span_box_1'><A href='"+Movie.LIST_FILE+"?&word="+word+"&now_page="+_now_page+"&cateno="+cateno+"'>다음</A></span>"); 
      } 
      str.append("</DIV>"); 
       
      return str.toString(); 
    }
	
	
}