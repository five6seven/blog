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
    <script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/ztree/jquery.ztree.all-3.5.js"></script>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/js/ztree/zTreeStyle.css"/>
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
        <div class="tab-content" >
            <div>
                <!-- 角色管理模块 -->
                <div class="check-div">
                    <shiro:hasPermission name="roleManager_add">
                        <button class="btn btn-yellow btn-xs" data-toggle="modal" data-target="#roleAdd" onclick="add()">添加角色</button>
                    </shiro:hasPermission>
                </div>
                <!-- 显示数据 -->
                <div class="data-div">
                    <!-- 判断是否有权限查询权限 -->
                    <shiro:hasPermission name="roleManager_select">
                        <table class="table table-hover" id="mytable">
                            <thead>
                            <tr>
                                <th>角色名</th>
                                <th>角色简码</th>
                                <th>角色简介</th>
                                <th>拥有的权限</th>
                                <th>操作</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${pageUtil.data.list}" var="ds">
                                <tr>
                                    <td>${ds.name}</td>
                                    <td>${ds.roleCode}</td>
                                    <td>${ds.description}</td>
                                    <td><button class='btn btn-default btn-xs' id="${ds.id}" data-toggle='modal' data-target='#showAuth' onclick='showAuth()'>点击查看</button></td>
                                    <td>
                                        <button class='btn btn-success btn-xs' id="${ds.id}" data-toggle='modal' data-target='#reviseRole' onclick='revise()'>修改</button>
                                        <button class='btn btn-danger btn-xs' id="${ds.id}" data-toggle='modal'  onclick='remove()'>删除</button>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </shiro:hasPermission>
                </div>
                <jsp:include page="../public/footer.jsp"></jsp:include>
                <!--添加角色窗口-->
                <div class="modal fade" id="roleAdd" role="dialog" aria-labelledby="gridSystemModalLabel">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                <h4 class="modal-title" id="gridSystemModalLabel">添加角色</h4>
                            </div>
                            <div class="modal-body">
                                <div class="container-fluid">
                                    <form class="form-horizontal" id="myForm" action="<%=request.getContextPath()%>/roleManager/add.jhtml" method="post">
                                        <div class="form-group ">
                                            <label for="nameA" class="col-xs-3 control-label">角色名：</label>
                                            <div class="col-xs-3 ">
                                                <input type="text" class="form-control input-sm duiqi" required id="nameA" placeholder="请输入角色名">
                                            </div>
                                            <div class="col-xs-3" id="msg">
                                            </div>
                                        </div>
                                        <div class="form-group ">
                                            <label for="roleCodeA" class="col-xs-3 control-label">角色简码：</label>
                                            <div class="col-xs-6 ">
                                                <input type="text" class="form-control input-sm duiqi" id="roleCodeA" placeholder="请输入角色简码以供管理">
                                            </div>
                                        </div>
                                        <div class="form-group ">
                                            <label for="descriptionA" class="col-xs-3 control-label">角色简介：</label>
                                            <div class="col-xs-6 ">
                                                <input type="text" class="form-control input-sm duiqi" id="descriptionA" placeholder="请输入该权限所对应的url">
                                            </div>
                                        </div>
                                        <!-- 选择角色所拥有的权限  -->
                                        <div class="form-group ">
                                            <label class="col-xs-3 control-label">选择权限：</label>
                                            <div class="col-xs-6 ">
                                                <ul id="zTree" class="ztree"></ul>
                                            </div>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-xs btn-white" data-dismiss="modal">取 消</button>
                                            <button type="button" class="btn btn-xs btn-green" onclick="save()">保 存</button>
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

                <!--修改权限窗口-->
                <div class="modal fade" id="reviseRole" role="dialog" aria-labelledby="gridSystemModalLabel">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                            <h4 class="modal-title" id="gridSystemModalLabel">修改角色</h4>
                        </div>
                        <div class="modal-body">
                            <div class="container-fluid">
                                <form class="form-horizontal">
                                    <div class="form-group ">
                                        <label for="name" class="col-xs-3 control-label">角色名：</label>
                                        <input type="hidden" name="id" id="iid" />
                                        <div class="col-xs-6 ">
                                            <input type="text" class="form-control input-sm duiqi" name="name" id="name" >
                                        </div>
                                    </div>
                                    <div class="form-group ">
                                        <label  class="col-xs-3 control-label">角色简码：</label>
                                        <div class="col-xs-6 ">
                                            <input type="text" class="form-control input-sm duiqi" name="roleCode" id="roleCode" >
                                        </div>
                                    </div>
                                    <div class="form-group ">
                                        <label  class="col-xs-3 control-label">角色简码：</label>
                                        <div class="col-xs-6 ">
                                            <input type="text" class="form-control input-sm duiqi" name="description" id="description" >
                                        </div>
                                    </div>
                                    <div class="form-group ">
                                        <label class="col-xs-3 control-label">拥有的权限：</label>
                                        <div class="col-xs-6 ">
                                            <ul id="ZtreeUpdate" class="ztree"></ul>
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-xs btn-green" onclick="updateRole()">保 存</button>
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
            <!-- 弹出该角色拥有的权限信息 -->
            <div class="modal fade" id="showAuth" role="dialog" aria-labelledby="gridSystemModalLabel">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                            <h4 class="modal-title" id="gridSystemModalLabe2">拥有的权限</h4>
                        </div>
                        <div class="modal-body">
                            <div class="container-fluid">
                                <div id= "content" >
                                    <ul id="r4auths" class="ztree"></ul>
                                </div>
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
</div>
<script type="text/javascript">
    // 修改前
    function revise(){
        $.get('<%=request.getContextPath()%>/authManager/selectAll.jhtml',function(data){
            //页面加载完成后，执行这段代码----动态创建ztree
            var setting = {
                check:{
                    enable:true
                }
            };
            //构造节点数据
            var zNodes=data;
            //调用API初始化ztree
            var treeObj = $.fn.zTree.init($("#ZtreeUpdate"), setting,zNodes);
            treeObj.expandAll(true);
        });
        //获取将要修改的权限ID
        var id=event.srcElement.id;
        $.get('<%=request.getContextPath()%>/roleManager/'+id+'/selectById.jhtml',function(data){
            if(data.code==200){
                //动态往修改页面添加数据
                $('#name').val(data.data.name);
                $('#roleCode').val(data.data.roleCode);
                $('#description').val(data.data.description);
            }
        })
    }
    //修改
    function updateRole(){
        //获取选中数据
        var nodes = $.fn.zTree.getZTreeObj("ZtreeUpdate").getCheckedNodes(true);
        var ids = new Array();
        //遍历获取权限ID
        for(var i=0;i<nodes.length;i++){
            ids.push(nodes[i].id);
        }
        ids = JSON.stringify(ids);
        var json={"name":$('#name').val(),"roleCode":$('#roleCode').val(),"description":$('#description').val(),"ids":ids};
        $.post('<%=request.getContextPath()%>/roleManager/update.jhtml',json,function(data){
            if(data.code==200){
                window.location.replace("<%=request.getContextPath()%>/roleManager/home.jhtml");
            }
        })
    }
    //删除方法
    function remove(){
        var flag = confirm("您确定要删除该角色吗？");
        if(flag){
            var id=event.srcElement.id;
            $.get('<%=request.getContextPath()%>/roleManager/'+id+'/remove.jhtml',function(data){
                if(data.code==200){
                    alert('删除成功');
                    window.location.replace("<%=request.getContextPath()%>/roleManager/home.jhtml");
                }else{
                    alert('删除失败');
                }
            })
        }
    }
    //查看角色权限方法
    function showAuth(){
        var id=event.srcElement.id;
        $.get('<%=request.getContextPath()%>/authManager/selectAll.jhtml',function(data){
            //页面加载完成后，执行这段代码----动态创建ztree
            var setting = {
                check:{
                    enable:true
                }
            };
            //构造节点数据
            var zNodes=data;
            //调用API初始化ztree
            var tree =  $.fn.zTree.init($("#r4auths"), setting,zNodes);
            tree.expandAll(true);
            var treeObj = $.fn.zTree.getZTreeObj("r4auths");
            $.get('<%=request.getContextPath()%>/authManager/'+id+'/selectAllAuthByRoleId.jhtml',function(data){
                if(data.code == 200){
                   /* $.each(data.data,function(a,b){
                        var node = treeObj.getNodeByParam("id",b.id);
                        treeObj.selectNode(node);
                        treeObj.checkNode(node,true,true);
                        treeObj.updateNode(node);
                    })*/
                    var node = treeObj.getNodeByParam("id","a3fcb2d9a26511e787bcf8a96332c90f");
                    treeObj.selectNode(node);
                    treeObj.checkNode(node,true,true);
                    treeObj.updateNode(node);
                }
            });

        });
    }
    //添加角色并赋予权限
    function save(){
        //获取选中数据
        var nodes = $.fn.zTree.getZTreeObj("zTree").getCheckedNodes(true);
        var ids = new Array();
        //遍历获取权限ID
        for(var i=0;i<nodes.length;i++){
            ids.push(nodes[i].id);
        }
        ids = JSON.stringify(ids);
        var json={"name":$('#nameA').val(),"roleCode":$('#roleCodeA').val(),"description":$('#descriptionA').val(),"ids":ids};
        $.post('<%=request.getContextPath()%>/roleManager/add.jhtml',json,function(data){
            if(data.code==200){
                window.location.replace("<%=request.getContextPath()%>/roleManager/home.jhtml");
            }
        })
    }
    //点击添加按钮时查询所有权限以供选择
    function add(){
        $.get('<%=request.getContextPath()%>/authManager/selectAll.jhtml',function(data){
            //页面加载完成后，执行这段代码----动态创建ztree
            var setting = {
                check:{
                    enable:true
                }
            };
            //构造节点数据
            var zNodes=data;
            //调用API初始化ztree
            var treeObj = $.fn.zTree.init($("#zTree"), setting,zNodes);
            treeObj.expandAll(true);
        });
    }
</script>
</body>
</html>