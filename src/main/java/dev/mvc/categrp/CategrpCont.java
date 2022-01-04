package dev.mvc.categrp;

import java.util.List;

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
    
}