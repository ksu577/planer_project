package com.study.cart.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/cart/")
public class CartController {




    @RequestMapping("/cart/paypage.wow")
    public String paypage() {


        return "/cart/paypage";
    }

    @RequestMapping("/minishop.wow")
    public String minishop() {
        return "/cart/minishop";
    }

    @RequestMapping("/productregist.wow")
    public String productregist() {
        return "/cart/productregist";
    }

    @RequestMapping("/productview.wow")
    public String productview() {
        return "/cart/productview";
    }

    @RequestMapping("/shoppingcart.wow")
    public String shoppingcart() {
        return "/cart/shoppingcart";
    }

    @RequestMapping("/afterpay.wow")
    public String afterpay() {
        return "/cart/afterpay";
    }

}
