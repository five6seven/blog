package cn.szhtwl.auth.services;

import cn.szhtwl.base.baseService;
import cn.szhtwl.auth.bean.MyAuth;
import cn.szhtwl.dto.ResponseDto;

/**
 * 权限服务接口
 * Created by 宁采臣丶 on 2017/9/26.
 */
public interface MyAuthService extends baseService<MyAuth> {

    /**
     * 查询所有菜单项权限
     * @return
     */
    ResponseDto  selectAlltoMenu();

    ResponseDto selectAllToShiro();

    /**
     * 根据角色Id查询其拥有的所有权限
     * @param roleId
     * @return
     */
    ResponseDto selectAllAuthByRoleId(String roleId);

    public ResponseDto selectTopList();
}
