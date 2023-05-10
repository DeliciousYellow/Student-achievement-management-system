package com.cqcj.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @program: SSM
 * @description:
 * @author: 王炸！！
 * @create: 2022-12-23 20:58
 **/
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Dept {
    private Integer id;
    private String deptCode;
    private String deptName;
}
