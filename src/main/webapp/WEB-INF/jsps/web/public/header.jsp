<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<nav class="navbar navbar-default navbar-static-top" role="navigation">
    <div class="navbar-header">
        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"> <span class="sr-only">HaoTianBlog</span><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span></button> <a class="navbar-brand" href="<%=request.getContextPath()%>/page/Index.jhtml">小白狼|MyBlog</a>
    </div>
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
        <ul class="nav navbar-nav">
            <li>
                <a href="<%=request.getContextPath()%>/page/Index.jhtml">
                    <span>主页</span>
                </a>
            </li>
            <li>
                <a href="<%=request.getContextPath()%>/page/topical.jhtml">主题帖</a>
            </li>
            <li>
                <a href="<%=request.getContextPath()%>/page/mentality.jhtml">心得体会</a>
            </li>
            <li>
                <a href="<%=request.getContextPath()%>/page/aboutMe.jhtml">关于我</a>
            </li>
            <li>
                <a href="<%=request.getContextPath()%>/page/words.jhtml">留言</a>
            </li>
            <li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">讨论组<strong class="caret"></strong></a>
                <ul class="dropdown-menu">
                    <li>
                        <a href="#">提问题</a>
                    </li>
                    <li>
                        <a href="#">答问题</a>
                    </li>
                    <li>
                        <a href="#">分享idea</a>
                    </li>
                </ul>
            </li>
        </ul>
        <form class="navbar-form navbar-right" role="search">
            <div class="form-group">
                <input type="text" class="form-control" placeholder="请输入搜索关键词" />
            </div><button type="submit" class="btn btn-default"> <span class="glyphicon glyphicon-search"></span>搜索</button>
        </form>
    </div>
</nav>
