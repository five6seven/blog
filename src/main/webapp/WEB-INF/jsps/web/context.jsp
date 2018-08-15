<%@ taglib prefix="f.mt" uri="http://java.sun.com/jstl/fmt_rt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="public/staticSource.jsp"></jsp:include>
</head>
<body>
<div class="container">
    <div class="row clearfix">
        <div class="col-md-12 col-xs-12 col-sm-12  column">
            <jsp:include page="public/header.jsp"></jsp:include>
            <div class="row clearfix col-md-8 col-xs-8 col-sm-8">
               <h2>${in.data.title}</h2><br/>
                <small>
                    <span class="text-left"><span class="glyphicon glyphicon-list-alt"></span> &nbsp;&nbsp;标签名</span>
                    <span class="text-right"><span class="glyphicon glyphicon-time"></span>&nbsp;&nbsp;<f.mt:formatDate value="${in.data.createTime}" pattern="yyyy/MM/dd"/></span>
                    <span class="text-right"><span class="glyphicon glyphicon-eye-open"></span>&nbsp;&nbsp;${in.data.uNumber}</span>
                </small>
                <br/>
                <br/>
                <p>
                    ${in.data.context}
                </p>
            </div>
            <div class="row clearfix col-md-2 col-xs-2 col-sm-2 "></div>
            <jsp:include page="public/right.jsp"></jsp:include>
        </div>
    </div>
</div>
<hr />
<jsp:include page="public/button.jsp"></jsp:include>
</body>
</html>
