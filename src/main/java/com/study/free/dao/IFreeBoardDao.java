package com.study.free.dao;

import com.study.common.vo.PagingVO;
import com.study.free.vo.FreeBoardVO;
import org.apache.ibatis.annotations.Mapper;
import java.util.List;

@Mapper
public interface IFreeBoardDao {

    public  int getTotalRowCount(PagingVO paging);
    public List<FreeBoardVO> getBoardList(PagingVO paging);
    public FreeBoardVO getBoard(int freeNum);
    public int increaseLike();
    public int updateBoard();
    public int deleteBoard();
    public int insertBoard();

}