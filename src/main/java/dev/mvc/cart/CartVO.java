package dev.mvc.cart;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class CartVO {
    private int cartno;
    private int memberno = -1;
    private int mno = -1;

    private String title = "";
    private String director = "";


    public int getCartno(){return cartno;}
    public void setCartno(int cartno){this.cartno = cartno;}

    public int getmemberno(){return memberno;}
    public void setmemberno(int memberno){this.memberno = memberno;}

    public int getMno(){return cartno;}
    public void setMno(int mno){this.mno = mno;}
}
