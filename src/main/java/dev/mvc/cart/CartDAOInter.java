package dev.mvc.cart;

import java.util.List;

public interface CartDAOInter {

    /**
     * 장바구니 컬럼 생성
     * @param cartVO
     * @return
     */
    public int create(CartVO cartVO);

    /**
     * 개인 장바구니 리스트 조회
     * @return
     */
    public List<CartVO> cartList(/*int memberno*/);

    /**
     * 로그인 된 멤버로 장바구니 내 정보조회
     * @param mno
     * @return
     */
    public CartVO cartMovieDetail(int mno);

    /**
     * 장바구니 삭제
     * @param cartno
     * @return
     */
    public  int cartDelete(int cartno);

}
