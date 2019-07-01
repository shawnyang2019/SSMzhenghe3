<%--
  Created by IntelliJ IDEA.
  User: 86158
  Date: 2019/4/20
  Time: 17:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>员工列表</title>
    <%--下面的语句是用来拿到项目的路径，以斜线开始，不以斜线结束--%>
    <%
        pageContext.setAttribute("APP_PATH", request.getContextPath());
    %>
    <%--web路径问题：
    不以/开始的相对路径，找资源，以当前资源的路径为基准，经常容易出问题
    以/开始的相对路径，找资源，以服务器的路径为表中
    （http://localhost:3306/ localhose:3306是服务器路径，等同于下面的${APP_PAth},--%>
    <%--引入jquery--%>
    <script type="text/javascript" src="${APP_PATH}/SSMzhenghe3/static/js/jquery-3.3.1.js"></script>
    <!-- 引入Bootstrap样式 -->
    <link href="${APP_PATH}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="${APP_PATH}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
</head>
<body>
 <div class="container"><%--
  Created by IntelliJ IDEA.
  User: 86158
  Date: 2019/4/20
  Time: 17:23
  To change this template use File | Settings | File Templates.
--%>
     <%@ page contentType="text/html;charset=UTF-8" language="java" %>
     <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
     <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
     <html>
     <head>
         <title>员工列表</title>
         <%--下面的语句是用来拿到项目的路径，以斜线开始，不以斜线结束--%>
         <%
             pageContext.setAttribute("APP_PATH", request.getContextPath());
         %>
         <%--web路径问题：
         不以/开始的相对路径，找资源，以当前资源的路径为基准，经常容易出问题
         以/开始的相对路径，找资源，以服务器的路径为表中
         （http://localhost:3306/ localhose:3306是服务器路径，等同于下面的${APP_PAth},--%>
         <%--引入jquery--%>
         <script type="text/javascript" src="${APP_PATH}/SSMzhenghe3/static/js/jquery-3.3.1.js"></script>
         <!-- 引入Bootstrap样式 -->
         <link href="${APP_PATH}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
         <script src="${APP_PATH}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
     </head>
     <body>
     <div class="container">
         <%--标题--%>
         <div class="row">
             <div class="col-md-12">SSMzhenghe</div>
         </div>
         <%--按钮--%>
         <div class="row">
             <div class="col-md-4 col-md-offset-8">
                 <button class="btn btn-primary">新增</button>
                 <button class="btn btn-danger">删除</button>
             </div>
         </div>
         <%--显示表格数据--%>
         <div class="row">
             <div class="col-md-12">
                 <table class="table table-hover">
                     <tr>
                         <th>#</th>
                         <th>empNamle</th>
                         <th>Gender</th>
                         <th>Email</th>
                         <th>DeptName</th>
                         <th>操作</th>
                     </tr>
                     <c:forEach items="${pageInfo.list}" var="emp">
                         <tr>
                             <th>${emp.empId}</th>
                             <th>${emp.empName}</th>
                             <th>${emp.gender=="M"?"男":"女"}</th>
                             <th>${emp.email}</th>
                             <th>${emp.department.deptName}</th>
                             <th>
                                 <button class="btn btn-primary btn-sm">
                                     <span class="glyphicon glyphicon-play-circle" aria-hidden="true"></span>
                                     新增</button>
                                 <button class="btn btn-danger btn-sm">
                                     <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
                                     删除</button>
                             </th>
                         </tr>
                     </c:forEach>
                 </table>
             </div>
         </div>
         <%--显示分页信息栏--%>
         <div class="row">
             <%--分页文字信息--%>
             <div class="col-md-6">
                 当前第${pageInfo.pageNum}页，总共${pageInfo.pages}页，总共${pageInfo.total}条记录
             </div>
             <%--分页条信息--%>
             <div class="col-md-6 col-md-offset-6">
                 <nav aria-label="Page navigation">
                     <ul class="pagination">
                         <li>
                             <a href="${APP_PATH}/emps?pn=1">首页</a>
                         </li>
                         <c:if test="${pageInfo.hasPreviousPage}">
                             <li>
                                 <a href="${APP_PATH}/emps?pn=${page_Num-1}" aria-label="Previous">
                                     <span aria-hidden="true">&laquo;</span>
                                 </a>
                             </li>
                         </c:if>
                         <c:forEach items="${pageInfo.navigatepageNums}" var="page_Num">
                             <c:if test="${page_Num==pageInfo.pageNum}">
                                 <li class="active"><a href="#">${page_Num}</a></li>
                             </c:if>
                             <c:if test="${page_Num!=pageInfo.pageNum}">
                                 <li><a href="${APP_PATH}/emps?pn=${page_Num}">${page_Num}</a></li>
                             </c:if>
                         </c:forEach>
                         <c:if test="${pageInfo.hasNextPage}">
                             <li>
                                 <a href="${APP_PATH}/emps?pn=${page_Num+1}" aria-label="Next">
                                     <span aria-hidden="true">&raquo;</span>
                                 </a>
                             </li>
                         </c:if>
                         <li>
                             <a href="${APP_PATH}/emps?pn=${pageInfo.pages}">末页</a>
                         </li>
                     </ul>
                 </nav>
             </div>
         </div>
     </div>
</body>
</html>

