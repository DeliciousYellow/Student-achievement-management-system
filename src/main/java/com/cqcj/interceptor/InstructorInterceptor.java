package com.cqcj.interceptor;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * @program: SSM
 * @description:
 * @author: 王炸！！
 * @create: 2022-12-22 17:09
 **/
@Component
public class InstructorInterceptor implements HandlerInterceptor {
    @Override
    //前置拦截(一般情况下只配置前置拦截即可)
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
//        System.out.println("到达辅导员拦截器");
//        HttpSession session = request.getSession();
//        str.substring(0,i);
//        session.getAttribute("user")
//        if(session.getAttribute("user") != "T") {
//            return true;
//        }
//        response.sendRedirect(request.getContextPath()+"/login");
//        return false;

        return true;
    }
}