package dev.mvc.cart;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;

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


}
