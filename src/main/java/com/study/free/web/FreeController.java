package com.study.free.web;

import java.io.IOException;
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
public class FreeController {
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

    @GetMapping("/free/freeList.wow")
    public String freeList(Model model
            , @ModelAttribute("paging") PagingVO paging
            , @ModelAttribute("searchVO") SearchVO search
            , @ModelAttribute("searchCategory") String searchCategory) {
        List<CodeVO> cateList = codeService.getCodeListByParent("BC00");
        model.addAttribute("cateList", cateList);
        List<FreeBoardVO> freeBoardList = freeBoardService.getBoardList(paging, search, searchCategory);

        for (FreeBoardVO freeBoardEntity : freeBoardList){
            String context = freeBoardEntity.getFreeContext();
            Document doc = Jsoup.parse(context);
            Element imgElement = doc.selectFirst("img");
            if (imgElement !=null){
                String src = imgElement.attr("src");
                freeBoardEntity.setThumbnailImagePath(src);

                String thumbnailFileName = getThumbnailFileName(src);
                freeBoardEntity.setThumbnailImagePath(thumbnailFileName);
            }
        }
        model.addAttribute("freeBoardList", freeBoardList);
        return "free/freeList";
    }
    // 이미지 파일명에서 썸네일 이미지 파일명으로 변경하는 메소드
    private String getThumbnailFileName(String originalFileName) {
        // 파일 확장자 추출
        String fileExtension = StringUtils.getFilenameExtension(originalFileName);
        // 파일 이름에서 확장자 제외한 부분 추출
        String fileNameWithoutExtension = StringUtils.stripFilenameExtension(originalFileName);

        // 썸네일 이미지 파일명 생성 (예: "원래파일명_thumb.확장자")
        return fileNameWithoutExtension + "_thumb." + fileExtension;
    }

    @RequestMapping(method = RequestMethod.GET, value = "/free/freeView.wow")
    public String freeView(Model model,
                           HttpSession session,
                           @RequestParam(name = "freeNum") int freeNum) throws BizNotFoundException, BizNotEffectedException {
        FreeBoardVO freeBoard = freeBoardService.getBoard(freeNum);
        if(freeBoard != null){
            UserVO loginUser = (UserVO) session.getAttribute("user");

            boolean canEdit = loginUser != null && (loginUser.getId().equals(freeBoard.getId()) || loginUser.getRole().equals("MANAGER"));

            model.addAttribute("freeBoard", freeBoard);
            model.addAttribute("canEdit", canEdit);

            freeBoardService.increaseHit(freeNum);
            return "free/freeView";
        }
        return "redirect:/";
    }

    @GetMapping("/free/freeEdit.wow")
    public String freeEdit(Model model, HttpSession session ,int freeNum) throws BizNotFoundException {

        if (session.getAttribute("user") == null){
            return "redirect:/login/login.wow";
        }
        FreeBoardVO freeBoard = freeBoardService.getBoard(freeNum);
        model.addAttribute("freeBoard", freeBoard);
        return "free/freeEdit";
    }

    @PostMapping("/free/freeModify.wow")
    public String freeModify(Model model, HttpSession session ,FreeBoardVO freeBoard, @RequestParam(name = "boFiles", required = false) MultipartFile[] boFiles) throws BizNotFoundException, BizPasswordNotMatchedException, BizNotEffectedException, IOException {

        if (session.getAttribute("user") == null){
            return "redirect:/login/login.wow";
        }

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
    public String delete(Model model, FreeBoardVO freeBoard) throws BizException {
        ResultMessageVO resultMessageVO = new ResultMessageVO();

        model.addAttribute("freeBoard",freeBoard);

        freeBoardService.removeBoard(freeBoard);
        resultMessageVO.messageSetting(true, "삭제", "삭제성공", "/free/freeList.wow", "목록으로");

        model.addAttribute("resultMessageVO", resultMessageVO);
        return "common/message";
    }


    @GetMapping("/free/freeForm.wow")
    public String freeForm(Model model, HttpSession session) {

        if (session.getAttribute("user")==null){
            return "redirect:/login/login.wow";
        }

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