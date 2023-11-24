package com.study.product.service;

import com.study.cart.vo.CartVO;
import com.study.common.vo.PagingVO;
import com.study.common.vo.SearchVO;
import com.study.product.dao.ProductDao;
import com.study.product.vo.ProductVO;
import com.study.product.vo.SaveCartVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.inject.Inject;
import java.util.List;

@Service
public class ProductServiceImple implements IproductService {

    @Autowired
    ProductDao productDao;



    // 1. 상품 추가
    @Override
    public void insert(ProductVO productVO) {
        productDao.insertproduct(productVO);
    }

    // 2. 상품 목록 ( 미니샾 )
    @Override
    public List<ProductVO> getprodList(PagingVO paging, SearchVO search) {
        int totalRowCount = productDao.getTotalRowCount(paging,search);

        paging.setTotalRowCount(totalRowCount);
        paging.pageSetting();
        return productDao.getprodList(paging,search);

    }

    // 3. 상품 지우기
    @Override
    public void delete(int productId) {
        productDao.delete(productId);
    }

    // 4. 상품 수정
    @Override
    public void update(ProductVO product) {
        productDao.update(product);
    }

    // 5. 상품 상세
    @Override
    public ProductVO getproduct(int productId) {
        return productDao.getproduct(productId);
    }

    @Override
    public void getSave(SaveCartVO saveCartVO) {
        productDao.insertSaveCart(saveCartVO);
    }


    //여기서부터 11월 23일
    @Override
    public SaveCartVO viewUserInfo(String id) {
        SaveCartVO userinfo = productDao.selectUserInfo(id);
        return userinfo;
    }

    @Override
    public List<ProductVO> viewProductInfo(String productid){
        List<ProductVO> productinfo = productDao.selectProductInfo(productid);
        return productinfo;
    }




}
