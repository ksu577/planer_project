package com.study.cart.web;

import com.study.cart.service.ICartService;
import com.study.cart.vo.CartVO;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;
import java.security.Principal;
import java.util.List;


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
        int count = cartService.CountCart(cartVO.getProductId(), userId);
        if (count == 0) {
            cartService.insert(cartVO);
        } else {
            cartService.updateCart(cartVO);
        }
        return "redirect:/cart/shoppingcartview";
    }

    ;

//    // 2. 장바구니 목록
//    @RequestMapping("/cart/shoppingcartview")
//    public Model list(HttpSession session, Model model) {
//        String userId = (String) session.getAttribute("user"); // session에 저장된 거
//        List<CartVO> list = cartService.listCart(userId); // 장바구니 정보
//        int sumMoney = cartService.sumMoney(userId);// 장바구니 전체 금액
//        model.addAttribute("list", list);
//        model.addAttribute("sumMoney", sumMoney);
//        return model;
//    };

    @RequestMapping("/cart/shoppingcartview.wow")
    public String cartList(Model model, @RequestParam String userId){
       List<CartVO> list = cartService.listCart(userId);
       model.addAttribute("list", list);
        return "redirect:/cart/shoppingcartview.wow?userId=" + userId;
    }


    // 3. 장바구니 삭제
    @RequestMapping("shoppingCartDelete")
    public String delete(int cardId, @RequestParam String userId) {
        cartService.delete(cardId);
        return "redirect:/cart/shoppingcartview.wow";
    }

    ;


    // 4. 장바구니 수정
    @RequestMapping("/shoppingcartupdate")
    public String update(@RequestParam() int[] amount, @RequestParam int[] product_id, HttpSession session) {
        String userId = (String) session.getAttribute("user");
        for (int i = 0; i < product_id.length; i++) {
            CartVO cartVO = new CartVO();
            cartVO.setUserId(userId);
            cartVO.setAmount(amount[i]);
            cartVO.setProductId(product_id[i]);
            cartService.modify(cartVO);
        }
        return "redirect:/cart/shoppingcartview";
    }

    ;


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
