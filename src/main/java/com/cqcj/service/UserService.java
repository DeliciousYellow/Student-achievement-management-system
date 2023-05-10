package com.cqcj.service;

import com.cqcj.entity.User;

import java.util.List;

public interface UserService {

    boolean login(String usercode,String password);
    int insertUser(User user);
    int deleteById(int id);
    int updateUser(User user);
    User getById(int id);
    User getByName(String name);
    User getByCode(String code);
    List<User> getAll();
    void updatePersonal(String code, String password, String email,String imgPath);

    String getDeptByCode(String code);

}
