package com.study.free.service;

import java.util.List;


import com.study.attach.dao.IAttachDao;
import com.study.attach.vo.AttachVO;
import com.study.common.vo.PagingVO;
import com.study.common.vo.SearchVO;
import com.study.exception.BizNotEffectedException;
import com.study.exception.BizNotFoundException;
import com.study.exception.BizPasswordNotMatchedException;
import com.study.free.dao.IFreeBoardDao;
import com.study.free.vo.FreeBoardVO;
import com.study.login.vo.UserVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Service
public class FreeBoardServiceImpl implements IFreeBoardService {

    @Autowired
    IFreeBoardDao freeBoardDao;

    @Autowired
    IAttachDao attachDao;

    @Autowired
    private HttpServletRequest request;

    @Override
    public List<FreeBoardVO> getBoardList(PagingVO paging, SearchVO search, String searchCategory) {
        int totalRowCount = freeBoardDao.getTotalRowCount(paging, search, searchCategory);
        paging.setTotalRowCount(totalRowCount);
        paging.pageSetting();


        List<FreeBoardVO> freeBoardList = freeBoardDao.getBoardList(paging, search, searchCategory);
        return freeBoardList;
    }


    @Override
    public FreeBoardVO getBoard(int freeNum) throws BizNotFoundException {
        FreeBoardVO freeBoard = freeBoardDao.getBoard(freeNum);
        if (freeBoard == null) {
            throw new BizNotFoundException();
        }
        //reslutMap을 통해 이미 freeBoard에는 attaches가 세팅되어있다.
        //List<AttachVO> attaches = attachDao.getAttachListByParent("FREE",freeBoard.getFreeNum());
        //freeBoard.setAttaches(attaches);
        return freeBoard;
    }


    @Override
    public void increaseHit(int freeNum) throws BizNotEffectedException {

        int cnt = freeBoardDao.increaseView(freeNum); // update된 행 수가 return 됨
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

        HttpSession session = request.getSession();
        UserVO sessiongUserId = (UserVO) session.getAttribute("user");

        if (!vo.getId().equals(sessiongUserId.getId()) && !"MANAGER".equals(sessiongUserId.getRole()))
            throw new BizPasswordNotMatchedException();

        int cnt = freeBoardDao.updateBoard(freeBoard);
        if (cnt == 0)
            throw new BizNotEffectedException();
        //추가된 첨부파일 DB에 넣는건 regist랑 똑같이...
        List<AttachVO> attaches = freeBoard.getAttaches();
        if (attaches != null) {
            for (AttachVO attach : attaches) {
                attach.setAtchParentNo(freeBoard.getFreeNum());
                attachDao.insertAttach(attach);
            }
        }
        //휴지통버튼에 의해 삭제될 첨부파일들을 처리해야함
        int[] delAtchNos = freeBoard.getDelAtchNos();
        if (delAtchNos != null && delAtchNos.length > 0) {
            attachDao.delAtchNos(delAtchNos);
        }
    }


    @Override
    public void removeBoard(FreeBoardVO freeBoard)
            throws BizNotFoundException, BizNotEffectedException {
        FreeBoardVO vo = freeBoardDao.getBoard(freeBoard.getFreeNum());
        if (vo == null)
            throw new BizNotFoundException();

        int cnt = freeBoardDao.deleteBoard(freeBoard);
        if (cnt == 0)
            throw new BizNotEffectedException();

    }

    @Override
    public int increaseView(int freeNum) throws BizNotFoundException {
        if (freeBoardDao.getBoard(freeNum) == null) {
            throw new BizNotFoundException("해당하는 게시글이 존재하지 않습니다.");
        }

        // 게시글이 존재하면 좋아요를 증가시킵니다.
        return freeBoardDao.increaseView(freeNum);
    }

    @Override
    public int increaseLike(int freeNum) throws BizNotFoundException {
        return 0;
    }


    @Override
    public void registBoard(FreeBoardVO freeBoard) throws BizNotEffectedException {
        HttpSession session = request.getSession();
        UserVO user = (UserVO) session.getAttribute("user");

        int cnt;

        if (user != null && "MANAGER".equals(user.getRole())){
            freeBoard.setTitle("[공지]"+freeBoard.getTitle());
            cnt = freeBoardDao.insertBoard(freeBoard);
        }else {
            cnt = freeBoardDao.insertBoard(freeBoard);
        }

        if (cnt == 0) {
            throw new BizNotEffectedException();
        }

//        int cnt = freeBoardDao.insertBoard(freeBoard);
//        if (cnt == 0)
//            throw new BizNotEffectedException();

        List<AttachVO> attaches = freeBoard.getAttaches();
        if (attaches != null) {
            for (AttachVO attach : attaches) {
                attach.setAtchParentNo(freeBoard.getFreeNum());
                attachDao.insertAttach(attach);
            }
        }
    }
}


