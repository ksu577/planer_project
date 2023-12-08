package com.study.cart.dao;

import com.study.cart.vo.CartVO;
import com.study.product.vo.ProductVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;




@Mapper
public interface CartDao {


    // 1. 장바구니 추가
    public void insertCart(CartVO cartVO);

    // 2. 장바구니 목록
    public List<CartVO> cartList(String userId);

    // 3. 장바구니 삭제
    public void delete(int cartId);

    // 4. 장바구니 수정
    public void modifyCart(CartVO cartVO);

    // 5. 장바구니 금액 합계
    public int sumMoney(String userId);

    // 6. 장바구니에 있는 것과 동일한 상품 코드 확인
    public int countCart(@Param("product_id") int prodcut_id
            , @Param("userId") String userId);

    // 7. 장바구니 상품수량 변경
    public void updateCart(CartVO cartVo);

    //8. 장바구니 전체 삭제
    public void clearCart(String userId);


    // 임의 장바구니 제품이름 가격보기

    public int getAmountInCart(@Param("product_id") int product_id
            , @Param("userId") String userId);

    public int getProductAmountInCart(@Param("product_id") int product_id, @Param("userId") String userId);

    void setProductCnt(CartVO cartVo);

    void returnProductCnt(@Param("amount") int amount, @Param("tempId") int tempId);

    int getAmountinProduct(@Param("productId")int productId);


}

