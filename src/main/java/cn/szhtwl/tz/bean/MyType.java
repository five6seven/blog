package cn.szhtwl.tz.bean;

public class MyType {
    private String id;

    private String name;

    private Integer ocode;

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

    public Integer getOcode() {
        return ocode;
    }

    public void setOcode(Integer ocode) {
        this.ocode = ocode;
    }
}