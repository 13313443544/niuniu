$(function () {
    $("#userCode").blur(function(){
        var userCode=$(this).val();
        $.ajax({
           "url":"/sys/user/checkUserCode",
           "type":"post",
           "dataType":"json",
           "data":{"userCode":userCode},
           "success":function (data) {
                alert(data.message)
           } ,
            "error":function () {
                alert("网络连接失败")
            }
        });
    });
});