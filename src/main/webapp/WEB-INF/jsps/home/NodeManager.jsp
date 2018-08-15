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
                    <button class="btn btn-yellow btn-xs" data-toggle="modal" data-target="#addNode">添加心得</button>
                </div>
            </div>
            <div class="data-div">
                <shiro:hasPermission name="inManager_select">
                    <table class="table table-hover" id="mytable">
                        <thead>
                        <tr>
                            <th>ID</th>
                            <th>标题</th>
                            <th>内容</th>
                            <th>创建时间</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${pageUtil.data.list}" var="ds">
                            <tr>
                                <td>${ds.id}</td>
                                <td>${ds.title}</td>
                                <td>${ds.context}</td>
                                <td>${ds.createTime}</td>
                                <td>
                                    <button class='btn btn-success btn-xs' id="${ds.id}" data-toggle='modal' data-target='#updateNode' onclick='revise()'>修改</button>
                                    <button class='btn btn-danger btn-xs' id="${ds.id}" onclick='remove()'>删除</button>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </shiro:hasPermission>
            </div>
            <!-- 页码块 -->
            <jsp:include page="../public/footer.jsp"></jsp:include>
            <!--弹出添加心得窗口-->
            <div class="modal fade" id="addNode" role="dialog" aria-labelledby="gridSystemModalLabel">
                <div class="modal-dialog" role="document" style="width: 850px">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                            <h4 class="modal-title" id="gridSystemModalLabel">添加心得</h4>
                        </div>
                        <div class="modal-body">
                            <div class="container-fluid">
                                <form class="form-horizontal" action="<%=request.getContextPath()%>/nodeManager/add.jhtml" method="post">
                                    <div class="form-group ">
                                        <label class="col-xs-3 control-label">心得标题：</label>
                                        <div class="col-xs-8 ">
                                            <input type="text" class="form-control input-sm duiqi" name="title" placeholder="请输入帖子标题">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="sKnot" class="col-xs-3 control-label">心得内容:</label>
                                        <div class="col-xs-8">
                                            <textarea name="context"></textarea>
                                        </div>
                                        <div class="col-xs-1"></div>
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

            <!--弹出修改帖子窗口-->
            <div class="modal fade" id="updateNode" role="dialog" aria-labelledby="gridSystemModalLabel">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                            <h4 class="modal-title" id="gridSystemModalLabel">修改心得信息</h4>
                        </div>
                        <div class="modal-body">
                            <div class="container-fluid">
                                <form class="form-horizontal" action="<%=request.getContextPath()%>/nodeManager/update.jhtml">
                                    <input type="hidden" id="nid" name="id"/>
                                    <div class="form-group ">
                                        <label for="title" class="col-xs-3 control-label">心得标题：</label>
                                        <div class="col-xs-8 ">
                                            <input type="text" class="form-control input-sm duiqi" id="title" name ="title">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="context" class="col-xs-3 control-label">心得内容：</label>
                                        <div class="col-xs-8">
                                            <input type="text" class="form-control input-sm duiqi" id="context" name="context">
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
        var flag = confirm('您确定要删除该心得吗？');
        var id = event.srcElement.id;
        if(flag){
            $.post('<%=request.getContextPath()%>/nodeManager/'+id+'/remove.jhtml',function (data) {
                if(data.code==200){
                    alert('删除成功!');
                    window.location.replace("<%=request.getContextPath()%>/nodeManager/home.jhtml");
                }
            })
        }
    }
    //修改
    function revise(){
        var id = event.srcElement.id;
        $.get('<%=request.getContextPath()%>/nodeManager/'+id+'/selectById.jhtml',function(data){
            if(data.code==200){
                $('#title').val(data.data.title);
                $('#context').val(data.data.context);
                $('#nid').val(data.data.id);

            }
        })
    }
</script>
</body>
</html>