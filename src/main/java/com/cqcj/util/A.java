package com.cqcj.util;

import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.testng.annotations.BeforeClass;
import org.apache.ibatis.io.Resources;

import java.io.Reader;

public class A {

    public static SqlSessionFactory sqlSessionFactory;

    @BeforeClass
    public static void init() {
        //得到配置文件，在生成sqlSessionFactory
        try {
            Reader reader = Resources.getResourceAsReader("mybatis-config.xml");
            sqlSessionFactory = new SqlSessionFactoryBuilder().build(reader);
            reader.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
