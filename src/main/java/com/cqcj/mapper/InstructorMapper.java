package com.cqcj.mapper;

import com.cqcj.entity.Score;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @program: SSMtest1
 * @description:
 * @author: 王炸！！
 * @create: 2022-12-18 13:56
 **/
@Mapper
public interface InstructorMapper {

    List<Score> selectBydept(String deptId);
    List<Score> selectBydeptPage(@Param("deptId") String deptId,@Param("offset") Integer offset,@Param("pageSize") Integer pageSize);
    Integer selectNumBydept(String deptId);

    List<Score> selectScoreByCode(String code);

    List<Score> selectScoreByCourseName(@Param("deptId") String deptId,@Param("courseName") String courseName);

    Integer insertScore(Score score);

    Integer deleteScoreBycodeAndcourseName(@Param("code") String code,@Param("courseName") String courseName);

    Integer updateScoreByid(Score score);
}
