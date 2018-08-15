<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <jsp:include page="public/staticSource.jsp"></jsp:include>
</head>
<body>
<div class="container">
    <div class="row clearfix">
        <div class="col-md-12 col-xs-12 col-sm-12 column">
            <jsp:include page="public/header.jsp"></jsp:include>
            <div class="row clearfix col-md-8 col-xs-8 col-sm-8">
                <c:forEach items="${pageUtil.data.list}" var="c">
                    <div class="column ">
                        <h3>
                            ${c.title}&nbsp;&nbsp;&nbsp;
                                <c:if test="${c.status == 2}">
                                    <img src="<%=request.getContextPath()%>/resources/img/hot.jpg" alt="热门"/>
                                </c:if>
                        </h3>
                        <small>
                            <span class="text-left"><span class="glyphicon glyphicon-list-alt"></span> &nbsp;&nbsp;${c.myLabels.name}</span>
                            <span class="text-right"><span class="glyphicon glyphicon-time"></span>&nbsp;&nbsp;<fmt:formatDate value="${c.createTime}" pattern="yyyy/MM/dd"/></span>
                            <span class="text-right"><span class="glyphicon glyphicon-eye-open"></span>&nbsp;&nbsp;${c.uNumber}</span>
                        </small>
                        <div class="media">
                            <a href="#" class="pull-left">
                                <c:choose>
                                    <c:when test="${c.img!=null}">
                                        <img src="<%=request.getContextPath()%>/resources/images/pictures/${c.img}" style="width: 100px;height: 100px;"></a>
                                    </c:when>
                                    <c:otherwise>
                                        <img src="<%=request.getContextPath()%>/resources/img/tiezi.jpg" style="width: 100px;height: 100px;"></a>
                                    </c:otherwise>
                                </c:choose>
                            <div class="media-body">
                                <p>
                                    ${c.subContext}
                                </p>
                                <p class="text-right">
                                    <a class="btn" href="<%=request.getContextPath()%>/page/${c.id}/context.jhtml">阅读全文»</a>
                                </p>
                            </div>
                        </div>
                        <hr />
                    </div>
                </c:forEach>
                <div class="col-md-12 col-xs-12 col-sm-12 column" align="center">
                    <div class="row clearfix">
                        <div class="col-md-10 col-xs-10 col-sm-10 column">
                            <ul class="pagination" id="footer">
                                <li>
                                    <a href="<%=request.getContextPath()%>/page/topical.jhtml?pageNum=${pageUtil.data.firstPage}">First</a>
                                </li>
                                <li>
                                    <a href="<%=request.getContextPath()%>/page/topical.jhtml?pageNum=${pageUtil.data.pageNum-1<0?1:pageUtil.data.pageNum}"><span class="glyphicon glyphicon-arrow-left"></span></a>
                                </li>
                                <c:forEach var="i"  begin="${pageUtil.data.firstPage}" end="${pageUtil.data.lastPage}">
                                   <li>
                                       <a href="<%=request.getContextPath()%>/page/topical.jhtml?pageNum=${i}">${i}</a>
                                   </li>
                                </c:forEach>
                                <li>
                                    <a href="<%=request.getContextPath()%>/page/topical.jhtml?pageNum=${pageUtil.data.pageNum+1>pageUtil.data.pages?pageUtil.data.pages:pageUtil.data.pageNum+1}"><span class="glyphicon glyphicon-arrow-right"></span></a>
                                </li>
                                <li>
                                    <a href="<%=request.getContextPath()%>/page/topical.jhtml?pageNum=${pageUtil.data.lastPage}">Last</a>
                                </li>
                            </ul>
                        </div>
                        <div class="col-md-2 col-xs-2 col-sm-2 column">
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row clearfix col-md-2 col-xs-2 col-sm-2"></div>
        <jsp:include page="public/right.jsp"></jsp:include>
    </div>
</div>
<hr />
<jsp:include page="public/button.jsp"></jsp:include>
</body>
</html>
