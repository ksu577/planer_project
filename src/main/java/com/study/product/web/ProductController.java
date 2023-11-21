package com.study.product.web;

import com.study.cart.service.ICartService;
import com.study.cart.vo.CartVO;
import com.study.login.vo.UserVO;
import com.study.product.service.IproductService;
import com.study.product.vo.ProductVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class ProductController {

    private final IproductService iproductService;

    public ProductController(IproductService iproductService) {
        this.iproductService = iproductService;
    }


    @Autowired
    ICartService cartService;


    // 1. 상품 전체 목록
    @RequestMapping("shop/minishop.wow")
    public String list(Model model) {
        List<ProductVO> productList = iproductService.getprodList();
        model.addAttribute("list", productList);
        return "/shop/minishop";
    }

    // 2. 상품 상세보기
    @RequestMapping("/product/productview.wow")
    public String viewdetail(@RequestParam int productId, Model model) {
        ProductVO detail = iproductService.getproduct(productId);
        model.addAttribute("product", detail);
        return "product/productview";
    }

    // 3. 상품 등록페이지 이동
    @RequestMapping("/product/productregist")
    public String productregist() {
        return "/product/productregist";
    }

    // 4. 상품 등록 페이지 (기능) -- 사진 db에 삽입하기
    @RequestMapping("/product/productinsert")
    public String productinsert(ProductVO productVO) {
        iproductService.insert(productVO);
        return "redirect:/shop/minishop.wow";
    }


//    // 5. 상품 수정 페이지 이동 ------------ 수정 페이지 필요, 만들어야 함
//    @RequestMapping("/product/productupdate(admin)")
//    public String update(ProductVO productVO, Model model){
//        model.addAttribute("updatepage", iproductService.update(ProductVO productVO));
//        return "product/productupdate(admin)";
//    };

    // 6. 상품 수정 페이지 (기능)  -- 사진 db에 변경하기
    @RequestMapping("/product/productupdate(admin)")
    public String edit(ProductVO productVO) {
        iproductService.update(productVO);
        return "product/productupdate(admin)";
    }

    // 7. 상품 삭제 기능
    @RequestMapping("/product/productdelete")
    public String productdelete(@RequestParam int productId) {
        iproductService.delete(productId);
        return "product/productdelete";
    }

    // ---------------------샵 페이지------------MemberController로 갔어요


    @RequestMapping("/shop/afterpay.wow")
    public String afterpay() {
        return "shop/afterpay";
    }


}