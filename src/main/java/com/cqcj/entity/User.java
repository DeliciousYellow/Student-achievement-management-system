package com.cqcj.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;


@Data
@AllArgsConstructor
@NoArgsConstructor
public class User {
    private Integer id;
    private String code;
    private String name;
    private String pwd;
    private Integer sex;
    private String email;
    private String deptId;
    private String deptName;
    private String imgPath;
}
