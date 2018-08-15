<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                    <button class="btn btn-yellow btn-xs" data-toggle="modal" data-target="#addUser" onclick="add()">添加用户</button>
                </div>
            </div>
            <div class="data-div">
                <shiro:hasPermission name="userManager_select">
                    <table class="table table-hover table-striped" id="mytable">
                        <thead>
                        <tr>
                            <th>用户名</th>
                            <th>昵称</th>
                            <th>创建时间</th>
                            <th>最后登录时间</th>
                            <th>角色</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${pageUtil.data.list}" var="ds">
                                <tr>
                                    <td>${ds.loginName}</td>
                                    <td>${ds.name}</td>
                                    <td>${ds.createTime}</td>
                                    <td>${ds.loginTime}</td>
                                    <td>
                                        <c:forEach items="${ds.roleList}" var="role">
                                            ${role.name}&nbsp;
                                        </c:forEach>
                                    </td>
                                    <td>
                                        <button class='btn btn-success btn-xs' id="${ds.id}" data-toggle='modal' data-target='#updateUser' onclick='revise()'>修改</button>
                                        <a href='#'><button  class='btn green btn-xs'>冻结</button></a>
                                        <button class='btn btn-danger btn-xs' id="${ds.id}" onclick='remove()'>删除</button>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </shiro:hasPermission>
            </div>
           <jsp:include page="../public/footer.jsp"></jsp:include>

            <!--弹出添加用户窗口-->
            <div class="modal fade" id="addUser" role="dialog" aria-labelledby="gridSystemModalLabel">
                <div class="modal-dialog" role="document" style="width: 850px">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                            <h4 class="modal-title" id="gridSystemModalLabel">添加用户</h4>
                        </div>
                        <div class="modal-body">
                            <div class="container-fluid">
                                <form class="form-horizontal" action="<%=request.getContextPath()%>/userManager/add.jhtml" method="post">
                                    <div class="form-group ">
                                        <label class="col-xs-3 control-label">用户名：</label>
                                        <div class="col-xs-8 ">
                                            <input type="text" class="form-control input-sm duiqi" name="loginName" onblur="checkName(this)" placeholder="请输入登录账号名">
                                            <div id="msg" style="height: 20px"></div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-xs-3 control-label">用户昵称：</label>
                                        <div class="col-xs-8 ">
                                            <input type="text" class="form-control input-sm duiqi" name="name" placeholder="请输入用户昵称，用于显示">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-xs-3 control-label">密码:</label>
                                        <div class="col-xs-8">
                                            <input type="password" name="password" class="form-control input-sm duiqi">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-xs-3 control-label">选择角色:</label>
                                        <div class="col-xs-8" id="roles2">
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

            <!--弹出修改用户窗口-->
            <div class="modal fade" id="updateUser" role="dialog" aria-labelledby="gridSystemModalLabel">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                            <h4 class="modal-title" id="gridSystemModalLabel">修改用户信息</h4>
                        </div>
                        <div class="modal-body">
                            <div class="container-fluid">
                                <form class="form-horizontal" action="<%=request.getContextPath()%>/userManager/update.jhtml" method="post">
                                    <input type="hidden" name="id" id="iid"/>
                                    <div class="form-group ">
                                        <label for="name" class="col-xs-3 control-label">昵称：</label>
                                        <div class="col-xs-8 ">
                                            <input type="text" class="form-control input-sm duiqi" id="name" name ="name">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="subContext" class="col-xs-3 control-label">角色：</label>
                                        <div class="col-xs-8" id="roles">
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="submit" class="btn btn-xs btn-green">保 存</button>
                                        <button type="button" class="btn btn-xs btn-white" data-dismiss="modal">取 消</button>
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

            <!-- 弹出用户XXX窗口 -->
            <div class="modal fade" id="showContent" role="dialog" aria-labelledby="gridSystemModalLabel">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                            <h4 class="modal-title" id="gridSystemModalLabe2">帖子内容</h4>
                        </div>
                        <div class="modal-body">
                            <div class="container-fluid">
                                <div id= "content" ></div>
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
        var flag = confirm('您确定要删除该用户吗？');
        var id = event.srcElement.id;
        if(flag){
            $.post('<%=request.getContextPath()%>/userManager/'+id+'/remove.jhtml',function (data) {
                if(data.code==200){
                    alert('删除成功!');
                    window.location.replace("<%=request.getContextPath()%>/userManager/home.jhtml");
                }
            })
        }
    }
    //显示用户信息
    function show(){
        var id = event.srcElement.id;
        $.post('<%=request.getContextPath()%>/inManager/'+id+'/selectById.jhtml',function (data) {
            if(data.code==200){
                $('#content').html(""+data.data.context);
                window.location.replace("<%=request.getContextPath()%>/userManager/home.jhtml");
            }
        })
    }
    //修改用户
    function revise(){
        var id = event.srcElement.id;
        $('#roles').empty();
        $.get('<%=request.getContextPath()%>/userManager/'+id+'/selectById.jhtml',function(data){
            if(data.code==200){
                $('#name').val(data.data.name);
                $('#iid').val(data.data.id);
                var roleList = data.data.roleList;
                //查询出所有角色
                $.get('<%=request.getContextPath()%>/roleManager/selectAll.jhtml',function(data){
                    if(data.code==200){
                        $.each(data.data,function(a,index){
                            var d = '<input type="checkbox" name="role" value="'+index.id+'"';
                            $.each(roleList,function(b,c){
                                console.info(c.id);
                                console.info(index.id);
                                if(c.id==index.id){
                                    d+="checked";
                                }
                            });
                            d+="/>"+index.name;
                            $('#roles').append(d);
                        });

                    }
                })
            }
        })
    }
    //添加用户时查询所有的角色以供选择
    function add(){
        $('#roles2').empty();
        $.get('<%=request.getContextPath()%>/roleManager/selectAll.jhtml',function(data){
            if(data.code==200){
                $.each(data.data,function(i,index){
                    $('#roles2').append("<input type='checkbox' name='role' value="+index.id+">"+index.name);
                });

            }
        })
    }
    //用户名验证
    function checkName(login){
        var v = $.trim(login.value);
        $.get('<%=request.getContextPath()%>/userManager/'+v+'/checkName.jhtml',function(data){
            if(data.code==200){
                if(data.data==1){
                    $('#msg').html('');
                    $('#msg').html('该用户名可以使用');
                }else if(data.data==0){
                    $('#msg').html('');
                    $('#msg').html('该用户名已经存在');

                }
            }
        })
    }
</script>
</body>
</html>