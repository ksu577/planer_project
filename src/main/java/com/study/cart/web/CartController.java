package com.study.cart.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CartController {


    // 카트 보기
    @RequestMapping("/cart/shoppingcart.wow")
    public String shoppingcart() {
        return "/cart/shoppingcart";
    }












    // ---------------------샵 페이지------------
    @RequestMapping("/shop/paypage.wow")
    public String paypage() {
        return "shop/paypage";
    }

    @RequestMapping("/shop/minishop.wow")
    public String minishop() {
        return "shop/minishop";
    }


    @RequestMapping("/shop/afterpay.wow")
    public String afterpay() {
        return "shop/afterpay";
    }

}
