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
            <!-- Tab panes -->
            <div class="tab-content">
                <!-- 权限管理模块 -->
                <div class="check-div">
                    <shiro:hasPermission name="authManager_add">
                        <button class="btn btn-yellow btn-xs" data-toggle="modal" data-target="#authAdd">添加权限</button>
                    </shiro:hasPermission>
                </div>
                <!-- 显示数据 -->
                <div class="data-div">
                    <!-- 判断是否有权限查询权限 -->
                    <shiro:hasPermission name="authManager_select">
                        <table class="table table-hover" id="mytable">
                            <thead>
                                <tr>
                                    <th>权限名</th>
                                    <th>权限简码</th>
                                    <th>权限对应的URL</th>
                                    <th>父权限</th>
                                    <th>优先级</th>
                                    <th>是否为菜单</th>
                                    <th>操作</th>
                                </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${pageUtil.data.list}" var="ds">
                                <tr>
                                    <td>${ds.name}</td>
                                    <td>
                                        <c:if test="${ds.authCode ==null}">null</c:if>
                                        <c:if test="${ds.authCode !=null}">${ds.authCode}</c:if>
                                    </td>
                                    <td>
                                        <c:if test="${ds.url ==null}">null</c:if>
                                        <c:if test="${ds.url !=null}">${ds.url}</c:if>
                                    </td>
                                    <td>
                                        <c:if test="${ds.myAuth.name ==null}">null</c:if>
                                        <c:if test="${ds.myAuth.name !=null}">${ds.myAuth.name}</c:if>
                                    </td>
                                    <td>${ds.ocode}</td>
                                    <td>
                                        <c:if test="${ds.ismenu ==1}">是</c:if>
                                        <c:if test="${ds.ismenu ==0}">否</c:if>
                                    </td>
                                    <td>
                                        <button class='btn btn-success btn-xs' id="${ds.id}" data-toggle='modal' data-target='#reviseAuth' onclick='revise()'>修改</button>
                                        <button class='btn btn-danger btn-xs' id="${ds.id}" data-toggle='modal' data-target='#deleteAuth' onclick='remove()'>删除</button>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </shiro:hasPermission>
                </div>
                <jsp:include page="../public/footer.jsp"></jsp:include>
                <!--添加权限弹出窗口-->
                <div class="modal fade" id="authAdd" role="dialog" aria-labelledby="gridSystemModalLabel">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                <h4 class="modal-title" id="gridSystemModalLabel">添加权限</h4>
                            </div>
                            <div class="modal-body">
                                <div class="container-fluid">
                                    <form class="form-horizontal" action="<%=request.getContextPath()%>/authManager/add.jhtml">
                                        <div class="form-group ">
                                            <label for="name" class="col-xs-3 control-label">权限名：</label>
                                            <div class="col-xs-3 ">
                                                <input type="text" class="form-control input-sm duiqi" required name="name" placeholder="请输入权限名">
                                            </div>
                                            <div class="col-xs-3" id="msg">
                                            </div>
                                        </div>
                                        <div class="form-group ">
                                            <label for="authCode" class="col-xs-3 control-label">权限简码：</label>
                                            <div class="col-xs-6 ">
                                                <input type="text" class="form-control input-sm duiqi" name="authCode" placeholder="请输入权限简码以供管理">
                                            </div>
                                        </div>
                                        <div class="form-group ">
                                            <label for="url" class="col-xs-3 control-label">权限URL：</label>
                                            <div class="col-xs-6 ">
                                                <input type="text" class="form-control input-sm duiqi" name="url" placeholder="请输入该权限所对应的url">
                                            </div>
                                        </div>
                                        <div class="form-group ">
                                            <label for="sName" class="col-xs-3 control-label">请选择父权限：</label>
                                            <div class="col-xs-6 ">
                                               <select id="parent" name="myAuth.id">
                                                   <option value="${menu.id}">${menu.name}</option>
                                                   <c:forEach items="${menu.myAuthList}" var="auth">
                                                       <option value="${auth.id}">-${auth.name}</option>
                                                       <c:if test="${auth.myAuthList.size()>0}">
                                                           <c:forEach items="${auth.myAuthList}" var="child">
                                                               <option value="${child.id}">--${child.name}</option>
                                                               <c:if test="${child.myAuthList.size()>0}">
                                                                       <c:forEach items="${child.myAuthList}" var="child2">
                                                                           <option value="${child2.id}">---${child2.name}</option>
                                                                       </c:forEach>
                                                               </c:if>
                                                           </c:forEach>
                                                       </c:if>
                                                   </c:forEach>
                                               </select>
                                            </div>
                                        </div>
                                        <div class="form-group ">
                                            <label for="sName" class="col-xs-3 control-label">优先级：</label>
                                            <div class="col-xs-6 ">
                                                <select name="ocode">
                                                    <option value="0">0</option>
                                                    <option value="1">1</option>
                                                    <option value="2">2</option>
                                                    <option value="3">3</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="form-group ">
                                            <label for="sName" class="col-xs-3 control-label">是否为菜单：</label>
                                            <input type="radio" name="ismenu" value="1" checked>是</input>
                                            <input type="radio" name="ismenu" value="1">否</input>
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

                <!--修改权限弹出窗口-->
                <div class="modal fade" id="reviseAuth" role="dialog" aria-labelledby="gridSystemModalLabel">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                <h4 class="modal-title" id="gridSystemModalLabel">修改权限</h4>
                            </div>
                            <div class="modal-body">
                                <div class="container-fluid">
                                    <form class="form-horizontal">
                                        <div class="form-group ">
                                            <label for="name" class="col-xs-3 control-label">权限名：</label>
                                            <div class="col-xs-6 ">
                                                <input type="text" class="form-control input-sm duiqi" name="name" id="name" >
                                            </div>
                                        </div>
                                        <div class="form-group ">
                                            <label  class="col-xs-3 control-label">请选择父权限：</label>
                                            <div class="col-xs-6 ">
                                                <select id="parentUpdate" name="myAuth.id">
                                                </select>
                                            </div>
                                        </div>
                                        <div class="form-group ">
                                            <label for="sName" class="col-xs-3 control-label">优先级：</label>
                                            <div class="col-xs-6 ">
                                                <select id="ocode" name="ocode">
                                                </select>
                                            </div>
                                        </div>
                                        <div class="form-group ">
                                            <label class="col-xs-3 control-label">是否为菜单：</label>
                                            <input type="radio" name="ismenu" value="0">是</input>
                                            <input type="radio" name="ismenu" value="1">否</input>
                                        </div>
                                    </form>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-xs btn-white" data-dismiss="modal">取 消</button>
                                <a id="updateSend"><button type="button" class="btn btn-xs btn-green">修改</button></a>
                            </div>
                        </div>
                        <!-- /.modal-content -->
                    </div>
                    <!-- /.modal-dialog -->
                </div>
                <!-- /.modal -->
            </div>
        </div>
    <script>
        // 修改方法
        function revise(){
            //获取将要修改的权限ID
            var id=event.srcElement.id;
            $.get('<%=request.getContextPath()%>/authManager/'+id+'/selectById.jhtml',function(data){
                if(data==200){
                    //动态往修改页面添加数据
                    $('#name').val(data.name);
                    //父权限
                    $('#parentUpdate').append();
                    $('#ocode').append();
                }
            })
        }
        //删除方法
        function remove(){
            var flag = confirm("您确定要删除该权限吗？");
            if(flag){
                var id=event.srcElement.id;
                $.get('<%=request.getContextPath()%>/authManager/'+id+'/remove.jhtml',function(data){
                    if(data.code==200){
                        alert('删除成功');
                        window.location.replace("<%=request.getContextPath()%>/authManager/home.jhtml");
                    }else{
                        alert('删除失败，请重新删除');
                    }
                })
            }
        }
    </script>
</body>
</html>