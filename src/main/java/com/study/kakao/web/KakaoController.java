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
//            String parameter = "cid=TC0ONETIME&partner_order_id=partner_order_id&partner_user_id=partner_user_id&item_name=주문서번호&quantity=1&total_amount=77800&vat_amount=778&tax_free_amount=0&approval_url=http://localhost:8081/test/approval.wow&fail_url=http://localhost:8081/test/fail.wow&cancel_url=http://localhost:8081/test/cancel.wow";
            String parameter = "cid=TC0ONETIME&partner_order_id=partner_order_id&partner_user_id=partner_user_id&item_name=item_name&quantity=quantity&total_amount=total_amount&vat_amount=0&tax_free_amount=0&approval_url=http://localhost:8081/test/approval.wow&fail_url=http://localhost:8081/test/fail.wow&cancel_url=http://localhost:8081/test/cancel.wow";
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
}