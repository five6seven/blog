package cn.szhtwl.tz.dao;


import cn.szhtwl.tz.bean.MyType;
import cn.szhtwl.tz.bean.MyTypeExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface MyTypeMapper {
    long countByExample(MyTypeExample example);

    int deleteByExample(MyTypeExample example);

    int deleteByPrimaryKey(String id);

    int insert(MyType record);

    int insertSelective(MyType record);

    List<MyType> selectByExample(MyTypeExample example);

    MyType selectByPrimaryKey(String id);

    int updateByExampleSelective(@Param("record") MyType record, @Param("example") MyTypeExample example);

    int updateByExample(@Param("record") MyType record, @Param("example") MyTypeExample example);

    int updateByPrimaryKeySelective(MyType record);

    int updateByPrimaryKey(MyType record);
}