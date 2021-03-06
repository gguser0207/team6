package dev.mvc.cart;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class CartCont {
    @Autowired
    @Qualifier("dev.mvc.cart.CartProc")
    private CartProcInter cartProc;

    public CartCont() {
        System.out.println("-> CartCont created.");
    }

    @RequestMapping(value="/cart/create.do", method= RequestMethod.POST )
    @ResponseBody
    public String create(HttpSession session, int mno){
        CartVO cartVO = new CartVO();
        cartVO.setMno(mno);
        cartVO.setBuy("0");

        int memberno = (Integer)session.getAttribute("memberno");
        cartVO.setmemberno(memberno);


        int cnt = this.cartProc.create(cartVO);
        JSONObject json = new JSONObject();
        json.put("cnt", cnt);
        System.out.println("-> cartCont create: " + json.toString());

        return json.toString();
    }

    @RequestMapping(value="/cart/create_buy.do", method= RequestMethod.POST )
    @ResponseBody
    public String createBuy(HttpSession session, int mno){

        CartVO cartVO = new CartVO();
        cartVO.setMno(mno);
        cartVO.setBuy("1");

        int memberno = (Integer)session.getAttribute("memberno");
        cartVO.setmemberno(memberno);


        int cnt = this.cartProc.create(cartVO);
        JSONObject json = new JSONObject();
        json.put("cnt", cnt);
        System.out.println("-> cartCont createBuy: " + json.toString());

        return json.toString();
    }

    @RequestMapping(value="/cart/list.do", method = RequestMethod.GET)
    public ModelAndView cartList(
        HttpSession session,
        @RequestParam(value="cartno", defaultValue="0") int cartno){
        try {
            ModelAndView mav = new ModelAndView();

            int tot = 0;               // 할인 금액 합계 = 할인 금액 * 수량
            int tot_sum = 0;        // 할인 금액 총 합계 = 할인 금액 총 합계 + 할인 금액 합계
            int point_tot = 0;       // 포인트 합계 = 포인트 합계 + (포인트 * 수량)
            int baesong_tot = 0;   // 배송비 합계
            int total_order = 0; // 전체 주문 금액

            if (session.getAttribute("memberno") != null) { // 회원으로 로그인을 했다면 쇼핑카트로 이동
                int memberno = (int)session.getAttribute("memberno");
                // 출력 순서별 출력
                List<CartVO> list = this.cartProc.cartList(memberno);
//
//                for (CartVO cartVO : list) {
//                    tot = cartVO.getSaleprice() * cartVO.getCnt();  // 할인 금액 합계 = 할인 금액 * 수량
//                    cartVO.setTot(tot);
//
//                    // 할인 금액 총 합계 = 할인 금액 총 합계 + 할인 금액 합계
//                    tot_sum = tot_sum + cartVO.getTot();
//                    // 포인트 합계 = 포인트 합계 + (포인트 * 수량)
//                    point_tot = point_tot + (cartVO.getPoint() * cartVO.getCnt());
//
//                }
//
//                if (tot_sum < 30000) { // 상품 주문 금액이 30,000 원 이하이면 배송비 3,000 원 부여
//                    if (list.size() > 0) {  // 총 주문 금액이 30,000 이하이면서 상품이 존재한다면 3,000 할당
//                        baesong_tot = 3000;
//                    }
//                }
//
//                total_order = tot_sum + baesong_tot; // 전체 주문 금액

                mav.addObject("list", list); // request.setAttribute("list", list);
                mav.addObject("cartno", cartno); // 쇼핑계속하기에서 사용
//
//                mav.addObject("tot_sum", tot_sum);
//                mav.addObject("point_tot", point_tot);
//                mav.addObject("baesong_tot", baesong_tot);
//                mav.addObject("total_ordering", total_order);

                mav.setViewName("/cart/list"); // /WEB-INF/views/cart/list.jsp

            } else { // 회원으로 로그인하지 않았다면
                mav.addObject("return_url", "/cart/list.do"); // 로그인 후 이동할 주소 ★

                mav.setViewName("redirect:/member/login.do"); // /WEB-INF/views/member/login_ck_form.jsp
            }
            return mav;
        }catch(Exception e){
            System.out.println("error-------------------------------------------------------------");
            System.out.println(e);
            System.out.println("error-------------------------------------------------------------");
            throw e;
        }
    }

    @RequestMapping(value="/cart/buylist.do", method = RequestMethod.GET)
    public ModelAndView buyList(
            HttpSession session,
            @RequestParam(value="cartno", defaultValue="0") int cartno){
        try {
            ModelAndView mav = new ModelAndView();

            if (session.getAttribute("memberno") != null) { // 회원으로 로그인을 했다면 쇼핑카트로 이동
                int memberno = (int)session.getAttribute("memberno");
                // 출력 순서별 출력
                List<CartVO> list = this.cartProc.buyList(memberno);

                mav.addObject("list", list); // request.setAttribute("list", list);
                mav.addObject("cartno", cartno); // 쇼핑계속하기에서 사용

                mav.setViewName("/cart/buylist"); // /WEB-INF/views/cart/list.jsp

            } else { // 회원으로 로그인하지 않았다면
                mav.addObject("return_url", "/cart/list.do"); // 로그인 후 이동할 주소 ★

                mav.setViewName("redirect:/member/login.do"); // /WEB-INF/views/member/login_ck_form.jsp
            }
            return mav;
        }catch(Exception e){
            System.out.println("error-------------------------------------------------------------");
            System.out.println(e);
            System.out.println("error-------------------------------------------------------------");
            throw e;
        }
    }

    @RequestMapping(value = "/cart/cartMovieDetail.do", method = RequestMethod.GET)
    public ModelAndView cartMovieDetail(int mno){
        ModelAndView mav = new ModelAndView();

        CartVO cartVO = this.cartProc.cartMovieDetail(mno);
        mav.addObject("cartVO",cartVO);
        mav.setViewName("/cart/cartMovieDetail");

        return mav;
    }

    @RequestMapping(value = "/cart/pay.do", method = RequestMethod.GET)
    public ModelAndView cartBuy(int cartno){
        ModelAndView mav = new ModelAndView();

        this.cartProc.cartBuy(cartno);
        mav.setViewName("/cart/pay");

        System.out.println("update complete");

        return mav;
    }

    @RequestMapping(value = "/cart/delete.do", method = RequestMethod.GET)
    public ModelAndView cartDelete(int cartno){
        ModelAndView mav = new ModelAndView();

        this.cartProc.cartDelete(cartno);
        mav.setViewName("/cart/delete");

        System.out.println("delete complete");

        return mav;
    }


}
