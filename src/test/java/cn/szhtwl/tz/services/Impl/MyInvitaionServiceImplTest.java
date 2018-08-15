package cn.szhtwl.tz.services.Impl;

import cn.szhtwl.tz.bean.MyInvitation;
import cn.szhtwl.tz.services.IMyInvitaionService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.UUID;

import static org.junit.Assert.*;

/**
 * Created by 宁采臣丶 on 2017/10/22.
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:spring/*.xml"})
public class MyInvitaionServiceImplTest {

    @Autowired
    IMyInvitaionService  myInvitaionService;
    @Test
    public void add() throws Exception {
        MyInvitation myInvitation = new MyInvitation();
        myInvitation.setTitle("sfsa");
        myInvitation.setSubContext("asdf");
        myInvitation.setContext("sdfsf");
        myInvitaionService.add(myInvitation,"3308334071014ecfa8f584317d71115a");
    }

}