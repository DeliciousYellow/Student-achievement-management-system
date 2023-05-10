package com.cqcj.mapper;

import com.cqcj.entity.User;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface UserMapper {

    User selectByName(String name);
    User selectByCode(String code);
    Integer insertUser(User user);
    Integer deleteById(int id);
    Integer updateUser(User user);

    Integer resetPwd(String code);
    User selectById(int id);
    List<User> selectAll();

    List<User> selectUserPage(@Param("offset") Integer offset,@Param("pageSize") Integer pageSize);

    Integer selectNumUser();
    void updatePersonal(@Param("code") String code,@Param("password") String password,@Param("email") String email,@Param("imgPath")String imgPath);
    String selectDeptByCode(String code);
}
