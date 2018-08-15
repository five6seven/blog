package cn.szhtwl.auth.services;

import cn.szhtwl.base.baseService;
import cn.szhtwl.auth.bean.MyUser;
import cn.szhtwl.dto.ResponseDto;

/**
 * Created by 宁采臣丶 on 2017/9/28.
 */
public interface MyUserService extends baseService<MyUser> {
    /**
     * 用户登录方法
     * @param myUser
     * @return
     */
    ResponseDto login(MyUser myUser);

    ResponseDto add(MyUser myUser,String[] rid);

    ResponseDto update(MyUser myUser,String[] rid);

    ResponseDto checkName(String name);
}
