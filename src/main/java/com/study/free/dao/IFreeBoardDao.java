package com.study.free.dao;

import com.study.free.vo.FreeBoardVO;
import org.apache.ibatis.annotations.Mapper;
import java.util.List;

@Mapper
public interface IFreeBoardDao {

    public  int getTotalRowCount();
    public List<FreeBoardVO> getBoardList();
    public FreeBoardVO getBoard(int freeNum);
    public int increaseLike(int freeNum);
    public int updateBoard(FreeBoardVO freeBoardVO);
    public int deleteBoard(FreeBoardVO freeBoardVO);
    public int insertBoard(FreeBoardVO freeBoardVO);

}