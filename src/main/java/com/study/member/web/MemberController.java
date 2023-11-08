package com.study.member.web;

import com.study.common.vo.PagingVO;
import com.study.common.vo.SearchVO;
import com.study.exception.BizException;
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

    @RequestMapping("/member/memberList.wow")
    public String memberList(Model model, @ModelAttribute("paging") PagingVO paging, @ModelAttribute("search") SearchVO search) {
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
        memberService.modifyMember(member);
        return "member/memberModify";

        // 만약 오류나면 Modify, delete, Regist.jsp 를 생성후
        // MemberVO member = memberService.getMember(Id);
        // model.addAttribute("member", member);
        // return "member/memberModify" 로 대체 할것.
    }



    @PostMapping("/member/memberDelete.wow")
    public String delete(Model model, MemberVO member) throws BizException {
        memberService.removeMember(member);
        return "member/memberDelete";
    }


    @GetMapping("/member/memberForm.wow")
    public String memberForm(Model model) {
        return "member/memberForm";
    }


    @PostMapping("/member/memberRegist.wow")
    public String memberRegist(Model model, MemberVO member) throws BizException {
        memberService.registMember(member);
        return "member/memberRegist";
    }
}