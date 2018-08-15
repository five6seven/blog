package cn.szhtwl.home.dao;


import cn.szhtwl.home.bean.MyHome;
import cn.szhtwl.home.bean.MyHomeExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface MyHomeMapper {
    long countByExample(MyHomeExample example);

    int deleteByExample(MyHomeExample example);

    int deleteByPrimaryKey(String id);

    int insert(MyHome record);

    int insertSelective(MyHome record);

    List<MyHome> selectByExample(MyHomeExample example);

    MyHome selectByPrimaryKey(String  id);

    int updateByExampleSelective(@Param("record") MyHome record, @Param("example") MyHomeExample example);

    int updateByExample(@Param("record") MyHome record, @Param("example") MyHomeExample example);

    int updateByPrimaryKeySelective(MyHome record);

    int updateByPrimaryKey(MyHome record);
}