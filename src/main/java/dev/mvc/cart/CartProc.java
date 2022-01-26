package dev.mvc.cart;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.List;

@Component("dev.mvc.cart.CartProc")

public class CartProc implements CartProcInter{
    @Autowired
    private CartDAOInter cartDAO;

    public CartProc(){
        System.out.println("-> CartProc created.");
    }

    @Override
    public int create(CartVO cartVO){
        int cnt = this.cartDAO.create(cartVO);
        return cnt;
    }

    @Override
    public List<CartVO> cartList(int memberno){
        try{
            List<CartVO> list = this.cartDAO.cartList(memberno);
            return list;
        }catch (Exception e){
            List<CartVO> list = null;
            System.out.println("error---------------------------------------------V");
            System.out.println(e);
            System.out.println("error---------------------------------------------ㅅ");
            return list;
        }
    }

    @Override
    public List<CartVO> buyList(int memberno){
        try{
            List<CartVO> list = this.cartDAO.buyList(memberno);
            System.out.println(list);
            return list;
        }catch (Exception e){
            List<CartVO> list = null;
            System.out.println("error---------------------------------------------V");
            System.out.println(e);
            System.out.println("error---------------------------------------------ㅅ");
            return list;
        }
    }

    @Override
    public CartVO cartMovieDetail(int mno){
        CartVO cartVO = this.cartDAO.cartMovieDetail(mno);
        return cartVO;
    }

    @Override
    public int cartDelete(int cartno){
        int cnt = this.cartDAO.cartDelete(cartno);
        return cnt;
    }
}
