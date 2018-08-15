<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
    <jsp:include page="public/staticSource.jsp"></jsp:include>
<body>
<div class="container">
    <div class="row clearfix">
        <div class="col-md-12 col-xs-12 col-sm-12 column">
            <jsp:include page="public/header.jsp"></jsp:include>
            <div class="row clearfix col-md-8 col-xs-8 col-sm-8">
                <div id="SOHUCS" ></div>
            </div>
            <div class="row clearfix col-md-2 col-xs-2 col-sm-2"></div>
            <jsp:include page="public/right.jsp"></jsp:include>
        </div>
    </div>
</div>
<hr />
<jsp:include page="public/button.jsp"></jsp:include>
<script type="text/javascript">
    (function(){
        var appid = 'cytbNdfXt';
        var conf = 'prod_aa5bc3b75538951e99c319015f3ca6db';
        var width = window.innerWidth || document.documentElement.clientWidth;
        if (width < 960) {
            window.document.write('<script id="changyan_mobile_js" charset="utf-8" type="text/javascript" src="http://changyan.sohu.com/upload/mobile/wap-js/changyan_mobile.js?client_id=' + appid + '&conf=' + conf + '"><\/script>'); } else { var loadJs=function(d,a){var c=document.getElementsByTagName("head")[0]||document.head||document.documentElement;var b=document.createElement("script");b.setAttribute("type","text/javascript");b.setAttribute("charset","UTF-8");b.setAttribute("src",d);if(typeof a==="function"){if(window.attachEvent){b.onreadystatechange=function(){var e=b.readyState;if(e==="loaded"||e==="complete"){b.onreadystatechange=null;a()}}}else{b.onload=a}}c.appendChild(b)};loadJs("http://changyan.sohu.com/upload/changyan.js",function(){window.changyan.api.config({appid:appid,conf:conf})}); } })();
</script>
</body>
</html>

