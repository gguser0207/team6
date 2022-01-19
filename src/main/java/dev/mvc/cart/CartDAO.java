package dev.mvc.cart;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.List;

@Component("dev.mvc.cart.CartDAO")
public class CartDAO implements CartDAOInter{
    @Autowired
    private CartDAOInter cartDAO;

    public CartDAO(){
        System.out.println("->CartDAO created.");
    }

    @Override
    public int create(CartVO cartVO){
        int cnt = this.cartDAO.create(cartVO);
        return cnt;
    }

    @Override
    public List<CartVO> cartList(int memberno){
        List<CartVO> list = this.cartDAO.cartList(memberno);
        return list;
    }

    @Override
    public CartVO cartMovieDetail(int memberno){
        CartVO cartVO = this.cartDAO.cartMovieDetail(memberno);
        return cartVO;
    }

    @Override
    public int cartDelete(int cartno){
        int cnt = this.cartDAO.cartDelete(cartno);
        return cnt;
    }
}
