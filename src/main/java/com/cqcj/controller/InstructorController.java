package com.cqcj.controller;

import com.alibaba.fastjson.JSON;
import com.cqcj.entity.Score;
import com.cqcj.service.InstructorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * @program: SSMtest1
 * @description:
 * @author: 王炸！！
 * @create: 2022-12-18 10:58
 **/
@RequestMapping("/instructor")
@Controller
public class InstructorController {

    @Autowired
    private InstructorService instructorService;

    //查询本学院所有学生
    @GetMapping("/getByDept/{deptId}")
    @ResponseBody
    public String getByDept(@PathVariable String deptId) {
        List<Score> list = instructorService.getBydept(deptId);
        return JSON.toJSONString(list);
    }

    //分页查询本学院所有学生
    @GetMapping("/getByDept/{deptId}/{offset}/{pageSize}")
    @ResponseBody
    public String getByDept(@PathVariable String deptId,@PathVariable Integer offset,@PathVariable Integer pageSize) {
        List<Score> list = instructorService.getBydeptPage(deptId,offset,pageSize);
        return JSON.toJSONString(list);
    }

    //分页查询所需要的本学院所有学生的记录条数
    @GetMapping("/getNumberByDept/{deptId}")
    @ResponseBody
    public String getNumberByDept(@PathVariable String deptId) {
        Integer num = instructorService.getNumBydept(deptId);
        return JSON.toJSONString(num);
    }

    //根据学生code查询成绩
    @GetMapping("/getScoreByCode/{code}")
    @ResponseBody
    public String getScoreByCode(@PathVariable String code) {
        List<Score> list = instructorService.getScoreByCode(code);
        return JSON.toJSONString(list);
    }

    //根据学生code查询成绩
    @GetMapping("/getScoreByCourseName/{deptId}/{courseName}")
    @ResponseBody
    public String getScoreByCourseName(@PathVariable String deptId,@PathVariable String courseName) {
        List<Score> list = instructorService.getScoreByCourseName(deptId,courseName);
        return JSON.toJSONString(list);
    }

    //添加学生成绩
    @PostMapping("/addScore")
    @ResponseBody
    public String addScore(Score score) {
        Integer integer = instructorService.addScore(score);
        return JSON.toJSONString(integer);
    }

    //删除学生成绩
    @DeleteMapping("/deleteScore")
    @ResponseBody
    public String deleteScore(String code,String courseName) {
        Integer integer = instructorService.deleteScore(code,courseName);
        System.out.println(integer);
        return JSON.toJSONString(integer);
    }

    //修改学生成绩
    @PutMapping("/updateScore")
    @ResponseBody
    public String updateScore(Integer id,String InputCode,Integer SelectSemester,String InputCourseName,Double InputScore) {
        Score score = new Score(id,InputCode, InputCourseName, InputScore, SelectSemester, null);
        System.out.println(score);
        Integer integer = instructorService.updateScore(score);
        System.out.println(integer);
        return JSON.toJSONString(integer);
    }
}
