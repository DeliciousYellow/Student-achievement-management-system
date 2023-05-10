package com.cqcj.service.impl;

import com.cqcj.entity.Score;
import com.cqcj.mapper.InstructorMapper;
import com.cqcj.service.InstructorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @program: SSMtest1
 * @description:
 * @author: 王炸！！
 * @create: 2022-12-18 14:36
 **/
@Service
public class InstructorServiceImpl implements InstructorService {

    @Autowired
    private InstructorMapper instructorMapper;

    @Override
    public List<Score> getBydept(String deptId) {
        return instructorMapper.selectBydept(deptId);
    }

    @Override
    public List<Score> getBydeptPage(String deptId, Integer offset, Integer pageSize) {
        return instructorMapper.selectBydeptPage(deptId,offset,pageSize);
    }

    @Override
    public List<Score> getScoreByCourseName(String deptId,String courseName) {
        return instructorMapper.selectScoreByCourseName(deptId,courseName);
    }

    @Override
    public Integer getNumBydept(String deptId) {
        return instructorMapper.selectNumBydept(deptId);
    }

    @Override
    public List<Score> getScoreByCode(String code) {
        return instructorMapper.selectScoreByCode(code);
    }

    @Override
    public Integer addScore(Score score) {
        return instructorMapper.insertScore(score);
    }

    @Override
    public Integer deleteScore(String code, String courseName) {
        return instructorMapper.deleteScoreBycodeAndcourseName(code,courseName);
    }

    @Override
    public Integer updateScore(Score score) {
        return instructorMapper.updateScoreByid(score);
    }
}

