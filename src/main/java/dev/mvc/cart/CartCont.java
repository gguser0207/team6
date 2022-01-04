package dev.mvc.cart;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import dev.mvc.cart.CartVO;

@Controller
public class CartCont {
    @Autowired
    @Qualifier("dev.mvc.cart.CartProc")
    private CartProcInter cartProc = null;

    public CartCont(){
        System.out.println("-> CartCont created.");
    }

    // http://localhost:9091/cart/cartlist.do
    /**
     * http://localhost:9091/cart/cartlist.do
     * @return
     */
    @RequestMapping(value="/cart/cartlist.do", method=RequestMethod.GET )
    public ModelAndView cartList(
        @RequestParam(value="cartno", defaultValue="0")
            HttpSession session, int cartno
    ) { ModelAndView mav = new ModelAndView();

        if (session.getAttribute("memberno") != null) { // 회원으로 로그인을 했다면 쇼핑카트로 이동
            int memberno = (int)session.getAttribute("memberno");

            // 출력 순서별 출력
            List<CartVO> list = this.cartProc.cartList(memberno);
            mav.addObject("contents", list);
            mav.setViewName("redirect:/cart/catlist.do");
        } else { // 회원으로 로그인하지 않았다면
            mav.addObject("return_url", "/cart/list_by_memberno.do"); // 로그인 후 이동할 주소 ★

            mav.setViewName("redirect:/cart/catlist.do"); // /WEB-INF/views/member/login_ck_form.jsp
        }
        return mav;
    }

    // http://localhost:9091/cart/cartDetail?cartno={cartno}
    /**
     * 등록 폼
     * @return
     */
    @RequestMapping(value="cart/cartDetail.do", method=RequestMethod.GET )
    public ModelAndView cartDetail(
        @RequestParam(value="cartno", defaultValue="0")
            HttpSession session, int cartno
    ) { int memberno = (int)session.getAttribute("memberno");
        ModelAndView mav = new ModelAndView();
        List<CartVO> list = this.cartProc.cartList(memberno);

        /*
        mav.addObject("영화 테이블 각 필드", 리스트 내 특정 장바구니 고유번호에 따른 영화 테이블)
         */

        return mav; // forward
    }
}

