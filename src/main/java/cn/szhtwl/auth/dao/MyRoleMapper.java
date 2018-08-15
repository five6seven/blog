package cn.szhtwl.auth.dao;


import cn.szhtwl.auth.bean.MyRole;
import cn.szhtwl.auth.bean.MyRoleExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface MyRoleMapper {
    long countByExample(MyRoleExample example);

    int deleteByExample(MyRoleExample example);

    int deleteByPrimaryKey(String id);

    int insert(MyRole record);

    int insertSelective(MyRole record);

    /**
     * 根据用户Id查询其所有的角色
     * @param userId
     * @return
     */
    List<MyRole> selectAllRoleByUserId(String userId);

    List<MyRole> selectByExample(MyRoleExample example);

    MyRole selectByPrimaryKey(String id);

    int updateByExampleSelective(@Param("record") MyRole record, @Param("example") MyRoleExample example);

    int updateByExample(@Param("record") MyRole record, @Param("example") MyRoleExample example);

    int updateByPrimaryKeySelective(MyRole record);

    int updateByPrimaryKey(MyRole record);

    int inserAuth(@Param("rId") String rId,@Param("aId") String aId);

    int deleteAuthsByRole(String id);
}