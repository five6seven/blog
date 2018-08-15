package cn.szhtwl.tz.dao;


import cn.szhtwl.tz.bean.MyNode;
import cn.szhtwl.tz.bean.MyNodeExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface MyNodeMapper {
    long countByExample(MyNodeExample example);

    int deleteByExample(MyNodeExample example);

    int deleteByPrimaryKey(String id);

    int insert(MyNode record);

    int insertSelective(MyNode record);

    List<MyNode> selectByExample(MyNodeExample example);

    MyNode selectByPrimaryKey(String id);

    int updateByExampleSelective(@Param("record") MyNode record, @Param("example") MyNodeExample example);

    int updateByExample(@Param("record") MyNode record, @Param("example") MyNodeExample example);

    int updateByPrimaryKeySelective(MyNode record);

    int updateByPrimaryKey(MyNode record);
}