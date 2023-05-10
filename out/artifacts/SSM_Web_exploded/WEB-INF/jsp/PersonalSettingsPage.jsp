<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html lang="en">

<head>
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
                <!--头像，昵称，个人设置，退出登录-->
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
                <li id="li" class="nav-item">
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
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col-md-12 grid-margin">
                                <div class="d-flex justify-content-between flex-wrap">
                                    <div class="d-flex align-items-end flex-wrap">
                                        <div class="me-md-3 me-xl-5">
                                            <div class="container">
                                                <br>
                                                <h4>我的个人信息</h4><br>
                                                头像：<img style="width:200px;height:200px;" src="${pageContext.request.contextPath}${user.imgPath}"/><br>
                                                用户ID：${user.code}<br><br>
                                                学院：${deptName}<br><br>
                                                姓名：${user.name}<br><br>
                                                密码：${user.pwd}<br><br>
                                                邮箱：${user.email}<br><br>
                                                <!-- //打开模态的按钮 -->
                                                <button type="button" class="btn btn-primary btn-warning btn-rounded" data-toggle="modal" data-target="#myModal">
                                                    修改个人资料
                                                </button>
                                                <!-- //模态框 -->
                                                <div class="modal fade" id="myModal">
                                                    <div class="modal-dialog modal-dialog-centered">
                                                        <div class="modal-content">
                                                            <!-- //模态头部  -->
                                                            <div class="modal-header">
                                                                <h4 class="modal-title">修改个人资料</h4>
                                                                <button type="button" class="close" data-dismiss="modal">×</button>
                                                            </div>
                                                            <!-- //模态内容 -->
                                                            <div class="modal-body">
                                                                <form action="${pageContext.request.contextPath}/updatePersonal" class="forms-sample" method="post" enctype="multipart/form-data">
                                                                    <div class="form-group">
                                                                        <label for="imgPath">头像路径</label>
                                                                        <input name="imgPath" type="file" class="form-control" id="imgPath" placeholder="密码" value="${user.imgPath}">
                                                                    </div>
                                                                    <div class="form-group">
                                                                        <label for="password">密码</label>
                                                                        <input name="password" type="text" class="form-control" id="password" placeholder="密码" value="${user.pwd}">
                                                                    </div>
                                                                    <div class="form-group">
                                                                        <label for="email">邮箱</label>
                                                                        <input name="email" type="text" class="form-control" id="email" placeholder="邮箱" value="${user.email}">
                                                                    </div>
                                                                    <input id="addScore" type="submit" class="btn btn-warning me-2" value="确认修改">
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
                        </div>
                    </div>
                </div>
                <!--概览的标签-->
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
<script>
    $(document).ready(function(){
        code = String("${user.code}")
        console.log(code.substring(0,1));
        if (code.substring(0,1)==="T"){
            $("#access").html("<h3>你的当前权限为:老师</h3>");
            $("#li").html('<a class="nav-link" href="${pageContext.request.contextPath}/instructorPage"><i class="mdi mdi-account-search menu-icon"></i><span class="menu-title">教师班级管理</span></a>')
        }else if(code.substring(0,1)==="a"){
            $("#access").html("<h3>你的当前权限为:教务处</h3>");
            $("#li").html('<a class="nav-link" href="${pageContext.request.contextPath}/adminPage"><i class="mdi mdi-account-search menu-icon"></i><span class="menu-title">教务处全校概览</span></a>')
        }else {
            $("#access").html("<h3>你的当前权限为:学生</h3>");
            $("#li").html('<a class="nav-link" href="${pageContext.request.contextPath}/studentPage"><i class="mdi mdi-account-search menu-icon"></i><span class="menu-title">个人成绩查询</span></a>');
        }
    })
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

