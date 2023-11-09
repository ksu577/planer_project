package com.study.free.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;


import com.study.attach.dao.IAttachDao;
import com.study.attach.vo.AttachVO;
import com.study.common.vo.PagingVO;
import com.study.common.vo.SearchVO;
import com.study.exception.BizNotEffectedException;
import com.study.exception.BizNotFoundException;
import com.study.exception.BizPasswordNotMatchedException;
import com.study.exception.DaoException;
import com.study.free.dao.IFreeBoardDao;
import com.study.free.vo.FreeBoardVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.inject.Inject;

@Service
public class FreeBoardServiceImpl implements IFreeBoardService {

    @Autowired
    IFreeBoardDao freeBoardDao;

    @Autowired
    IAttachDao attachDao;

    @Override
    public List<FreeBoardVO> getBoardList(PagingVO paging, SearchVO search, String searchCategory) {
        int totalRowCount = freeBoardDao.getTotalRowCount(paging,search,searchCategory);
        paging.setTotalRowCount(totalRowCount);
        paging.pageSetting();

        List<FreeBoardVO> freeBoardList = freeBoardDao.getBoardList(paging,search,searchCategory);
        return freeBoardList;
    }


    @Override
    public FreeBoardVO getBoard(int freeNum) throws BizNotFoundException {
        FreeBoardVO freeBoard = freeBoardDao.getBoard(freeNum);
        if (freeBoard == null) {
            throw new BizNotFoundException();
        }
        return freeBoard;
    }


    @Override
    public void increaseHit(int freeNum) throws BizNotEffectedException {

        int cnt = freeBoardDao.increaseLike(freeNum); // update된 행 수가 return 됨
        if (cnt == 0) { // 업데이트가 제대로 안됬다.. 근데 사실 일어날수가 없는 일인데..
            throw new BizNotEffectedException();
        }

    }

    @Override
    public void modifyBoard(FreeBoardVO freeBoard)
            throws BizNotFoundException, BizPasswordNotMatchedException, BizNotEffectedException {

        FreeBoardVO vo = freeBoardDao.getBoard(freeBoard.getFreeNum());
        // vo는 DB에 있는 데이터
        if (vo == null)
            throw new BizNotFoundException();
//        if (freeBoard.getBoPass().equals(vo.getBoPass())) {

            int cnt = freeBoardDao.updateBoard(freeBoard);
            if (cnt == 0)
                throw new BizNotEffectedException();
//        } else {
//            throw new BizPasswordNotMatchedException();
//        }
    }


    @Override
    public void removeBoard(FreeBoardVO freeBoard)
            throws BizNotFoundException, BizPasswordNotMatchedException, BizNotEffectedException {
        FreeBoardVO vo = freeBoardDao.getBoard(freeBoard.getFreeNum());
        if (vo == null)
            throw new BizNotFoundException();
//        if (freeBoard.getBoPass().equals(vo.getBoPass())) {
            int cnt = freeBoardDao.deleteBoard(freeBoard);
            if (cnt == 0)
                throw new BizNotEffectedException();
//        } else {
//            throw new BizPasswordNotMatchedException();
//        }
    }


    @Override
    public void registBoard(FreeBoardVO freeBoard) throws BizNotEffectedException {

        int cnt = freeBoardDao.insertBoard(freeBoard);
        if (cnt == 0)
            throw new BizNotEffectedException();

        List<AttachVO> attaches = freeBoard.getAttaches();
        if (attaches != null){
            for (AttachVO attach : attaches){
                attach.setAtchParentNo(freeBoard.getFreeNum());
                attachDao.insertAttach(attach);
            }
        }
    }
}


