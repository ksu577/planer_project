package com.study.cart.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/cart")
public class CartController {




    @RequestMapping("/cart/paypage.wow")
    public String paypage() {
        return "shop/paypage";
    }

    @RequestMapping("/minishop.wow")
    public String minishop() {
        return "shop/minishop";
    }


    @RequestMapping("/shoppingcart.wow")
    public String shoppingcart() {
        return "/cart/shoppingcart";
    }

    @RequestMapping("/afterpay.wow")
    public String afterpay() {
        return "shop/afterpay";
    }

}
