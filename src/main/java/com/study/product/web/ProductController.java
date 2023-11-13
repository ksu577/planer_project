package com.study.product.web;

import com.study.product.service.IproductService;
import com.study.product.vo.ProductVO;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.inject.Inject;
import java.util.List;

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

    // 2. 상품 상세보기
//    @RequestMapping("detail/{productId}")
//    public Model detail(@RequestParam int productId, Model model){
//       model.addAttribute("product", iproductService.getproduct(productId));
//        return "shop/productviwe";
//    }



    @RequestMapping("/shop/productregist.wow")
    public String productinsert() {
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
