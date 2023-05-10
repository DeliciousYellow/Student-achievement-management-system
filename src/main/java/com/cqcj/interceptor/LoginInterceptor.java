package com.cqcj.interceptor;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@Component
public class LoginInterceptor implements HandlerInterceptor {
    @Override
    //前置拦截(一般情况下只配置前置拦截即可)
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        System.out.println("到达登录拦截器");
        HttpSession session = request.getSession();

        if(session.getAttribute("user") != null) {
            return true;
        }
        response.sendRedirect(request.getContextPath()+"/login");
        return false;
    }
}
