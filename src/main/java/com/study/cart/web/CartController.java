package com.study.cart.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CartController {












    @RequestMapping("/cart/paypage.wow")
    public String paypage() {
        return "/minishop/paypage";
    }

    @RequestMapping("/cart/minishop.wow")
    public String minishop() {
        return "/minishop/minishop";
    }

    @RequestMapping("/cart/productregist.wow")
    public String productregist() {
        return "/minishop/productregist";
    }

    @RequestMapping("/cart/productview.wow")
    public String productview() {
        return "/minishop/productview";
    }

    @RequestMapping("/cart/shoppingcart.wow")
    public String shoppingcart() {
        return "/minishop/shoppingcart";
    }

    @RequestMapping("/cart/afterpay.wow")
    public String afterpay() {
        return "/minishop/afterpay";
    }

}
