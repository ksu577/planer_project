package com.study.product.dao;

import com.study.common.vo.PagingVO;
import com.study.common.vo.SearchVO;
import com.study.product.vo.ProductVO;

import com.study.product.vo.SaveCartVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

@Mapper
public interface ProductDao {

    // 1. 물건 등록
    public void insertproduct(ProductVO productVO);

    // 2.물건 삭제
    public void delete(int productId);

    // 3.물건 수정
    public void updateproduct(ProductVO productVO);

    // 4.물건 확인 (상세 페이지 확인)
    public ProductVO getproduct(int productId);

    // 5.물건 목록 확인
    public List<ProductVO> getprodList(@Param("paging") PagingVO paging
            , @Param("search") SearchVO search);

    // 6. 물건 갯수 조절
    public void updateProductAmount(@Param("productId") int productId, @Param("purchaseQuantity") int purchaseQuantity);

    public int getTotalRowCount(@Param("paging") PagingVO paging
            , @Param("search") SearchVO search);

    public void insertSaveCart(SaveCartVO saveCartVO);

    //    xml dao service 전부 수정할 예정 11월 23일
    public SaveCartVO selectUserInfo(String id);

    public List<ProductVO> selectProductInfo(String id);

    public List<SaveCartVO> getBuyingMemberList(@Param("paging") PagingVO paging, @Param("search") SearchVO search);
}
