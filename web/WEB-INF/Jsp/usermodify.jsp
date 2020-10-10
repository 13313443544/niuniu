<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>超市订单管理系统</title>
    <link type="text/css" rel="stylesheet" href="/static/css/style.css"/>
    <link type="text/css" rel="stylesheet" href="/static/css/public.css"/>
</head>
<body>
<jsp:include page="frame.jsp"></jsp:include>
<!--主体内容-->
<section class="publicMian ">
    <jsp:include page="left.jsp"></jsp:include>
    <div class="right">
        <div class="location">
            <strong>你现在所在的位置是:</strong>
            <span>用户管理页面 >> 用户修改页面</span>
        </div>
        <div class="providerAdd">
            <form id="userForm" name="userForm" method="post" action="/user/userupd.do">
                <input type="hidden" name="method" value="modifyexe">
                <input type="hidden" name="id" value="${user.id}"/>
                <div>
                    <label for="userName">用户名称：</label>
                    <input type="text" name="userName" id="userName" value="${user.userName}">
                    <font color="red"></font>
                </div>
                <div>
                    <label>用户性别：</label>
                    <select name="gender" id="${user.gender}">


                        <option value="1">男</option>
                        <option value="2" selected="selected">女</option>


                    </select>
                </div>
                <div>
                    <label for="data">出生日期：</label>
                    <input type="text" Class="Wdate" id="birthday" name="birthday" value="<fmt:formatDate value="${user.birthday}" pattern="yyyy-MM-dd"/>"
                           readonly="readonly" onclick="WdatePicker();">
                    <font color="red"></font>
                </div>

                <div>
                    <label for="userphone">用户电话：</label>
                    <input type="text" name="phone" id="phone" value="${user.phone}">
                    <font color="red"></font>
                </div>
                <div>
                    <label for="userAddress">用户地址：</label>
                    <input type="text" name="address" id="address" value="${user.address}">
                </div>
                <div>
                    <label>用户角色：</label>
                    <!-- 列出所有的角色分类 -->
                    <input type="hidden" value="3" id="rid"/>
                    <select name="userRole" id="userRole"></select>
                    <font color="red"></font>
                </div>
                <div class="providerAddBtn">
                    <input type="submit" name="save" id="save" value="保存"/>
                    <input type="button" id="back" name="back" value="返回"/>
                </div>
            </form>
        </div>
    </div>
</section>


<footer class="footer">
    版权归北大青鸟
</footer>
<script type="text/javascript" src="/static/js/time.js"></script>
<script type="text/javascript" src="/static/js/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="/static/js/common.js"></script>
<script type="text/javascript" src="/static/calendar/WdatePicker.js"></script>
</body>
</html>
<%--<script type="text/javascript" src="/static/js/usermodify.js"></script>--%>
