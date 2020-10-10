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
            <span>订单管理页面</span>
        </div>
        <div class="search">
            <form method="get" action="jsp/bill.do">
                <input name="method" value="query" class="input-text" type="hidden">
                <span>商品名称：</span>
                <input name="queryProductName" type="text" value="">

                <span>供应商：</span>
                <select name="queryProviderId">

                    <option value="0">--请选择--</option>

                    <option
                            value="1">北京三木堂商贸有限公司
                    </option>

                    <option
                            value="2">石家庄帅益食品贸易有限公司
                    </option>

                    <option
                            value="3">深圳市泰香米业有限公司
                    </option>

                    <option
                            value="4">深圳市喜来客商贸有限公司
                    </option>

                    <option
                            value="5">兴化佳美调味品厂
                    </option>

                    <option
                            value="6">北京纳福尔食用油有限公司
                    </option>

                    <option
                            value="7">北京国粮食用油有限公司
                    </option>

                    <option
                            value="8">慈溪市广和绿色食品厂
                    </option>

                    <option
                            value="9">优百商贸有限公司
                    </option>

                    <option
                            value="10">南京火头军信息技术有限公司
                    </option>

                    <option
                            value="11">广州市白云区美星五金制品厂
                    </option>

                    <option
                            value="12">北京隆盛日化科技
                    </option>

                    <option
                            value="13">山东豪克华光联合发展有限公司
                    </option>

                    <option
                            value="14">无锡喜源坤商行
                    </option>

                    <option
                            value="15">乐摆日用品厂
                    </option>


                </select>

                <span>是否付款：</span>
                <select name="queryIsPayment">
                    <option value="0">--请选择--</option>
                    <option value="1">未付款</option>
                    <option value="2">已付款</option>
                </select>

                <input value="查 询" type="submit" id="searchbutton">
                <a href="jsp/billadd.jsp">添加订单</a>
            </form>
        </div>
        <!--账单表格 样式和供应商公用-->
        <table class="providerTable" cellpadding="0" cellspacing="0">
            <tr class="firstTr">
                <th width="10%">订单编码</th>
                <th width="20%">商品名称</th>
                <th width="10%">供应商</th>
                <th width="10%">订单金额</th>
                <th width="10%">是否付款</th>
                <th width="10%">创建时间</th>
                <th width="30%">操作</th>
            </tr>

            <tbody id="tbody">

            </tbody>

            <%--            <c:forEach items="${bills}" var="bill">--%>

            <%--                <tr>--%>
            <%--                    <td>--%>
            <%--                        <span>${bill.billCode}</span>--%>
            <%--                    </td>--%>
            <%--                    <td>--%>
            <%--                        <span>${bill.productName}</span>--%>
            <%--                    </td>--%>
            <%--                    <td>--%>
            <%--                        <span>${bill.providerName}</span>--%>
            <%--                    </td>--%>
            <%--                    <td>--%>
            <%--                        <span>${bill.totalPrice}</span>--%>
            <%--                    </td>--%>
            <%--                    <td>--%>
            <%--					<span>--%>
            <%--						<c:if test="${bill.isPayment==2}">--%>
            <%--                            已支付--%>
            <%--                        </c:if>--%>
            <%--						<c:if test="${bill.isPayment==1}">--%>
            <%--                            未支付--%>
            <%--                        </c:if>--%>
            <%--					</span>--%>
            <%--                    </td>--%>
            <%--                    <td>--%>
            <%--					<span>--%>
            <%--                        <fmt:formatDate value="${bill.creationDate}" pattern="yyyy-MM-dd"/>--%>
            <%--                    </span>--%>
            <%--                    </td>--%>
            <%--                    <td>--%>
            <%--                        <span><a class="viewBill" href="javascript:;" billid=1 billcc=BILL2016_001><img--%>
            <%--                                src="/static/images/read.png" alt="查看" title="查看"/></a></span>--%>
            <%--                        <span><a class="modifyBill" href="javascript:;" billid=1 billcc=BILL2016_001><img--%>
            <%--                                src="/static/images/xiugai.png" alt="修改" title="修改"/></a></span>--%>
            <%--                        <span><a class="deleteBill" href="javascript:;" billid=1 billcc=BILL2016_001><img--%>
            <%--                                src="/static/images/schu.png" alt="删除" title="删除"/></a></span>--%>
            <%--                    </td>--%>
            <%--                </tr>--%>

            <%--            </c:forEach>--%>

        </table>
    </div>
</section>

<!--点击删除按钮后弹出的页面-->
<div class="zhezhao"></div>
<div class="remove" id="removeBi">
    <div class="removerChid">
        <h2>提示</h2>
        <div class="removeMain">
            <p>你确定要删除该订单吗？</p>
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
<script type="text/javascript" src="/static/js/billlist.js"></script>
<script>
    // $(function () {
    //     $.ajax({
    //         "url": "/bill/billList.json",
    //         "data": "",
    //         "dataType": "json",
    //         "type": "post",
    //         "success": function (result) {
    //             var content = "";
    //             $.each(result.data, function (i, e) {
    //                 content += "<td><td>" + e.billCode + "</td><td>" + e.productName + "</td><td>" + e.providerName + "</td><td>" + e.totalPrice + "</td><td>" + e.isPayment + "</td><td>" + e.creationDate + "</td></tr>";
    //             });
    //             $("#tbody").html(content)
    //         },
    //         "error": function () {
    //             alert("网络连接失败")
    //         }
    //     })
    // })
    $(function () {
        var count = "";
        $.ajax({
            "url": "/sys/bill/billList.json",
            "type": "post",
            "data": "",
            "dataType": "json",
            "success": function (result) {
                $(result.data).each(function () {
                    count += "<tr>" +
                        "<td>" + this.billCode + "</td>" +
                        "<td>" + this.productName + "</td>" +
                        "<td>" + this.providerName + "</td>" +
                        "<td>" + this.totalPrice + "</td>";
                    if (this.isPayment == 1) {
                        count += "<td>未付款</td>";
                    } else if (this.isPayment == 2) {
                        count += "<td>已付款</td>";
                    }
                    count += "<td>" + this.creationDate + "</td>" +
                        "<td><span><a class='viewBill' href='/bill/bill.html/" + this.id + "'><img src='/static/images/read.png' alt='查看' title='查看'></a></span>" +
                        "<span><a class='modifyBill' href='/bill/billUpd.html/" + this.id + "'><img src='/static/images/xiugai.png' alt='修改' title='修改'></a></span>" +
                        "<span><a class='deleteBill' onclick='confirm('确定删除吗?')?location.href='/bill/billDel.do/" + this.id + "':'''' ><img src='/static/images/schu.png' alt='删除' title='删除'></a></span>" +
                        "</td>" + "</tr>";

                })
                $("#tbody").append(count);
            },
            "error": function () {
                alert("请求失败");
            }
        })
    })
</script>
