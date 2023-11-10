package com.study.member.web;

import com.study.common.vo.PagingVO;
import com.study.common.vo.ResultMessageVO;
import com.study.common.vo.SearchVO;
import com.study.exception.*;
import com.study.member.dao.IMemberDao;
import com.study.member.service.IMemberService;
import com.study.member.vo.MemberVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
public class MemberController {

    @Autowired
    IMemberService memberService;

    @ExceptionHandler(value = {BizNotFoundException.class, BizNotEffectedException.class, BizPasswordNotMatchedException.class, BizException.class})
    public String exception(Model model, BizException e) {
        e.printStackTrace();
        ResultMessageVO resultMessageVO = new ResultMessageVO();
        resultMessageVO.messageSetting(false, "에러", "에러", "/", "홈으로 갑니다.");
        model.addAttribute("resultMessageVO", resultMessageVO);
        return "common/message";
    }

    @RequestMapping("/member/memberList.wow")
    public String memberList(Model model, @ModelAttribute("paging") PagingVO paging, @ModelAttribute("search") SearchVO search, @ModelAttribute("searchId") String searchId) {
        List<MemberVO> memberList = memberService.getMemberList(paging, search);
        model.addAttribute("memberList", memberList);
        return "member/memberList";
    }


    @GetMapping("/member/memberView.wow")
    public String memberView(Model model, @RequestParam(name = "Id") String Id) throws BizException {
        MemberVO member = memberService.getMember(Id);
        model.addAttribute("member", member);
        return "member/memberView";
    }


    @GetMapping("/member/memberEdit.wow")
    public String memberEdit(Model model, String Id) throws BizException {
        MemberVO member = memberService.getMember(Id);
        model.addAttribute("member", member);
        return "member/memberEdit";
    }


    @PostMapping("/member/memberModify.wow")
    public String memberModify(Model model, MemberVO member) throws BizException {
        ResultMessageVO resultMessageVO = new ResultMessageVO();
        memberService.modifyMember(member);
        resultMessageVO.messageSetting(true, "수정", "수정 되었습니다."
                , "/member/memberList.wow", "목록으로");
        model.addAttribute("resultMessageVO",resultMessageVO);
        return "common/message";
    }



    @PostMapping("/member/memberDelete.wow")
    public String delete(Model model, MemberVO member) throws BizException {
        ResultMessageVO resultMessageVO = new ResultMessageVO();
        memberService.removeMember(member);
        resultMessageVO.messageSetting(true, "탈퇴", "회원탈퇴 되었습니다."
                , "/member/memberList.wow", "탈퇴완료.");
        return "common/message";
    }


    @GetMapping("/member/memberForm.wow")
    public String memberForm(Model model) {
        return "member/memberForm";
    }


    @PostMapping("/member/memberRegist.wow")
    public String memberRegist(Model model,MemberVO member) throws BizNotEffectedException, BizDuplicateKeyException {
        ResultMessageVO resultMessageVO=new ResultMessageVO();
        memberService.registMember(member);
        resultMessageVO.messageSetting(true,"등록","회원가입 되었습니다."
                ,"/member/memberList.wow" , "목록으로");
        model.addAttribute("resultMessageVO",resultMessageVO);
        return "common/message";
    }
}