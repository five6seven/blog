package cn.szhtwl.tz.bean;

import java.util.Date;

public class MyInvitation {
    private String id;

    private String title;

    private String subContext;

    private String context;

    private Integer status;

    private Date createTime;

    private String img;

    private Integer uNumber;

    private Integer uPraise;

    private MyLabels myLabels;

    public MyLabels getMyLabels() {
        return myLabels;
    }

    public void setMyLabels(MyLabels myLabels) {
        this.myLabels = myLabels;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title == null ? null : title.trim();
    }

    public String getSubContext() {
        return subContext;
    }

    public void setSubContext(String subContext) {
        this.subContext = subContext == null ? null : subContext.trim();
    }

    public String getContext() {
        return context;
    }

    public void setContext(String context) {
        this.context = context == null ? null : context.trim();
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img == null ? null : img.trim();
    }

    public Integer getuNumber() {
        return uNumber;
    }

    public void setuNumber(Integer uNumber) {
        this.uNumber = uNumber;
    }

    public Integer getuPraise() {
        return uPraise;
    }

    public void setuPraise(Integer uPraise) {
        this.uPraise = uPraise;
    }

}