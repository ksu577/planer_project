package com.study.product.web;

import com.study.cart.service.ICartService;
import com.study.cart.vo.CartVO;
import com.study.exception.BizNotFoundException;
import com.study.kakao.service.KakaoService;
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
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import com.study.common.vo.SearchVO;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class ProductController {

    private final IproductService iproductService;
    @Autowired
    IMemberService memberService;

    @Autowired
    private final KakaoService kakaoService;

    public ProductController(IproductService iproductService, KakaoService kakaoService) {
        this.iproductService = iproductService;
        this.kakaoService = kakaoService;
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
    public String productinsert(ProductVO productVO, HttpSession session , MultipartFile imgFile) throws IOException {
        UserVO user = (UserVO) session.getAttribute("user");
        if (user.getRole() == "MANAGER") {
            iproductService.insert(productVO, imgFile);
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



//    https://jungkeung.tistory.com/149 카카오페이 참고블로그
//    https://developers.kakao.com/docs/latest/ko/kakaopay/common
//    https://developers.kakao.com/docs/latest/ko/kakaopay/single-payment
//    https://blog.naver.com/PostView.naver?blogId=dudghks2814&logNo=222470808715
    @PostMapping("/shop/paypage.wow")
    public String paypage(@ModelAttribute SaveCartVO saveCartVO, ProductVO 주문서VO, HttpSession session) {
        UserVO user = (UserVO) session.getAttribute("user");
        String userId = user.getId();
        saveCartVO.setUserId(userId);
        iproductService.getSave(saveCartVO);
        return "redirect:/shop/afterpay.wow";

    }

//        HashMap<String, Object> kakao = new HashMap<>();
//        int sumMoney = cartService.sumMoney(userId);// 장바구니 전체 금액
//        int realsumMoney = sumMoney + 3000;// 장바구니 금액에 배송비 3000원 더한금액
//        order 테이블 또는 product와 savecart 관계형 테이블 하나 만들까,,
//      사실상 주문서id를 잡고 거기에서 총금액 summoney를 결제하는 형식이되어야됨
//      단건 결제라서.. 지금은 카트에 담겨있는게 여러가지 상품이라 그렇게되면
//        9번이라는 결제를 해야되니 -> 이건 단건 결제 -> 1번결제로 해치우기
//        단건 결제가 아니면 productvo를 list로 묶고 가져와야함
//        kakao.put("item_name", 주문서VO.getProductId(saveCartVO)); // 대충 이런느낌
//        kakao.put("item_name", saveCartVO.getSaveNum()); // 주문서 id, 주문서 전체를 가져올수있으면 되는부분..
//        kakao.put("quantity", sumMoney); // 1건의 결제 즉, 주문서의 총금액 한번결제하면 됨
//        kakao.put("total_amount", realsumMoney); // 총금액 sumMoney에 +3000원 해줘야됨.
//        kakao.put("tax_free_amount", realsumMoney/10); // 10%의 세금

//        payParams.add("item_name", params.get("item_name")); 여기서부턴 카카오 형식에 적혀져 있는거 참고용으로 가져오긴함
//        payParams.add("quantity", params.get("quantity"));
//        payParams.add("total_amount", params.get("total_amount"));
//        payParams.add("tax_free_amount", params.get("tex_free_amount"));


        //여기서 작성해야되고
//        kakaoService.kakaoPay(saveCartVO);


//        return "test/test";



    @GetMapping("/shop/paypage.wow")
    public String cartList(Model model, HttpSession session) throws BizNotFoundException {
        UserVO user = (UserVO) session.getAttribute("user");

        if (user != null) {
            String userId = user.getId();
            MemberVO member = memberService.getMember(userId);
            model.addAttribute("member", member);
            List<CartVO> list = cartService.listCart(userId); // 장바구니 정보
            int sumMoney = cartService.sumMoney(userId);// 장바구니 전체 금액
            model.addAttribute("listCart", list); // 장바구니 정보 추가
            model.addAttribute("sumMoney", sumMoney); // 장바구니 전체 금액 추가
            return "shop/paypage";
        } else {
            return "redirect:/login/login.wow";
        }
    }

    @GetMapping("/shop/afterpay.wow")
    public String afterpay(HttpSession session, Model model) throws BizNotFoundException {
        UserVO user = (UserVO) session.getAttribute("user");
        SaveCartVO userinfo = iproductService.viewUserInfo(user.getId());
        List<ProductVO> productinfo = iproductService.viewProductInfo(user.getId());
        model.addAttribute("userinfo", userinfo);
        model.addAttribute("productinfo", productinfo);
        return "/shop/afterpay";
    }





}