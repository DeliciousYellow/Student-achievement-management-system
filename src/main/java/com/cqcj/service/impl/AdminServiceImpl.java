package com.cqcj.service.impl;

import com.cqcj.entity.Dept;
import com.cqcj.entity.Score;
import com.cqcj.entity.User;
import com.cqcj.mapper.AdminMapper;
import com.cqcj.mapper.UserMapper;
import com.cqcj.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @program: SSM
 * @description:
 * @author: 王炸！！
 * @create: 2022-12-23 17:36
 **/
@Service
public class AdminServiceImpl implements AdminService {

    @Autowired
    private AdminMapper adminMapper;
    @Autowired
    private UserMapper userMapper;

    @Override
    public List<Score> getScoreAll() {
        return adminMapper.selectScoreAll();
    }

    @Override
    public List<Score> getScoreAllPage(Integer offset, Integer pageSize) {
        return adminMapper.selectScoreAllPage(offset,pageSize);
    }

    @Override
    public Integer getScoreNum() {
        return adminMapper.selectScoreNum();
    }

    @Override
    public List<User> getAllUser() {
        return userMapper.selectAll();
    }

    @Override
    public List<User> getUserPage(Integer offset, Integer pageSize) {
        return userMapper.selectUserPage(offset,pageSize);
    }

    @Override
    public Integer getNumUser() {
        return userMapper.selectNumUser();
    }

    @Override
    public Integer resetPwd(String code) {
        return userMapper.resetPwd(code);
    }

    @Override
    public Integer addDept(Dept dept) {
        return adminMapper.insertDept(dept);
    }

    @Override
    public List<Dept> getDept() {
        return adminMapper.selectDept();
    }

    @Override
    public Integer addUser(User user) {
        return userMapper.insertUser(user);
    }

    @Override
    public Integer updateUser(User user) {
        return userMapper.updateUser(user);
    }
}
