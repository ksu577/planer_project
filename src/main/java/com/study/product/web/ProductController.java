package com.study.product.web;

import com.study.product.service.IproductService;
import com.study.product.vo.ProductVO;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
public class ProductController {

    private final IproductService iproductService;

    public ProductController(IproductService iproductService) {
        this.iproductService = iproductService;
    }

    // 1. 상품 전체 목록
    @RequestMapping("shop/minishop.wow")
    public String list(Model model) {
        List<ProductVO> productList = iproductService.getprodList();
        model.addAttribute("list", productList);

        return "/shop/minishop";
    }

    // 2. 상품 상세보기
    @RequestMapping("product/productview.wow")
    public String viewdetail(@RequestParam int productId, Model model) {
        ProductVO detail = iproductService.getproduct(productId);
        model.addAttribute("product", detail);
        return "product/productview";
    }

    // 3. 상품 등록페이지 이동
    @RequestMapping("/productregist")
    public String productregist() {
        return "/product/productregist";
    }

    // 4. 상품 등록 페이지 (기능) -- 사진 db에 삽입하기
    @RequestMapping("/product/productregist.wow")
    public String productinsert(ProductVO productVO) {
        iproductService.insert(productVO);
        return "product/productregist";
    }


    // 5. 상품 수정 페이지 이동 ------------ 수정 페이지 필요, 만들어야 함
    @RequestMapping("/product/productupdate(admin).wow")
    public String update(@RequestParam int productId, Model model){
        model.addAttribute("updatepage", iproductService.getproduct(productId));
        return "product/productupdate(admin)";
    };

    // 6. 상품 수정 페이지 (기능)  -- 사진 db에 변경하기
//    @RequestMapping("/shop/productupdate.wow")
//    public String edit(ProductVO productVO) {
//        iproductService.update(productVO);
//        return "redirect:/shop/minishop";
//    }

    // 7. 상품 삭제 기능
    @RequestMapping("/product/productdelete.wow")
    public String productdelete(@RequestParam int productId) {
        iproductService.delete(productId);
        return "product/productdelete";
    }

    // ---------------------샵 페이지------------
    @RequestMapping("/shop/paypage.wow")
    public String paypage() {
        return "shop/paypage";
    }


    @RequestMapping("/shop/afterpay.wow")
    public String afterpay() {
        return "shop/afterpay";
    }

}