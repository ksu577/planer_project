package com.study.kakao.web;

import com.study.common.vo.ResultMessageVO;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import javax.servlet.http.HttpSession;
import java.io.*;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;

@Controller
public class KakaoController {


    @GetMapping("/test/test.wow")
    public String test()
    {
        return "test/test";
    }


    @RequestMapping("/test/approval.wow")
    public ModelAndView approval(ModelAndView mv, HttpSession s , RedirectView rv) {
        mv.setViewName("/test/approval");
        return mv;
    }


    @RequestMapping("/test/fail.wow")
    public ModelAndView fail(ModelAndView mv, HttpSession s , RedirectView rv) {
        mv.setViewName("/test/fail");
        return mv;
    }


    @RequestMapping("/test/cancel.wow")
    public ModelAndView cancel(ModelAndView mv, HttpSession s , RedirectView rv) {
        mv.setViewName("/test/cancel");
        return mv;
    }



    @PostMapping("/test/kakaopay.wow")
    @ResponseBody
    public ResultMessageVO kakaopay() {

        ResultMessageVO msg = new ResultMessageVO();

        try {
            URL kakaoadd = new URL("https://kapi.kakao.com/v1/payment/ready");
            HttpURLConnection serverconnection = (HttpURLConnection) kakaoadd.openConnection();
            serverconnection.setRequestMethod("POST");
            serverconnection.setRequestProperty("Authorization", "KakaoAK 3c757d5ad8df5f534911c2a4f1504def");
            serverconnection.setRequestProperty("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
            serverconnection.setDoOutput(true);
            String parameter = "cid=TC0ONETIME&partner_order_id=partner_order_id&partner_user_id=partner_user_id&item_name=engitem&quantity=1&total_amount=2200&vat_amount=200&tax_free_amount=0&approval_url=http://localhost:8081/test/approval.wow&fail_url=http://localhost:8081/test/fail.wow&cancel_url=http://localhost:8081/test/cancel.wow";
            OutputStream give = serverconnection.getOutputStream();
            DataOutputStream datagive = new DataOutputStream(give);
            datagive.writeBytes(parameter);
            datagive.close();

            int result = serverconnection.getResponseCode();

            InputStream receive;
            if (result == 200) {
                receive = serverconnection.getInputStream();
            } else {
                receive = serverconnection.getErrorStream();
            }

            InputStreamReader reader = new InputStreamReader(receive);
            BufferedReader conversion = new BufferedReader(reader);

            msg.setMessage(conversion.readLine());
        } catch (MalformedURLException e) {
            e.printStackTrace();
            msg.setUrl("/test/test.wow");
        } catch (IOException e) {
            e.printStackTrace();
            msg.setUrl("/test/test.wow");
        }

        return msg;
    }

//    @ResponseBody
//    @PostMapping("/kakao/pay/ready")
//    public Map<String, Object> kakaoPayReady() {
//        String URL = "https://kapi.kakao.com/v1/payment/ready";
//
//        HttpHeaders headers = new HttpHeaders();
//        headers.setContentType(MediaType.APPLICATION_FORM_URLENCODED);
//        headers.set("Authorization", "KakaoAK {3c757d5ad8df5f534911c2a4f1504def}");
//
//        Map<String, Object> params = new HashMap<>();
//        params.put("cid", "TC0ONETIME");
//        params.put("partner_order_id", "1001");
//        params.put("partner_user_id", "testUser");
//        params.put("item_name", "아이템");
//        params.put("quantity", 1);
//        params.put("total_amount", 2200);
//        params.put("vat_amount", 200);
//        params.put("tax_free_amount", 0);
//        params.put("created_at", "2016-11-15T21:18:22");
//        params.put("approved_at", "2016-11-15T21:20:47");
//        params.put("approval_url", "http://localhost:8081/success");
//        params.put("cancel_url", "http://localhost:8081/cancel");
//        params.put("fail_url", "http://localhost:8081/fail");
//
//        HttpEntity<Map<String, Object>> request = new HttpEntity<>(params, headers);
//
//        RestTemplate restTemplate = new RestTemplate();
//        Map<String, Object> response = restTemplate.postForObject(URL, request, Map.class);
//
//        return response;
//    }
}