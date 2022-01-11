package dev.mvc.categrp;

import java.util.List;

import org.eclipse.jdt.internal.compiler.ast.ReturnStatement;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class CategrpCont {
    @Autowired
    @Qualifier("dev.mvc.categrp.CategrpProc")
    private CategrpProcInter categrpProc;
    /* 등록 폼 
     * 
     */
    @RequestMapping(value = "/categrp/create.do", method = RequestMethod.GET)
    public ModelAndView create() {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("/categrp/create");

        return mav;
    }
    /* 등록 처리
     * 
     */
    @RequestMapping(value = "/categrp/create.do", method = RequestMethod.POST)
    public ModelAndView create(CategrpVO categrpVO) {

        ModelAndView mav = new ModelAndView();

        int cnt = this.categrpProc.create(categrpVO); // 등록 처리
        mav.addObject("cnt", cnt);
        if (cnt == 1) {
            mav.addObject("code", "create_success");
        } else {
            mav.addObject("code", "create_fail");
        }
        mav.setViewName("/categrp/msg"); 

        return mav;
    }
    @RequestMapping(value = "/categrp/list.do", method = RequestMethod.GET)
    public ModelAndView list() {
        ModelAndView mav = new ModelAndView();
        
        List<CategrpVO> list = this.categrpProc.list();
        
        mav.addObject("list",list);
        mav.setViewName("/categrp/list");
        return mav;
    }
    @RequestMapping(value = "/categrp/update_seqno_up.do", method = RequestMethod.GET)
    public ModelAndView update_seqno_up(int categrp_no) {
        ModelAndView mav = new ModelAndView();
        
        int cnt = this.categrpProc.update_seqno_up(categrp_no);
        
        mav.addObject("cnt",cnt);
        mav.setViewName("redirect:/categrp/list.do");
        return mav;
    }
    
    @RequestMapping(value = "/categrp/update_seqno_down.do", method = RequestMethod.GET)
    public ModelAndView update_seqno_down(int categrp_no) {
        ModelAndView mav = new ModelAndView();
        
        int cnt = this.categrpProc.update_seqno_down(categrp_no);
        
        mav.addObject("cnt",cnt);
        mav.setViewName("redirect:/categrp/list.do");
        return mav;
    }
    @RequestMapping(value = "/categrp/delete.do", method = RequestMethod.POST)
    public ModelAndView delete(int categrp_no) {
        ModelAndView mav = new ModelAndView();
        
        int cnt = this.categrpProc.delete(categrp_no);
        
        mav.addObject("cnt", cnt);
        mav.setViewName("redirect:/categrp/list.do");

        return mav;
        
    }
    @RequestMapping(value="/categrp/update_visible.do", method = RequestMethod.GET)
    public ModelAndView update_visible(CategrpVO categrpVO) {
        ModelAndView mav = new ModelAndView();
        
        int cnt = this.categrpProc.update_visible(categrpVO);
        mav.addObject("cnt",cnt);
        mav.setViewName("redirect:/categrp/list.do");
        return mav;
    }
    
    @RequestMapping(value="/categrp/update.do", method = RequestMethod.GET)
    public ModelAndView update_form(int categrp_no) {
        ModelAndView mav = new ModelAndView();

        CategrpVO categrpVO = this.categrpProc.read(categrp_no);
        mav.addObject("categrpVO", categrpVO); // request 객체에 저장

        List<CategrpVO> list = this.categrpProc.list();
        mav.addObject("list", list); // request 객체에 저장
        
        mav.setViewName("/categrp/update");
        return mav;
    }
    
    
    @RequestMapping(value="/categrp/update.do", method = RequestMethod.POST)
    public ModelAndView update(CategrpVO categrpVO) {
        ModelAndView mav = new ModelAndView();
        
        int cnt = this.categrpProc.update(categrpVO);
        mav.addObject("cnt", cnt);
        System.out.println("cnt="+cnt);
        if (cnt == 1) {
            
            mav.setViewName("redirect:/categrp/list.do");
        } else {
            mav.addObject("code", "update");
            mav.setViewName("/categrp/msg"); 
        }
        
        return mav;
    }
    
}