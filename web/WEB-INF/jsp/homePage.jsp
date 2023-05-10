<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">

<head>
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
                        <h2>欢迎回来,${user.name}</h2>
                        <p id="access" class="mb-md-0"></p>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>

          <!--概览的标签-->
          <div id="main">
            <div class="row">
              <div class="col-md-12 grid-margin stretch-card">
                <div class="card">
                  <div class="card-body dashboard-tabs p-0">
                    <ul class="nav nav-tabs px-4" role="tablist">
                      <li class="nav-item">
                        <a class="nav-link active" id="overview-tab" data-bs-toggle="tab" href="#overview" role="tab" aria-controls="overview" aria-selected="true">成绩优秀科目</a>
                      </li>
                      <li class="nav-item">
                        <a class="nav-link" id="sales-tab" data-bs-toggle="tab" href="#sales" role="tab" aria-controls="sales" aria-selected="false">挂科科目</a>
                      </li>
                    </ul>
                    <div class="tab-content py-0 px-0">
                      <div class="tab-pane fade show active" id="overview" role="tabpanel" aria-labelledby="overview-tab">
                        <div class="d-flex flex-wrap justify-content-xl-between">
                          <div class="d-none d-xl-flex border-md-right flex-grow-1 align-items-center justify-content-center p-3 item">
                            <i class="mdi mdi-emoticon-cool icon-lg me-3 text-primary"></i>
                            <div class="d-flex flex-column justify-content-around">
                              <small class="mb-1 text-muted">查看成绩优秀科目</small>
                              <div class="dropdown">
                                <a class="btn btn-secondary dropdown-toggle p-0 bg-transparent border-0 text-dark shadow-none font-weight-medium" href="#" role="button" id="dropdownMenuLinkA1" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                  <h5 class="mb-0 d-inline-block">展示成绩详情</h5>
                                </a>
                                <div class="dropdown-menu" aria-labelledby="dropdownMenuLinkA">
                                  <c:forEach items="${ExcellentScore}" var="ExcellentScore">
                                    <a class="dropdown-item" href="#">${ExcellentScore.courseName}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${ExcellentScore.score}</a>
                                  </c:forEach>
                                </div>
                              </div>
                            </div>
                          </div>
                          <div class="d-flex py-3 border-md-right flex-grow-1 align-items-center justify-content-center p-3 item">
                            <i class="mdi mdi-account-card-details me-3 icon-lg text-danger"></i>
                            <div class="d-flex flex-column justify-content-around">
                              <small class="mb-1 text-muted">学号</small>
                              <h5 class="me-2 mb-0">${user.code}</h5>
                            </div>
                          </div>
                          <div class="d-flex border-md-right flex-grow-1 align-items-center justify-content-center p-3 item">
                            <i class="mdi mdi-face me-3 icon-lg text-success"></i>
                            <div class="d-flex flex-column justify-content-around">
                              <small class="mb-1 text-muted">姓名</small>
                              <h5 class="me-2 mb-0">${user.name}</h5>
                            </div>
                          </div>
                          <div class="d-flex py-3 border-md-right flex-grow-1 align-items-center justify-content-center p-3 item">
                            <i class="mdi mdi-flag me-3 icon-lg text-danger"></i>
                            <div class="d-flex flex-column justify-content-around">
                              <small class="mb-1 text-muted">学院</small>
                              <h5 class="me-2 mb-0">${deptName}</h5>
                            </div>
                          </div>
                        </div>
                      </div>
                      <div class="tab-pane fade" id="sales" role="tabpanel" aria-labelledby="sales-tab">
                        <div class="d-flex flex-wrap justify-content-xl-between">
                          <div class="d-none d-xl-flex border-md-right flex-grow-1 align-items-center justify-content-center p-3 item">
                            <i class="mdi mdi-emoticon-sad icon-lg me-3 text-primary"></i>
                            <div class="d-flex flex-column justify-content-around">
                              <small class="mb-1 text-muted">查看不及格科目</small>
                              <div class="dropdown">
                                <a class="btn btn-secondary dropdown-toggle p-0 bg-transparent border-0 text-dark shadow-none font-weight-medium" href="#" role="button" id="dropdownMenuLinkA2" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                  <h5 class="mb-0 d-inline-block">展示成绩详情</h5>
                                </a>
                                <div class="dropdown-menu" aria-labelledby="dropdownMenuLinkA">
                                  <c:forEach items="${FailScore}" var="FailScore">
                                    <a class="dropdown-item" href="#">${FailScore.courseName}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${FailScore.score}</a>
                                  </c:forEach>
                                </div>
                              </div>
                            </div>
                          </div>
                          <div class="d-flex py-3 border-md-right flex-grow-1 align-items-center justify-content-center p-3 item">
                            <i class="mdi mdi-account-card-details me-3 icon-lg text-danger"></i>
                            <div class="d-flex flex-column justify-content-around">
                              <small class="mb-1 text-muted">学号</small>
                              <h5 class="me-2 mb-0">${user.code}</h5>
                            </div>
                          </div>
                          <div class="d-flex border-md-right flex-grow-1 align-items-center justify-content-center p-3 item">
                            <i class="mdi mdi-face me-3 icon-lg text-success"></i>
                            <div class="d-flex flex-column justify-content-around">
                              <small class="mb-1 text-muted">姓名</small>
                              <h5 class="me-2 mb-0">${user.name}</h5>
                            </div>
                          </div>
                          <div class="d-flex py-3 border-md-right flex-grow-1 align-items-center justify-content-center p-3 item">
                            <i class="mdi mdi-flag me-3 icon-lg text-danger"></i>
                            <div class="d-flex flex-column justify-content-around">
                              <small class="mb-1 text-muted">学院</small>
                              <h5 class="me-2 mb-0">${deptName}</h5>
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
      $("#main").html('');
      $("#li").html('<a class="nav-link" href="${pageContext.request.contextPath}/instructorPage"><i class="mdi mdi-account-search menu-icon"></i><span class="menu-title">教师班级管理</span></a>')

    }else if(code.substring(0,1)==="a"){
      $("#access").html("<h3>你的当前权限为:教务处</h3>");
      $("#main").html('');
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

<script src="${pageContext.request.contextPath}/static/Bootstrap/js/chart.js"></script>
<!-- End custom js for this page-->
</html>

