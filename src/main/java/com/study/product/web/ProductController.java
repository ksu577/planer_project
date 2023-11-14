package com.study.product.web;

import com.study.product.service.IproductService;
import com.study.product.vo.ProductVO;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class ProductController {

    private final IproductService iproductService;

    public ProductController(IproductService iproductService) {
        this.iproductService = iproductService;
    }

    // 1. 상품 전체 목록
    @RequestMapping("/minishop")
    public String list(Model model) {
        model.addAttribute("list", iproductService.getprodList());
        return "shop/minishop";
    }

    //     2. 상품 상세보기
    @RequestMapping("detail/{productId}")
    public String detail(@RequestParam int productId, Model model) {
        model.addAttribute("product", iproductService.getproduct(productId));
        return "shop/productviwe";
    }

    // 3. 상품 등록페이지 이동
    @RequestMapping("/productregist")
    public String productregist() {
        return "/shop/productregist";
    }


    // 4. 상품 등록 페이지 작성
    @RequestMapping("/shop/productregist.wow")
    public String productinsert(ProductVO productVO)
    {
        return "product/productregist";

    }


    @RequestMapping("/shop/productupdate.wow")
    public String productupdate() {
        return "product/productupdate";
    }

    @RequestMapping("/shop/productdelete.wow")
    public String productdelete() {
        return "product/productdelete";
    }

    @RequestMapping(value = "/shop/productview.wow", method = RequestMethod.GET)
    public String getProduct(int productId, Model model) {

        ProductVO productVO = iproductService.getproduct(productId);
        model.addAttribute("product", productVO);

        return "shop/productview";
    }
}
