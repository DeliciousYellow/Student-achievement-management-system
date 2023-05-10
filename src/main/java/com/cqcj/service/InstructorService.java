package com.cqcj.service;

import com.cqcj.entity.Score;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface InstructorService {

    List<Score> getBydept(String deptId);
    List<Score> getBydeptPage(String deptId,Integer offset,Integer pageSize);
    Integer getNumBydept(String deptId);

    List<Score> getScoreByCode(String code);
    List<Score> getScoreByCourseName(String deptId,String courseName);
    Integer addScore(Score score);
    Integer deleteScore(String code,String courseName);
    Integer updateScore(Score score);
}
