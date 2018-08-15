package cn.szhtwl.tz.dao;


import cn.szhtwl.tz.bean.MyInvitation;
import cn.szhtwl.tz.bean.MyInvitationExample;
import org.apache.ibatis.annotations.Param;
import org.springframework.web.bind.annotation.PathVariable;

import java.util.List;

public interface MyInvitationMapper {
    long countByExample(MyInvitationExample example);

    int deleteByExample(MyInvitationExample example);

    int deleteByPrimaryKey(String id);

    int insertLable4In(@Param("iId")String iId,@Param("lId")String lId);

    int insert(MyInvitation record);

    int insertSelective(MyInvitation record);

    List<MyInvitation> selectByExample(MyInvitationExample example);

    MyInvitation selectByPrimaryKey(String id);

    int updateByExampleSelective(@Param("record") MyInvitation record, @Param("example") MyInvitationExample example);

    int updateByExample(@Param("record") MyInvitation record, @Param("example") MyInvitationExample example);

    int updateByPrimaryKeySelective(MyInvitation record);

    int updateByPrimaryKey(MyInvitation record);

    int deleteLabelsById(String id);
}