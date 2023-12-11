package com.study.kakao.service;

import com.study.kakao.vo.KakaoPayReadyVO;
import org.apache.commons.collections4.MultiValuedMap;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.web.client.RestTemplate;

import java.util.Map;

@Service
public class KakaoService {

    public KakaoPayReadyVO kakaoPay(Map<String, Object> params) {
        HttpHeaders headers = new HttpHeaders();
        headers.set("Authorization", "KakaoAK {3c757d5ad8df5f534911c2a4f1504def}");

        MultiValueMap<String, Object> payParams = new LinkedMultiValueMap<>();

        payParams.add("cid", "TC0ONETIME");
        payParams.add("partner_order_id", "KA020230318001");
        payParams.add("partner_user_id", "kakaopayTest");
        payParams.add("item_name", params.get("item_name"));
        payParams.add("quantity", params.get("quantity"));
        payParams.add("total_amount", params.get("total_amount"));
        payParams.add("tax_free_amount", params.get("tex_free_amount"));
        payParams.add("approval_url", "https://kapi.kakao.com/v1/payment/ready");
        payParams.add("fail_url", "/pay/fail");
        payParams.add("cancel_url", "/pay/cancel");

        HttpEntity<Map> request = new HttpEntity<Map>(payParams, headers);

        RestTemplate template = new RestTemplate();
        String url = "https://kapi.kakao.com/v1/payment/ready";

        KakaoPayReadyVO res = template.postForObject(url, request, KakaoPayReadyVO.class);
        return res;

    }
}
