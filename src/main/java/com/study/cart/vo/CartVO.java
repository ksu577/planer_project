package com.study.cart.vo;

import lombok.Data;
import lombok.Getter;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

@Data
public class CartVO {

    private String orderNum;
    private String id;
    private int productNum;
    private String productName;
    private String productImg;
    private int productAmount;


    @Override
    public String toString() {
        return ToStringBuilder.reflectionToString(this, ToStringStyle.MULTI_LINE_STYLE);
    }

}


