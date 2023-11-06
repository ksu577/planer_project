package com.study.free.dao;

import com.study.free.vo.FreeBoardVO;
import org.apache.ibatis.annotations.Mapper;
import java.util.List;

@Mapper
public interface IFreeBoardDao {
    public List<FreeBoardVO> getBoardList();
    public FreeBoardVO getBoard(int freeNum);
    public int updateBoard(FreeBoardVO freeBoard);
    public int deleteBoard(FreeBoardVO freeBoard);
    public int insertBoard(FreeBoardVO freeBoard);

}