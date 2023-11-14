package com.study.product.service;

import com.study.product.dao.ProductDao;
import com.study.product.vo.ProductVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.inject.Inject;
import java.util.List;

@Service
public class ProductServiceImple implements IproductService {

    @Inject
    ProductDao productDao;

    // 1. 상품 추가
    @Override
    public void insert(ProductVO productVO) {
        productDao.insertproduct(productVO);
    }

    // 2. 상품 목록 ( 미니샾 )
    @Override
    public List<ProductVO> getprodList() {
        return productDao.getprodList();
    }

    // 3. 상품 지우기
    @Override
    public void delete(int productId) {
        productDao.delete(productId);
    }

    // 4. 상품 수정
    @Override
    public void update(ProductVO productVO) {
        productDao.update(productVO);
    }

    // 5. 상품 상세
    @Override
    public ProductVO getproduct(int productId) {
        return productDao.getproduct(productId);
    }
}
