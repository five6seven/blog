<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!--页码块-->
<footer class="footer">
    <ul class="pagination">
        <li>
            <select>

            </select>
            页
        </li>
        <li class="gray">
            共${pageUtil.data.pages}页
        </li>
        <li>
            <a href="<%=request.getContextPath()%>/${url}.jhtml?pageNum=${pageUtil.data.pageNum-1>0?pageUtil.data.pageNum-1:1}">
                <i class="glyphicon glyphicon-menu-left" >
                </i>
            </a>
        </li>
        <li>
            当前为第${pageUtil.data.pageNum}页
        </li>
        <li>
            <a href="<%=request.getContextPath()%>/${url}.jhtml?pageNum=${pageUtil.data.pageNum+1>pageUtil.data.pages?pageUtil.data.pages:pageUtil.data.pageNum+1}">
                <i class="glyphicon glyphicon-menu-right" >
                </i>
            </a>
        </li>
    </ul>
</footer>