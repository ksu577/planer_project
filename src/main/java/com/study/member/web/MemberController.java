package com.study.member.web;

import com.study.cart.service.ICartService;
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
import com.study.product.service.IproductService;
import com.study.product.vo.ProductVO;
import com.study.product.vo.SaveCartVO;
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
    @Autowired
    IproductService iproductService;

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
        try {
            if (user == null) {
                return "redirect:/login/login.wow";
            }
            if ("MANAGER".equals(user.getRole()) && Id != null) {
                MemberVO member = memberService.getMember(Id);
                model.addAttribute("member", member);
                SaveCartVO userinfo = iproductService.viewUserInfo(member.getId());
                List<ProductVO> productinfo = iproductService.viewProductInfo(member.getId());
                model.addAttribute("userinfo", userinfo);
                model.addAttribute("productinfo", productinfo);
            } else {
                String userId = user.getId();
                MemberVO member = memberService.getMember(userId);
                model.addAttribute("member", member);
                SaveCartVO userinfo = iproductService.viewUserInfo(user.getId());
                List<ProductVO> productinfo = iproductService.viewProductInfo(user.getId());
                model.addAttribute("userinfo", userinfo);
                model.addAttribute("productinfo", productinfo);
            }
            return "member/memberView";
        } catch (BizNotFoundException e) {
            model.addAttribute("error", "에러");
            return "redirect:/login/login.wow";
        }
    }

    @GetMapping("/member/memberEdit.wow")
    public String memberEdit(@RequestParam(required = false) String Id, Model model, HttpSession session) throws BizException {
        UserVO user = (UserVO) session.getAttribute("user");
        try {
            if (user == null) {
                return "redirect:/login/login.wow";
            }
            if ("MANAGER".equals(user.getRole()) && Id != null) {
                MemberVO member = memberService.getMember(Id);
                model.addAttribute("member", member);
            } else {
                String userId = user.getId();
                MemberVO member = memberService.getMember(userId);
                model.addAttribute("member", member);
            }
            return "member/memberEdit";
        } catch (BizNotFoundException e) {
            return "redirect:/login/login.wow";
        }
    }


    @PostMapping("/member/memberModify.wow")
    public String memberModify(MemberVO member, Model model, HttpSession session, MultipartHttpServletRequest Request) throws Exception {
        ResultMessageVO resultMessageVO = new ResultMessageVO();
        String profile = FileUtil.modifyMember(Request);

        UserVO user = (UserVO) session.getAttribute("user");

        member.setProfile(profile);
        //member.setId(user.getId());

        memberService.modifyMember(member);  // 이름, 사는곳 등등 회원정보 변경하는 코드


        session.setAttribute("user", user);

        resultMessageVO.messageSetting(true, "수정", "회원정보가 수정되었습니다."
                , "/member/memberList.wow", "목록으로");
        model.addAttribute("resultMessageVO", resultMessageVO);
        return "redirect:/member/memberView.wow?Id="+ member.getId();
    }



    @PostMapping("/member/memberDelete.wow")
    public String memberDelete(Model model, MemberVO member) throws BizException {
        ResultMessageVO resultMessageVO = new ResultMessageVO();
        memberService.removeMember(member);
        resultMessageVO.messageSetting(true, "탈퇴", "회원탈퇴가 완료되었습니다."
                , "/member/memberList.wow", "탈퇴완료.");
        model.addAttribute("resultMessageVO", resultMessageVO);
        return "redirect:/member/memberList.wow";
    }


    @GetMapping("/member/memberForm.wow")
    public String memberForm() {
        return "member/memberForm";
    }


    @PostMapping("/member/memberRegist.wow")
    public String memberRegist(Model model, MemberVO member) throws BizNotEffectedException, BizDuplicateKeyException {
        ResultMessageVO resultMessageVO = new ResultMessageVO();
        memberService.registMember(member);
        resultMessageVO.messageSetting(true, "회원가입", "회원가입이 성공하였습니다."
                , "/member/memberRegist.wow", "로그인");
        model.addAttribute("resultMessageVO", resultMessageVO);
        return "common/message";
    }


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
    public String findId(String name, String email) {
        List<MemberVO> result = memberService.findId(name, email);
        return "/login/myId.wow";
    }

    @GetMapping("/login/myId.wow")
    public String myId() {
        return "redirect:/login/findId.wow";
    }


    @PostMapping("/login/myId.wow")
    public String myId(String name, String email, Model model) {

        List<MemberVO> result = memberService.findId(name, email);

        model.addAttribute("result", result);

        return "/login/myId";
    }

    @ResponseBody
    @RequestMapping(value = "/findId/emailCheck3", produces = "text/plain;charset=UTF-8")
    public String emailCheck3(String email, MemberVO member, Model model) throws MessagingException, BizException {
        if (memberService.findIdCheck(member) == 0) {
            model.addAttribute("msg", "이름 또는 이메일을 확인해주세요.");
            return "error";
        } else {
            memberService.findId(member.getName(), member.getEmail());
            model.addAttribute("member", member.getEmail());
            key = mailService.mailSend2(email);
            return key;
        }
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
    public String findPw(String email, HttpSession session, Model model) {
        UserVO user = (UserVO) session.getAttribute("user");

        if (user != null) {
            String Id = user.getId();
            MemberVO member = memberService.findPw(Id, email);
            if (member != null) {
                model.addAttribute("member", member);
                model.addAttribute("Id", Id);
                return "redirect:/login/changePw.wow";
            } else {
                return "redirect:/";
            }
        } else {
            return "redirect:/";
        }
    }


    @ResponseBody
    @RequestMapping(value = "/findPw/emailCheck5", produces = "text/plain;charset=UTF-8")
    public String emailCheck5(String email, MemberVO member, Model model) throws MessagingException, BizException {
        if (memberService.findPwCheck(member) == 0) {
            model.addAttribute("msg", "아이디와 이메일을 확인해주세요.");
            return "error";
        } else {
            memberService.findPw(member.getId(), member.getEmail());
            model.addAttribute("member", member.getEmail());
            key = mailService.mailSend3(email);
            return key;
        }
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

        session.setAttribute("member", member);
        session.setAttribute("confirm", true);

        resultMessageVO.setMessage("인증완료");
        resultMessageVO.setUrl("/login/changePw.wow");

        return resultMessageVO;
    }


    @GetMapping("/login/changePw.wow")
    public String changeMePw(Model model, HttpSession session) {
        MemberVO member = (MemberVO) session.getAttribute("member");
        Boolean confirm = (Boolean) session.getAttribute("confirm");

        if (confirm == null || !confirm) {
            return "redirect:/login/findPw.wow";
        }

        model.addAttribute("member", member);

        return "login/changePw";
    }


    @PostMapping("/login/changePw.wow")
    public String changePw(Model model, HttpSession session, MemberVO member) throws BizException {
        ResultMessageVO resultMessageVO = new ResultMessageVO();
        MemberVO user = (MemberVO) session.getAttribute("member");
        member.setId(user.getId());
        memberService.changePw(member);

        session.setAttribute("member", user);

        resultMessageVO.messageSetting(true, "수정", "비밀번호가 변경되었습니다."
                , "/login/login.wow", "로그인");
        model.addAttribute("resultMessageVO", resultMessageVO);
        return "common/message";
    }
}