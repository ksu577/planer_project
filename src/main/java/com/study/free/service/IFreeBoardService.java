package com.study.free.service;

import java.util.List;

import com.study.common.vo.PagingVO;
import com.study.common.vo.SearchVO;
import com.study.exception.BizNotEffectedException;
import com.study.exception.BizNotFoundException;
import com.study.exception.BizPasswordNotMatchedException;
import com.study.free.vo.FreeBoardVO;

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

    public int increaseLike(int freeNum) throws BizNotFoundException;

    public void registBoard(FreeBoardVO freeBoard) throws BizNotEffectedException;
}