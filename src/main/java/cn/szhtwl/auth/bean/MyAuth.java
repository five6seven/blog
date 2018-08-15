package cn.szhtwl.auth.bean;

import com.fasterxml.jackson.annotation.JsonBackReference;

import java.util.List;

/**
 * 权限类
 */
public class MyAuth {
    private String id;   //权限ID UUID

    private String name;  //权限名称

    private String authCode; //权限简码

    private String url;  //权限URL

    private MyAuth myAuth;  //父权限

    private List<MyAuth> myAuthList; //子权限列表

    private List<MyRole> myRoleList; //该权限所对应的所有角色

    private Integer ocode; //菜单排序 默认为0

    private Integer ismenu; //是否为菜单

    public MyAuth(){}

    /**
     * 添加权限构造方法
     * @param id
     * @param name
     * @param authCode
     * @param url
     * @param myAuth
     * @param ocode
     * @param ismenu
     */
    public MyAuth(String id, String name, String authCode, String url, MyAuth myAuth, Integer ocode, Integer ismenu) {
        this.id = id;
        this.name = name;
        this.authCode = authCode;
        this.url = url;
        this.myAuth = myAuth;
        this.ocode = ocode;
        this.ismenu = ismenu;
    }

    public MyAuth(String id, String name, String authCode, String url, MyAuth myAuth, List<MyAuth> myAuthList, List<MyRole> myRoleList, Integer ocode, Integer ismenu) {
        this.id = id;
        this.name = name;
        this.authCode = authCode;
        this.url = url;
        this.myAuth = myAuth;
        this.myAuthList = myAuthList;
        this.myRoleList = myRoleList;
        this.ocode = ocode;
        this.ismenu = ismenu;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id==null?null:id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name==null?null:name;
    }

    public String getAuthCode() {
        return authCode;
    }

    public void setAuthCode(String authCode) {
        this.authCode = authCode==null?null:authCode;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url==null?null:url;
    }

    public MyAuth getMyAuth() {
        return myAuth;
    }

    public void setMyAuth(MyAuth myAuth) {
        this.myAuth = myAuth==null?null:myAuth;
    }

    public List<MyAuth> getMyAuthList() {
        return myAuthList;
    }

    public void setMyAuthList(List<MyAuth> myAuthList) {
        this.myAuthList = myAuthList;
    }

    public Integer getOcode() {
        return ocode;
    }

    public void setOcode(Integer ocode) {
        this.ocode = ocode==null?null:ocode;
    }

    public Integer getIsmenu() {
        return ismenu;
    }

    public void setIsmenu(Integer ismenu) {
        this.ismenu = ismenu==null?null:ismenu;
    }

}