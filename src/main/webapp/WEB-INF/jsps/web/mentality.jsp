<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
   <jsp:include page="public/staticSource.jsp"></jsp:include>
</head>
<body>
<div class="container">
    <div class="row clearfix">
        <div class="col-md-12 col-xs-12 col-sm-12 column">
            <jsp:include page="public/header.jsp"></jsp:include>
            <div class="row clearfix col-md-8 col-xs-8 col-sm-8">
                <div class="bloglist">
                    <section class="main">
                        <ul class="timeline">
                            <c:forEach items="${pageUtil.data.list}" var="c" varStatus="index">
                                <li class="event">
                                    <input type="radio" name="tl-group" <c:if test="${index.index==0}"> checked</c:if>/>
                                    <label></label>
                                    <!--日期-->
                                    <div class="thumb user">
                                        <span><fmt:formatDate value="${c.createTime}" pattern="yyyy/MM/dd"/></span>
                                    </div>
                                    <div class="content-perspective" style="width: 70%">
                                        <div class="content">
                                            <div class="content-inner">
                                                <!--标题名-->
                                                <h3>${c.title}</h3>
                                                <!--内容-->
                                                <p>${c.context}</p>
                                            </div>
                                        </div>
                                    </div>
                                </li>
                            </c:forEach>
                        </ul>
                    </section>
                </div>
                <div class="col-md-12 col-xs-12 col-sm-12 column" align="center">
                    <div class="row clearfix">
                        <div class="col-md-10 col-xs-10 col-sm-10 column">
                            <ul class="pagination" id="footer">
                                <li>
                                    <a href="<%=request.getContextPath()%>/page/mentality.jhtml?pageNum=${pageUtil.data.firstPage}">First</a>
                                </li>
                                <li>
                                    <a href="<%=request.getContextPath()%>/page/mentality.jhtml?pageNum=${pageUtil.data.pageNum-1>0?pageUtil.data.pageNum:1}"><span class="glyphicon glyphicon-arrow-left"></span></a>
                                </li>
                                <c:forEach var="i"  begin="${pageUtil.data.firstPage}" end="${pageUtil.data.lastPage}">
                                    <li>
                                        <a href="<%=request.getContextPath()%>/page/topical.jhtml?pageNum=${i}">${i}</a>
                                    </li>
                                </c:forEach>
                                <li>
                                    <a href="<%=request.getContextPath()%>/page/mentality.jhtml?pageNum=${pageUtil.data.pageNum+1>pageUtil.data.pages?pageUtil.data.pages:pageUtil.data.pageNum+1}"><span class="glyphicon glyphicon-arrow-right"></span></a>
                                </li>
                                <li>
                                    <a href="<%=request.getContextPath()%>/page/mentality.jhtml?pageNum=${pageUtil.data.lastPage}">Last</a>
                                </li>
                            </ul>
                        </div>
                        <div class="col-md-2 col-xs-2 col-sm-2 column">
                        </div>
                    </div>
                </div>
            </div>
            <div class="row clearfix col-md-2 col-xs-2 col-sm-2">
            </div>
            <jsp:include page="public/right.jsp"></jsp:include>
        </div>
    </div>
</div>
<hr />
<jsp:include page="public/button.jsp"></jsp:include>
</body>
</html>