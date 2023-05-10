package com.cqcj.controller;

import com.alibaba.fastjson.JSON;
import com.cqcj.entity.Dept;
import com.cqcj.entity.Score;
import com.cqcj.entity.User;
import com.cqcj.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Queue;

/**
 * @program: SSM
 * @description:
 * @author: 王炸！！
 * @create: 2022-12-23 16:41
 **/
@RequestMapping("/admin")
@Controller
public class AdminController {

    @Autowired
    private AdminService adminService;

    //查询本校所有学生
    @GetMapping("/getScoreAll")
    @ResponseBody
    public String getScoreAll() {
        List<Score> list = adminService.getScoreAll();
        return JSON.toJSONString(list);
    }

    //分页查询本校所有学生
    @GetMapping("/getScoreAllPage/{offset}/{pageSize}")
    @ResponseBody
    public String getByDept(@PathVariable Integer offset, @PathVariable Integer pageSize) {
        List<Score> list = adminService.getScoreAllPage(offset, pageSize);
        return JSON.toJSONString(list);
    }

    //分页查询所需要的本校所有学生的记录条数
    @GetMapping("/getScoreNum")
    @ResponseBody
    public String getScoreNum() {
        Integer num = adminService.getScoreNum();
        return JSON.toJSONString(num);
    }

    //查询本系统所有用户
    @GetMapping("/getAllUser")
    @ResponseBody
    public String getAllUser() {
        List<User> list = adminService.getAllUser();
        return JSON.toJSONString(list);
    }

    //分页查询本系统所有用户
    @GetMapping("/getUserPage/{offset}/{pageSize}")
    @ResponseBody
    public String getUserPage(@PathVariable Integer offset, @PathVariable Integer pageSize) {
        List<User> list = adminService.getUserPage(offset, pageSize);
        return JSON.toJSONString(list);
    }

    //分页查询所需要的本系统所有用户的记录条数
    @GetMapping("/getUserNum")
    @ResponseBody
    public String getUserNum() {
        Integer num = adminService.getNumUser();
        return JSON.toJSONString(num);
    }

    //重置密码
    @GetMapping("/resetPwd/{code}")
    @ResponseBody
    public String getUserNum(@PathVariable String code) {
        Integer num = adminService.resetPwd(code);
        return JSON.toJSONString(num);
    }


    //添加部门
    @PostMapping("/addDept")
    @ResponseBody
    public String addDept(Dept dept) {
        Integer integer = adminService.addDept(dept);
        return JSON.toJSONString(integer);
    }

    //查询所有学院
    @GetMapping("/getDept")
    @ResponseBody
    public String getDept() {
        List<Dept> list = adminService.getDept();
        return JSON.toJSONString(list);
    }

    //添加用户
    @PostMapping("/addUser")
    @ResponseBody
    public String addUser(User user) {
        Integer integer = adminService.addUser(user);
        return JSON.toJSONString(integer);
    }

    //修改用户
    @PutMapping("/updateUser")
    @ResponseBody
    public String updateUser(Integer id, String code, String name, String deptId, Integer sex) {
        User user = new User(id, code, name, null, sex, null, deptId, null, null);
        Integer integer = adminService.updateUser(user);
        return JSON.toJSONString(integer);
    }

}
