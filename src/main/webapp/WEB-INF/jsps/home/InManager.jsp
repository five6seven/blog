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
    <script type="text/javascript" charset="utf-8" src="<%=request.getContextPath()%>/resources/js/kindeditor-4.1.10/kindeditor.js"></script>
    <script type="text/javascript" charset="utf-8" src="<%=request.getContextPath()%>/resources/js/kindeditor-4.1.10/kindeditor-all-min.js"></script>
    <script type="text/javascript" charset="utf-8" src="<%=request.getContextPath()%>/resources/js/kindeditor-4.1.10/lang/zh_CN.js"></script>
    <link href="<%=request.getContextPath()%>/resources/js/kindeditor-4.1.10/themes/default/default.css" type="text/css" rel="stylesheet">
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
                <button class="btn btn-yellow btn-xs" data-toggle="modal" data-target="#addTopical" onclick="add()">添加新帖</button>
            </div>
        </div>
        <div class="data-div">
            <shiro:hasPermission name="inManager_select">
                <table class="table table-hover" id="mytable">
                    <thead>
                    <tr>
                        <th>帖子标题</th>
                        <th>帖子副标题</th>
                        <th>帖子状态</th>
                        <th>浏览数量</th>
                        <th>点赞数量</th>
                        <th>帖子内容</th>
                        <th>操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${pageUtil.data.list}" var="ds">
                        <tr>
                            <td>${ds.title}</td>
                            <td>${ds.subContext}</td>
                            <td>
                                <c:choose>
                                    <c:when test="${ds.status==0}">
                                        <div style="color:red">待审核</div>
                                    </c:when>
                                    <c:when test="${ds.status== 1}">
                                        <div style="color:green">已发布
                                    </c:when>
                                    <c:when test="${ds.status== 2}">
                                        <div style="color:greenyellow">热门
                                    </c:when>
                                    <c:when test="${ds.status== 3}">
                                        <div style="color:#5375ff">精品
                                    </c:when>
                                    <c:when test="${ds.status== -1}">
                                        <div style="color:#ff1607">已冻结
                                    </c:when>
                                </c:choose>
                            </td>
                            <td>${ds.uNumber}</td>
                            <td>${ds.uPraise}</td>
                            <td>
                                <button class='btn btn-default btn-xs' id="${ds.id}" data-toggle='modal' data-target='#showContent' onclick='show()'>点击查看</button>
                            </td>
                            <td>
                                <button class='btn btn-success btn-xs' id="${ds.id}" data-toggle='modal' data-target='#updateIn' onclick='revise()'>修改</button>
                                <button class='btn btn-danger btn-xs' id="${ds.id}" onclick='remove()'>删除</button>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </shiro:hasPermission>
        </div>
        <jsp:include page="../public/footer.jsp"></jsp:include>

        <!--弹出添加帖子窗口-->
        <div class="modal fade" id="addTopical" role="dialog" aria-labelledby="gridSystemModalLabel">
            <div class="modal-dialog" role="document" style="width: 850px">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="gridSystemModalLabel">发布帖子</h4>
                    </div>
                    <div class="modal-body">
                        <div class="container-fluid">
                            <form class="form-horizontal" action="<%=request.getContextPath()%>/inManager/add.jhtml" method="post" enctype="multipart/form-data">
                                <div class="form-group ">
                                    <label class="col-xs-3 control-label">帖子标题：</label>
                                    <div class="col-xs-8 ">
                                        <input type="text" class="form-control input-sm duiqi" name="title" placeholder="请输入帖子标题">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-xs-3 control-label">帖子副标题：</label>
                                    <div class="col-xs-8 ">
                                        <input type="text" class="form-control input-sm duiqi" name="subContext" placeholder="请输入帖子副标题">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-xs-3 control-label">缩略图:</label>
                                    <div class="col-xs-8">
                                        <input type="file" name="picture" class="form-control input-sm duiqi">
                                        <img src="" alt=""/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-xs-3 control-label">选择标签:</label>
                                    <div class="col-xs-8" id="labels">

                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="sKnot" class="col-xs-2 control-label">帖子内容:</label>
                                    <div class="col-xs-8">
                                        <textarea id= "context" style="width:500px;height:500px;visibility:hidden;" name="context"></textarea>
                                        <script type="text/javascript">
                                            //KindEditor脚本
                                            var editor;
                                            KindEditor.ready(function(K) {
                                                editor = K.create('#context', {
                                                });
                                            });
                                        </script>
                                    </div>
                                    <div class="col-xs-2"></div>
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
        <div class="modal fade" id="updateIn" role="dialog" aria-labelledby="gridSystemModalLabel">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="gridSystemModalLabel">修改帖子状态</h4>
                    </div>
                    <div class="modal-body">
                        <div class="container-fluid">
                            <form class="form-horizontal" action="<%=request.getContextPath()%>/inManager/update.jhtml" method="post">
                                <input type="hidden" name="id" id="iid"/>
                                <div class="form-group ">
                                    <label for="title" class="col-xs-3 control-label">帖子标题：</label>
                                    <div class="col-xs-8 ">
                                        <input type="text" class="form-control input-sm duiqi" id="title" name ="title">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="subContext" class="col-xs-3 control-label">帖子副标题：</label>
                                    <div class="col-xs-8">
                                        <input type="text" class="form-control input-sm duiqi" id="subContext" name="subContext">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="situation" class="col-xs-3 control-label">帖子状态：</label>
                                    <div class="col-xs-8" id="radios">
                                        <input type="radio" name="status" value="0" checked>待审核</input>
                                        <input type="radio" name="status" value="1">已发布</input>
                                        <input type="radio" name="status" value="2">热门</input>
                                        <input type="radio" name="status" value="3">精品</input>
                                        <input type="radio" name="status" value="-1">冻结</input>
                                    </div>
                                </div>
                                <div class="form-group ">
                                    <label for="title" class="col-xs-3 control-label">标签：</label>
                                    <div class="col-xs-8 " id="labelsu">
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

        <!-- 弹出帖子内容窗口 -->
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
        var flag = confirm('您确定要删除该帖吗？');
        var id = event.srcElement.id;
        if(flag){
            $.post('<%=request.getContextPath()%>/inManager/'+id+'/remove.jhtml',function (data) {
                if(data.code==200){
                    alert('删除成功!');
                    window.location.replace("<%=request.getContextPath()%>/inManager/home.jhtml");
                }
            })
        }
    }
    //显示帖子内容
    function show(){
      var id = event.srcElement.id;
      $.post('<%=request.getContextPath()%>/inManager/'+id+'/selectById.jhtml',function (data) {
          if(data.code==200){
              $('#content').html(""+data.data.context);
          }
      })
    }
    //修改帖子状态
    function revise(){
        var id = event.srcElement.id;
        $.get('<%=request.getContextPath()%>/inManager/'+id+'/selectById.jhtml',function(data){
            if(data.code==200){
                $('#title').val(data.data.title);
                $('#subContext').val(data.data.subContext);
                $('#iid').val(data.data.id);
                if(data.data.myLabels!=null){
                    var lId= data.data.myLabels.id;
                }else{
                    var lId= null
                }
                $.get('<%=request.getContextPath()%>/labelManager/selectAll.jhtml',function(d){
                    if(d.code==200){
                        $('#labelsu').empty();
                        $.each(d.data,function(a,b){
                            if( lId == b.id){
                                $('#labelsu').append('<input type="radio" name="myLabels.id" value="'+b.id+'" checked>'+b.name);
                            }else {
                                $('#labelsu').append('<input type="radio" name="myLabels.id" value="' + b.id + '">' + b.name);
                            }
                        })
                    }
                });
                var status = data.data.status;
                $("input[name='status']").eq(status).attr("checked","checked");
            }
        })
    }
    //添加帖子时查询所有标签
    function add(){
        $.get('<%=request.getContextPath()%>/labelManager/selectAll.jhtml',function(data){
            if(data.code==200){
                $.each(data.data,function(da,index){
                    $('#labels').append("<input type='radio' name='lId' value='"+index.id+"'/>"+index.name);
                });

            }
        })
    }
</script>
</body>
</html>