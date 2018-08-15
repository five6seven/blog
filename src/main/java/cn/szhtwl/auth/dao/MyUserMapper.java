package cn.szhtwl.auth.dao;


import cn.szhtwl.auth.bean.MyUser;
import cn.szhtwl.auth.bean.MyUserExample;
import cn.szhtwl.dto.ResponseDto;
import org.apache.ibatis.annotations.Param;
import org.springframework.web.bind.annotation.PathVariable;

import java.util.List;

public interface MyUserMapper {
    long countByExample(MyUserExample example);

    int deleteByExample(MyUserExample example);

    int deleteByPrimaryKey(String id);

    int insert(MyUser record);

    int insertSelective(MyUser record);

    int insertUserToRole(@Param("uid")String uid, @Param("rid")String rid);

    List<MyUser> selectByExample(MyUserExample example);

    MyUser selectByPrimaryKey(String id);

    int updateByExampleSelective(@Param("record") MyUser record, @Param("example") MyUserExample example);

    int updateByExample(@Param("record") MyUser record, @Param("example") MyUserExample example);

    int updateByPrimaryKeySelective(MyUser record);

    int updateByPrimaryKey(MyUser record);

    String checkName(String name);

    int deleteUserToRole(String r);
}