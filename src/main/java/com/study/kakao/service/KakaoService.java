package com.study.kakao.service;

import com.fasterxml.jackson.databind.ObjectReader;
import com.study.cart.dao.CartDao;
import com.study.cart.vo.CartVO;
import com.study.kakao.vo.KakaoPayReadyVO;
import com.study.product.dao.ProductDao;
import com.study.product.service.IproductService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.collections4.MultiValuedMap;
import org.apache.ibatis.annotations.One;
import org.springframework.http.MediaType;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.net.URI;
import java.net.URISyntaxException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Slf4j
@Service
@RequiredArgsConstructor
public class KakaoService {

    private final ProductDao productDao;
    private final CartDao cartDao;

    private final static String HOST = "https://kapi.kakao.com";
    private final static String APP_KEY = "3c757d5ad8df5f534911c2a4f1504def";
    private final static String C_ID = "TC0ONETIME";

    public Map<String, Object> approval(String pgToken, String tid, String userId) {

        MultiValueMap<String, Object> data = new LinkedMultiValueMap<>();
        data.add("partner_order_id", "partner_order_id");
        data.add("partner_user_id", "partner_user_id");
        data.add("tid", tid);
        data.add("pg_token", pgToken);
        Map<String, Object> map = approveKakaoPay(data);

        // 카트에 있는 상품을 list order table에 저장하는 로직 작성 ㄱㄱ
        saveOrder(userId, map);

        return map;
    }

    public void saveOrder(String userId, Map<String,Object> map) {

    }

    public Map ready(String userId) {

        Map<String, Object> pass = validationCheck(userId);
        if(pass == null) {
            return null;
        }

        MultiValueMap<String, Object> data = new LinkedMultiValueMap<>();
        data.add("partner_order_id", "partner_order_id");
        data.add("partner_user_id", "partner_user_id");
        data.add("item_name", pass.get("name"));
        data.add("quantity", pass.get("quantity"));
        data.add("total_amount", pass.get("totalAmount"));
        data.add("tax_free_amount", 0);
        data.add("approval_url", "http://localhost:8081/test/approval.wow");
        data.add("fail_url", "http://localhost:8081/test/fail.wow");
        data.add("cancel_url", "http://localhost:8081/test/cancel.wow");

        return readyKakaoPay(data);
    }


    // 좀더 세부적으로 물품 수량에 대한 유효성 검사가 필요해 보임
    // 우선 간단하게 구매 요청 당시 물품 수량 서버 단에서 체크하는 로직
    private Map<String, Object> validationCheck(String userId) {

        List<CartVO> list = cartDao.cartList(userId);

        int quantity = 0;
        int totalAmount = 0;
        int count = 0;
        String name = null;

        for(CartVO cartVO : list) {

            if(name == null) {
                name = cartVO.getProductName();
            }

            if(cartVO.getProductAmount() < cartVO.getAmount()) {
                return null;
            }
            quantity += cartVO.getAmount();
            totalAmount += cartVO.getAmount() * cartVO.getPrice();
            count++;
        }

        if(count > 1) {
            name = name+" 외 "+count+"개의 상품";
        }

        return Map.of("quantity", quantity, "totalAmount", totalAmount, "name", name);
    }

    private Map readyKakaoPay(MultiValueMap<String , Object> data) {
        return callKakaoPayAPI("/v1/payment/ready", data);
    }

    private Map approveKakaoPay(MultiValueMap<String, Object> data) {
        return callKakaoPayAPI("/v1/payment/approve", data);
    }

    private Map callKakaoPayAPI(String path, MultiValueMap<String, Object> data) {

        HttpHeaders httpHeaders = new HttpHeaders();
        httpHeaders.add("Authorization", "KakaoAK "+ APP_KEY);
        httpHeaders.add("Accept", MediaType.APPLICATION_JSON_VALUE + ";charset=UTF-8");
        httpHeaders.add("Content-type", MediaType.APPLICATION_FORM_URLENCODED_VALUE  + ";charset=UTF-8");

        MultiValueMap<String, Object> params = new LinkedMultiValueMap<>();
        params.add("cid", C_ID);
        params.addAll(data);

        HttpEntity<MultiValueMap<? extends String, ?>> entity
                = new HttpEntity<>(params, httpHeaders);

        RestTemplate restTemplate = new RestTemplate();
        Map<String, Object> map;
        try {
            map = restTemplate.postForObject(new URI(HOST + path), entity, HashMap.class);
            log.info(map.toString());
        } catch (URISyntaxException e) {
            throw new RuntimeException(e);
        }

        return map;
    }
}
