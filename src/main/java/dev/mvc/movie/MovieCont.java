package dev.mvc.movie;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import dev.mvc.categrp.CategrpProcInter;
import dev.mvc.categrp.CategrpVO;
import dev.mvc.movie.Movie;
import dev.mvc.tool.Tool;
import dev.mvc.tool.Upload;

@Controller
public class MovieCont {
    @Autowired
    @Qualifier("dev.mvc.categrp.CategrpProc")
    private CategrpProcInter categrpProc;
  
    @Autowired
    @Qualifier("dev.mvc.movie.MovieProc")
    private MovieProcInter movieProc;
    private String uploadDir = Movie.getPath();
    public MovieCont() {
        System.out.println("-> movieCont created.");
    }

    // http://localhost:9091/movie/create.do
    /**
     * 등록 폼
     * 
     * @return
     */
    @RequestMapping(value = "/movie/create.do", method = RequestMethod.GET)
    public ModelAndView create() {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("/movie/create"); // webapp/WEB-INF/views/movie/create.jsp

        return mav; // forward
    }
    // http://localhost:9091/movie/create.do
    /**
     * msg 폼
     * 
     * @return
     */
    @RequestMapping(value = "/movie/msg.do", method = RequestMethod.GET)
    public ModelAndView msg() {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("/movie/msg"); // webapp/WEB-INF/views/movie/msg.jsp

        return mav; // forward
    }
    // http://localhost:9091/movie/create.do
    /**
     * 등록 처리
     * 
     * @param categrpVO
     * @return
     */
    @RequestMapping(value="/movie/create.do", method = RequestMethod.POST)
    public ModelAndView create(HttpServletRequest request, MovieVO movieVO) {
        ModelAndView mav = new ModelAndView();        // MovieVO movieVO <FORM> 태그의 값으로 자동 생성됨.
        // request.setAttribute("movieVO", movieVO); 자동 실행

        // 파일 전송코드
        String file1 = ""; // 원본 파일명 image
        String file1saved = ""; // 저장된 파일명, image
        String thumb1 = ""; // preview image
        String uploadDir = this.uploadDir;
        // 기준경로 확인
        MultipartFile mf = movieVO.getFile1MF();

        file1 = Tool.getFname(mf.getOriginalFilename()); // 원본 순수 파일명 산출

        long size2 = mf.getSize(); // 파일크기

        if (size2 > 0) {
            file1saved = Upload.saveFileSpring(mf, uploadDir);
            if (Tool.isImage(file1saved)) {
                thumb1 = Tool.preview(uploadDir, file1saved, 150, 200);
            }
        }
        movieVO.setFile1(file1);
        movieVO.setFile1saved(file1saved);
        movieVO.setThumb1(thumb1);
        movieVO.setSize2(size2);

        // Call By Reference: 메모리 공유, Hashcode 전달
        int cnt = this.movieProc.create(movieVO);
        // ------------------------------------------------------------------------------
        // PK의 return
        // ------------------------------------------------------------------------------
//        System.out.println("--> cnt: " + cnt);
        System.out.println("--> mno: " + movieVO.getMno());
        System.out.println("--> mno: " + movieVO.getThumb1());
        mav.addObject("mno", movieVO.getMno());
        mav.addObject("movieVO", movieVO);
        
        if( cnt == 1) {
            mav.addObject("code", "create_success");
//            System.out.println("--> success: " + cnt);
            
        } else {
            mav.addObject("code", "create_fail");
//            System.out.println("--> fail: " + cnt);
        }
        mav.addObject("cnt", cnt);
        mav.addObject("url", "/movie/msg");
        mav.setViewName("redirect:/movie/msg.do");
        return mav;
    }
    
    
    // http://localhost:9091/movie/list.do
    @RequestMapping(value = "/movie/list.do", method = RequestMethod.GET)
    public ModelAndView list() {
        ModelAndView mav = new ModelAndView();

        // 출력 순서별 출력
        List<MovieVO> list = this.movieProc.list();
        mav.addObject("list", list); 

        mav.setViewName("/movie/list"); // /webapp/WEB-INF/views/movie/list.jsp
        return mav;
    }
    
    // http://localhost:9091/movie/list.do
    @RequestMapping(value = "/movie/rank_price_1.do", method = RequestMethod.GET)
    public ModelAndView rank_price_1(@RequestParam(value="categrp_no", defaultValue="8")int categrp_no,
    									@RequestParam(value="word", defaultValue="")String word,
    									@RequestParam(value="now_page", defaultValue="1")int now_page) {
        ModelAndView mav = new ModelAndView();
        
        HashMap<String, Object> map = new HashMap<String,Object>();
        map.put("categrp_no",categrp_no);
        map.put("word", word);
        map.put("now_page", now_page);
        
        List<MovieVO> list = this.movieProc.rank_price_1(map);
        mav.addObject("list", list);
        
        int search_count = movieProc.search_count(map);
        mav.addObject("search_count", search_count);
        
		CategrpVO categrpVO = categrpProc.read(categrp_no);
        mav.addObject("categrpVO",categrpVO);
        
        String paging = movieProc.pagingBox(categrp_no, search_count, now_page, word, "rank", "_1");
        mav.addObject("paging", paging);
        
        mav.addObject("now_page", now_page);
        
        mav.setViewName("/movie/rank_price");
        return mav;
    }
    @RequestMapping(value = "/movie/rank_price_2.do", method = RequestMethod.GET)
    public ModelAndView rank_price_2(@RequestParam(value="categrp_no", defaultValue="8")int categrp_no,
    									@RequestParam(value="word", defaultValue="")String word,
    									@RequestParam(value="now_page", defaultValue="1")int now_page) {
        ModelAndView mav = new ModelAndView();
        
        HashMap<String, Object> map = new HashMap<String,Object>();
        map.put("categrp_no",categrp_no);
        map.put("word", word);
        map.put("now_page", now_page);
        
        List<MovieVO> list = this.movieProc.rank_price_2(map);
        mav.addObject("list", list);
        
        int search_count = movieProc.search_count(map);
        mav.addObject("search_count", search_count);
        
		CategrpVO categrpVO = categrpProc.read(categrp_no);
        mav.addObject("categrpVO",categrpVO);
        
        String paging = movieProc.pagingBox(categrp_no, search_count, now_page, word, "rank", "_2");
        mav.addObject("paging", paging);
        
        mav.addObject("now_page", now_page);
        
        mav.setViewName("/movie/rank_price");
        return mav;
    }
    @RequestMapping(value = "/movie/rank_price_3.do", method = RequestMethod.GET)
    public ModelAndView rank_price_3(@RequestParam(value="categrp_no", defaultValue="8")int categrp_no,
    									@RequestParam(value="word", defaultValue="")String word,
    									@RequestParam(value="now_page", defaultValue="1")int now_page) {
        ModelAndView mav = new ModelAndView();
        
        HashMap<String, Object> map = new HashMap<String,Object>();
        map.put("categrp_no",categrp_no);
        map.put("word", word);
        map.put("now_page", now_page);
        
        List<MovieVO> list = this.movieProc.rank_price_3(map);
        mav.addObject("list", list);
        
        int search_count = movieProc.search_count(map);
        mav.addObject("search_count", search_count);
        
		CategrpVO categrpVO = categrpProc.read(categrp_no);
        mav.addObject("categrpVO",categrpVO);
        
        String paging = movieProc.pagingBox(categrp_no, search_count, now_page, word, "rank", "_3");
        mav.addObject("paging", paging);
        
        mav.addObject("now_page", now_page);
        
        mav.setViewName("/movie/rank_price");
        return mav;
    }
    
    // http://localhost:9091/movie/list.do
    @RequestMapping(value = "/movie/list_by_search.do", method = RequestMethod.GET)
    public ModelAndView list_by_search(@RequestParam(value="categrp_no", defaultValue="8")int categrp_no,
    									@RequestParam(value="word", defaultValue="")String word) {
        ModelAndView mav = new ModelAndView();
        
        HashMap<String, Object> map = new HashMap<String,Object>();
        map.put("categrp_no",categrp_no);
        map.put("word", word);
        
        
        List<MovieVO> list = this.movieProc.list_by_search(map);
        mav.addObject("list", list);
        
        int search_count = movieProc.search_count(map);
        mav.addObject("search_count", search_count);
        
		CategrpVO categrpVO = categrpProc.read(categrp_no);
        mav.addObject("categrpVO",categrpVO);
        
        mav.setViewName("/movie/list_by_search");
        return mav;
    }
    
    // http://localhost:9091/movie/list.do
    @RequestMapping(value = "/movie/list_by_search_paging.do", method = RequestMethod.GET)
    public ModelAndView list_by_search_paging(@RequestParam(value="categrp_no", defaultValue="8")int categrp_no,
    									@RequestParam(value="word", defaultValue="")String word,
    									@RequestParam(value="now_page", defaultValue="1")int now_page) {
        ModelAndView mav = new ModelAndView();
        
        HashMap<String, Object> map = new HashMap<String,Object>();
        map.put("categrp_no",categrp_no);
        map.put("word", word);
        map.put("now_page", now_page);
        
        List<MovieVO> list = this.movieProc.list_by_search_paging(map);
        mav.addObject("list", list);
        
        int search_count = movieProc.search_count(map);
        mav.addObject("search_count", search_count);
        
		CategrpVO categrpVO = categrpProc.read(categrp_no);
        mav.addObject("categrpVO",categrpVO);
        
        String paging = movieProc.pagingBox(categrp_no, search_count, now_page, word, "list", "_");
        mav.addObject("paging", paging);
        
        mav.addObject("now_page", now_page);
        
        mav.setViewName("/movie/list_by_search_paging");
        return mav;
    }
    // http://localhost:9091/movie/read_update_text.do?mno=1
    /**
     * 조회 + 수정폼
     * 
     * @param mno 조회할 영화 번호
     * @return
     */
    
    
    @RequestMapping(value="/movie/read.do",method = RequestMethod.GET)
    public ModelAndView read(int mno) {
    	ModelAndView mav = new ModelAndView();
    	
    	MovieVO movieVO = this.movieProc.read(mno);
    	mav.addObject("movieVO", movieVO);
    	
    	mav.setViewName("/movie/read_cookie");
    	
    	
    	return mav;
    }
    
    @RequestMapping(value = "/movie/read_update_text.do", method = RequestMethod.GET)
    public ModelAndView update_text(int mno) {
        // request.setAttribute("mno", int mno) 작동 안됨.

        ModelAndView mav = new ModelAndView();

        MovieVO movieVO = this.movieProc.read(mno);
        mav.addObject("movieVO", movieVO); // request 객체에 저장

        List<MovieVO> list = this.movieProc.list();
        mav.addObject("list", list); // request 객체에 저장

        mav.setViewName("/movie/update_text"); // /WEB-INF/views/movie/read_update.jsp
        return mav; // forward
    }
    // http://localhost:9091/movie/update_text.do?mno=1
    /**
     * 수정처리
     * @param mno 수정할 영화 번호
     * @return
     */
    @RequestMapping(value= "/movie/update_text.do", method = RequestMethod.POST)
    public ModelAndView update_text(MovieVO moiveVO) {
    	ModelAndView mav = new ModelAndView();
    	int cnt = this.movieProc.update_text(moiveVO);
    	
    	mav.addObject("mno", moiveVO.getMno());
    	
    	mav.setViewName("redirect:/movie/read.do");
    	
    	return mav;
    }


	@RequestMapping(value="/movie/read_update_file.do", method = RequestMethod.GET)
	public ModelAndView read_update_file(int mno) {
		ModelAndView mav = new ModelAndView();
		
		MovieVO movieVO = this.movieProc.read(mno);
		mav.addObject("movieVO",movieVO);
		
		mav.setViewName("/movie/update_file");
		
		return mav;
	}

    
    // http://localhost:9091/movie/update.do
    /**
     * 파일 수정 처리
     * 
     * @param movieVO
     * @return
     */
    @RequestMapping(value = "/movie/update_file.do", method = RequestMethod.POST)
    public ModelAndView update(HttpServletRequest request,MovieVO movieVO, @RequestParam(value = "now_page", defaultValue = "1") int now_page) {
        ModelAndView mav = new ModelAndView();
        
        MovieVO movieVO_old = movieProc.read(movieVO.getMno());
        
        HashMap<String, Object> map = new HashMap<String, Object>();
        map.put("mno", movieVO.getMno());
        map.put("passwd", movieVO.getPasswd());

        int cnt = 0;
        int passwd_cnt = this.movieProc.passwd_check(map);
        if (passwd_cnt == 1) {
           
//           MovieVO vo = movieProc.read(movieVO.getMno());
           
           String file1saved = movieVO_old.getFile1saved();
           String thumb1 = movieVO_old.getThumb1();
           long size1 = 0;
           boolean sw = false;
           
           String upDir =  System.getProperty("user.dir") + "/src/main/resources/static/movie/images/"; // 절대 경로
           
           sw = Tool.deleteFile(upDir, file1saved);  // Folder에서 1건의 파일 삭제
           sw = Tool.deleteFile(upDir, thumb1);  
           String file1 = "";    
           MultipartFile mf = movieVO.getFile1MF();
           
           file1 = mf.getOriginalFilename(); // 원본 파일명
           size1 = mf.getSize();  // 파일 크기
           if (size1 > 0) { // 파일 크기 체크
               // 파일 저장 후 업로드된 파일명이 리턴됨, spring.jsp, spring_1.jpg...
               file1saved = Upload.saveFileSpring(mf, upDir); 
               
               if (Tool.isImage(file1saved)) { // 이미지인지 검사
                 // thumb 이미지 생성후 파일명 리턴됨, width: 250, height: 200
                 thumb1 = Tool.preview(upDir, file1saved, 150, 200); 
               }
               
             } else {
                 file1 = "";
                 file1saved = "";
                 thumb1 = "";
                 size1 = 0;
                 
             }
             
             movieVO.setFile1(file1);
             movieVO.setFile1saved(file1saved);
             movieVO.setThumb1(thumb1);
             movieVO.setSize2(size1);
             
           mav.addObject("Mno", movieVO.getMno());
           mav.addObject("now_page", now_page);
           cnt = this.movieProc.update_file(movieVO);// 수정 처리
           mav.setViewName("redirect:/movie/read.do"); 
        }
        else {
            mav.addObject("cnt", cnt);
            mav.addObject("code","passwd_fail");
            mav.setViewName("redirect:/movie/msg.do");
        }
        

        mav.addObject("mno", movieVO_old.getMno());

        return mav;
    }

    // http://localhost:9091/movie/read_delete.do?mno=1
    /**
     * 조회 + 삭제폼
     * 
     * @param mno 조회할 영화 번호
     * @return
     */
    @RequestMapping(value = "/movie/read_delete.do", method = RequestMethod.GET)
    public ModelAndView read_delete(int mno) {
        ModelAndView mav = new ModelAndView();

        MovieVO movieVO = this.movieProc.read(mno); // 삭제할 자료 읽기
        mav.addObject("movieVO", movieVO); // request 객체에 저장

        List<MovieVO> list = this.movieProc.list();
        mav.addObject("list", list); // request 객체에 저장

        mav.setViewName("/movie/delete"); // read_delete.jsp
        return mav;
    }
    
    // http://localhost:9091/movie/delete.do
    /**
     * 삭제
     * @param mno 조회할 영화 번호
     * @return 삭제된 레코드 갯수
     */
    @RequestMapping(value="/movie/delete.do", method=RequestMethod.POST )
    public ModelAndView delete(int mno) {
      ModelAndView mav = new ModelAndView();
      
      MovieVO movieVO = this.movieProc.read(mno); // 삭제 정보
      mav.addObject("movieVO", movieVO);  // request 객체에 저장
      int cnt = 0;
      
      try {
        cnt = this.movieProc.delete(mno); // 삭제 처리  
      } catch (Exception e) {
        mav.addObject("msg", "child_record_found");
      }
      
      // cnt = 0; // error test
      mav.addObject("cnt", cnt);  // request 객체에 저장
      
      if (cnt == 1) {
          mav.addObject("code", "delete_success"); // request에 저장, request.setAttribute("code", "delete_success")
      } else if (cnt == 0){
          mav.addObject("code", "delete_fail"); // request에 저장, request.setAttribute("code", "delete_fail")
      }
      mav.setViewName("redirect:/movie/msg.do"); // /WEB-INF/views/movie/msg.jsp
      
      return mav;
    }
}