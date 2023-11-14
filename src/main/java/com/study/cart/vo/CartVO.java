package com.study.cart.vo;

import com.study.product.vo.ProductVO;
import lombok.Data;


@Data
public class CartVO extends ProductVO {

    private int cartId; //장바구니 번호
    private String userId; // 사용자 아이디
    private String userName; // 사용자 이름
    private int productId; // 상품 번호
    private String productName; // 상품 이름
    private int price; //상품 단가
    private int money; // 상품 가격
    private int amount; // 구매 수량

}


