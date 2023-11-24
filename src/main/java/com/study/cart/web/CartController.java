package com.study.cart.web;

import com.study.cart.service.ICartService;
import com.study.cart.vo.CartVO;
import com.study.login.vo.UserVO;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;
import java.security.Principal;
import java.util.List;


@Controller
@RequestMapping("/cart")
public class CartController {

    @Inject
    ICartService cartService;

    //카트 테이블 자체가 장바구니로 보는게 편하다.

    // 1. 장바구니에(물품) 추가
    @RequestMapping("/shoppingcartinsert")
    public String insert(@ModelAttribute CartVO cartVO, HttpSession session) {
        UserVO user = (UserVO) session.getAttribute("user");

        if (user != null) {
            String userId = user.getId();

            cartVO.setUserId(userId);
            cartService.insert(cartVO);
            return "redirect:/cart/shoppingcartview";
        }

        return "redirect:/login/login.wow";

    }

    ;

        // 2. 장바구니 목록(장바구니 전체 - 카트 페이지)
        @GetMapping("/shoppingcartview")
        public String cartList(Model model, HttpSession session) {
            UserVO user = (UserVO) session.getAttribute("user");

            if (user != null) {
                String userId = user.getId();
                List<CartVO> list = cartService.listCart(userId); // 장바구니 정보
                int sumMoney = cartService.sumMoney(userId);// 장바구니 전체 금액
                model.addAttribute("listCart", list); // 장바구니 정보 추가
                model.addAttribute("sumMoney", sumMoney); // 장바구니 전체 금액 추가
                return "cart/shoppingcartview" ;
            } else {
                return "redirect:/login/login.wow";
            }

        }




    // 3. 장바구니(담은 물품) 삭제
    @RequestMapping(value = "/shoppingCartDelete", method = RequestMethod.POST)
    public String delete(@RequestParam("cartId") int cartId) {
        cartService.delete(cartId);
        return "redirect:/cart/shoppingcartview.wow";
    }

    ;


    // 4. 장바구니 수정
    @RequestMapping("/shoppingcartupdate")
    public String updateCartItem(@RequestParam() int[] amount, @RequestParam int[] productId, HttpSession session) {
        UserVO user = (UserVO) session.getAttribute("user");

        if (user != null) {
            String userId = user.getId();
            for (int i = 0; i < productId.length; i++) {
                CartVO cartVO = new CartVO();
                cartVO.setUserId(userId);
                cartVO.setAmount(amount[i]);
                cartVO.setProductId(productId[i]);
                if (amount[i] < 1) {
                    amount[i] = 1;
                    cartVO.setAmount(amount[i]);
                } else {
                    // 아니면 업데이트
                    cartService.modify(cartVO);
                }
            }
            return "redirect:/cart/shoppingcartview.wow";
        }
        return "redirect:/login/login.wow";
    }

    // 4. 전체 삭제
    @RequestMapping("/shoppingCartClear")
    public String clear(HttpSession session) {
        UserVO user = (UserVO) session.getAttribute("user");

        if (user != null) {
            String userId = user.getId();
            cartService.clearCart(userId);
        }

        return "redirect:/cart/shoppingcartview.wow";
    }


    // 카트 페이지에 데이터 보내기
    @PostMapping("/shoppingcartview")
    public String cartpage(HttpSession session) {
        UserVO user = (UserVO) session.getAttribute("user");
        if (user != null) {
            return "cart/shoppingcartview";
        } else {
            return "redirect: /login/login.wow";
        }
    }

}