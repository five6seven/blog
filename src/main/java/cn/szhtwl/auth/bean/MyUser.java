package cn.szhtwl.auth.bean;

import java.util.Date;
import java.util.List;

public class MyUser {
    private String id; //用户ID

    private String name; //昵称

    private String loginName; //登录名

    private String password; //密码

    private Date createTime; //创建时间

    private Date loginTime;  //登录时间

    private List<MyRole> roleList; //该用户所拥有的所有角色

    public MyUser(){}

    public MyUser(String id, String loginName, String password, Date loginTime, List<MyRole> roleList) {
        this.id = id;
        this.loginName = loginName;
        this.password = password;
        this.loginTime = loginTime;
        this.roleList = roleList;
    }

    public MyUser(String id, String name, String loginName, String password, Date createTime, Date loginTime, List<MyRole> roleList) {
        this.id = id;
        this.name = name;
        this.loginName = loginName;
        this.password = password;
        this.createTime = createTime;
        this.loginTime = loginTime;
        this.roleList = roleList;
    }

    public List<MyRole> getRoleList() {
        return roleList;
    }

    public void setRoleList(List<MyRole> roleList) {
        this.roleList = roleList;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public String getLoginName() {
        return loginName;
    }

    public void setLoginName(String loginName) {
        this.loginName = loginName == null ? null : loginName.trim();
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password == null ? null : password.trim();
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Date getLoginTime() {
        return loginTime;
    }

    public void setLoginTime(Date loginTime) {
        this.loginTime = loginTime;
    }

    /**
     * 判断用户是否具有访问该URL的权限
     * @param url
     * @return
     */
    public boolean checkAuthByUrl(String url){
        if(isAdmin()){
            return  true;
        }
        if(roleList.size()>0){
            for(MyRole myRole:roleList){
                if(myRole.getMyAuthList().size()>0) {
                    for (MyAuth myAuth : myRole.getMyAuthList()) {
                        if (myAuth.getUrl().equals(url)) {
                            return true;
                        }
                    }
                }else{
                    return false;
                }
            }
        }
        return false;
    }

    /**
     * 判断用户是否拥有访问该权限名的权限
     * @param name
     * @return
     */
    public boolean checkAuthByName(String name){
        if(isAdmin()){
            return  true;
        }
        if(roleList.size()>0){
            for(MyRole myRole:roleList){
                if(myRole.getMyAuthList().size()>0) {
                    for (MyAuth myAuth : myRole.getMyAuthList()) {
                        if (myAuth.getName().equals(name)) {
                            return true;
                        }
                    }
                }else{
                    return false;
                }
            }
        }
        return false;
    }

    /**
     * 判断用户是否为内置超级用户
     */
    public boolean isAdmin(){
        return "admin".equals(loginName);
    }
}