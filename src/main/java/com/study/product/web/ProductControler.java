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

    @RequestMapping("/productupdate.wow")
    public String productupdate(){
        return "product/productupdate";
    }

    @RequestMapping("/productdelete.wow")
    public String productdelete(){
        return "product/productdelete";
    }


}
