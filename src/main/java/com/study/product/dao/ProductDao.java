package com.study.product.dao;

import com.study.product.vo.ProductVO;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ProductDao {

    // 1. 물건 등록
    public void insertpublic(ProductVO productVO);

    // 2.물건 삭제
    public void delete(int id);

    // 3.물건 변경
    public void update(ProductVO productVO);

    // 4.물건 확인 (상세 페이지 확인)
    public void getporduct(int id);


}
