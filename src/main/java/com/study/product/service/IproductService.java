package com.study.product.service;

import com.study.cart.vo.CartVO;
import com.study.product.vo.ProductVO;

import java.util.List;

public interface IproductService {


    // 1. 물건 추가
    public void insert(ProductVO productVO);

    // 2. 물건 목록
    public List<ProductVO> getprodList();

    // 3. 물건 삭제
    public void delete(int productId);

    // 4. 물건 수정
    public void modify(ProductVO productVO);

    // 5. 물건 확인
    public ProductVO getproduct(int productId);




}
