package cn.szhtwl.auth.bean;

import java.util.List;

public class MyRole {
    private String id;  //角色ID

    private String name;  //角色名

    private String roleCode; //角色简码

    private String description; //角色解释

    private List<MyAuth> myAuthList; //该角色所拥有的所有权限

    private List<MyUser> myUserList; //该角色所对应的所有用户

    public MyRole(){}

    public MyRole(String id, String name, String roleCode, String description, List<MyAuth> myAuthList, List<MyUser> myUserList) {
        this.id = id;
        this.name = name;
        this.roleCode = roleCode;
        this.description = description;
        this.myAuthList = myAuthList;
        this.myUserList = myUserList;
    }

    public List<MyAuth> getMyAuthList() {
        return myAuthList;
    }

    public void setMyAuthList(List<MyAuth> myAuthList) {
        this.myAuthList = myAuthList;
    }

    public List<MyUser> getMyUserList() {
        return myUserList;
    }

    public void setMyUserList(List<MyUser> myUserList) {
        this.myUserList = myUserList;
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

    public String getRoleCode() {
        return roleCode;
    }

    public void setRoleCode(String roleCode) {
        this.roleCode = roleCode == null ? null : roleCode.trim();
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description == null ? null : description.trim();
    }
}