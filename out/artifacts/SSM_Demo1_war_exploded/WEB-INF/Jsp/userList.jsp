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
    <!--主体内容-->

    <div class="right">
        <div class="location">
            <strong>你现在所在的位置是:</strong>
            <span>用户管理页面</span>
        </div>
        <div class="search">
            <form method="post" action="jsp/user.do">
                <input name="method" value="query" class="input-text" type="hidden">
                <span>用户名：</span>
                <input name="queryname" class="input-text" type="text" value="">

                <span>用户角色：</span>
                <select name="queryUserRole">

                    <option value="0">--请选择--</option>

                    <option
                            value="1">系统管理员
                    </option>

                    <option
                            value="2">经理
                    </option>

                    <option
                            value="3">普通员工
                    </option>


                </select>

                <input type="hidden" name="pageIndex" value="1"/>
                <input value="查 询" type="button" id="searchbutton">
                <a href="/sys/user/useradd">添加用户</a>
            </form>
        </div>
        <!--用户-->

        <table class="providerTable" cellpadding="0" cellspacing="0">
            <tr class="firstTr">
                <th width="10%">用户编码</th>
                <th width="20%">用户名称</th>
                <th width="10%">性别</th>
                <th width="10%">年龄</th>
                <th width="10%">电话</th>
                <th width="10%">用户角色</th>
                <th width="30%">操作</th>
            </tr>

            <tbody id="tbody">

            </tbody>

            <%--            <c:forEach items="${users}" var="user">--%>

            <%--                <tr>--%>
            <%--                    <td>--%>
            <%--                        <span>${user.userCode}</span>--%>
            <%--                    </td>--%>
            <%--                    <td>--%>
            <%--                        <span>${user.userName}</span>--%>
            <%--                    </td>--%>
            <%--                    <td>--%>
            <%--							<span><c:if test="${user.gender==1}">--%>
            <%--                                女--%>
            <%--                            </c:if>--%>

            <%--                            <c:if test="${user.gender==2}">--%>
            <%--                                男--%>
            <%--                            </c:if></span>--%>
            <%--                    </td>--%>
            <%--                    <td>--%>
            <%--                        <span>${user.age}</span>--%>
            <%--                    </td>--%>
            <%--                    <td>--%>
            <%--                        <span>${user.phone}</span>--%>
            <%--                    </td>--%>
            <%--                    <td>--%>
            <%--                        <span>${user.userRoleName}</span>--%>
            <%--                    </td>--%>
            <%--                    <td>--%>
            <%--                    <span><a class="viewUser" href="/user/getuser/${user.id}" userid=11 username=孙兴><img--%>
            <%--                            src="/static/images/read.png"--%>
            <%--                            alt="查看"--%>
            <%--                            title="查看"/></a></span>--%>
            <%--                        <span><a class="modifyUser" href="/user/upd/${user.id}" userid=11 username=孙兴><img--%>
            <%--                                src="/static/images/xiugai.png"--%>
            <%--                                alt="修改" title="修改"/></a></span>--%>
            <%--                        <span><a class="deleteUser" href="/user/del/${user.id}" userid=11 username=孙兴><img--%>
            <%--                                src="/static/images/schu.png"--%>
            <%--                                alt="删除" title="删除"/></a></span>--%>
            <%--                    </td>--%>
            <%--                </tr>--%>
            <%--            </c:forEach>--%>


        </table>
        <input type="hidden" id="totalPageCount" value="3"/>


        <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
        <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>Insert title here</title>
            <script type="text/javascript">

            </script>
        </head>
        <body>
        <div class="page-bar">
            <ul class="page-num-ul clearfix">
                <li>共12条记录&nbsp;&nbsp; 1/3页</li>


                <a href="javascript:page_nav(document.forms[0],2);">下一页</a>
                <a href="javascript:page_nav(document.forms[0],3);">最后一页</a>

                &nbsp;&nbsp;
            </ul>
            <span class="page-go-form"><label>跳转至</label>
	     <input type="text" name="inputPage" id="inputPage" class="page-key"/>页
	     <button type="button" class="page-btn"
                 onClick='jump_to(document.forms[0],document.getElementById("inputPage").value)'>GO</button>
		</span>
        </div>
        </body>
        <script type="text/javascript" src="/static/js/rollpage.js"></script>
        </html>
    </div>
</section>

<!--点击删除按钮后弹出的页面-->
<div class="zhezhao"></div>
<div class="remove" id="removeUse">
    <div class="removerChid">
        <h2>提示</h2>
        <div class="removeMain">
            <p>你确定要删除该用户吗？</p>
            <a href="#" id="yes">确定</a>
            <a href="#" id="no">取消</a>
        </div>
    </div>
</div>


<footer class="footer">
    版权归北大青鸟
</footer>
<script type="text/javascript" src="/static/js/time.js"></script>
<script type="text/javascript" src="/static/js/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="/static/js/common.js"></script>
<script type="text/javascript" src="/static/calendar/WdatePicker.js"></script>
</body>
</html>
<%--<script type="text/javascript" src="/static/js/userlist.js"></script>--%>
<script>
    $(function () {
        show()
    })

    function show() {
        var count = "";
        $.ajax({
            "url": "/sys/user/userList.json",
            "type": "post",
            "data": "userRole=0",
            "dataType": "json",
            "success": function (result) {
                $(result.data).each(function () {
                    count += "<tr>" +
                        "<td>" + this.userCode + "</td>" +
                        "<td>" + this.userName + "</td>"
                    if (this.gender == 1) {
                        count += "<td>女</td>";
                    } else if (this.gender == 2) {
                        count += "<td>男</td>";
                    }
                    count += "<td>" + this.age + "</td>" +
                        "<td>" + this.phone + "</td>";

                    count += "<td>" + this.userRoleName + "</td>" +
                        "<td><span><a class='viewUser' href='/sys/user/getuser/" + this.id + "'><img src='/static/images/read.png' alt='查看' title='查看'></a></span>" +
                        "<span><a class='modifyUser' href='/sys/user/upd/" + this.id + "'><img src='/static/images/xiugai.png' alt='修改' title='修改'></a></span>" +
                        "<span><a class='deleteUser' href='javascript:void(0)' onclick='del(" + this.id + ")' ><img src='/static/images/schu.png' alt='删除' title='删除'></a></span>" +
                        "</td>" + "</tr>";
                })
                $("#tbody").html(count);
            },
            "error": function () {
                alert("请求失败");
            }
        })
    }

    $("#searchbutton").click(function () {
        var username = $("input[name='queryname']").val();
        var userrole = $("select[name='queryUserRole']").val();
        var count = "";
        $("#tbody").html("");
        $.ajax({
            "url": "/sys/user/userList.json",
            "type": "post",
            "data": "userName=" + username + "&userRole=" + userrole,
            "dataType": "json",
            "success": function (result) {
                $(result.data).each(function () {
                    alert(this.userName)
                    count += "<tr>" +
                        "<td>" + this.userCode + "</td>" +
                        "<td>" + this.userName + "</td>"
                    if (this.gender == 1) {
                        count += "<td>女</td>";
                    } else if (this.gender == 2) {
                        count += "<td>男</td>";
                    }
                    count += "<td>" + this.age + "</td>" +
                        "<td>" + this.phone + "</td>";
                    count += "<td>" + this.userRoleName + "</td>" +
                        "<td><span><a class='viewUser' href='/sys/user/getuser/" + this.id + "'><img src='/static/images/read.png' alt='查看' title='查看'></a></span>" +
                        "<span><a class='modifyUser' href='/sys/user/upd/" + this.id + "'><img src='/static/images/xiugai.png' alt='修改' title='修改'></a></span>" +
                        "<span><a class='deleteUser' href='javascript:void(0)' onclick='del(" + this.id + ")' ><img src='/static/images/schu.png' alt='删除' title='删除'></a></span>" +
                        "</td>" + "</tr>";

                })
                $("#tbody").append(count);
            },
            "error": function () {
                alert("请求失败");
            }
        })
    })

    function del(id) {
        var flag = confirm("确定要删除么");
        if (!flag) {
            return;
        }
        $.ajax({
            "url": "/sys/user/del",
            "type": "post",
            "data": {"id": id},
            "dataType": "json",
            "success": function (result) {
                alert(result.message)
                show();
            },
            "error": function () {
                alert("服务器异常");
            }
        })
    }

</script>
