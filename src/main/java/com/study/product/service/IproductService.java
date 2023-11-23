package com.study.product.service;

import com.study.cart.vo.CartVO;
import com.study.common.vo.PagingVO;
import com.study.common.vo.SearchVO;
import com.study.product.vo.ProductVO;
import com.study.product.vo.SaveCartVO;

import java.util.List;


public interface IproductService {


    // 1. 상품 추가
    public void insert(ProductVO productVO);


    // 1.5. 상품 목록
    public List<ProductVO> getprodList(PagingVO paging
            , SearchVO search);

    // 3. 상품 삭제
    public void delete(int productId);

    // 4. 싱품 수정
    public void update(ProductVO productVO);

    // 5. 상품 상세
    public ProductVO getproduct(int productId);
    public void getSave(SaveCartVO saveCartVO);


    //11월 23일
    public List<CartVO> viewuserInfo(String id);

    public  List<ProductVO> viewproductInfo(String productid);




}
