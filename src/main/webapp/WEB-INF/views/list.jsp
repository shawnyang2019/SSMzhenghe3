<%--
  Created by IntelliJ IDEA.
  User: 86158
  Date: 2019/4/20
  Time: 17:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>员工列表</title>
    pageContext.setAttribute("APP_PATH",request.getContextPath());
    <%--web路径问题：
    不以/开始的相对路径，找资源，以当前资源的路径为基准，经常容易出问题
    以/开始的相对路径，找资源，以服务器的路径为表中（http://localhost:3306);需要加上项目名--%>
    <%--引入jquery--%>
    <script type="text/javascript" src="${APP_PAth}/static/js/jquery-3.3.1.js"></script>
    <!-- 引入Bootstrap样式 -->
    <link href="${APP_PAth}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="${APP_PAth}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
</head>
<body>
<%--搭建显示页面--%>
<div class="container">
    <%--标题--%>
    <div class="row">
        <div class="col-md-12">
            <h1>SSMzhenghe3</h1>
        </div>
    </div>
    <%--按钮--%>
    <div class="row"></div>
    <%--数据--%>
    <div class="row"></div>
    <%--分页信息--%>
    <div class="row"></div>
</div>
</body>
</html>
