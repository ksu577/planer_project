package com.study.product.web;

import com.study.cart.service.ICartService;
import com.study.cart.vo.CartVO;
import com.study.exception.BizNotFoundException;
import com.study.login.vo.UserVO;
import com.study.member.service.IMemberService;
import com.study.member.vo.MemberVO;
import com.study.product.service.IproductService;
import com.study.product.vo.ProductVO;
import com.study.product.vo.SaveCartVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import com.study.common.vo.PagingVO;
import javax.servlet.http.HttpSession;
import java.util.List;
import com.study.common.vo.SearchVO;
@Controller
public class ProductController {

    private final IproductService iproductService;
    @Autowired
    IMemberService memberService;

    public ProductController(IproductService iproductService) {
        this.iproductService = iproductService;
    }


    @Autowired
    IproductService IproductService;
    @Autowired
    ICartService cartService;


    // 1. 상품 전체 목록
    @RequestMapping("shop/minishop.wow")
    public String productlist(Model model
            , @ModelAttribute("paging") PagingVO paging
            , @ModelAttribute("searchVO") SearchVO search ){
        List<ProductVO> productList = iproductService.getprodList(paging,search);
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
    public String productregist(HttpSession session) {
        UserVO user = (UserVO) session.getAttribute("user");
        if (user.getRole() == "MANAGER") {
            return "/product/productregist";
        } else {
            return "redirect:/shop/minishop.wow";
        }
    }

    // 4. 상품 등록 페이지 (기능) -- 사진 db에 삽입하기
    @RequestMapping("/product/productinsert")
    public String productinsert(ProductVO productVO, HttpSession session) {
        UserVO user = (UserVO) session.getAttribute("user");
        if (user.getRole() == "MANAGER") {
            iproductService.insert(productVO);
            return "redirect:/shop/minishop.wow";
        } else {
            return "redirect:/shop/minishop.wow";
        }

    }


    // 5. 상품 수정 페이지 이동후 내용물 보이기 - 이동
    @RequestMapping("/product/productupdate(admin)")
    public String update(@RequestParam("product") int productId, HttpSession session, Model model) {
        UserVO user = (UserVO) session.getAttribute("user");
        if (user.getRole() == "MANAGER") {
            ProductVO productVO = IproductService.getproduct(productId);
            model.addAttribute("product", productVO);
            return "product/productupdate(admin)";
        } else {
            return "redirect:/shop/minishop.wow";
        }
    }

    ;

    // 6. 상품 수정 페이지 (기능)  -- 사진 db에 변경하기
    @RequestMapping("/product/productModify(admin)")
    public String update(ProductVO productVO) {
        iproductService.update(productVO);
        return "redirect: /shop/minishop.wow";
    }

    // 7. 상품 삭제 기능
    @RequestMapping("/product/productdelete")
    public String productdelete(@RequestParam("product") int productId, HttpSession session) {
        UserVO user = (UserVO) session.getAttribute("user");
        if (user.getRole() == "MANAGER") {
            iproductService.delete(productId);
            return "redirect:/shop/minishop.wow";
        } else {
            return "redirect:/shop/minishop.wow";
        }
    }

    // ---------------------샵 페이지------------MemberController로 갔어요


    @PostMapping("/shop/paypage.wow")
    public String paypage(@ModelAttribute SaveCartVO saveCartVO, HttpSession session) {
        UserVO user = (UserVO) session.getAttribute("user");
        String userId = user.getId();
        saveCartVO.setUserId(userId);
        iproductService.getSave(saveCartVO);
        return "redirect:/shop/afterpay.wow";
    }


//    여기부분 수정해야됨 11월 23일 목요일
    @GetMapping("/shop/afterpay.wow")
    public String afterpay(HttpSession session, Model model) throws BizNotFoundException {
        UserVO user = (UserVO) session.getAttribute("user");
        List<CartVO> userinfo = iproductService.viewuserInfo(user.getId());
//       List<ProductVO> productinfo = iproductService.viewproductInfo(user.getId());
        model.addAttribute("userinfo", userinfo);
//        model.addAttribute("productinfo", productinfo);
        return "/shop/afterpay";
    }

//    이거 수정하고 afterpay.jsp로 넘어가서 결과값이 나오면 nice


    // 도전했던 흔적들...
//    @Autowired
//    IMemberService memberService; 아래꺼 쓰려면 위에 이거 써야겠지..?

//    @PostMapping("/shop/paypage.wow")
//    public String paypage(@ModelAttribute SaveCartVO saveCartVO, HttpSession session, Model model) throws BizNotFoundException {
//        UserVO user = (UserVO) session.getAttribute("user");
//        String userId = user.getId();
//        saveCartVO.setUserId(userId);
//        MemberVO member = memberService.getMember(userId);
//        model.addAttribute("saveCartVO", saveCartVO);
//        model.addAttribute("member", member);
//
//        iproductService.getSave(saveCartVO);
//        session.setAttribute("saveCartVO", saveCartVO);
//        session.setAttribute("member", member);
//
//        return "redirect:/shop/afterpay.wow?method=POST";
//    }
//
//
//    @GetMapping("/shop/afterpay.wow")
//    public String afterpay(Model model, HttpSession session, @RequestParam(value = "method", required = false) String method){
//        if (!"POST".equals(method)) {
//            return "redirect:/";
//        }
//
//        UserVO user = (UserVO) session.getAttribute("user");
//        SaveCartVO saveCartVO = (SaveCartVO) session.getAttribute("saveCartVO");
//        MemberVO member = (MemberVO) session.getAttribute("member");
//
//        model.addAttribute("saveCartVO", saveCartVO);
//        model.addAttribute("member", member);
//        return "/shop/afterpay";
//    }



}