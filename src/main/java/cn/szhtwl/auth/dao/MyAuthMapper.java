package cn.szhtwl.auth.dao;

import cn.szhtwl.auth.bean.MyAuth;
import cn.szhtwl.auth.bean.MyAuthExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface MyAuthMapper {
    long countByExample(MyAuthExample example);

    int deleteByExample(MyAuthExample example);

    int deleteByPrimaryKey(String id);

    int insert(MyAuth record);

    int insertSelective(MyAuth record);

    /**
     * 查询所有需要权限才能访问的URL
     * @return
     */
    List<String> selectAllToUrl();

    /**
     * 查询所有权限简码以供赋予权限
     * @return
     */
    List<String> selectAllToCode();
    /**
     * 通过角色Id查询所有权限
     * @param roleId
     * @return
     */
    List<MyAuth> selectAllAuthByRoleId(String roleId);

    List<MyAuth> selectByExample(MyAuthExample example);

    MyAuth selectByPrimaryKey(String id);

    int updateByExampleSelective(@Param("record") MyAuth record, @Param("example") MyAuthExample example);

    int updateByExample(@Param("record") MyAuth record, @Param("example") MyAuthExample example);

    int updateByPrimaryKeySelective(MyAuth record);

    int updateByPrimaryKey(MyAuth record);

    int deleteR4auth(String id);
}