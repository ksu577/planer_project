package com.study.cart.web;

import com.study.cart.service.ICartService;
import com.study.cart.vo.CartVO;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class CartController {

    @Inject
    ICartService cartService;

    // 1. 장바구니에 추가
    @RequestMapping("/shoppingcartinsert")
    public String insert(@ModelAttribute CartVO cartVO, HttpSession session) {
        String userId = (String) session.getAttribute("user");
        cartVO.setCartId(Integer.parseInt(userId));
        //장바구니에 상품 체크
        int count = cartService.CountCart(cartVO.getProduct_id(), userId);
        if (count == 0) {
            cartService.insert(cartVO);
        } else {
            cartService.updateCart(cartVO);
        }
        return "redirect: /cart/shoppingcartview";
    };

    // 2. 장바구니 목록
    @RequestMapping("/shoppingcartview")
    public Model list(HttpSession session, Model model) {
        String userId = (String) session.getAttribute("user"); // session에 저장된 거
        List<CartVO> list = cartService.listCart(userId); // 장바구니 정보
        int sumMoney = cartService.sumMoney(userId);// 장바구니 전체 금액
        model.addAttribute("list", list);
        model.addAttribute("sumMoney", sumMoney);
        model.addAttribute("list", list);
        return model;
    };

    // 3. 장바구니 삭제
    @RequestMapping("shoppingCartDelete")
    public String delete(@RequestParam ()int cardId){
        cartService.delete(cardId);
        return "redirect: /cart/shoppingcartview";
    };


//    // 4. 장바구니 수정
//    @RequestMapping("/shopingcartupdate")
//    public String update(@RequestParam ()int amount, @RequestParam int product_id, HttpSession session){
//        String userId = (String) session.getAttribute("user");
//        for (int i=0; i<product_id.length; )
//
//    }








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
