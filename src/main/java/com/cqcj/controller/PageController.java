package com.cqcj.controller;

import com.alibaba.fastjson.JSON;
import com.cqcj.entity.Score;
import com.cqcj.service.InstructorService;
import com.cqcj.service.StudentService;
import com.cqcj.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.concurrent.atomic.AtomicLong;


/**
 * @program: SSMtest
 * @description: 负责页面跳转
 * @author: 王炸！！
 * @create: 2022-12-11 09:37
 **/
@Controller
public class PageController {

    @Autowired
    private UserService userService;
    @Autowired
    private StudentService studentService;

    @RequestMapping({"/","/login"})
    public String index() {
        return "loginPage";
    }

    @RequestMapping("/homePage")
    public String homepage() {
        return "homePage";
    }

    @RequestMapping("/loginout")
    public String loginout(HttpSession session){
        session.removeAttribute("user");
        return "loginPage";
    }

    @PostMapping("/checklogin")
    @ResponseBody
    public String login(String usercode, String password, Model model,HttpSession session){
        if (userService.login(usercode,password)) {
            System.out.println("登陆成功");
            /*将user对象存session*/
            session.setAttribute("user",userService.getByCode(usercode));
            /*将部门信息存session*/
            String deptName= userService.getDeptByCode(usercode);
            session.setAttribute("deptName",deptName);
            /*将学生成绩不及格的信息存session*/
            List<Score> FailScore = studentService.getFailByCode(usercode);
            session.setAttribute("FailScore",FailScore);
            /*将学生成绩优秀的信息存session*/
            List<Score> ExcellentScore = studentService.getExcellentByCode(usercode);
            session.setAttribute("ExcellentScore",ExcellentScore);
            return "200";
        }
//        session.setAttribute("count",1);
//        Integer count = Integer.parseInt(session.getAttribute("count").toString());
//        System.out.println(count);
//        session.setAttribute("count",Integer.parseInt(session.getAttribute("count").toString())+1);
        model.addAttribute("message","登录失败！");
        return "400";
    }

    @RequestMapping("/studentPage")
    public String studentpage() {
        return "studentPage";
    }

    @RequestMapping("/instructorPage")
    public String instructorPage() {
        return "instructorPage";
    }

    @RequestMapping("/adminPage")
    public String adminPage() {
        return "adminPage";
    }

    @RequestMapping("/PersonalSettingsPage")
    public String PersonalSettingsPage(){
        return "PersonalSettingsPage";
    }
}
