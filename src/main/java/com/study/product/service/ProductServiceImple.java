package com.study.product.service;

import com.study.product.dao.ProductDao;
import com.study.product.vo.ProductVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
public class ProductServiceImple implements IproductService {

    @Autowired
    ProductDao productDao;

    // 1. 상품 추가
    @Override
    public void insert(ProductVO productVO) {

    }


    // 2. 상품 목록 ( 미니샾 )
    @Override
    public List<ProductVO> getprodList() {
        return null;
    }

    // 3. 상품 지우기
    @Override
    public void delete(int productId) {

    }


    // 4. 상품 변경
    @Override
    public void modify(ProductVO productVO) {

    }

    // 5. 상품 상세
    @Override
    public void getproduct(int productId) {

    }
}
