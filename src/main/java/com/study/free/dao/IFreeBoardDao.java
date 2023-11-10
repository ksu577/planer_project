package com.study.free.dao;

import com.study.common.vo.PagingVO;
import com.study.common.vo.SearchVO;
import com.study.free.vo.FreeBoardVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface IFreeBoardDao {

    public  int getTotalRowCount(@Param("paging") PagingVO paging
            , @Param("search") SearchVO search, @Param("searchCategory") String searchCategory);
    public List<FreeBoardVO> getBoardList(@Param("paging") PagingVO paging
            , @Param("search") SearchVO search, @Param("searchCategory") String searchCategory);
    public FreeBoardVO getBoard(int freeNum);
    public int increaseLike(int freeNum);
    public int updateBoard(FreeBoardVO freeBoard);
    public int deleteBoard(FreeBoardVO freeBoard);
    public int insertBoard(FreeBoardVO freeBoard);

}