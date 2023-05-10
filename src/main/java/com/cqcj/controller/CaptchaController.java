package com.cqcj.controller;


import com.ramostear.captcha.HappyCaptcha;
import com.ramostear.captcha.support.CaptchaStyle;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @program: SSM
 * @description:
 * @author: 王炸！！
 * @create: 2022-12-18 23:35
 **/


@Controller
public class CaptchaController {

    @GetMapping("/captcha")
    public void captcha(HttpServletResponse response, HttpServletRequest request){
        HappyCaptcha.require(request, response).style(CaptchaStyle.IMG).build().finish();
    }

    @GetMapping("/checkCaptcha")
    @ResponseBody
    public String checkCaptcha(String code,HttpServletRequest request){
        boolean flag = HappyCaptcha.verification(request, code, true);
        if (flag) {
            //如果通过清除当前验证码验证
            HappyCaptcha.remove(request);
            return "success";
        }
        return "error";
    }

}
