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
    private int memberno;
    private int mno;

    private String title = "";
    private String director = "";
    private String actor = "";


    public int getCartno(){return cartno;}
    public void setCartno(int cartno){this.cartno = cartno;}

    public int getmemberno(){return memberno;}
    public void setmemberno(int memberno){this.memberno = memberno;}

    public int getMno(){return mno;}
    public void setMno(int mno){this.mno = mno;}

    public String getTitle(){return title;}
    public void setTitle(String title){this.title = title;}

    public String getDirector(){return director;}
    public void setDirector(String director){this.director = director;}

    public String getActor(){return actor;}
    public void setActor(String actor){this.actor = actor;}
}
