<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- 左侧菜单栏目块 -->
<div class="leftMeun" id="leftMeun">
    <div id="logoDiv">
        <p id="logoP"><img id="logo" alt="左右结构项目" src="<%=request.getContextPath()%>/resources/img/timg.jpg"><span>昊天后台管理</span></p>
    </div>
    <div id="personInfor">
        <p>欢迎您&nbsp;&nbsp;&nbsp;<a id="userName">${user.name}</a></p>
    </div>
    <c:forEach items="${menu.myAuthList}" var="auth" varStatus="in">
        <div class="meun-title">${auth.name}</div>
        <c:forEach items="${auth.myAuthList}" var="child">
            <c:if test="${child.authCode!=null}">
            <shiro:hasPermission name="${child.authCode}">
                <div class="meun-item"><a href="<%=request.getContextPath()%>${child.url}.jhtml"><img src="<%=request.getContextPath()%>/resources/img/icon_chara_grey.png">${child.name}</a></div>
            </shiro:hasPermission>
            </c:if>
        </c:forEach>
    </c:forEach>
</div>
