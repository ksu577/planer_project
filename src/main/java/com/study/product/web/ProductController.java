package com.study.product.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/prodct")
public class ProductController {

    @RequestMapping("/shop/productregist.wow")
    public String productregist() {
        return "product/productregist";
    }

    @RequestMapping("/shop/productview.wow")
    public String productview() {
        return "product/productview";
    }

    @RequestMapping("/shop/productupdate.wow")
    public String productupdate(){
        return "product/productupdate";
    }

    @RequestMapping("/shop/productdelete.wow")
    public String productdelete(){
        return "product/productdelete";
    }


}
