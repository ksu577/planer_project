package com.study.cart.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CartController {




    @RequestMapping("/minishop/paypage.wow")
    public String paypage() {
        return "/minishop/paypage";
    }

    @RequestMapping("/minishop/minishop.wow")
    public String minishop() {
        return "/minishop/minishop";
    }

    @RequestMapping("/minishop/productregist.wow")
    public String productregist() {
        return "/minishop/productregist";
    }

    @RequestMapping("/minishop/productview.wow")
    public String productview() {
        return "/minishop/productview";
    }

    @RequestMapping("/minishop/shoppingcart.wow")
    public String shoppingcart() {
        return "/minishop/shoppingcart";
    }

    @RequestMapping("/minishop/afterpay.wow")
    public String afterpay() {
        return "/minishop/afterpay";
    }

}
