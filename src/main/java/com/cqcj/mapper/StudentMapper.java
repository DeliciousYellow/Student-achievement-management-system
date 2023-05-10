package com.cqcj.mapper;

import com.cqcj.entity.Score;
import com.cqcj.entity.User;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @program: SSMtest1
 * @description:
 * @author: 王炸！！
 * @create: 2022-12-16 19:20
 **/
@Mapper
public interface StudentMapper {

    List<Score> selectBycode(String code);
    List<Score> selectBycodePage(@Param("code") String code,@Param("offset") Integer offset,@Param("pageSize") Integer pageSize);
    Integer selectNumByCode(String code);
    List<Score> selectFailByCode(String Code);
    List<Score> selectExcellentByCode(String Code);
}
