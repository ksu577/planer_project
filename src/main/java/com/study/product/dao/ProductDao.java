package com.study.product.dao;

import com.study.common.vo.PagingVO;
import com.study.common.vo.SearchVO;
import com.study.product.vo.ProductVO;

import com.study.product.vo.SaveCartVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface ProductDao {

    // 1. 물건 등록
    public void insertproduct(ProductVO productVO);

    // 2.물건 삭제
    public void delete(int productId);

    // 3.물건 수정
    public void update(ProductVO productVO);

    // 4.물건 확인 (상세 페이지 확인)
    public ProductVO getproduct(int productId);

    // 5.물건 목록 확인
     public List<ProductVO> getprodList(@Param("paging") PagingVO paging
             , @Param("search") SearchVO search);

    public int getTotalRowCount(@Param("paging") PagingVO paging
            , @Param("search") SearchVO search, @Param("searchCategory") String searchCategory);
    public void insertSaveCart(SaveCartVO saveCartVO);

}
