<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2020/9/17
  Time: 11:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>超市订单管理系统</title>
    <link type="text/css" rel="stylesheet" href="/static/css/style.css" />
    <link type="text/css" rel="stylesheet" href="/static/css/public.css" />
</head>
<body>
<div class="left">
    <h2 class="leftH2"><span class="span1"></span>功能列表 <span></span></h2>
    <nav>
        <ul class="list">
            <li ><a href="/sys/bill/billList">订单管理</a></li>
            <li><a href="/sys/provider/providerList">供应商管理</a></li>
            <li><a href="/sys/user/userList">用户管理</a></li>
            <li><a href="/sys/user/change">密码修改</a></li>
            <li><a href="/sys/user/logout.do">退出系统</a></li>
        </ul>
    </nav>
</div>
<input type="hidden" id="path" name="path" value="/SMBMS"/>
<input type="hidden" id="referer" name="referer" value="http://localhost:8080jsp/frame.jsp"/>

</body>
</html>


