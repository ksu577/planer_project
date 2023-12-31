package com.study.free.service;

import java.util.List;

import com.study.common.vo.PagingVO;
import com.study.common.vo.SearchVO;
import com.study.exception.BizNotEffectedException;
import com.study.exception.BizNotFoundException;
import com.study.exception.BizPasswordNotMatchedException;
import com.study.free.vo.FreeBoardVO;

import javax.servlet.http.HttpSession;

public interface IFreeBoardService {

    public List<FreeBoardVO>
    getBoardList(PagingVO paging
            , SearchVO search, String searchCategory);

    public FreeBoardVO getBoard(int freeNum) throws BizNotFoundException;

    public void increaseHit(int freeNum) throws BizNotEffectedException;

    public void modifyBoard(FreeBoardVO freeBoard)
            throws BizNotFoundException, BizPasswordNotMatchedException, BizNotEffectedException;

    public void removeBoard(FreeBoardVO freeBoard)
            throws BizNotFoundException, BizPasswordNotMatchedException, BizNotEffectedException;

    public int increaseView(int freeNum) throws BizNotFoundException;

    public int updateLikeCount(int freeLike) throws BizNotEffectedException;

    public void registBoard(FreeBoardVO freeBoard) throws BizNotEffectedException;

    public void updateCommentCount(int free_num) throws Exception;

}