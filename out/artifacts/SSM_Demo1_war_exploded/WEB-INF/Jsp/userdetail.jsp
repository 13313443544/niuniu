<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <!--主体内容-->
    <div class="right">
        <div class="location">
            <strong>你现在所在的位置是:</strong>
            <span>用户管理页面 >> 用户信息查看页面</span>
        </div>
        <div class="providerView">
            <p><strong>用户编号：</strong><span>${user.userCode}</span></p>
            <p><strong>用户名称：</strong><span>${user.userName}</span></p>
            <p><strong>用户性别：</strong>
                <span>
            		<span><c:if test="${user.gender==1}">
                        女
                    </c:if>

                            <c:if test="${user.gender==2}">
                                男
                            </c:if></span>
				</span>
            </p>
            <p><strong>出生日期：</strong><span>${user.birthday}</span></p>
            <p><strong>用户电话：</strong><span>${user.phone}</span></p>
            <p><strong>用户地址：</strong><span>${user.address}</span></p>
            <p><strong>用户角色：</strong><span>${user.userRoleName}</span></p>
            <div class="providerAddBtn">
                <input type="button" id="back" name="back" value="返回">
            </div>
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
<script type="text/javascript" src="/static/js/userview.js"></script>