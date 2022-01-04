package dev.mvc.cart;

import java.util.List;

public interface CartProcInter {
  /**
   * 카트에 상품 등록
   * @param cartVO
   * @return
   */
  public int create(CartVO cartVO);
  
  /**
   * memberno 회원 번호별 쇼핑카트 목록 출력
   * @return
   */
  public List<CartVO> cartList(int memberno);

  /**
   * 수량 변경
   * @param cartVO
   * @return
   */
  public List<CartVO> cartMovieDetail(CartVO cartVO);
  
  /**
   * 상품 삭제
   * @param cartno
   * @return
   */
  public int delete(int cartno);

  
  
}
