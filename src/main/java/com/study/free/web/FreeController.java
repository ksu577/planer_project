package com.study.free.web;

import java.io.IOException;
import java.util.List;

import javax.inject.Inject;

import com.study.attach.vo.AttachVO;
import com.study.code.service.ICommCodeService;
import com.study.code.vo.CodeVO;
import com.study.common.util.StudyAttachUtils;
import com.study.common.vo.PagingVO;
import com.study.common.vo.ResultMessageVO;
import com.study.common.vo.SearchVO;
import com.study.exception.BizException;
import com.study.exception.BizNotEffectedException;
import com.study.exception.BizNotFoundException;
import com.study.exception.BizPasswordNotMatchedException;
import com.study.free.dao.IFreeBoardDao;
import com.study.free.service.IFreeBoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.study.free.vo.FreeBoardVO;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class FreeController {

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

    @RequestMapping("/free/freeList.wow")
    public String freeList(Model model
            , @ModelAttribute("paging") PagingVO paging
            , @ModelAttribute("searchVO") SearchVO search
            , @ModelAttribute("searchCategory") String searchCategory) {
        List<CodeVO> cateList = codeService.getCodeListByParent("BC00");
        model.addAttribute("cateList", cateList);
        List<FreeBoardVO> freeBoardList = freeBoardService.getBoardList(paging, search, searchCategory);
        model.addAttribute("freeBoardList", freeBoardList);
        return "free/freeList";
    }

    @RequestMapping(method = RequestMethod.GET, value = "/free/freeView.wow")
    public String freeView(Model model,
                           @RequestParam(name = "freeNum") int freeNum) throws BizNotFoundException, BizNotEffectedException {

        FreeBoardVO freeBoard = freeBoardService.getBoard(freeNum);
        model.addAttribute("freeBoard", freeBoard);
        freeBoardService.increaseHit(freeNum);
        return "free/freeView";
    }

    @GetMapping("/free/freeEdit.wow")
    public String freeEdit(Model model, int freeNum) throws BizNotFoundException {
        FreeBoardVO freeBoard = freeBoardService.getBoard(freeNum);
        model.addAttribute("freeBoard", freeBoard);
        return "free/freeEdit";
    }

    @PostMapping("/free/freeModify.wow")
    public String freeModify(Model model, FreeBoardVO freeBoard, @RequestParam(name = "boFiles", required = false) MultipartFile[] boFiles) throws BizNotFoundException, BizPasswordNotMatchedException, BizNotEffectedException, IOException {
        System.out.println(boFiles);
        if (boFiles != null) {
            List<AttachVO> attaches = attachUtils.getAttachListByMultiparts(boFiles, "FREE", "free");
            freeBoard.setAttaches(attaches);
        }

        //form이랑 다른거는 휴지통버튼을 통해 삭제해야 할 첨부파일 번호들도 날라왔는데
        //그거는 servier에서 처리해줌
        freeBoardService.modifyBoard(freeBoard);
        ResultMessageVO resultMessageVO = new ResultMessageVO();
        resultMessageVO.messageSetting(true, "수정", "수정성공", "/free/freeList.wow", "목록으로");

        model.addAttribute("resultMessageVO", resultMessageVO);
        return "common/message";
    }

    @PostMapping("/free/freeDelete.wow")
    public String freeDelete(Model model, @ModelAttribute("freeBoard") FreeBoardVO freeBoard)throws BizException {
        ResultMessageVO resultMessageVO = new ResultMessageVO();

        freeBoardService.removeBoard(freeBoard);
        resultMessageVO.messageSetting(true, "삭제", "삭제성공", "/free/freeList.wow", "목록으로");

        model.addAttribute("resultMessageVO", resultMessageVO);
        return "common/message";
    }


    @GetMapping("/free/freeForm.wow")
    public String freeForm(Model model) {
        return "free/freeForm";
    }

    @PostMapping("/free/freeRegist.wow")
    public String freeRegist(Model model, FreeBoardVO freeBoard, @RequestParam(name = "boFiles" ,required = false) MultipartFile[] boFiles) throws BizException, IOException {
        if (boFiles != null) {

            List<AttachVO> attaches = attachUtils.getAttachListByMultiparts(boFiles, "FREE", "free");
            freeBoard.setAttaches(attaches);
        }

        ResultMessageVO resultMessageVO = new ResultMessageVO();
        freeBoardService.registBoard(freeBoard);
        resultMessageVO.messageSetting(true, "등록", "등록성공", "/free/freeList.wow", "목록으로");

        model.addAttribute("resultMessageVO", resultMessageVO);
        return "common/message";
    }


}