package cn.szhtwl.utils;

import java.util.List;

/**
 * Created by Administrator on 2017/7/22.
 */
public class PageUtil {
    private List<?> pageList;
    private Integer begin;  //开始行
    private Integer allPage; //总页数
    private Integer allSize;

    public PageUtil() {
    }

    public void setSize(Integer size,Integer showPage,Integer allSize){
        this.allPage = (allSize%size)==0?allSize/size:allSize/size+1;
        showPage=showPage>1?showPage:1;
        showPage=showPage<=allPage?showPage:allPage;
        this.begin = (showPage-1)*size;
        this.allSize = allSize;
    }

    public List<?> getPageList() {
        return pageList;
    }

    public void setPageList(List<?> pageList) {
        this.pageList = pageList;
    }

    public Integer getBegin() {
        return begin;
    }

    public Integer getAllPage() {
        return allPage;
    }

    public Integer getAllSize() {
        return allSize;
    }

}
