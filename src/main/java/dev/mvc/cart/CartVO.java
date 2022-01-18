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
}
