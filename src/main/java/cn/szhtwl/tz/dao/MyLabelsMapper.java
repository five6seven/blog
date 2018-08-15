package cn.szhtwl.tz.dao;


import cn.szhtwl.tz.bean.MyLabels;
import cn.szhtwl.tz.bean.MyLabelsExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface MyLabelsMapper {
    long countByExample(MyLabelsExample example);

    int deleteByExample(MyLabelsExample example);

    int deleteByPrimaryKey(String id);

    int insert(MyLabels record);

    int insertSelective(MyLabels record);

    List<MyLabels> selectByExample(MyLabelsExample example);

    MyLabels selectByPrimaryKey(String id);

    int updateByExampleSelective(@Param("record") MyLabels record, @Param("example") MyLabelsExample example);

    int updateByExample(@Param("record") MyLabels record, @Param("example") MyLabelsExample example);

    int updateByPrimaryKeySelective(MyLabels record);

    int updateByPrimaryKey(MyLabels record);
}