package com.cqcj.service;

import com.cqcj.entity.Score;

import java.util.List;

public interface StudentService {
    List<Score> getBycode(String code);
    List<Score> getBycodePage(String code,Integer offset,Integer pageSize);
    Integer getNumByCode(String code);
    List<Score> getFailByCode(String Code);
    List<Score> getExcellentByCode(String Code);
}
