package cn.szhtwl.utils.shiro;

import cn.szhtwl.auth.bean.MyAuth;
import cn.szhtwl.auth.bean.MyRole;
import cn.szhtwl.auth.bean.MyUser;
import cn.szhtwl.auth.bean.MyUserExample;
import cn.szhtwl.auth.dao.MyAuthMapper;
import cn.szhtwl.auth.dao.MyUserMapper;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.*;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthenticatingRealm;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

/**
 * 自定义Realm
 * Created by 宁采臣丶 on 2017/9/28.
 */
public class myRealm extends AuthorizingRealm {

    @Autowired
    MyUserMapper myUserMapper;

    @Autowired
    MyAuthMapper myAuthMapper;
    /**
     * 认证
     * @param token
     * @return
     * @throws AuthenticationException
     */
    protected AuthenticationInfo doGetAuthenticationInfo(//
                        AuthenticationToken token) throws AuthenticationException {
        UsernamePasswordToken usernamePasswordToken = (UsernamePasswordToken) token;
        String username = usernamePasswordToken.getUsername();
        MyUserExample myUserExample  =new MyUserExample();
        MyUserExample.Criteria c = myUserExample.createCriteria();
        c.andLoginNameEqualTo(username);
        List<MyUser> users = myUserMapper.selectByExample(myUserExample);
        //存在该用户名
        if(users.size()>0){
            AuthenticationInfo info = new SimpleAuthenticationInfo(users.get(0),users.get(0).getPassword(),this.getName());
            return info;
        }else{
            return null;
        }
    }
    /**
     * 授权
     * @param principals
     * @return
     */
    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(
            PrincipalCollection principals){
        SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();
        //获取Subject对象
        Subject subject = SecurityUtils.getSubject();
        //获取登录用户
        MyUser myUser = (MyUser) subject.getSession().getAttribute("user");
        //判断是否为内置账户
        if(myUser.isAdmin()){
            info.addStringPermissions(myAuthMapper.selectAllToCode());
        }
        for(MyRole myRole:myUser.getRoleList()){
           List<MyAuth> myAuthList = myAuthMapper.selectAllAuthByRoleId(myRole.getId());
            for(MyAuth myAuth:myAuthList){
                if(myAuth.getAuthCode()!=null){
                    info.addStringPermission(myAuth.getAuthCode());
                }
            }
        }
        return info;
    }
}
