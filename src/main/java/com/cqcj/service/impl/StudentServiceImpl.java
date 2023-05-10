package com.cqcj.service.impl;

import com.cqcj.entity.Score;
 import com.cqcj.mapper.StudentMapper;
import com.cqcj.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @program: SSMtest1
 * @description:
 * @author: 王炸！！
 * @create: 2022-12-16 19:36
 **/
@Service
public class StudentServiceImpl implements StudentService {

    @Autowired
    private StudentMapper studentMapper;

    @Override
    public List<Score> getBycode(String code) {
        return studentMapper.selectBycode(code);
    }

    @Override
    public List<Score> getBycodePage(String code, Integer offset, Integer pageSize) {
        List<Score> list = studentMapper.selectBycodePage(code, offset, pageSize);
        return list;
    }

    @Override
    public Integer getNumByCode(String code){
        return studentMapper.selectNumByCode(code);
    }

    @Override
    public List<Score> getFailByCode(String Code) {
        return studentMapper.selectFailByCode(Code);
    }

    @Override
    public List<Score> getExcellentByCode(String Code) {
        return studentMapper.selectExcellentByCode(Code);
    }
}
