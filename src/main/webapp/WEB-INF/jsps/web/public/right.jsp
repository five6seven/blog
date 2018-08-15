<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<style>
    li{
        list-style:none;
    }
    li a{
        color: #d1ff70;
    }
</style>
<div class="row clearfix col-md-2 col-xs-2 col-sm-2">
    <div>
        <h3>学习标签</h3><hr />
        <div class="row clearfix">
            <div class="col-md-12 col-xs-12 col-sm-12 column">
                <c:forEach items="${labels.data}" var="label">
                    <div class="btn-group btn-group-md" style="width: 100%">
                        <a href="#"><button class="btn btn-primary btn-sm" type="button">${label.name}&nbsp;&nbsp;&nbsp;<span class="badge pull-right">42</span></button></a>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>
    <div>
        <h3>热门文章<hr/></h3>
        <ul>
            <c:forEach items="${hots.data}" var="in">
                <li>
                    <a href="<%=request.getContextPath()%>/page/${in.id}/context.jhtml">${in.title}</a>
                </li>
            </c:forEach>
        </ul>
    </div>
    <div>
        <h3>友情链接</h3><hr />
        <ul>
            <li>
                <a href="www.baidu.com">百度</a>
            </li>
            <li>
                <a href="www.baidu.com">腾讯</a>
            </li>
            <li>
                <a href="www.baidu.com">阿里巴巴</a>
            </li>
            <li>
                <a href="www.baidu.com">谷歌</a>
            </li>
            <li>
                <a href="http://www.wellch4n.com/">陈卓越和猫</a>
            </li>
        </ul>
    </div>
</div>
