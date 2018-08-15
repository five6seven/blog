<%--
  Created by IntelliJ IDEA.
  User: 宁采臣丶
  Date: 2017/10/10
  Time: 15:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="col-md-12 column">
    <div class="tabbable" id="tabs-184521">
        <ul class="nav nav-tabs">
            <li class="active">
                <a href="#panel-77547" data-toggle="tab">幻灯片管理</a>
            </li>
            <li>
                <a href="#panel-71615" data-toggle="tab">其他管理</a>
            </li>
        </ul>
        <div class="tab-content">
            <div class="tab-pane active" id="panel-77547">
                <p>
                    请选择照片：
                </p>
                <div class="row clearfix">
                    <div class="col-md-12 column">
                        <a id="modal-2756" href="#modal-container-2756" role="button" class="btn" data-toggle="modal">点击选择照片</a>

                        <div class="modal fade" id="modal-container-2756" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                                        <h6 class="modal-title" id="myModalLabel">
                                            请选择照片
                                        </h6>
                                    </div>
                                    <div class="modal-body">
                                        <div class="row clearfix">
                                            <div class="col-lg-4"><img src="<%=request.getContextPath()%>/resources/img/captchaCode.jpg" alt="1" /></div>
                                            <div class="col-lg-4"><img src="<%=request.getContextPath()%>/resources/img/captchaCode.jpg" alt="1" /></div>
                                            <div class="col-lg-4"><img src="" alt="1" /></div>
                                            <div class="col-lg-4"><img src="" alt="1" /></div>
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                                        <button type="button" class="btn btn-primary">保存</button>
                                    </div>
                                </div>

                            </div>

                        </div>

                    </div>
                </div>
                <button class="btn btn-primary btn-sm">点击预览</button>
            </div>
            <div class="tab-pane" id="panel-71615">
                <p>
                    Howdy, I'm in Section 2.
                </p>
            </div>
        </div>
    </div>
</div>