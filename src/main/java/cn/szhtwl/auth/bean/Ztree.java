package cn.szhtwl.auth.bean;

import java.util.List;

/**
 * Created by 宁采臣丶 on 2017/10/20.
 */
public class Ztree {
    private String id;

    private String name;

    private List<Ztree> children;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public List<Ztree> getChildren() {
        return children;
    }

    public void setChildren(List<Ztree> children) {
        this.children = children;
    }

    public Ztree(String id, String name, List<Ztree> children) {
        this.id = id;
        this.name = name;
        this.children = children;
    }

    public String getId() {

        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public Ztree(){}

}
