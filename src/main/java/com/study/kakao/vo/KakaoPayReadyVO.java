package com.study.kakao.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class KakaoPayReadyVO {
    private String tid;
    private String next_redirect_mobile_url;
    private String next_redirect_pc_url;
    private String partner_order_id;
}
