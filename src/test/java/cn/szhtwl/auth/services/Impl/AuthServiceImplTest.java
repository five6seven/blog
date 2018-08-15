package cn.szhtwl.auth.services.Impl;

import cn.szhtwl.auth.bean.MyAuth;
import cn.szhtwl.auth.services.MyAuthService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

/**
 * Created by 宁采臣丶 on 2017/9/26.
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:spring/*.xml"})
public class AuthServiceImplTest {
    @Autowired
    MyAuthService myAuthService;
    @Test
    public void selectAll() throws Exception {
        myAuthService.selectTopList();
    }

}