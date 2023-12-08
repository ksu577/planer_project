package com.study.manager;

import com.study.cart.vo.CartVO;
import com.study.exception.BizNotFoundException;
import com.study.product.dao.BuyingDao;
import com.study.product.vo.SaveCartVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class managerServiceImple implements managerService {

    @Autowired
    BuyingDao buyingDao;
    @Override
    public List<CartVO> getcartListMember(int saveNum) throws BizNotFoundException {
        List<CartVO> cart =  buyingDao.getcartList(saveNum);
        return cart;
    }
}
