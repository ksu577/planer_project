package com.study.comment.service;

import com.study.comment.dao.ICommentDao;
import com.study.comment.vo.CommentVO;
import com.study.common.vo.PagingVO;
import com.study.exception.BizAccessFailException;
import com.study.exception.BizNotFoundException;
import com.study.login.vo.UserVO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Service
public class CommentServiceImpl implements ICommentService {
    private static final Logger logger = LoggerFactory.getLogger(CommentServiceImpl.class);
    @Autowired
    private ICommentDao commentDao;

    @Autowired
    private HttpSession session;
    @Autowired
    private HttpServletRequest request;


    @Override
    public List<CommentVO> getCommentListByParent(PagingVO paging, int freeNum) {
        logger.info("getCommnetListByParent method called."); // 로그 추가

        int totalRowCount = commentDao.getCommentCountByParent(freeNum);
        paging.setTotalRowCount(totalRowCount);
        paging.pageSetting();
        List<CommentVO> commentList = commentDao.getCommentListByParent(freeNum);

        return commentList;
    }

    @Override
    public void modifyComment(CommentVO comment) throws BizNotFoundException, BizAccessFailException {
        HttpSession session = request.getSession();
        UserVO user = (UserVO) session.getAttribute("user");

        if (user == null) {
            throw new BizAccessFailException("로그인이 필요합니다.");
        }
        CommentVO commentFromDB= commentDao.getComment(comment.getFreeBoardCommentNumber());
        if (commentFromDB == null){
            throw new BizNotFoundException();
        }
        if (!"MANAGER".equals(user.getRole()) && !commentFromDB.getId().equals(user.getId())){
            throw new BizAccessFailException("글쓴이가 아닙니다.");
        }
//        CommentVO commentFromDB = commentDao.getComment(comment.getFreeBoardCommentNumber());
//        if (! comment.getId().equals(commentFromDB.getId())){
//            throw new BizAccessFailException("글쓴이가 아닙니다.");
//        }
        commentDao.updateComment(comment);
    }

    @Override
    public void removeComment(CommentVO comment) throws BizNotFoundException, BizAccessFailException {
//        CommentVO commentFromDB = commentDao.getComment(comment.getFreeBoardCommentNumber());
//        if (! comment.getId().equals(commentFromDB.getId())){
//            throw new BizAccessFailException("글쓴이가 아닙니다.");
//        }
        UserVO user = (UserVO) session.getAttribute("user");
        if (user == null){
            throw new BizAccessFailException("로그인이 필요합니다.");
        }
        CommentVO commentFromDB = commentDao.getComment(comment.getFreeBoardCommentNumber());
        if (commentFromDB == null){
            throw new BizNotFoundException("댓글을 찾을 수 없습니다.");
        }
        if (!"MANAGER".equals(user.getRole()) &&!commentFromDB.getId().equals(user.getId())){
            throw new BizAccessFailException("글쓴이가 아닙니다.");
        }
        commentDao.deleteComment(comment);

    }

    @Override
    public void registComment(CommentVO comment) {

        logger.info("Registering comment: {}", comment);

        commentDao.insertComment(comment);

    }
}