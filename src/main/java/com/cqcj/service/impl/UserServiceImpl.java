package com.cqcj.service.impl;

import com.cqcj.entity.User;
import com.cqcj.mapper.UserMapper;
import com.cqcj.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @program: SSM
 * @description:
 * @author: 王炸！！
 * @create: 2022-12-10 12:04
 **/
@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserMapper userMapper;

    public boolean login(String code,String password){
        User user = userMapper.selectByCode(code);
        if (user != null && user.getPwd().equals(password)){
            return true;
        }
        return false;
    }

    @Override
    public int insertUser(User user) {
        return userMapper.insertUser(user);
    }

    @Override
    public int deleteById(int id) {
        return userMapper.deleteById(id);
    }

    @Override
    public int updateUser(User user) {
        return userMapper.updateUser(user);
    }

    @Override
    public User getById(int id) {
        return userMapper.selectById(id);
    }

    @Override
    public User getByName(String name){
        return userMapper.selectByName(name);
    }

    @Override
    public User getByCode(String code){
        return userMapper.selectByCode(code);
    }

    @Override
    public List<User> getAll() {
        return userMapper.selectAll();
    }

    @Override
    public void updatePersonal(String code, String password, String email,String imgPath) {
        userMapper.updatePersonal(code,password,email,imgPath);
    }

    @Override
    public String getDeptByCode(String code) {
        return userMapper.selectDeptByCode(code);
    }
}
