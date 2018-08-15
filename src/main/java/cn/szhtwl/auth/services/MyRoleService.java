package cn.szhtwl.auth.services;

import cn.szhtwl.base.baseService;
import cn.szhtwl.auth.bean.MyRole;
import cn.szhtwl.dto.ResponseDto;

/**
 * Created by 宁采臣丶 on 2017/9/27.
 */
public interface MyRoleService extends baseService<MyRole> {
    /**
     * 根据用户id查询其具有的角色
     */
    ResponseDto selectAllRoleByUserId(String userId);

    ResponseDto selectAllToPage();

    ResponseDto add(MyRole myRole,String ids);
}
