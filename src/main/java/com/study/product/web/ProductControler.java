package com.study.product.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/prodct")
public class ProductControler {

    @RequestMapping("/productregist.wow")
    public String productregist() {
        return "product/productregist";
    }

    @RequestMapping("/productview.wow")
    public String productview() {
        return "product/productview";
    }


}
