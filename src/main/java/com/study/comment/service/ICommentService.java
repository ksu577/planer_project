package com.study.comment.service;

import com.study.comment.vo.CommentVO;
import com.study.common.vo.PagingVO;
import com.study.exception.BizAccessFailException;
import com.study.exception.BizNotFoundException;

import java.util.List;

public interface ICommentService {
    /** 댓글 목록 조회 <br>
     * <b>필수 : reCategory, reParentNo </b>
     */
    public List<CommentVO> getCommentListByParent(PagingVO paging, int freeNum);


    public void modifyComment(CommentVO comment) throws BizNotFoundException, BizAccessFailException;

    public void removeComment(CommentVO comment) throws BizNotFoundException, BizAccessFailException;

    public void registComment(CommentVO comment);
}
