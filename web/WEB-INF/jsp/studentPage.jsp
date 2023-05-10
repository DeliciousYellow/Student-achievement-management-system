<%@ page contentType="text/html;charset=UTF-8" language="java"%>
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
                    <a class="nav-link" href="${pageContext.request.contextPath}/studentPage">
                        <i class="mdi mdi-account-search menu-icon"></i>
                        <span class="menu-title">个人成绩查询</span>
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
                                <button id="queryAll" type="button" class="btn btn-primary btn-rounded btn-fw">查询所有</button>
                                <button type="button" class="btn btn-primary dropdown-toggle btn-rounded" data-bs-toggle="dropdown">
                                    分页查询
                                </button>
                                <ul class="dropdown-menu">
                                    <li><span class="dropdown-item-text">选择分页尺寸</span></li>
                                    <div class="dropdown-divider"></div>
                                    <li><a class="dropdown-item" onclick=changePageSize(5)>5</a></li>
                                    <li><a class="dropdown-item" onclick=changePageSize(6)>6</a></li>
                                    <li><a class="dropdown-item" onclick=changePageSize(7)>7</a></li>
                                    <li><a class="dropdown-item" onclick=changePageSize(8)>8</a></li>
                                    <li><a class="dropdown-item" onclick=changePageSize(9)>9</a></li>
                                    <li><a class="dropdown-item" onclick=changePageSize(10)>10</a></li>
                                    <li><a class="dropdown-item" onclick=changePageSize(15)>15</a></li>
                                    <li><a class="dropdown-item" onclick=changePageSize(20)>20</a></li>
                                    <li><a class="dropdown-item" onclick=changePageSize(100)>100</a></li>
                                </ul>
                            </div>
                            <!--分页标签-->
                            <div id="paging">

                            </div>
                            <!--表格-->
                            <div class="table-responsive pt-3">
                                <table class="table table-bordered">
                                    <thead>
                                        <tr>
                                            <th>
                                                #
                                            </th>
                                            <th>
                                                学号
                                            </th>
                                            <th>
                                                姓名
                                            </th>
                                            <th>
                                                学年/学期
                                            </th>
                                            <th>
                                                科目
                                            </th>
                                            <th>
                                                分数
                                            </th>
                                            <th>
                                                是否及格
                                            </th>
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
<script type="text/javascript">
    $(document).ready(function(){
        $("#queryAll").click(function(){
            $.ajax({
                type : "get",
                url : "${pageContext.request.contextPath}"+"/student/getByCode/${user.code}",
                async : true,
                dataType: 'json',
                // headers:{'Content-Type': 'application/json'},
                success : function (jsonArr){
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
    function changePageSize(size) {
        pageSize = size;
        $("#result").html('')
        $.ajax({
            type : "get",
            url : "${pageContext.request.contextPath}/student/getNumberByCode/${user.code}",
            async : true,
            dataType: 'json',
            // headers:{'Content-Type': 'application/json'},
            success : function (json){
                var max = Math.ceil(json/pageSize);
                let pagehtml = '';
                pagehtml+='<ul class="pagination">';
                pagehtml+='<li id="up" class="disabled page-item"><a class="page-link" onclick="sendQueryPage(-1,'+max+')">上一页</a></li>';
                for (let i = 0; i < json/pageSize; i++) {
                    pagehtml+='<li id="btn'+i+'" class="page-item"><button onclick="sendQueryPage(0,'+max+','+i+')" class="page-link">';
                    pagehtml+= i+1;
                    pagehtml+='</a></li>';
                }
                pagehtml+='<li id="down" class="disabled page-item"><a class="page-link" onclick="sendQueryPage(1,'+max+')">下一页</a></li></ul>';
                $("#paging").html(pagehtml)
            }
        })
    }
    var tip = 0;
    function sendQueryPage(flag,max,offset){
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
            url : "${pageContext.request.contextPath}/student/getByCode/${user.code}/"+tip+"/"+pageSize,
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

