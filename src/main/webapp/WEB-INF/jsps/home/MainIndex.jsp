<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="ch">
    <head>
        <%@include file="../public/StaticResource.jsp"%>
    </head>
<body>
    <div id="wrap">
        <!-- 左侧菜单栏 -->
        <jsp:include page="../public/Left.jsp"></jsp:include>
        <!-- 右侧具体内容栏目 -->
        <div id="rightContent">
            <a class="toggle-btn" id="nimei">
                <i class="glyphicon glyphicon-align-justify"></i>
            </a>
            <!-- Tab panes -->
            <div class="tab-content">
                <!-- 修改密码模块 -->
                <div role="tabpanel" class="tab-pane" id="chan">
                    <div class="check-div">
                        原始密码为12312313
                    </div>
                    <div style="padding: 50px 0;margin-top: 50px;background-color: #fff; text-align: right;width: 420px;margin: 50px auto;">
                        <form class="form-horizontal">
                            <div class="form-group">
                                <label for="sKnot" class="col-xs-4 control-label">原密码：</label>
                                <div class="col-xs-5">
                                    <input type="" class="form-control input-sm duiqi" id="sKnot" placeholder="" style="margin-top: 7px;">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="sKnot" class="col-xs-4 control-label">新密码：</label>
                                <div class="col-xs-5">
                                    <input type="" class="form-control input-sm duiqi" id="sKnot" placeholder="" style="margin-top: 7px;">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="sKnot" class="col-xs-4 control-label">重复密码：</label>
                                <div class="col-xs-5">
                                    <input type="" class="form-control input-sm duiqi" id="sKnot" placeholder="" style="margin-top: 7px;">
                                </div>
                            </div>
                            <div class="form-group text-right">
                                <div class="col-xs-offset-4 col-xs-5" style="margin-left: 169px;">
                                    <button type="reset" class="btn btn-xs btn-white">取 消</button>
                                    <button type="submit" class="btn btn-xs btn-green">保存</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
<script>
    $(function() {
        $(".meun-item").click(function() {
            $(".meun-item").removeClass("meun-item-active");
            $(this).addClass("meun-item-active");
            var itmeObj = $(".meun-item").find("img");
            itmeObj.each(function() {
                var items = $(this).attr("src");
                items = items.replace("_grey.png", ".png");
                items = items.replace(".png", "_grey.png");
                $(this).attr("src", items);
            });
            var attrObj = $(this).find("img").attr("src");
            attrObj = attrObj.replace("_grey.png", ".png");
            $(this).find("img").attr("src", attrObj);
        });
        $("#topAD").click(function() {
            $("#topA").toggleClass(" glyphicon-triangle-right");
            $("#topA").toggleClass(" glyphicon-triangle-bottom");
        });
        $("#topBD").click(function() {
            $("#topB").toggleClass(" glyphicon-triangle-right");
            $("#topB").toggleClass(" glyphicon-triangle-bottom");
        });
        $("#topCD").click(function() {
            $("#topC").toggleClass(" glyphicon-triangle-right");
            $("#topC").toggleClass(" glyphicon-triangle-bottom");
        });
        $(".toggle-btn").click(function() {
            $("#leftMeun").toggleClass("show");
            $("#rightContent").toggleClass("pd0px");
        })
    })
</script>
</html>