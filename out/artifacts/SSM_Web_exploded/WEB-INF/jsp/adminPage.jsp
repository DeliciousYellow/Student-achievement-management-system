<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html lang="en">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>重庆财经学院成绩管理系统</title>
    <!--bootstrap5引入-->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/bootstrap.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/js/bootstrap.bundle.js">
    <!--模态框-->
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/4.4.1/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/4.4.1/js/bootstrap.min.js"></script>
    <!--模板的依赖-->
    <!-- plugins:css -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/Bootstrap/vendors/mdi/css/materialdesignicons.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/Bootstrap/vendors/base/vendor.bundle.base.css">
    <!-- endinject -->
    <!-- plugin css for this page -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/Bootstrap/vendors/datatables.net-bs4/dataTables.bootstrap4.css">
    <!-- End plugin css for this page -->
    <!-- inject:css -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/Bootstrap/css/style.css">
    <!-- endinject -->
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/static/Bootstrap/images/favicon.png"/>
</head>

<body>
<div class="container-scroller">
    <!--页眉-->
    <nav class="navbar col-lg-12 col-12 p-0 fixed-top d-flex flex-row">
        <!--左上角图标-->
        <div class="navbar-brand-wrapper d-flex justify-content-center">
            <div class="navbar-brand-inner-wrapper d-flex justify-content-between align-items-center w-100">
                <a class="navbar-brand brand-logo" href="${pageContext.request.contextPath}/homePage"><img src="${pageContext.request.contextPath}/static/img/CQCJL.ico" alt="logo"/></a>
                <button class="navbar-toggler navbar-toggler align-self-center" type="button" data-toggle="minimize">
                    <span class="mdi mdi-sort-variant"></span>
                </button>
            </div>
        </div>
        <!--正上方页眉部分-->
        <div class="navbar-menu-wrapper d-flex align-items-center justify-content-end">
            <ul class="navbar-nav navbar-nav-right">
                <!--消息提醒铃铛-->
                <li class="nav-item dropdown me-4">
                    <a class="nav-link count-indicator dropdown-toggle d-flex align-items-center justify-content-center notification-dropdown" id="notificationDropdown" href="#" data-bs-toggle="dropdown">
                        <i class="mdi mdi-bell mx-0"></i>
                        <span class="count"></span>
                    </a>
                    <div class="dropdown-menu dropdown-menu-right navbar-dropdown" aria-labelledby="notificationDropdown">
                        <p class="mb-0 font-weight-normal float-left dropdown-header">Notifications</p>
                        <a class="dropdown-item">
                            <div class="item-thumbnail">
                                <div class="item-icon bg-success">
                                    <i class="mdi mdi-information mx-0"></i>
                                </div>
                            </div>
                            <div class="item-content">
                                <h6 class="font-weight-normal">Application Error</h6>
                                <p class="font-weight-light small-text mb-0 text-muted">
                                    Just now
                                </p>
                            </div>
                        </a>
                        <a class="dropdown-item">
                            <div class="item-thumbnail">
                                <div class="item-icon bg-warning">
                                    <i class="mdi mdi-settings mx-0"></i>
                                </div>
                            </div>
                            <div class="item-content">
                                <h6 class="font-weight-normal">Settings</h6>
                                <p class="font-weight-light small-text mb-0 text-muted">
                                    Private message
                                </p>
                            </div>
                        </a>
                        <a class="dropdown-item">
                            <div class="item-thumbnail">
                                <div class="item-icon bg-info">
                                    <i class="mdi mdi-account-box mx-0"></i>
                                </div>
                            </div>
                            <div class="item-content">
                                <h6 class="font-weight-normal">New user registration</h6>
                                <p class="font-weight-light small-text mb-0 text-muted">
                                    2 days ago
                                </p>
                            </div>
                        </a>
                    </div>
                </li>
                <!--头像，姓名，个人设置，退出登录-->
                <li class="nav-item nav-profile dropdown">
                    <a class="nav-link dropdown-toggle" href="#" data-bs-toggle="dropdown" id="profileDropdown">
                        <img src="${pageContext.request.contextPath}${user.imgPath}" alt="profile"/>
                        <span class="nav-profile-name">${user.name}</span>
                    </a>
                    <div class="dropdown-menu dropdown-menu-right navbar-dropdown" aria-labelledby="profileDropdown">
                        <a class="dropdown-item" href="${pageContext.request.contextPath}/loginout">
                            <i class="mdi mdi-logout text-primary"></i>
                            退出登录
                        </a>
                    </div>
                </li>
            </ul>
        </div>
    </nav>
    <!-- 页眉下方 -->
    <div class="container-fluid page-body-wrapper">
        <!-- 左下页面列表 -->
        <nav class="sidebar sidebar-offcanvas" id="sidebar">
            <ul class="nav">
                <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}/homePage">
                        <i class="mdi mdi-home menu-icon"></i>
                        <span class="menu-title">主页</span>
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}/adminPage">
                        <i class="mdi mdi-account-search menu-icon"></i>
                        <span class="menu-title">教务处全校概览</span>
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}/PersonalSettingsPage">
                        <i class="mdi mdi-settings menu-icon"></i>
                        <span class="menu-title">个人设置</span>
                    </a>
                </li>
            </ul>
        </nav>
        <!-- 右下主要部分 -->
        <div class="main-panel">
            <div class="content-wrapper">
                <div class="col-lg-12 stretch-card">
                    <div class="card">
                        <div class="card-body">
                            <h4 class="card-title">欢迎，${user.name}</h4>
                            <div class="card-description">
                                <div class="row">
                                    <div class="col-sm-4 p-4">
                                        学生操作
                                        <div class="btn-group">
                                        <button id="queryAllScore" type="button" class="btn btn-primary btn-rounded btn-fw">查询所有</button>
                                        <button type="button" class="btn btn-primary dropdown-toggle btn-rounded" data-bs-toggle="dropdown">
                                            分页查询
                                        </button>
                                        <ul class="dropdown-menu">
                                            <li><span class="dropdown-item-text">选择分页尺寸</span></li>
                                            <div class="dropdown-divider"></div>
                                            <li><a class="dropdown-item" onclick=changePageSizeScore(5)>5</a></li>
                                            <li><a class="dropdown-item" onclick=changePageSizeScore(6)>6</a></li>
                                            <li><a class="dropdown-item" onclick=changePageSizeScore(7)>7</a></li>
                                            <li><a class="dropdown-item" onclick=changePageSizeScore(8)>8</a></li>
                                            <li><a class="dropdown-item" onclick=changePageSizeScore(9)>9</a></li>
                                            <li><a class="dropdown-item" onclick=changePageSizeScore(10)>10</a></li>
                                            <li><a class="dropdown-item" onclick=changePageSizeScore(15)>15</a></li>
                                            <li><a class="dropdown-item" onclick=changePageSizeScore(20)>20</a></li>
                                            <li><a class="dropdown-item" onclick=changePageSizeScore(100)>100</a></li>
                                        </ul>
                                    </div>
                                    </div>
                                    <div class="col-sm-4 p-4">
                                        用户操作
                                        <div class="btn-group">
                                            <button id="queryAllUser" type="button" class="btn btn-success btn-rounded btn-fw">查询所有</button>
                                            <button type="button" class="btn btn-success dropdown-toggle btn-rounded" data-bs-toggle="dropdown">
                                                分页查询
                                            </button>
                                            <ul class="dropdown-menu">
                                                <li><span class="dropdown-item-text">选择分页尺寸</span></li>
                                                <div class="dropdown-divider"></div>
                                                <li><a class="dropdown-item" onclick=changePageSizeUser(5)>5</a></li>
                                                <li><a class="dropdown-item" onclick=changePageSizeUser(6)>6</a></li>
                                                <li><a class="dropdown-item" onclick=changePageSizeUser(7)>7</a></li>
                                                <li><a class="dropdown-item" onclick=changePageSizeUser(8)>8</a></li>
                                                <li><a class="dropdown-item" onclick=changePageSizeUser(9)>9</a></li>
                                                <li><a class="dropdown-item" onclick=changePageSizeUser(10)>10</a></li>
                                                <li><a class="dropdown-item" onclick=changePageSizeUser(15)>15</a></li>
                                                <li><a class="dropdown-item" onclick=changePageSizeUser(20)>20</a></li>
                                                <li><a class="dropdown-item" onclick=changePageSizeUser(100)>100</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="col-sm-4 p-4">
                                        添加用户/学院
                                        <div class="btn-group">
                                            <div>
                                                <!-- //打开模态的按钮 -->
                                                <button onclick="queryDept()" type="button" class="btn btn-primary btn-warning btn-rounded" data-toggle="modal" data-target="#myModal">
                                                    添加用户
                                                </button>
                                                <!-- //模态框 -->
                                                <div class="modal fade" id="myModal">
                                                    <div class="modal-dialog modal-dialog-centered">
                                                        <div class="modal-content">
                                                            <!-- //模态头部  -->
                                                            <div class="modal-header">
                                                                <h4 class="modal-title">录入用户信息</h4>
                                                                <button type="button" class="close" data-dismiss="modal">×</button>
                                                            </div>
                                                            <!-- //模态内容 -->
                                                            <div class="modal-body">
                                                                <form class="forms-sample" onsubmit="return false">
                                                                    <div class="form-group">
                                                                        <label for="UserCode">用户ID</label>
                                                                        <input type="text" class="form-control" id="UserCode" placeholder="用户ID" required="required">
                                                                    </div>
                                                                    <div class="form-group">
                                                                        <label for="UserName">用户姓名</label>
                                                                        <input type="text" class="form-control" id="UserName" placeholder="用户姓名" required="required">
                                                                    </div>
                                                                    <div class="form-group">
                                                                        <label for="dept">学院</label>
                                                                        <select id="dept" class="form-control">

                                                                        </select>
                                                                    </div>
                                                                    <div class="form-group">
                                                                        <label for="sex">性别</label>
                                                                        <select id="sex" class="form-control">
                                                                            <option>请选择性别</option>
                                                                            <option value="1">男</option>
                                                                            <option value="0">女</option>
                                                                        </select>
                                                                    </div>
                                                                    <div id="format"></div>
                                                                    <button id="addUser" type="submit" class="btn btn-warning me-2">提交</button>
                                                                </form>
                                                            </div>
                                                            <!-- //模态尾部  -->
                                                            <div class="modal-footer">
                                                                <button type="button" class="btn btn-danger" data-dismiss="modal">关闭</button>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div>
                                                <!-- //打开模态的按钮 -->
                                                <button type="button" class="btn btn-primary btn-warning btn-rounded" data-toggle="modal" data-target="#myModal2">
                                                    添加学院
                                                </button>
                                                <!-- //模态框 -->
                                                <div class="modal fade" id="myModal2">
                                                    <div class="modal-dialog modal-dialog-centered">
                                                        <div class="modal-content">
                                                            <!-- //模态头部  -->
                                                            <div class="modal-header">
                                                                <h4 class="modal-title">录入学院信息</h4>
                                                                <button type="button" class="close" data-dismiss="modal">×</button>
                                                            </div>
                                                            <!-- //模态内容 -->
                                                            <div class="modal-body">
                                                                <form class="forms-sample" onsubmit="return false">
                                                                    <div class="form-group">
                                                                        <label for="DeptName">学院名</label>
                                                                        <input type="text" class="form-control" id="DeptName" placeholder="学院名" required="required">
                                                                    </div>
                                                                    <div class="form-group">
                                                                        <label for="DeptCode">学院ID</label>
                                                                        <input type="text" class="form-control" id="DeptCode" placeholder="学院ID" required="required">
                                                                    </div>
                                                                    <div id="format2"></div>
                                                                    <button id="addDept" type="submit" class="btn btn-warning me-2">提交</button>
                                                                </form>
                                                            </div>
                                                            <!-- //模态尾部  -->
                                                            <div class="modal-footer">
                                                                <button type="button" class="btn btn-danger" data-dismiss="modal">关闭</button>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </div>
                            <!--分页标签-->
                            <div id="paging">

                            </div>
                            <!--表格-->
                            <div class="table-responsive pt-3">
                                <table class="table table-bordered">
                                    <thead>
                                    <tr id="tr">

                                    </tr>
                                    </thead>
                                    <tbody id="result">

                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- 最下方版权标识 -->
            <footer class="footer">
                <div class="d-sm-flex justify-content-center justify-content-sm-between">
                    <span class="text-muted text-center text-sm-left d-block d-sm-inline-block">Copyright © 2022 <a href="http://jwc.cfec.edu.cn/" target="_blank">jwc.cfec.edu.cn</a>All Rights Reserved</span>
                    <span class="float-none float-sm-right d-block mt-1 mt-sm-0 text-center">如有问题请联系delicious_blood@qq.com</span>
                </div>
            </footer>
        </div>
    </div>
</div>
</body>

<script src="static/js/jquery-3.6.0.js"></script>
<!--对学生成绩查询-->
<script type="text/javascript">
    $(document).ready(function(){
        $("#queryAllScore").click(function(){
            $.ajax({
                type : "get",
                url : "${pageContext.request.contextPath}"+"/admin/getScoreAll",
                async : true,
                dataType: 'json',
                success : function (jsonArr){
                    $("#tr").html('<th>#</th><th>学号</th><th>姓名</th><th>学年/学期</th><th>科目</th><th>分数</th><th>是否及格</th>');
                    let html = '';
                    let count = 1;
                    for (let i = 0; i < jsonArr.length; i++) {
                        var pass = "不及格";
                        if (jsonArr[i].score >= 60){
                            html += '<tr class="table-info">';
                            pass = "及格";
                        }else
                            html += '<tr class="table-danger">';
                        html+='<td>'+count+++'</td>';
                        html+='<td>'+jsonArr[i].code+'</td>';
                        html+='<td>'+jsonArr[i].name+'</td>';
                        html+='<td>'+jsonArr[i].semester+'</td>';
                        html+='<td>'+jsonArr[i].courseName+'</td>';
                        html+='<td>'+jsonArr[i].score+'</td>';
                        html+='<td>'+pass+'</td>';
                    }
                    $("#result").html(html)
                    $("#paging").html('')
                }
            })
        })

    })
    var pageSize = 10;
    function changePageSizeScore(size) {
        pageSize = size;
        $("#result").html('')
        $.ajax({
            type : "get",
            url : "${pageContext.request.contextPath}/admin/getScoreNum",
            async : true,
            dataType: 'json',
            // headers:{'Content-Type': 'application/json'},
            success : function (json){
                var max = Math.ceil(json/pageSize);
                let pagehtml = '';
                pagehtml+='<ul class="pagination">';
                pagehtml+='<li id="up" class="disabled page-item"><a class="page-link" onclick="sendQueryPageScore(-1,'+max+')">上一页</a></li>';
                for (let i = 0; i < json/pageSize; i++) {
                    pagehtml+='<li id="btn'+i+'" class="page-item"><button onclick="sendQueryPageScore(0,'+max+','+i+')" class="page-link">';
                    pagehtml+= i+1;
                    pagehtml+='</a></li>';
                }
                pagehtml+='<li id="down" class="disabled page-item"><a class="page-link" onclick="sendQueryPageScore(1,'+max+')">下一页</a></li></ul>';
                $("#paging").html(pagehtml)
            }
        })
    }
    var tip = 0;
    function sendQueryPageScore(flag,max,offset){
        if (flag == 0){
            tip = offset*pageSize;
            <!--先用类选择器删除所有激活，再用id设置激活状态-->
            $(".page-item").removeClass("active");
            $("#btn"+offset).addClass("active");
        }else{
            if (flag == -1){
                tip = tip-pageSize;
            }
            if (flag == 1){
                tip = tip+pageSize;
            }
            $(".page-item").removeClass("active");
            $("#btn"+tip/pageSize).addClass("active");
        }
        <!--每次tip改变值后判定是否允许上下页按钮操作-->
        console.log("tip="+tip);
        if(tip/pageSize > 0){
            $("#up").removeClass("disabled");
        }
        if(tip/pageSize < max-1){
            $("#down").removeClass("disabled");
        }
        if(tip/pageSize == 0){
            $("#up").addClass("disabled");
        }
        if(tip/pageSize == max-1){
            $("#down").addClass("disabled");
        }

        $.ajax({
            type : "get",
            url : "${pageContext.request.contextPath}/admin/getScoreAllPage/"+tip+"/"+pageSize,
            async : true,
            dataType: 'json',
            // headers:{'Content-Type': 'application/json'},
            success : function (jsonArr){
                let Queryhtml = '';
                let count = tip+1;
                for (let i = 0; i < jsonArr.length; i++) {
                    var pass = "不及格";
                    if (jsonArr[i].score >= 60){
                        Queryhtml += '<tr class="table-info">';
                        pass = "及格";
                    }else
                        Queryhtml += '<tr class="table-danger">';
                    Queryhtml+='<td>'+count+++'</td>';
                    Queryhtml+='<td>'+jsonArr[i].code+'</td>';
                    Queryhtml+='<td>'+jsonArr[i].name+'</td>';
                    Queryhtml+='<td>'+jsonArr[i].semester+'</td>';
                    Queryhtml+='<td>'+jsonArr[i].courseName+'</td>';
                    Queryhtml+='<td>'+jsonArr[i].score+'</td>';
                    Queryhtml+='<td>'+pass+'</td>';
                }
                $("#result").html(Queryhtml)
            }
        })
    }
</script>
<!--对用户进行操作-->
<script type="text/javascript">
    $(document).ready(function(){
        $("#queryAllUser").click(function(){
            $.ajax({
                type : "get",
                url : "${pageContext.request.contextPath}"+"/admin/getAllUser",
                async : true,
                dataType: 'json',
                success : function (jsonArr){
                    let htmlUser = '';
                    let count = 1;
                    $("#tr").html('<th>#</th><th>用户ID</th><th>姓名</th><th>性别</th><th>学院名</th><th>邮箱</th><th>操作</th>');
                    for (let i = 0; i < jsonArr.length; i++) {
                        var s = String(jsonArr[i].code).substring(0,1);
                        console.log(s);
                        if (s==='T'||s==='a'){
                            htmlUser+='<tr class="table-info">';
                        }else{
                            htmlUser+='<tr class="table-success">';
                        }
                        htmlUser+='<td>'+count+'</td>';
                        htmlUser+='<td>'+jsonArr[i].code+'</td>';
                        htmlUser+='<td>'+jsonArr[i].name+'</td>';
                        if (jsonArr[i].sex===0){
                            htmlUser+='<td>男</td>';
                        }else {
                            htmlUser+='<td>女</td>';
                        }
                        htmlUser+='<td>'+jsonArr[i].deptName+'</td>';
                        if (jsonArr[i].email===undefined){
                            htmlUser+='<td>该用户未设置邮箱</td>';
                        }else {
                            htmlUser+='<td>'+jsonArr[i].email+'</td>';
                        }
                        htmlUser+='<td><button style="margin-left:10px" onclick="resetPwd(\''+jsonArr[i].code+'\')" type="button" class="btn btn-danger btn-sm">重置密码</button>';
                        htmlUser+='<button onclick="queryDeptP('+count+')" style="margin-left:10px" data-toggle="modal" data-target="#Modal'+count+'" type="button" class="btn btn-warning btn-sm">修改</button>';

                        htmlUser+='<div class="modal fade" id="Modal'+count+'"><div class="modal-dialog modal-dialog-centered"><div class="modal-content">';
                        htmlUser+='<div class="modal-header"><h4 class="modal-title">录入用户信息</h4><button type="button" class="close" data-dismiss="modal">×</button></div>';
                        htmlUser+='<div class="modal-body"><form class="forms-sample" onsubmit="return false">';
                        htmlUser+='<div class="form-group"><label for="UserCode">用户ID</label><input type="text" class="form-control" id="UserCode'+count+'" value="'+jsonArr[i].code+'" placeholder="用户ID" required="required"></div>';
                        htmlUser+='<div class="form-group"><label for="UserName">用户姓名</label><input type="text" class="form-control" id="UserName'+count+'" value="'+jsonArr[i].name+'" placeholder="用户姓名" required="required"></div>';
                        htmlUser+='<div class="form-group"><label for="dept">学院</label><select id="dept'+count+'" value="'+jsonArr[i].deptName+'" class="form-control"></select></div>';
                        htmlUser+='<div class="form-group"><label for="sex">性别</label><select id="sex'+count+'" value="'+jsonArr[i].sex+'" class="form-control"><option>请选择性别</option><option value="1">男</option><option value="0">女</option></select></div><div id="format">';
                        htmlUser+='</div><button onclick="updateUser('+count+++','+jsonArr[i].id+')" id="addUser" type="submit" class="btn btn-warning me-2">提交</button></form></div>';
                        htmlUser+='<div class="modal-footer"><button type="button" class="btn btn-danger" data-dismiss="modal">关闭</button></div></div></div></div>';

                        htmlUser+='<button style="margin-left:10px" onclick="deleteScore(\''+jsonArr[i].code+'\',\''+jsonArr[i].courseName+'\')" type="button" class="btn btn-danger btn-sm">删除</button></td>';
                    }
                    $("#result").html(htmlUser)
                    $("#paging").html('')
                }
            })
        })

        $("#addUser").click(function () {
            $.ajaxSettings.async = false;
            <!--判断字段不为空和空格，减少服务器/数据库压力-->
            <!--这里没做约束-->
            $.post("${pageContext.request.contextPath}/admin/addUser",
                {
                    code : String($("#UserCode").val()),
                    name : $("#UserName").val(),
                    deptId : $("#dept").val(),
                    sex : $("#sex").val()
                },
                function(result){
                    if (result==1){
                        alert("添加成功");
                    }else {
                        alert("添加失败");
                    }
                }
            )
            $.ajaxSettings.async = true;
        })

        $("#addDept").click(function () {
            <!--判断字段不为空和空格，减少服务器/数据库压力-->
            <!--这里没做约束-->
            $.post("${pageContext.request.contextPath}/admin/addDept",
                {
                    deptCode : String($("#DeptCode").val()),
                    deptName : String($("#DeptName").val())
                },
                function(result){
                    if (result==="1"){
                        alert("添加学院成功");
                    }else {
                        alert("添加学院失败");
                    }
                }
            )
        })


    })

    function queryDept(){
        $.ajax({
            type : "get",
            url : "${pageContext.request.contextPath}/admin/getDept",
            async : true,
            dataType: 'json',
            success : function (jsonArr){
                let option='';
                option+='<option>请选择部门</option>'
                for (let i = 0; i < jsonArr.length; i++) {
                    option+='<option value="'+jsonArr[i].deptCode+'">'+jsonArr[i].deptName+'</option>'
                }
                $("#dept").html(option);
            }
        })
    }
    function queryDeptP(count){
        $.ajax({
            type : "get",
            url : "${pageContext.request.contextPath}/admin/getDept",
            async : true,
            dataType: 'json',
            success : function (jsonArr){
                let option='';
                option+='<option>请选择部门</option>'
                for (let i = 0; i < jsonArr.length; i++) {
                    option+='<option value="'+jsonArr[i].deptCode+'">'+jsonArr[i].deptName+'</option>'
                }
                $("#dept"+count).html(option);
            }
        })
    }

    var tip = 0;
    var pageSize = 10;
    function changePageSizeUser(size) {
        pageSize = size;
        $("#result").html('')
        $.ajax({
            type : "get",
            url : "${pageContext.request.contextPath}"+"/admin/getUserNum",
            async : true,
            dataType: 'json',
            // headers:{'Content-Type': 'application/json'},
            success : function (json){
                var max = Math.ceil(json/pageSize);
                let pagehtml = '';
                pagehtml+='<ul class="pagination">';
                pagehtml+='<li id="up" class="disabled page-item"><a class="page-link" onclick="sendQueryPageUser(-1,'+max+')">上一页</a></li>';
                for (let i = 0; i < json/pageSize; i++) {
                    pagehtml+='<li id="btn'+i+'" class="page-item"><button onclick="sendQueryPageUser(0,'+max+','+i+')" class="page-link">';
                    pagehtml+= i+1;
                    pagehtml+='</a></li>';
                }
                pagehtml+='<li id="down" class="disabled page-item"><a class="page-link" onclick="sendQueryPageUser(1,'+max+')">下一页</a></li></ul>';
                $("#paging").html(pagehtml)
            }
        })
    }

    function sendQueryPageUser(flag,max,offset){
        if (flag == 0){
            tip = offset*pageSize;
            <!--先用类选择器删除所有激活，再用id设置激活状态-->
            $(".page-item").removeClass("active");
            $("#btn"+offset).addClass("active");
        }else{
            if (flag == -1){
                tip = tip-pageSize;
            }
            if (flag == 1){
                tip = tip+pageSize;
            }
            $(".page-item").removeClass("active");
            $("#btn"+tip/pageSize).addClass("active");
        }
        <!--每次tip改变值后判定是否允许上下页按钮操作-->
        if(tip/pageSize > 0){
            $("#up").removeClass("disabled");
        }
        if(tip/pageSize < max-1){
            $("#down").removeClass("disabled");
        }
        if(tip/pageSize == 0){
            $("#up").addClass("disabled");
        }
        if(tip/pageSize == max-1){
            $("#down").addClass("disabled");
        }
        <!--分页请求-->
        $.ajax({
            type : "get",
            url : "${pageContext.request.contextPath}/admin/getUserPage/"+tip+"/"+pageSize,
            async : true,
            dataType: 'json',
            // headers:{'Content-Type': 'application/json'},
            success : function (jsonArr){
                let htmlUserPage = '';
                let count = tip+1;
                $("#tr").html('<th>#</th><th>用户ID</th><th>姓名</th><th>性别</th><th>学院名</th><th>邮箱</th><th>操作</th>');
                for (let i = 0; i < jsonArr.length; i++) {
                    var s = String(jsonArr[i].code).substring(0,1);
                    console.log(s);
                    if (s==='T'||s==='a'){
                        htmlUserPage+='<tr class="table-info">';
                    }else{
                        htmlUserPage+='<tr class="table-success">';
                    }
                    htmlUserPage+='<td>'+count+'</td>';
                    htmlUserPage+='<td>'+jsonArr[i].code+'</td>';
                    htmlUserPage+='<td>'+jsonArr[i].name+'</td>';
                    if (jsonArr[i].sex===0){
                        htmlUserPage+='<td>男</td>';
                    }else {
                        htmlUserPage+='<td>女</td>';
                    }
                    htmlUserPage+='<td>'+jsonArr[i].deptName+'</td>';
                    if (jsonArr[i].email===undefined){
                        htmlUserPage+='<td>该用户未设置邮箱</td>';
                    }else {
                        htmlUserPage+='<td>'+jsonArr[i].email+'</td>';
                    }
                    htmlUserPage+='<td><button style="margin-left:10px" onclick="resetPwd(\''+jsonArr[i].code+'\')" type="button" class="btn btn-danger btn-sm">重置密码</button>';
                    htmlUserPage+='<button onclick="queryDeptP('+count+')" style="margin-left:10px" data-toggle="modal" data-target="#Modal'+count+'" type="button" class="btn btn-warning btn-sm">修改</button>';

                    htmlUserPage+='<div class="modal fade" id="Modal'+count+'"><div class="modal-dialog modal-dialog-centered"><div class="modal-content">';
                    htmlUserPage+='<div class="modal-header"><h4 class="modal-title">录入用户信息</h4><button type="button" class="close" data-dismiss="modal">×</button></div>';
                    htmlUserPage+='<div class="modal-body"><form class="forms-sample" onsubmit="return false">';
                    htmlUserPage+='<div class="form-group"><label for="UserCode">用户ID</label><input type="text" class="form-control" id="UserCode'+count+'" value="'+jsonArr[i].code+'" placeholder="用户ID" required="required"></div>';
                    htmlUserPage+='<div class="form-group"><label for="UserName">用户姓名</label><input type="text" class="form-control" id="UserName'+count+'" value="'+jsonArr[i].name+'" placeholder="用户姓名" required="required"></div>';
                    htmlUserPage+='<div class="form-group"><label for="dept">学院</label><select id="dept'+count+'" value="'+jsonArr[i].deptName+'" class="form-control"></select></div>';
                    htmlUserPage+='<div class="form-group"><label for="sex">性别</label><select id="sex'+count+'" value="'+jsonArr[i].sex+'" class="form-control"><option>请选择性别</option><option value="1">男</option><option value="0">女</option></select></div><div id="format">';
                    htmlUserPage+='</div><button onclick="updateUser('+count+++','+jsonArr[i].id+')" id="addUser" type="submit" class="btn btn-warning me-2">提交</button></form></div>';
                    htmlUserPage+='<div class="modal-footer"><button type="button" class="btn btn-danger" data-dismiss="modal">关闭</button></div></div></div></div>';

                    htmlUserPage+='<button style="margin-left:10px" onclick="deleteScore(\''+jsonArr[i].code+'\',\''+jsonArr[i].courseName+'\')" type="button" class="btn btn-danger btn-sm">删除</button></td>';
                }
                $("#result").html(htmlUserPage)
            }
        })
    }
    <!--重置密码触发的函数-->
    function resetPwd(code) {
        var r=confirm("确定重置密码吗？");
        if(r){
            $.get("${pageContext.request.contextPath}/admin/resetPwd/"+code,
                function(result){
                    if (result>=1){
                        alert("重置成功");
                    }else {
                        alert("重置失败");
                    }
                }
            )
        }
        return;
    }
    <!--删除按钮触发的函数-->
    function deleteScore(code,courseName) {
        var r=confirm("确认删除该数据吗？");
        // jsonstr = '{\"code\":\"'+code+'\",\"courseName\":\"'+courseName+'\"}';
        // console.log(jsonstr);
        if(r){
            $.ajax({
                type:"POST",//此处仍然使用post
                url:"${pageContext.request.contextPath}/instructor/deleteScore",
                async:false,
                traditional:true,
                dataType:"json",
                data:{
                    _method:"DELETE", //这里是要修改的部分
                    code : code,
                    courseName : courseName
                },
                success:function (result) {
                    if (result>=1){
                        alert("删除成功");
                    }else{
                        alert("删除失败");
                    }
                }
            })
        }
        return;
    }
    <!--修改按钮触发的函数-->
    function updateUser(count,id) {
        console.log(id)
        $.ajaxSettings.async = false;
        var UserCode = $("#UserCode"+count).val()
        var UserName = $("#UserName"+count).val()
        var dept = $("#dept"+count).val()
        var sex = $("#sex"+count).val()
        console.log(UserCode,UserName,dept,sex)
        // <!--判断字段不为空和空格，减少服务器/数据库压力-->
        $.ajax({
            type:"POST",//此处仍然使用post
            url:"${pageContext.request.contextPath}/admin/updateUser",
            async:false,
            traditional:true,
            dataType:"json",
            data:{
                _method:"PUT", //这里是要修改的部分
                id : id,
                code : UserCode,
                name : UserName,
                deptId : dept,
                sex : sex
            },
            success:function (result) {
                if (result == 1){
                    alert("修改成功");
                }else {
                    alert("修改失败");
                }
            }
        })
        $.ajaxSettings.async = true;
        return;
    }
</script>

<!--模板的依赖-->
<!-- plugins:js -->
<script src="${pageContext.request.contextPath}/static/Bootstrap/vendors/base/vendor.bundle.base.js"></script>
<!-- endinject -->
<!-- Plugin js for this page-->
<script src="${pageContext.request.contextPath}/static/Bootstrap/vendors/chart.js/Chart.min.js"></script>
<script src="${pageContext.request.contextPath}/static/Bootstrap/vendors/datatables.net/jquery.dataTables.js"></script>
<script src="${pageContext.request.contextPath}/static/Bootstrap/vendors/datatables.net-bs4/dataTables.bootstrap4.js"></script>
<!-- End plugin js for this page-->
<!-- inject:js -->
<script src="${pageContext.request.contextPath}/static/Bootstrap/js/off-canvas.js"></script>
<script src="${pageContext.request.contextPath}/static/Bootstrap/js/hoverable-collapse.js"></script>
<script src="${pageContext.request.contextPath}/static/Bootstrap/js/template.js"></script>
<!-- endinject -->
<!-- Custom js for this page-->
<script src="${pageContext.request.contextPath}/static/Bootstrap/js/dashboard.js"></script>
<script src="${pageContext.request.contextPath}/static/Bootstrap/js/data-table.js"></script>
<script src="${pageContext.request.contextPath}/static/Bootstrap/js/jquery.dataTables.js"></script>
<script src="${pageContext.request.contextPath}/static/Bootstrap/js/dataTables.bootstrap4.js"></script>
<!-- End custom js for this page-->
<script src="${pageContext.request.contextPath}/static/Bootstrap/js/jquery.cookie.js" type="text/javascript"></script>
</html>

