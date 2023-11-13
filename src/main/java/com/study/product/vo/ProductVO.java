package com.study.product.vo;

import lombok.Data;


@Data
public class ProductVO {

    private int id; // 물품 아이디
    private String name; // 물품 이름
    private int price; // 물품 가격
    private String product_desc; //물품 설명
    private String img; // 물품 이미지

}
