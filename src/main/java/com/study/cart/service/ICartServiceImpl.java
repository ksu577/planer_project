package com.study.cart.service;

import com.study.cart.dao.CartDao;
import com.study.cart.vo.CartVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ICartServiceImpl implements ICartService {

    @Autowired
    CartDao cartDao;
    

    // 1. 장바구니(물품) 추가
    @Override
    public void insert(CartVO cartVO) {
        cartDao.insertCart(cartVO);
    }

    // 2. 장바구니 목록 ===> 이게 진짜 장바구니
    @Override
    public List<CartVO> listCart(String userId) {
        return cartDao.CartList(userId);
    }

    // 3. 장바구니 삭제 (물품 삭제)
    @Override
    public void delete(int cartId) {
        cartDao.delete(cartId);
    }

    // 4. 장바구니 수정
    @Override
    public void modify(CartVO cartVO) {
        cartDao.modifyCart(cartVO);
    }

    // 5. 장바구니 금액 합계
    @Override
    public int sumMoney(String userId) {
        return cartDao.sumMoney(userId);
    }

    // 6. 장바구니 상품 확인
    @Override
    public int CountCart(int product_id, String userId) {
        return cartDao.CountCart(product_id, userId);
    }

    // 7. 장바구니 상품 수량 변경
    @Override
    public void updateCart(CartVO cartVO) {
        cartDao.updateCart(cartVO);
    }

    //8. 장바구니 전체 삭제
    @Override
    public void clearCart(String userId) { cartDao.clearCart(userId);}

    }

