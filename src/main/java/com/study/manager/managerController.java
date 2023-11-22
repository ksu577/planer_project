package com.study.manager;

import com.study.common.vo.PagingVO;
import com.study.common.vo.SearchVO;
import com.study.product.service.IproductService;
import com.study.product.vo.ProductVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
public class managerController {

    private final IproductService iproductService;
    public managerController(IproductService iproductService) {
        this.iproductService = iproductService;
    }

    @Autowired
    IproductService IproductService;

    @Autowired
    managerService managerService;


    @GetMapping("/ManagerPage/manager.wow")
    public String manager(){
        return "ManagerPage/manager";
    }

    // 1.5 . 상품 리스트 - 어드민 보기용
    @RequestMapping("/product/productlist")
    public String productlist(Model model
                            , @ModelAttribute("paging") PagingVO paging
                            , @ModelAttribute("searchVO") SearchVO search ){
        List<ProductVO> productList = iproductService.getprodList(paging,search);
        model.addAttribute("productList", productList);
        return "/ManagerPage/managerproduct";
    }

}

