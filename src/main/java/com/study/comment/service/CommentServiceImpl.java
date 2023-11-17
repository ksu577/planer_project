package com.study.comment.service;

import com.study.comment.dao.ICommentDao;
import com.study.comment.vo.CommentVO;
import com.study.common.vo.PagingVO;
import com.study.exception.BizAccessFailException;
import com.study.exception.BizNotFoundException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CommentServiceImpl implements ICommentService {
    private static final Logger logger = LoggerFactory.getLogger(CommentServiceImpl.class);
    @Autowired
    private ICommentDao commentDao;

    @Override
    public List<CommentVO> getCommentListByParent(PagingVO paging, int freeNum) {
        logger.info("getCommnetListByParent method called."); // 로그 추가

        int totalRowCount = commentDao.getCommentCountByParent(paging, freeNum);
        paging.setTotalRowCount(totalRowCount);
        paging.pageSetting();
        List<CommentVO> commentList = commentDao.getCommentListByParent(paging, freeNum);

        return commentList;
    }

    @Override
    public void modifyComment(CommentVO comment) throws BizNotFoundException, BizAccessFailException {
        CommentVO commentFromDB = commentDao.getComment(comment.getFreeBoardCommentNumber());
        if (! comment.getId().equals(commentFromDB.getId())){
            throw new BizAccessFailException("글쓴이가 아닙니다.");
        }
        commentDao.updateComment(comment);
    }

    @Override
    public void removeComment(CommentVO comment) throws BizNotFoundException, BizAccessFailException {
        CommentVO commentFromDB = commentDao.getComment(comment.getFreeBoardCommentNumber());
        if (! comment.getId().equals(commentFromDB.getId())){
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