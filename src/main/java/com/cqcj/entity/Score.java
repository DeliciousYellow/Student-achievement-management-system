package com.cqcj.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @program: SSMtest1
 * @description:
 * @author: 王炸！！
 * @create: 2022-12-16 19:25
 **/
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Score {
    private Integer id;
    private String code;
    private String courseName;
    private Double score;
    private Integer semester;
    private String name;
}
