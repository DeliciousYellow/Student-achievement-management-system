package com.cqcj.service;

import com.cqcj.entity.Dept;
import com.cqcj.entity.Score;
import com.cqcj.entity.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface AdminService {

    List<Score> getScoreAll();

    List<Score> getScoreAllPage(Integer offset,Integer pageSize);

    Integer getScoreNum();

    List<User> getAllUser();

    List<User> getUserPage(@Param("offset") Integer offset, @Param("pageSize") Integer pageSize);

    Integer getNumUser();

    Integer resetPwd(String code);

    Integer addDept(Dept dept);

    List<Dept> getDept();

    Integer addUser(User user);

    Integer updateUser(User user);
}
