package com.study.cart.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CartController {

//    @Autowired
//    private CartService cartService;
//
//    @GetMapping("/minishop/paypage.wow")
//    public String paypageGet() throws Exception {
//        String
//    }


    @RequestMapping("/minishop/paypage.wow")
    public String paypageform() {
        return "/minishop/paypage";
    }

}
