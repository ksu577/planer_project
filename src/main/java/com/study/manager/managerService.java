package com.study.manager;

import com.study.cart.vo.CartVO;
import com.study.exception.BizNotFoundException;
import com.study.product.vo.SaveCartVO;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface managerService {
    public List<CartVO> getcartListMember(int saveNum) throws BizNotFoundException;
}
