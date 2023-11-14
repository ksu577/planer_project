package com.study.product.service;

import com.study.cart.vo.CartVO;
import com.study.product.vo.ProductVO;

import java.util.List;

public interface IproductService {


    // 1. 상품 추가
    public void insert(ProductVO productVO);

    // 2. 상품 목록
    public List<ProductVO> getprodList();

    // 3. 상품 삭제
    public void delete(int productId);

    // 4. 싱품 수정
    public void update(ProductVO productVO);

    // 5. 상품 상세
    public ProductVO getproduct(int productId);




}
