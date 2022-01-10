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
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MovieCont {
    @Autowired
    @Qualifier("dev.mvc.movie.MovieProc")
    private MovieProcInter movieProc;

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
     * 등록 처리
     * 
     * @param categrpVO
     * @return
     */
    @RequestMapping(value = "/movie/create.do", method = RequestMethod.POST)
    public ModelAndView create(MovieVO movieVO) { // movieVO 자동 생성, Form -> VO
        // MovieVO movieVO <FORM> 태그의 값으로 자동 생성됨.
        // request.setAttribute("movieVO", movieVO); 자동 실행

        ModelAndView mav = new ModelAndView();

        int cnt = this.movieProc.create(movieVO); // 등록 처리
        // cnt = 0; // error test
        
        mav.addObject("cnt", cnt);
       
        if (cnt == 1) {
            // System.out.println("등록 성공");
            
            // mav.addObject("code", "create_success"); // request에 저장, request.setAttribute("code", "create_success")
            // mav.setViewName("/movie/msg"); // /WEB-INF/views/movie/msg.jsp
            
            // response.sendRedirect("/movie/list.do");
            mav.setViewName("redirect:/movie/list.do");
        } else {
            mav.addObject("code", "create_fail"); // request에 저장, request.setAttribute("code", "create_fail")
            mav.setViewName("/movie/msg"); // /WEB-INF/views/movie/msg.jsp
        }

        return mav; // forward
    }
    
    // http://localhost:9091/movie/list.do
    @RequestMapping(value = "/movie/list.do", method = RequestMethod.GET)
    public ModelAndView list() {
        ModelAndView mav = new ModelAndView();

        // 출력 순서별 출력
        List<MovieVO> list = this.movieProc.list();
        mav.addObject("list", list); // request.setAttribute("list", list);

        mav.setViewName("/movie/list"); // /webapp/WEB-INF/views/movie/list.jsp
        return mav;
    }
    

    // http://localhost:9091/movie/read_update.do?mno=1
    /**
     * 조회 + 수정폼
     * 
     * @param mno 조회할 영화 번호
     * @return
     */
    @RequestMapping(value = "/movie/read_update.do", method = RequestMethod.GET)
    public ModelAndView read_update(int mno) {
        // request.setAttribute("mno", int mno) 작동 안됨.

        ModelAndView mav = new ModelAndView();

        MovieVO movieVO = this.movieProc.read(mno);
        mav.addObject("movieVO", movieVO); // request 객체에 저장

        List<MovieVO> list = this.movieProc.list();
        mav.addObject("list", list); // request 객체에 저장

        mav.setViewName("/movie/read_update"); // /WEB-INF/views/movie/read_update.jsp
        return mav; // forward
    }

    // http://localhost:9091/movie/update.do
    /**
     * 수정 처리
     * 
     * @param movieVO
     * @return
     */
    @RequestMapping(value = "/movie/update.do", method = RequestMethod.POST)
    public ModelAndView update(MovieVO movieVO) {

        ModelAndView mav = new ModelAndView();

        int cnt = this.movieProc.update(movieVO);
        mav.addObject("cnt", cnt); // request에 저장

        // cnt = 0; // error test
        if (cnt == 1) {
            // System.out.println("수정 성공");
            // response.sendRedirect("/movie/list.do");
            mav.setViewName("redirect:/movie/list.do");
        } else {
            mav.addObject("code", "update"); // request에 저장, request.setAttribute("code", "update")
            mav.setViewName("/movie/msg"); // /WEB-INF/views/movie/msg.jsp
        }

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

        mav.setViewName("/movie/read_delete"); // read_delete.jsp
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
      mav.setViewName("/movie/msg"); // /WEB-INF/views/movie/msg.jsp
      
      return mav;
    }
}