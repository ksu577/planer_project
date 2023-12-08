package com.study.product.dao;

import com.study.cart.vo.CartVO;
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

    public List<CartVO> getcartList(int saveNum);

    public int getTotalRowCount(@Param("paging") PagingVO paging, @Param("search") SearchVO search);
}
