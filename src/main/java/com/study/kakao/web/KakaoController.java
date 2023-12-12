package com.study.kakao.web;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.study.cart.service.ICartService;
import com.study.common.vo.ResultMessageVO;
import com.study.login.vo.UserVO;
import com.study.member.vo.MemberVO;
import com.study.product.service.IproductService;
import com.study.product.vo.ProductVO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import javax.servlet.http.HttpSession;
import java.io.*;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.ProtocolException;
import java.net.URL;


@Slf4j
@Controller
public class KakaoController {
    @Autowired
    IproductService IproductService;
    @Autowired
    ICartService cartService;

    @GetMapping("/test/test.wow")
    public String test()
    {
        return "test/test";
    }


    @RequestMapping("/test/approval.wow")
    public ModelAndView approval(ModelAndView mv, HttpSession s , RedirectView rv,
                                 @RequestParam("pg_token") String pgToken
    ) {

        try {
            URL kakaoadd = new URL("https://kapi.kakao.com/v1/payment/approve");
            HttpURLConnection serverconnection = (HttpURLConnection) kakaoadd.openConnection();
            serverconnection.setRequestMethod("POST");
            serverconnection.setRequestProperty("Authorization", "KakaoAK 3c757d5ad8df5f534911c2a4f1504def");
            serverconnection.setRequestProperty("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
            serverconnection.setDoOutput(true);
            String tid = s.getAttribute("tId").toString();
            log.info(tid);


            String parameter = "cid=TC0ONETIME&tid="+tid+"&partner_order_id=partner_order_id&partner_user_id=partner_user_id&pg_token="+pgToken;

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

            log.info(conversion.readLine());
            mv.addObject("msg", conversion.readLine());

        } catch (MalformedURLException e) {
            throw new RuntimeException(e);
        }  catch (ProtocolException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
        log.info(rv.toString());

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
    public ResultMessageVO kakaopay(HttpSession session) {
        UserVO user = (UserVO) session.getAttribute("user");
        String userId = user.getId();
        int sumMoney = cartService.sumMoney(userId);

        ResultMessageVO msg = new ResultMessageVO();

        // 이걸 공통으로 뽑아야함.
        try {
            URL kakaoadd = new URL("https://kapi.kakao.com/v1/payment/ready");
            HttpURLConnection serverconnection = (HttpURLConnection) kakaoadd.openConnection();
            serverconnection.setRequestMethod("POST");
            serverconnection.setRequestProperty("Authorization", "KakaoAK 3c757d5ad8df5f534911c2a4f1504def");
            serverconnection.setRequestProperty("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
            serverconnection.setDoOutput(true);
//            String parameter = "cid=TC0ONETIME&partner_order_id=partner_order_id&partner_user_id=partner_user_id&item_name=MyCart&quantity=1&total_amount="+sumMoney+"&vat_amount=0&tax_free_amount=0&approval_url=http://localhost:8081/test/approval.wow&fail_url=http://localhost:8081/test/fail.wow&cancel_url=http://localhost:8081/test/cancel.wow";
            String parameter = "cid=TC0ONETIME&partner_order_id=partner_order_id&partner_user_id=partner_user_id&item_name=MyCart&quantity=1&total_amount="+sumMoney+"&vat_amount=0&tax_free_amount=0&approval_url=http://115.90.137.188:23073/test/approval.wow&fail_url=http://115.90.137.188:23073/test/fail.wow&cancel_url=http://115.90.137.188:23073/test/cancel.wow";
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
            log.info(receive.toString());

            InputStreamReader reader = new InputStreamReader(receive);
            BufferedReader conversion = new BufferedReader(reader);

            msg.setMessage(conversion.readLine());
            JsonObject jsonObject = JsonParser.parseString(msg.getMessage()).getAsJsonObject();

            String tId = jsonObject.get("tid").toString();
            session.setAttribute("tId", tId); // 회원 결제가 1:1이라는 가정 리팩터링 대

            log.info("tid="+tId);

        } catch (MalformedURLException e) {
            e.printStackTrace();
            msg.setUrl("/test/test.wow");
        } catch (IOException e) {
            e.printStackTrace();
            msg.setUrl("/test/test.wow");
        }
        return msg;
    }
}
