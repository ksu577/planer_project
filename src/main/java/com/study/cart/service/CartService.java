package com.study.cart.service;

import com.study.cart.dao.CartDao;
import com.study.cart.vo.CartVO;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.List;

public class CartService {





    // 장바구니에 상품 추가
    public void insertCartItem(CartVO cartVO) {

    }

    // 장바구니에서 상품 삭제
    public void removeProductFromCart(int orderNum, int productAmount) {
        // 실제 로직 구현
    }

    // 장바구니에서 상품 수량 변경
    public void updateProductAmount(int orderNum, int productNo, int newproductAmounttity) {
        // 실제 로직 구현
    }

    // 특정 사용자의 장바구니 내역 조회
    public List<CartVO> getCartItemsForUser(String id) {
        // 실제 로직 구현
        return null;
    }

}
