package com.study.cart.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CartController {


    // 카트 보기
    @RequestMapping("/cart/shoppingcartview.wow")
    public String shoppingcartview() {
        return "/cart/shoppingcartview";
    }


    @RequestMapping("/cart/shoppingcartdelete.wow")
    public String shoppingcartdelete() {
        return "/cart/shoppingcartdelete";
    }


    @RequestMapping("/cart/shoppingcartcreate.wow")
    public String shoppingcartcreate() {
        return "/cart/shoppingcartcreate";
    }


    @RequestMapping("/cart/shoppingcartupdate.wow")
    public String shoppingcartupdate() {
        return "/cart/shoppingcartupdate";
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
