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
            <span>供应商管理页面</span>
        </div>
        <div class="search">
            <form method="get" action="user/changePwd">
                <input name="method" value="query" type="hidden">
                <span>供应商编码：</span>
                <input name="queryProCode" type="text" value="">

                <span>供应商名称：</span>
                <input name="queryProName" type="text" value="">

                <input value="查 询" type="submit" id="searchbutton">
                <a href="jsp/provideradd.jsp">添加供应商</a>
            </form>
        </div>
        <!--供应商操作表格-->
        <table class="providerTable" cellpadding="0" cellspacing="0">
            <tr class="firstTr">
                <th width="10%">供应商编码</th>
                <th width="20%">供应商名称</th>
                <th width="10%">联系人</th>
                <th width="10%">联系电话</th>
                <th width="10%">传真</th>
                <th width="10%">创建时间</th>
                <th width="30%">操作</th>
            </tr>

            <tbody id="tbody">

            </tbody>

            <%--            <c:forEach items="${providers}" var="provider">--%>


            <%--                <tr>--%>
            <%--                    <td>--%>
            <%--                        <span>${provider.proCode}</span>--%>
            <%--                    </td>--%>
            <%--                    <td>--%>
            <%--                        <span>${provider.proName}</span>--%>
            <%--                    </td>--%>
            <%--                    <td>--%>
            <%--                        <span>${provider.proContact}</span>--%>
            <%--                    </td>--%>
            <%--                    <td>--%>
            <%--                        <span>${provider.proPhone}</span>--%>
            <%--                    </td>--%>
            <%--                    <td>--%>
            <%--                        <span>${provider.proFax}</span>--%>
            <%--                    </td>--%>
            <%--                    <td>--%>
            <%--					<span>--%>
            <%--						<fmt:formatDate value="${provider.creationDate}" pattern="yyyy-MM-dd"/>--%>
            <%--					</span>--%>
            <%--                    </td>--%>
            <%--                    <td>--%>
            <%--                        <span><a class="viewProvider" href="javascript:;" proid=1 proname=北京三木堂商贸有限公司><img--%>
            <%--                                src="/static/images/read.png" alt="查看" title="查看"/></a></span>--%>
            <%--                        <span><a class="modifyProvider" href="javascript:;" proid=1 proname=北京三木堂商贸有限公司><img--%>
            <%--                                src="/static/images/xiugai.png" alt="修改" title="修改"/></a></span>--%>
            <%--                        <span><a class="deleteProvider" href="javascript:;" proid=1 proname=北京三木堂商贸有限公司><img--%>
            <%--                                src="/static/images/schu.png" alt="删除" title="删除"/></a></span>--%>
            <%--                    </td>--%>
            <%--                </tr>--%>

            <%--            </c:forEach>--%>

        </table>

    </div>
</section>

<!--点击删除按钮后弹出的页面-->
<div class="zhezhao"></div>
<div class="remove" id="removeProv">
    <div class="removerChid">
        <h2>提示</h2>
        <div class="removeMain">
            <p>你确定要删除该供应商吗？</p>
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
<%--<script type="text/javascript" src="/static/js/providerlist.js"></script>--%>
<script type="text/javascript">
    $(function () {
        show();
    })

    function show() {
        var count = "";
        $.ajax({
            "url": "/sys/provider/providerList.json",
            "type": "post",
            "data": "",
            "dataType": "json",
            "success": function (result) {
                $(result.data).each(function () {
                    count += "<tr>" +
                        "<td>" + this.proCode + "</td>" +
                        "<td>" + this.proName + "</td>"
                    count += "<td>" + this.proContact + "</td>" +
                        "<td>" + this.proPhone + "</td>"
                    count += "<td>" + this.proFax + "</td>" +
                        "<td>" + this.creationDate + "</td>"+
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
</script>
