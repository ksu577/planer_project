package com.study.free.web;

import java.io.IOException;
import java.nio.file.AccessDeniedException;
import java.util.List;


import com.study.attach.vo.AttachVO;
import com.study.code.service.ICommCodeService;
import com.study.code.vo.CodeVO;
import com.study.comment.service.ICommentService;
import com.study.common.util.StudyAttachUtils;
import com.study.common.vo.PagingVO;
import com.study.common.vo.ResultMessageVO;
import com.study.common.vo.SearchVO;
import com.study.exception.BizException;
import com.study.exception.BizNotEffectedException;
import com.study.exception.BizNotFoundException;
import com.study.exception.BizPasswordNotMatchedException;
import com.study.free.service.IFreeBoardService;
import com.study.login.vo.UserVO;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Element;
import org.jsoup.nodes.Document;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.util.StringUtils;

import com.study.free.vo.FreeBoardVO;
import org.springframework.web.multipart.MultipartFile;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

@Controller
public class NoticeController {
    @Inject
    private ICommentService commentService;

    @Autowired
    ICommCodeService codeService;
    @Autowired
    IFreeBoardService freeBoardService;

    @Autowired
    private StudyAttachUtils attachUtils;

    @ExceptionHandler(value = {BizNotFoundException.class
            , BizNotEffectedException.class
            , BizPasswordNotMatchedException.class, BizException.class})
    public String exception(Model model, BizException e) {
        e.printStackTrace();
        ResultMessageVO resultMessageVO = new ResultMessageVO();
        resultMessageVO.messageSetting(false, "에러", "아무튼에러", "/", "홈으로만갑니다");
        model.addAttribute("resultMessageVO", resultMessageVO);
        return "common/meesage";
    }

    @GetMapping("/free/noticeList.wow")
    public String freeList(Model model
            , @ModelAttribute("paging") PagingVO paging
            , @ModelAttribute("searchVO") SearchVO search
            , @ModelAttribute("searchCategory") String searchCategory) {
        List<CodeVO> cateList = codeService.getCodeListByParent("BC00");
        model.addAttribute("cateList", cateList);
        List<FreeBoardVO> freeBoardList = freeBoardService.getBoardList(paging, search, searchCategory);

        model.addAttribute("freeBoardList", freeBoardList);
        return "free/noticeList";
    }
}
