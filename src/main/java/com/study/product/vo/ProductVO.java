package com.study.product.vo;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;



@Getter
@Setter
public class ProductVO {

    private int productId; // 물품 아이디
    private String productName; // 물품 이름
    private int productPrice; // 물품 가격
    private String productDesc; //물품 설명

    private String img; // 물품 이미지
    private String imgPath;// 이미지 조회 경로

    private int productAmount;//  물품 남은 재고량

    private int price;
    private int amount;

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public int getProductPrice() {
        return productPrice;
    }

    public void setProductPrice(int productPrice) {
        this.productPrice = productPrice;
    }

    public String getProductDesc() {
        return productDesc;
    }

    public void setProductDesc(String productDesc) {
        this.productDesc = productDesc;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public String getImgPath() {
        return imgPath;
    }

    public void setImgPath(String imgPath) {
        this.imgPath = imgPath;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }

    public int getProductAmount() {
        return productAmount;
    }

    public void setProductAmount(int productAmount) {
        this.productAmount = productAmount;
    }

    @Override
    public String toString() {
        return "ProductVO{" +
                "productId=" + productId +
                ", productName='" + productName + '\'' +
                ", productPrice=" + productPrice +
                ", productDesc='" + productDesc + '\'' +
                ", img='" + img + '\'' +
                ", imgPath='" + imgPath + '\'' +
                ", price=" + price +
                ", amount=" + amount +
                '}';
    }
}
