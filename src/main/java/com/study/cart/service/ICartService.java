    package com.study.cart.service;

    import com.study.cart.vo.CartVO;
    import com.study.product.vo.ProductVO;

    import java.util.List;

    public interface ICartService {

        // 1. 장바구니 추가
        public void insert(CartVO cartVO);

        // 2. 장바구니 목록
        public List<CartVO> listCart(String userId);

        // 3. 장바구니 삭제
        public void delete(int cartId);

        // 4. 장바구니 수정
        public void modify(CartVO cartVO);

        // 5. 장바구니 금액 합계
        public int sumMoney(String userId);

        // 6. 장바구니 상품 확인
        public int countCart(int product_id, String userId);

        // 7. 장바구니 상품 수량 변경
        public void updateCart(CartVO cartVO);

        //8. 장바구니 전체 삭제
        public void clearCart(String userId);

    }
