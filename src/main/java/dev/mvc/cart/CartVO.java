package dev.mvc.cart;

/*
  cartno                        NUMBER(10) NOT NULL PRIMARY KEY,
  movieno                 NUMBER(10) NULL ,
  memberno                 NUMBER(10) NOT NULL,
  cnt                            NUMBER(10) DEFAULT 0 NOT NULL,
  tot                            NUMBER(10) DEFAULT 0 NOT NULL,
  rdate                          DATE NOT NULL,
  
  SELECT t.cartno, c.movieno, c.memberno, c.cnt, c.price, c.dc, c.saleprice, c.point, t.memberno, t.cnt, t.tot, t.rdate
 */
public class CartVO {
  /** 쇼핑 카트 번호 */
  private int cartno;
  private int movieno;
  private int memberno;
  private int cnt;
  private String rdate;
  
  public int getCartno() {
    return cartno;
  }
  public void setCartno(int cartno) { this.cartno = cartno; }

  public int getmovieno() { return movieno; }
  public void setmovieno(int movieno) { this.movieno = movieno; }

  public int getmemberno() {
    return memberno;
  }
  public void setmemberno(int memberno) {
    this.memberno = memberno;
  }

  public int getcnt() {
    return cnt;
  }
  public void setcnt(int cnt) {
    this.cnt = cnt;
  }

  public String getRdate() {
    return rdate;
  }
  public void setRdate(String rdate) {
    this.rdate = rdate;
  }

}

