package com.study.plan.web;

import com.study.login.vo.UserVO;
import com.study.member.service.IMemberService;
import com.study.member.vo.MemberVO;
import com.study.plan.service.IPlanService;
import com.study.plan.service.ITourService;
import com.study.plan.service.ShareService;
import com.study.plan.vo.ShareVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import javax.servlet.http.HttpSession;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.List;

@Controller
public class ShareController {

    @Autowired
    IPlanService planService;

    @Autowired
    ITourService tourService;

    @Autowired
    ShareService shareService;

    @Autowired
    IMemberService memberService;


    @PostMapping("/share/plan")
    public String planShare(@ModelAttribute ShareVO shareVO, HttpSession session) throws UnsupportedEncodingException {
        UserVO user = (UserVO) session.getAttribute("user");

        String receivedId = user.getId();
        shareVO.setId(receivedId);

        String share = shareVO.getShareId();

        List<MemberVO> memberVOList = memberService.getMemberList();

        boolean isContains = false;

        String result = "redirect:/";

        for (MemberVO m : memberVOList) {

            isContains = share.equals(m.getId());

            if (isContains) {
                shareService.sharePlan(shareVO);
                result = "redirect:/plan/marker.wow?planTitle=" + URLEncoder.encode(shareVO.getPlanTitle(), "UTF-8");
                break;
            }
        }
        return result;
    }
}