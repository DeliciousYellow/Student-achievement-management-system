package com.cqcj.mapper;

import com.cqcj.entity.Dept;
import com.cqcj.entity.Score;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface AdminMapper {

    List<Score> selectScoreAll();

    List<Score> selectScoreAllPage(@Param("offset") Integer offset,@Param("pageSize") Integer pageSize);

    Integer selectScoreNum();

    Integer insertDept(Dept dept);

    List<Dept> selectDept();
}
