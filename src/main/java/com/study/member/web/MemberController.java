package com.study.member.web;

import com.study.cart.service.ICartService;
import com.study.cart.vo.CartVO;
import com.study.common.vo.PagingVO;
import com.study.common.vo.ResultMessageVO;
import com.study.common.vo.SearchVO;
import com.study.exception.*;
import com.study.login.service.LoginService;
import com.study.login.vo.UserVO;
import com.study.member.service.IMemberService;
import com.study.member.service.MailService;
import com.study.member.vo.MemberVO;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.inject.Inject;
import javax.mail.MessagingException;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Controller
public class MemberController {

    private String key;
    @Inject
    ICartService cartService;
    @Autowired
    IMemberService memberService;
    @Autowired
    LoginService loginService;
    @Autowired
    private MailService mailService;

    @Value("#{util['file.upload.path']}")
    private String uploadPath;

    @ExceptionHandler(value = {BizNotFoundException.class, BizNotEffectedException.class, BizPasswordNotMatchedException.class, BizException.class})
    public String exception(Model model, BizException e) {
        e.printStackTrace();
        ResultMessageVO resultMessageVO = new ResultMessageVO();
        resultMessageVO.messageSetting(false, "에러", "에러", "/", "홈으로 갑니다.");
        model.addAttribute("resultMessageVO", resultMessageVO);
        return "common/message";
    }

    @RequestMapping("/member/memberList.wow")
    public String memberList(Model model, @ModelAttribute("paging") PagingVO paging, @ModelAttribute("search") SearchVO search, @ModelAttribute("searchId") String searchId, HttpSession session) {
        List<MemberVO> memberList = memberService.getMemberList(paging, search);
        model.addAttribute("memberList", memberList);
        UserVO user = (UserVO) session.getAttribute("user");
        if (user.getRole() == "MANAGER") {
            return "member/memberList";
        } else {
            return "redirect:/";
        }
    }


    @GetMapping("/member/memberView.wow")
    public String memberView(@RequestParam(required = false) String Id, HttpSession session, Model model) throws BizException {
        UserVO user = (UserVO) session.getAttribute("user");
        if ("MANAGER".equals(user.getRole())) {
            if (!Id.trim().isEmpty()) {
                MemberVO member = memberService.getMember(Id);
                model.addAttribute("member", member);
                return "member/memberView";
            }
        }
        if (user != null) {
            String userId = user.getId();
            MemberVO member = memberService.getMember(userId);
            model.addAttribute("member", member);
            return "member/memberView";
        }
        return "redirect:/login/login.wow";
    }

    @GetMapping("/member/memberEdit.wow")
    public String memberEdit(Model model, HttpSession session) throws BizException {
        UserVO user = (UserVO) session.getAttribute("user");
        if (user != null) {
            String Id = user.getId();
            MemberVO member = memberService.getMember(Id);
            model.addAttribute("member", member);
            return "member/memberEdit";
        } else {
            return "redirect:/login/login.wow";
        }
    }


    @PostMapping("/member/memberModify.wow")
    public String memberModify(Model model, MemberVO member, HttpSession session, String id, MultipartHttpServletRequest Request) throws Exception {
        ResultMessageVO resultMessageVO = new ResultMessageVO();

        String profile = FileUtil.modifyMember(Request);   //multipart 라이브러리의 함수들을 통해, 파일의 값을 가져오고 지정된 로컬에 저장, 저장된이름을 profile 에 담았다.

        UserVO user = (UserVO) session.getAttribute("user");
        member.setProfile(profile);
        member.setId(user.getId());
        memberService.modifyMember(member);  // 이름, 사는곳 등등 회원정보 변경하는 코드

        session.setAttribute("user", user);

        //jsp로 가기위한 코드
        resultMessageVO.messageSetting(true, "수정", "수정 되었습니다."
                , "/member/memberList.wow", "목록으로");
        model.addAttribute("resultMessageVO", resultMessageVO);
        return "common/message";
    }


    @PostMapping("/member/memberDelete.wow")
    public String memberDelete(Model model, MemberVO member) throws BizException {
        ResultMessageVO resultMessageVO = new ResultMessageVO();
        memberService.removeMember(member);
        resultMessageVO.messageSetting(true, "탈퇴", "회원탈퇴 되었습니다."
                , "/member/memberList.wow", "탈퇴완료.");
        model.addAttribute("resultMessageVO", resultMessageVO);
        return "common/message";
    }


    @GetMapping("/member/memberForm.wow")
    public String memberForm(Model model) {
        return "member/memberForm";
    }


    @PostMapping("/member/memberRegist.wow")
    public String memberRegist(Model model, MemberVO member) throws BizNotEffectedException, BizDuplicateKeyException {
        ResultMessageVO resultMessageVO = new ResultMessageVO();
        memberService.registMember(member);
        resultMessageVO.messageSetting(true, "등록", "회원가입 되었습니다."
                , "/member/memberRegist.wow", "회원가입");
        model.addAttribute("resultMessageVO", resultMessageVO);
        return "common/message";
//        return resultMessageVO.getUrl();
    }


//    @GetMapping("/shop/paypage.wow")
//    public String cartList(Model model, HttpSession session) throws BizNotFoundException {
//        UserVO user = (UserVO) session.getAttribute("user");
//
//        if (user != null) {
//            String userId = user.getId();
//            MemberVO member = memberService.getMember(userId);
//            model.addAttribute("member", member);
//            List<CartVO> list = cartService.listCart(userId); // 장바구니 정보
//            int sumMoney = cartService.sumMoney(userId);// 장바구니 전체 금액
//            model.addAttribute("listCart", list); // 장바구니 정보 추가
//            model.addAttribute("sumMoney", sumMoney); // 장바구니 전체 금액 추가
//            return "shop/paypage";
//        } else {
//            return "redirect:/login/login.wow";
//        }
//
//    }

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

//
//    @PostMapping("/shop/paypage.wow")
//    public String paypage(HttpSession session, Model model) throws BizNotFoundException {
//        UserVO user = (UserVO) session.getAttribute("user");
//
//
//        if (user != null) {
//            String userId = user.getId();
//            return "shop/paypage";
//        } else {
//            return "redirect:/login/login.wow";
//        }
//    }

    //img파일 썸네일
    @RequestMapping("/member/showProfile.wow")
    @ResponseBody
    public ResponseEntity<byte[]> showImage(String fileName, String filePath) {
        File file = new File(uploadPath + File.separatorChar + filePath, fileName);
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

    @GetMapping("/login/findId.wow")
    public String findId() {
        return "login/findId";
    }

    @PostMapping("/login/findId.wow")
    @ResponseBody
    public List<MemberVO> findId(@RequestParam("name") String name, @RequestParam("email") String email) {
        System.out.println(name + email);
        List<MemberVO> result = memberService.findId(name, email);
        return result;
    }

    @ResponseBody
    @RequestMapping(value = "/findId/emailCheck3", produces = "text/plain;charset=UTF-8")
    public String emailCheck3(String email) throws MessagingException {
        key = mailService.mailSend2(email);
        return key;
    }

    @ResponseBody
    @RequestMapping(value = "/findId/emailCheck4", produces = "text/plain;charset=UTF-8")
    public String emailCheck4(String sendKey) throws MessagingException {
        if (key.equals(sendKey)) {
            return "인증 되었습니다.";
        } else {
            return "인증번호를 확인해주세요";
        }
    }
}