package com.study.comment.web;

import com.study.comment.service.ICommentService;
import com.study.comment.vo.CommentVO;
import com.study.common.vo.PagingVO;
import com.study.exception.BizAccessFailException;
import com.study.exception.BizNotFoundException;
import com.study.login.vo.UserVO;
import org.apache.commons.logging.Log;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
public class CommentController {
    @Autowired
    private ICommentService commentService;
    private static final Logger logger = LoggerFactory.getLogger(CommentController.class);

    @RequestMapping(value = "/comment/commentList.wow")
    public Map<String, Object> commentList(PagingVO paging, Integer freeNum) {
        Map<String, Object> map = new HashMap<>();
        logger.info("commentList method called."); //

        if (freeNum == null){
            freeNum = 0;
        }

        List<CommentVO> commentList = commentService.getCommnetListByParent(paging, freeNum);
        map.put("size", commentList.size());
        map.put("data", commentList);

        return map;
    }


    @RequestMapping(value = "/comment/commentRegist.wow")
    public Map<String, Object> commentRgist(CommentVO comment,@RequestParam int freeNum, HttpServletRequest request) {
        Map<String, Object> map = new HashMap<>();

        HttpSession session = request.getSession();
        UserVO loginUser = (UserVO) session.getAttribute("user");




        comment.setId(loginUser.getId());


        commentService.registComment(comment);
        map.put("msg","등록 성공");
        return map;
    }

    @RequestMapping(value = "comment/commentModify.wow")
    public Map<String, Object> commentModify(CommentVO comment) throws BizNotFoundException, BizAccessFailException {
        Map<String, Object> map = new HashMap<>();
        commentService.modifyComment(comment);
        map.put("msg", "수정성공");
        return map;
    }

    @RequestMapping(value = "comment/commentDelete.wow")
    public Map<String, Object> commentDelte(CommentVO comment) throws BizNotFoundException, BizAccessFailException {
        Map<String, Object> map = new HashMap<>();
        commentService.removeComment(comment);
        map.put("msg", "수정성공");
        return map;
    }
}
