<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="public/staticSource.jsp"></jsp:include>
    <style type="text/css">
        h2.top_title{border-bottom:none;background:none;text-align:center;line-height:32px; font-size:20px}
        h2.top_title span{font-size:12px; color:#666;font-weight:500}
    </style>
</head>
<body>
    <div class="container">
        <div class="row clearfix">
            <div class="col-md-12 col-xs-12 col-sm-12  column">
                <jsp:include page="public/header.jsp"></jsp:include>
                <div class="col-md-11 col-xs-11 col-sm-11">
                    <div class="carousel slide" id="carousel-498131">
                        <ol class="carousel-indicators">
                            <li data-slide-to="0" data-target="#carousel-498131"  class="active">
                            </li>
                            <li data-slide-to="1" data-target="#carousel-498131">
                            </li>
                            <li data-slide-to="2" data-target="#carousel-498131">
                            </li>
                        </ol>
                        <div class="carousel-inner">
                            <div class="item active">
                                <img alt="" src="<%=request.getContextPath()%>/resources/img/0.jpg" />
                                <div class="carousel-caption">
                                    <h4>
                                        First Thumbnail label
                                    </h4>
                                    <p>
                                        Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.
                                    </p>
                                </div>
                            </div>
                            <div class="item">
                                <img alt="" src="<%=request.getContextPath()%>/resources/img/1.jpg" />
                                <div class="carousel-caption">
                                    <h4>
                                        Second Thumbnail label
                                    </h4>
                                    <p>
                                        Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.
                                    </p>
                                </div>
                            </div>
                            <div class="item">
                                <img alt="" src="<%=request.getContextPath()%>/resources/img/2.jpg" />
                                <div class="carousel-caption">
                                    <h4>
                                        Third Thumbnail label
                                    </h4>
                                    <p>
                                        Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.
                                    </p>
                                </div>
                            </div>
                        </div>
                        <a class="left carousel-control" href="#carousel-498131" data-slide="prev"><span class="glyphicon glyphicon-chevron-left"></span></a>
                        <a class="right carousel-control" href="#carousel-498131" data-slide="next"><span class="glyphicon glyphicon-chevron-right"></span></a>
                    </div>
                </div>
                <div class="row clearfix col-md-8 col-xs-8 col-sm-8">
                    <section id="cd-timeline" class="cd-container">
                        <c:forEach items="${pageUtil.data.list}" var="c" varStatus="index">
                            <div class="cd-timeline-block">
                                <c:choose>
                                    <c:when test="${index.index %2==0}">
                                        <div class="cd-timeline-img cd-picture">
                                        <img src="<%=request.getContextPath()%>/resources/img/cd-icon-movie.svg" alt="Picture">
                                    </c:when>
                                    <c:otherwise>
                                        <div class="cd-timeline-img cd-movie">
                                        <img src="<%=request.getContextPath()%>/resources/img/cd-icon-picture.svg" alt="movie">
                                        </c:otherwise>
                                </c:choose>
                                 </div>
                                <div class="cd-timeline-content">
                                    <h2>${c.title}</h2>
                                    <p>
                                        ${c.subContext}
                                    </p>
                                    <p class="text-right">
                                        <a href="<%=request.getContextPath()%>/page/${c.id}/context.jhtml" class="cd-read-more" target="_blank">阅读全文</a>
                                    </p>
                                    <span class="cd-date"><fmt:formatDate value="${c.createTime}" pattern="yyyy/MM/dd"/></span>
                                </div>
                            </div>
                        </c:forEach>
                    </section>
                </div>
                <div class="row clearfix col-md-2 col-xs-2 col-sm-2 "></div>
                <jsp:include page="public/right.jsp"></jsp:include>
            </div>
        </div>
    </div>
</body>
<hr/>
<jsp:include page="public/button.jsp"></jsp:include>
</html>
