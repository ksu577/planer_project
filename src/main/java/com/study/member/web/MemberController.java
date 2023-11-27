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
import com.study.member.service.MemberServiceImpl;
import com.study.member.vo.MemberVO;
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
import java.util.HashMap;
import java.util.List;

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
    @Autowired
    MemberServiceImpl memberServiceImpl;

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
        resultMessageVO.messageSetting(true, "수정", "회원정보가 수정되었습니다."
                , "/member/memberList.wow", "목록으로");
        model.addAttribute("resultMessageVO", resultMessageVO);
        return "common/message";
    }


    @PostMapping("/member/memberDelete.wow")
    public String memberDelete(Model model, MemberVO member) throws BizException {
        ResultMessageVO resultMessageVO = new ResultMessageVO();
        memberService.removeMember(member);
        resultMessageVO.messageSetting(true, "탈퇴", "회원탈퇴가 완료되었습니다."
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
        resultMessageVO.messageSetting(true, "회원가입", "회원가입이 성공하였습니다."
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
    public String emailCheck4(String sendKey) {
        if (key.equals(sendKey)) {
            return "인증 되었습니다.";
        } else {
            return "인증번호를 확인해주세요";
        }
    }


    @GetMapping("/login/findPw.wow")
    public String findPw() {
        return "login/findPw";
    }

    @PostMapping("/login/findPw.wow")
    public String findMePw(String email, HttpSession session, Model model) {
        UserVO user = (UserVO) session.getAttribute("user");

        if (user != null) {
            String Id = user.getId();
            MemberVO member = memberService.findPw(Id, email);

            if (member != null) {
                model.addAttribute("member", member);
                model.addAttribute("Id", Id);
                return "redirect:/login/changePw.wow";
            } else {
                return "redirect:/"; // 실패 시 처리, 에러 페이지로 리다이렉트하거나 다른 방식으로 처리
            }
        } else {
            // 사용자가 인증되지 않음
            return "redirect:/";
        }
    }

//    UserVO user = (UserVO) session.getAttribute("user");
//        if (user != null) {
//        String Id = user.getId();
//        MemberVO member = memberService.getMember(Id);
//        model.addAttribute("member", member);
//        return "member/memberEdit";
//    } else {
//        return "redirect:/login/login.wow";
//    }
//}
//    @PostMapping("/authenticate")
//    public String authenticateUser(Model model, HttpSession session) {
//        // 여기에서 본인 인증 로직을 수행하고, 성공적으로 인증되었다고 가정합니다.
//
//        // 가령, 본인 인증이 성공하면 UserVO 객체를 생성하거나 가져오고, 세션에 저장합니다.
//        UserVO authenticatedUser = new UserVO(); // 여기에서 실제 사용자 정보를 가져오거나 생성해야 합니다.
//        session.setAttribute("user", authenticatedUser);
//
//        // 나머지 로직은 로그인 후의 동작을 수행합니다.
//        model.addAttribute("authenticatedUser", authenticatedUser);
//        return "redirect:/home"; // 로그인 후 홈 페이지로 리다이렉트 또는 다른 동작 수행
//    }

//            List<MemberVO> memberList = memberServiceImpl.getMemberList(paging, search);
//            model.addAttribute("memberList", memberList);


    @ResponseBody
    @RequestMapping(value = "/findPw/emailCheck5", produces = "text/plain;charset=UTF-8")
    public String emailCheck5(String email) throws MessagingException {
        key = mailService.mailSend3(email);
        return key;
    }

    @ResponseBody
    @RequestMapping(value = "/findPw/emailCheck6", produces = "text/plain;charset=UTF-8")
    public String emailCheck6(String sendKey) {
        if (key.equals(sendKey)) {
            return "인증 되었습니다.";
        } else {
            return "인증번호를 확인해주세요";
        }
    }

    @ResponseBody
    @PostMapping("/login/author.wow")
    public ResultMessageVO author(HttpSession session, @RequestBody MemberVO member) {
        ResultMessageVO resultMessageVO = new ResultMessageVO();

        session.setAttribute("user", member);

        resultMessageVO.setMessage("인증완료");
        resultMessageVO.setUrl("/login/changePw.wow");

        return resultMessageVO;
    }

    @GetMapping("/login/changePw.wow")
    public String changeMePw(Model model, HttpSession session) {
        MemberVO member = (MemberVO) session.getAttribute("user");

        model.addAttribute("member", member);

        return "login/changePw";
    }


    @PostMapping("/login/changePw.wow")
    public String changePw(Model model, HttpSession session, MemberVO member) throws BizException {
        ResultMessageVO resultMessageVO = new ResultMessageVO();
        MemberVO user = (MemberVO) session.getAttribute("user");
        member.setId(user.getId());
        memberService.changePw(member);

        session.setAttribute("user", member);

        resultMessageVO.messageSetting(true, "수정", "비밀번호가 변경되었습니다."
                , "/login/login.wow", "목록으로");
        model.addAttribute("resultMessageVO", resultMessageVO);
        return "common/message";
    }
}