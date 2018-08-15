<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core_1_1" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
        <div class="tab-content">
            <div class="check-div form-inline">
                <div class="col-xs-3">
                    <button class="btn btn-yellow btn-xs" data-toggle="modal" data-target="#addNode">添加标签</button>
                </div>
            </div>
            <div class="data-div">
                <shiro:hasPermission name="inManager_select">
                    <table class="table table-hover" id="mytable">
                        <thead>
                        <tr>
                            <th>ID</th>
                            <th>标签名</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${pageUtil.data}" var="ds">
                            <tr>
                                <td>${ds.id}</td>
                                <td>${ds.name}</td>
                                <td>
                                    <button class='btn btn-success btn-xs' id="${ds.id}" data-toggle='modal' data-target='#updateLabel' onclick='revise()'>修改</button>
                                    <button class='btn btn-danger btn-xs' id="${ds.id}" onclick='remove()'>删除</button>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </shiro:hasPermission>
            </div>
            <!--弹出添加标签窗口-->
            <div class="modal fade" id="addNode" role="dialog" aria-labelledby="gridSystemModalLabel">
                <div class="modal-dialog" role="document" style="width: 850px">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                            <h4 class="modal-title" id="gridSystemModalLabel">添加标签</h4>
                        </div>
                        <div class="modal-body">
                            <div class="container-fluid">
                                <form class="form-horizontal" action="<%=request.getContextPath()%>/labelManager/add.jhtml" method="post">
                                    <div class="form-group ">
                                        <label class="col-xs-3 control-label">标签名：</label>
                                        <div class="col-xs-8 ">
                                            <input type="text" class="form-control input-sm duiqi" name="name">
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-xs btn-white" data-dismiss="modal">取 消</button>
                                        <button type="submit" class="btn btn-xs btn-green">保 存</button>
                                    </div>
                                </form>
                            </div>
                        </div>

                    </div>
                    <!-- /.modal-content -->
                </div>
                <!-- /.modal-dialog -->
            </div>
            <!-- /.modal -->
        </div>
    </div>
</div>
<script>
    //删除
    function remove(){
        var flag = confirm('您确定要删除该标签吗？');
        var id = event.srcElement.id;
        if(flag){
            $.post('<%=request.getContextPath()%>/labelManager/'+id+'/remove.jhtml',function (data) {
                if(data.code==200){
                    alert('删除成功!');
                    window.location.replace("<%=request.getContextPath()%>/labelManager/home.jhtml");
                }
            })
        }
    }
</script>
</body>
</html>