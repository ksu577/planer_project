package com.study.product.service;

import com.study.common.vo.PagingVO;
import com.study.common.vo.SearchVO;
import com.study.product.vo.ProductVO;
import com.study.product.vo.SaveCartVO;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.List;


public interface IproductService {


    // 1. 상품 추가
    public void insert(ProductVO productVO, MultipartFile imgFile) throws IOException;


    // 1.5. 상품 목록
    public List<ProductVO> getprodList(PagingVO paging
            , SearchVO search);

    // 3. 상품 삭제
    public void delete(int productId);

    // 4. 싱품 수정
    public void updateproduct(ProductVO productVO, MultipartFile imgFile) throws IOException;

    // 5. 상품 상세
    public ProductVO getproduct(int productId);
    public void getSave(SaveCartVO saveCartVO);


    //11월 23일
    public SaveCartVO viewUserInfo(String id);

    public  List<ProductVO> viewProductInfo(String productid);

    public List<SaveCartVO> buyingMemberInfo(PagingVO paging,SearchVO search);




}
