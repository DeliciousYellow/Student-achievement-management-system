package com.cqcj.controller;

import com.alibaba.fastjson.JSON;
import com.cqcj.entity.User;
import com.cqcj.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * @program: SSM
 * @description:
 * @author: 王炸！！
 * @create: 2022-12-09 14:58
 **/
@RequestMapping("/user")
@Controller
public class UserController {
    @Autowired
    private UserService userService;

    @GetMapping("/get/{id}")
    @ResponseBody
    public String getById(@PathVariable int id) {
        User user = userService.getById(id);
        System.out.println(user);
        String s = JSON.toJSONString(user);
        System.out.println(s);
        return s;
    }

    @GetMapping("/getAll")
    @ResponseBody
    public String getall() {
        List<User> list = userService.getAll();
        System.out.println(list);
        String s = JSON.toJSONString(list);
        System.out.println(s);
        return s;
    }

}
