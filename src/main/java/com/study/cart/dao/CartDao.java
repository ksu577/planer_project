package com.study.cart.dao;

import com.study.cart.vo.CartVO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;




@Mapper
public interface CartDao {


    // 1. 장바구니 추가
    public void insertCart(CartVO cartVO);

    // 2. 장바구니 목록
    public List<CartVO> CartList(String userId);

    // 3. 장바구니 삭제
    public void delete(int cartId);

    // 4. 장바구니 수정
    public void modifyCart(CartVO cartVO);

    // 5. 장바구니 금액 합계
    public int sumMoney(String userId);

    // 6. 장바구니에 있는 것과 동일한 상품 코드 확인
    public int CountCart(int prodcut_id, String userId);

    // 7. 장바구니 상품수량 변경
    public void updateCart(CartVO cartVo);

    //8. 장바구니 전체 삭제
    public void clearCart(String userId);

    // 임의 장바구니 제품이름 가격보기
}

