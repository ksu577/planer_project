package com.study.comment.dao;

import com.study.comment.vo.CommentVO;
import com.study.common.vo.PagingVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.List;

@Mapper
public interface ICommentDao {
    Logger logger = LoggerFactory.getLogger(ICommentDao.class);

    public int getCommentCountByParent(@Param("paging") PagingVO paging, @Param("freeNum") int freeNum);

    public List<CommentVO> getCommentListByParent(@Param("paging") PagingVO paging, @Param("freeNum") int freeNum);

    public CommentVO getComment(@Param("freeBoardCommentNumber") int freeBoardCommentNumber);

    public int updateComment(CommentVO comment);

    public int deleteComment(CommentVO comment);

    public int insertComment(CommentVO comment);


}
