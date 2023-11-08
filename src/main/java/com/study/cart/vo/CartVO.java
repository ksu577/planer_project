package com.study.cart.vo;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

public class CartVO {

    private int buNo;
    private String id;
    private int buProductNum;
    private int productCost;


    public int getBuNo() {
        return buNo;
    }

    public void setBuNo(int buNo) {
        this.buNo = buNo;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public int getBuProductNum() {
        return buProductNum;
    }

    public void setBuProductNum(int buProductNum) {
        this.buProductNum = buProductNum;
    }

    public int getProductCost() {
        return productCost;
    }

    public void setProductCost(int productCost) {
        this.productCost = productCost;
    }

    @Override
    public String toString() {
        return ToStringBuilder.reflectionToString(this, ToStringStyle.MULTI_LINE_STYLE);
    }

}


