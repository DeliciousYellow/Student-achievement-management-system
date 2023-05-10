package com.cqcj.controller;

import com.alibaba.fastjson.JSON;
import com.cqcj.entity.Score;
import com.cqcj.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * @program: SSMtest1
 * @description:
 * @author: 王炸！！
 * @create: 2022-12-18 10:49
 **/
@RequestMapping("/student")
@Controller
public class StudentController {

    @Autowired
    private StudentService studentService;

    @GetMapping("/getByCode/{code}")
    @ResponseBody
    public String getByCode(@PathVariable String code) {
        List<Score> list = studentService.getBycode(code);
        return JSON.toJSONString(list);
    }

    @GetMapping("/getByCode/{code}/{offset}/{pageSize}")
    @ResponseBody
    public String getByCode(@PathVariable String code,@PathVariable Integer offset,@PathVariable Integer pageSize) {
        List<Score> list = studentService.getBycodePage(code,offset,pageSize);
        return JSON.toJSONString(list);
    }

    @GetMapping("/getNumberByCode/{code}")
    @ResponseBody
    public String getNumberByCode(@PathVariable String code) {
        Integer num = studentService.getNumByCode(code);
        return JSON.toJSONString(num);
    }
}
