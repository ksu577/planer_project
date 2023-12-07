package com.study.product.dao;

import com.study.common.vo.PagingVO;
import com.study.common.vo.SearchVO;
import com.study.product.vo.SaveCartVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface BuyingDao {
    public List<SaveCartVO> getsavecartList(@Param("paging") PagingVO paging
            , @Param("search") SearchVO search);

    public int getTotalRowCount(@Param("paging") PagingVO paging, @Param("search") SearchVO search);
}
