package com.study.free.dao;

import com.study.free.vo.FreeBoardVO;
import org.apache.ibatis.annotations.Mapper;
import java.util.List;

@Mapper
public interface IFreeBoardDao {

    public  int getTotalRowCount();
    public List<FreeBoardVO> getBoardList();
    public FreeBoardVO getBoard(freeN);
    public int increaseLike();
    public int updateBoard();
    public int deleteBoard();
    public int insertBoard();

}