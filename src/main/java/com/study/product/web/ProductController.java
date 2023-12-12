package com.study.product.web;

import com.study.attach.vo.AttachVO;
import com.study.cart.service.ICartService;
import com.study.cart.vo.CartVO;
import com.study.exception.BizNotFoundException;
import com.study.kakao.service.KakaoService;
import com.study.login.vo.UserVO;
import com.study.member.service.IMemberService;
import com.study.member.vo.MemberVO;
import com.study.product.dao.ProductDao;
import com.study.product.service.IproductService;
import com.study.product.vo.ProductVO;
import com.study.product.vo.SaveCartVO;
import lombok.extern.slf4j.Slf4j;
import org.apache.xmlbeans.impl.xb.xsdschema.Attribute;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.*;
import com.study.common.vo.PagingVO;

import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.util.HashMap;
import java.util.List;

import com.study.common.vo.SearchVO;
import org.springframework.web.multipart.MultipartFile;

@Slf4j
@Controller
public class ProductController {

    private IproductService iproductService;
    @Autowired
    IMemberService memberService;

    @Autowired
    private final KakaoService kakaoService;

    public ProductController(IproductService iproductService, KakaoService kakaoService) {
        this.iproductService = iproductService;
        this.kakaoService = kakaoService;
    }

    @Value("#{util['file.upload.path']}")
    private String uploadPath;

    @Autowired
    IproductService IproductService;
    @Autowired
    ICartService cartService;


    // 1. 상품 전체 목록
    @RequestMapping("shop/minishop.wow")
    public String productlist(Model model
            , @ModelAttribute("paging") PagingVO paging
            , @ModelAttribute("searchVO") SearchVO search) {
        List<ProductVO> productList = iproductService.getprodList(paging, search);
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
    public String productinsert(ProductVO productVO, HttpSession session, MultipartFile imgFile) throws IOException {
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
    public String updatepage(@RequestParam("product") int productId, HttpSession session, Model model) {
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
    public String updateproduct(ProductVO productVO, MultipartFile imgFile, HttpSession session) throws IOException {
        UserVO user = (UserVO) session.getAttribute("user");
        if (user.getRole() == "MANAGER") {
            iproductService.updateproduct(productVO, imgFile);
            return "redirect:/shop/minishop.wow";
        }
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
    @PostMapping("/shop/insertOrder.wow")
    public String paypage(@ModelAttribute SaveCartVO saveCartVO, HttpSession session) throws Exception {
        UserVO user = (UserVO) session.getAttribute("user");
        String userId = user.getId();
        saveCartVO.setUserId(userId);
        iproductService.getSave(saveCartVO);
        return "redirect:/shop/afterpay.wow";
    }

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

//        if (user != null) {
//            String userId = user.getId();
//            cartService.clearCart(userId);
//        }
        model.addAttribute("userinfo", userinfo);
        model.addAttribute("productinfo", productinfo);


        return "/shop/afterpay";
    }


//    public File getFileFromAttachVO(ProductVO productVO) throws IOException, BizNotFoundException {
//        String fileName = productVO.getImg();  //저장되어있는 파일이름. 랜덤값
//        String filePath = productVO.getImgPath();     // 저장되어있는 폴더 경로
//        String path = uploadPath + File.separatorChar + filePath;
//        File file = new File(path, fileName);
//        if (!file.isFile()) throw new BizNotFoundException("파일없음");
//        return  file;
//
//    }

    //img파일 썸네일
    @RequestMapping("/imgDownload/showImg.wow")
    @ResponseBody
    public ResponseEntity<byte[]> showImage(@RequestParam("fileName") String img, @RequestParam("filePath") String imgPath) {
//        String projectPath = "/home/pc31/Docker/team3/";

        File file = new File(uploadPath + imgPath, img);
        log.debug("filepath: {}", file.toString());
        ResponseEntity<byte[]> result = null;
        try {
            HttpHeaders headers = new HttpHeaders();
            headers.add("Content-Type", Files.probeContentType(file.toPath()));
            result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), headers, HttpStatus.OK);
        } catch (IOException e) {
            e.printStackTrace();
        }
        return result;
    }






}

