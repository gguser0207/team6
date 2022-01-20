package dev.mvc.cart;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class CartCont {
    @Autowired
    @Qualifier("dev.mvc.cart.CartDAO")
    private CartDAOInter cartDAO;

    public CartCont() {
        System.out.println("-> CartCont created.");
    }

    @RequestMapping(value="/cart/create.do", method= RequestMethod.POST )
    @ResponseBody
    public String create(HttpSession session, int mno){
        CartVO cartVO = new CartVO();
        cartVO.setMno(mno);

        int memberno = (Integer)session.getAttribute("memberno");
        cartVO.setmemberno(memberno);

        JSONObject json = new JSONObject();

        System.out.println("-> cartCont create: " + json.toString());
        return json.toString();
    }

    @RequestMapping(value="/cart/list.do", method = RequestMethod.GET)
    public ModelAndView cartList(){
        try {
            ModelAndView mav = new ModelAndView();
            System.out.println(this.cartDAO.cartList());
            List<CartVO> list = this.cartDAO.cartList(/*memberno*/);
            System.out.println(list);
            mav.addObject("list", list);

            mav.setViewName("/cart/list");

            return mav;
        }catch(Exception e){
            System.out.println(this.cartDAO.cartList());
            System.out.println(e);
            throw e;
        }
    }

    @RequestMapping(value = "/cart/cartMovieDetail.do", method = RequestMethod.GET)
    public ModelAndView cartMovieDetail(int mno){
        ModelAndView mav = new ModelAndView();

        CartVO cartVO = this.cartDAO.cartMovieDetail(mno);
        mav.addObject("cartVO",cartVO);
        mav.setViewName("/cart/cartMovieDetail");

        return mav;
    }

}
