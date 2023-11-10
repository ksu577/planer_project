package com.study.product.vo;

import lombok.Data;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;


@Data
public class ProductVO {



    private String id;
    private int productNum;
    private String productName;
    private String productCategory;
    private int productCost;

    @Override
    public String toString() {
        return ToStringBuilder.reflectionToString(this, ToStringStyle.MULTI_LINE_STYLE);
    }

}
