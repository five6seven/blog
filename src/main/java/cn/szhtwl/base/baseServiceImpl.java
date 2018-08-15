package cn.szhtwl.base;

import cn.szhtwl.auth.dao.MyAuthMapper;
import cn.szhtwl.auth.dao.MyRoleMapper;
import cn.szhtwl.auth.dao.MyUserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by 宁采臣丶 on 2017/9/27.
 */
@Service
public class baseServiceImpl {
    @Autowired
    MyAuthMapper myAuthMapper;
    @Autowired
    MyRoleMapper myRoleMapper;
    @Autowired
    MyUserMapper myUserMapper;


}
