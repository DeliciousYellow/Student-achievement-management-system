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
                    <a class="nav-link" href="${pageContext.request.contextPath}/instructorPage">
                        <i class="mdi mdi-account-search menu-icon"></i>
                        <span class="menu-title">教师班级管理</span>
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
                                <button type="button" class="btn btn-success dropdown-toggle btn-rounded" data-bs-toggle="dropdown">
                                    根据学号查询
                                </button>
                                <ul class="dropdown-menu">
                                    <li><span class="dropdown-item-text">输入学生学号</span></li>
                                    <div class="dropdown-divider"></div>
                                    <li>
                                    <form>
                                        <input id="Code" type="text" class="form-control mt-3" placeholder="学生学号为10位数字">
                                    </form>
                                    </li>
                                    <li style="margin: 0 auto; text-align: center"><button id="queryByCode" type="button" class="btn btn-success">查询</button></li>
                                </ul>
                                <button type="button" class="btn btn-success dropdown-toggle btn-rounded" data-bs-toggle="dropdown">
                                    根据科目查询
                                </button>
                                <ul class="dropdown-menu">
                                    <li><span class="dropdown-item-text">输入课程名</span></li>
                                    <div class="dropdown-divider"></div>
                                    <li>
                                        <form>
                                            <input id="courseName" type="text" class="form-control mt-3" placeholder="可含有中文英文数字">
                                        </form>
                                    </li>
                                    <li style="margin: 0 auto; text-align: center"><button id="queryByCourseName" type="button" class="btn btn-success">查询</button></li>
                                </ul>
                                <!-- //打开模态的按钮 -->
                                <button type="button" class="btn btn-primary btn-warning btn-rounded" data-toggle="modal" data-target="#myModal">
                                    添加成绩
                                </button>
                                <!-- //模态框 -->
                                <div class="modal fade" id="myModal">
                                    <div class="modal-dialog modal-dialog-centered">
                                        <div class="modal-content">
                                            <!-- //模态头部  -->
                                            <div class="modal-header">
                                                <h4 class="modal-title">录入成绩信息</h4>
                                                <button type="button" class="close" data-dismiss="modal">×</button>
                                            </div>
                                            <!-- //模态内容 -->
                                            <div class="modal-body">
                                                <form class="forms-sample" onsubmit="return false">
                                                    <div class="form-group">
                                                        <label for="InputCode">学号</label>
                                                        <input type="text" class="form-control" id="InputCode" placeholder="学号" required="required">
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="SelectSemester">学期</label>
                                                        <select class="form-control" id="SelectSemester">
                                                            <option>1</option>
                                                            <option>2</option>
                                                            <option>3</option>
                                                            <option>4</option>
                                                            <option>5</option>
                                                            <option>6</option>
                                                            <option>7</option>
                                                            <option>8</option>
                                                        </select>
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="InputCourseName">课程名</label>
                                                        <input type="text" class="form-control" id="InputCourseName" placeholder="课程名" required="required">
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="InputScore">分数</label>
                                                        <input type="text" class="form-control" id="InputScore" placeholder="分数" required="required">
                                                    </div>
                                                    <div id="format"></div>
                                                    <button id="addScore" type="submit" class="btn btn-warning me-2">提交</button>
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
                                        <th>
                                            操作
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
                url : "${pageContext.request.contextPath}"+"/instructor/getByDept/${user.deptId}",
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
                            var pass = "及格";
                        }else
                            html += '<tr class="table-danger">';
                        html+='<td>'+count+'</td>';
                        html+='<td>'+jsonArr[i].code+'</td>';
                        html+='<td>'+jsonArr[i].name+'</td>';
                        html+='<td>'+jsonArr[i].semester+'</td>';
                        html+='<td>'+jsonArr[i].courseName+'</td>';
                        html+='<td>'+jsonArr[i].score+'</td>';
                        html+='<td>'+pass+'</td>';
                        html+='<td><button style="margin-left:10px" onclick="deleteScore('+jsonArr[i].code+',\''+jsonArr[i].courseName+'\')" type="button" class="btn btn-danger btn-sm">删除</button>';
                        html+='<button style="margin-left:10px" data-toggle="modal" data-target="#Modal'+count+'" type="button" class="btn btn-warning btn-sm">修改</button>';

                        html+='<div class="modal fade" id="Modal'+count+'"><div class="modal-dialog modal-dialog-centered"> <div class="modal-content"> <div class="modal-header"><h4 class="modal-title">录入成绩信息</h4>';
                        html+='<button type="button" class="close" data-dismiss="modal">×</button></div><div class="modal-body"><form class="forms-sample" onsubmit="return false"><div class="form-group"><label for="InputCode">学号</label>';
                        html+='<input type="text" class="form-control" id="InputCode'+count+'" placeholder="学号" required="required" value="'+jsonArr[i].code+'"></div><div class="form-group"><label for="SelectSemester">学期</label>';
                        html+='<select class="form-control" id="SelectSemester'+count+'" value="'+jsonArr[i].semester+'"><option>1</option><option>2</option><option>3</option><option>4</option><option>5</option><option>6</option><option>7</option><option>8</option></select></div>';
                        html+='<div class="form-group"><label for="InputCourseName">课程名</label><input type="text" class="form-control" id="InputCourseName'+count+'" placeholder="课程名" required="required" value="'+jsonArr[i].courseName+'">';
                        html+='</div><div class="form-group"><label for="InputScore">分数</label><input type="text" class="form-control" id="InputScore'+count+'" placeholder="分数" required="required" value="'+jsonArr[i].score+'"></div>';
                        html+='<div id="format'+count+'"></div><button onclick="updateScore('+count+++','+jsonArr[i].id+')" type="submit" class="btn btn-warning me-2">提交</button></form></div>';
                        html+='<div class="modal-footer">  <button type="button" class="btn btn-danger" data-dismiss="modal">关闭</button></div></div></div></div></td>';
                    }
                    $("#result").html(html)
                    $("#paging").html('')
                }
            })
        })

        $("#queryByCode").click(function(){
            var code = String($("#Code").val());
            if (code.substring(4,6) != ${user.deptId}){
                alert("不能查询您所属学院的学生成绩");
                return;
            }
            $.ajax({
                type : "get",
                url : "${pageContext.request.contextPath}"+"/instructor/getScoreByCode/"+$("#Code").val(),
                async : false,
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
                        html+='<td>'+count+'</td>';
                        html+='<td>'+jsonArr[i].code+'</td>';
                        html+='<td>'+jsonArr[i].name+'</td>';
                        html+='<td>'+jsonArr[i].semester+'</td>';
                        html+='<td>'+jsonArr[i].courseName+'</td>';
                        html+='<td>'+jsonArr[i].score+'</td>';
                        html+='<td>'+pass+'</td>';
                        html+='<td><button style="margin-left:10px" onclick="deleteScore('+jsonArr[i].code+',\''+jsonArr[i].courseName+'\')" type="button" class="btn btn-danger btn-sm">删除</button>';
                        html+='<button style="margin-left:10px"  data-toggle="modal" data-target="#ModalC'+count+'" type="button" class="btn btn-warning btn-sm">修改</button>';

                        html+='<div class="modal fade" id="ModalC'+count+'"><div class="modal-dialog modal-dialog-centered"> <div class="modal-content"> <div class="modal-header"><h4 class="modal-title">录入成绩信息</h4>';
                        html+='<button type="button" class="close" data-dismiss="modal">×</button></div><div class="modal-body"><form class="forms-sample" onsubmit="return false"><div class="form-group"><label for="InputCode">学号</label>';
                        html+='<input type="text" class="form-control" id="InputCode'+count+'" placeholder="学号" required="required" value="'+jsonArr[i].code+'"></div><div class="form-group"><label for="SelectSemester">学期</label>';
                        html+='<select class="form-control" id="SelectSemester'+count+'" value="'+jsonArr[i].semester+'"><option>1</option><option>2</option><option>3</option><option>4</option><option>5</option><option>6</option><option>7</option><option>8</option></select></div>';
                        html+='<div class="form-group"><label for="InputCourseName">课程名</label><input type="text" class="form-control" id="InputCourseName'+count+'" placeholder="课程名" required="required" value="'+jsonArr[i].courseName+'">';
                        html+='</div><div class="form-group"><label for="InputScore">分数</label><input type="text" class="form-control" id="InputScore'+count+'" placeholder="分数" required="required" value="'+jsonArr[i].score+'"></div>';
                        html+='<div id="format'+count+'"></div><button onclick="updateScore('+count+++','+jsonArr[i].id+')" type="submit" class="btn btn-warning me-2">提交</button></form></div>';
                        html+='<div class="modal-footer">  <button type="button" class="btn btn-danger" data-dismiss="modal">关闭</button></div></div></div></div></td>';
                    }
                    $("#result").html(html)
                    $("#paging").html('')
                }
            })
        })

        $("#queryByCourseName").click(function(){
            $.ajax({
                type : "get",
                url : "${pageContext.request.contextPath}"+"/instructor/getScoreByCourseName/${user.deptId}/"+$("#courseName").val(),
                async : false,
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
                        html+='<td>'+count+'</td>';
                        html+='<td>'+jsonArr[i].code+'</td>';
                        html+='<td>'+jsonArr[i].name+'</td>';
                        html+='<td>'+jsonArr[i].semester+'</td>';
                        html+='<td>'+jsonArr[i].courseName+'</td>';
                        html+='<td>'+jsonArr[i].score+'</td>';
                        html+='<td>'+pass+'</td>';
                        html+='<td><button style="margin-left:10px" onclick="deleteScore('+jsonArr[i].code+',\''+jsonArr[i].courseName+'\')" type="button" class="btn btn-danger btn-sm">删除</button>';
                        html+='<button style="margin-left:10px" data-toggle="modal" data-target="#ModalN'+count+'" type="button" class="btn btn-warning btn-sm">修改</button>';

                        html+='<div class="modal fade" id="ModalN'+count+'"><div class="modal-dialog modal-dialog-centered"> <div class="modal-content"> <div class="modal-header"><h4 class="modal-title">录入成绩信息</h4>';
                        html+='<button type="button" class="close" data-dismiss="modal">×</button></div><div class="modal-body"><form class="forms-sample" onsubmit="return false"><div class="form-group"><label for="InputCode">学号</label>';
                        html+='<input type="text" class="form-control" id="InputCode'+count+'" placeholder="学号" required="required" value="'+jsonArr[i].code+'"></div><div class="form-group"><label for="SelectSemester">学期</label>';
                        html+='<select class="form-control" id="SelectSemester'+count+'" value="'+jsonArr[i].semester+'"><option>1</option><option>2</option><option>3</option><option>4</option><option>5</option><option>6</option><option>7</option><option>8</option></select></div>';
                        html+='<div class="form-group"><label for="InputCourseName">课程名</label><input type="text" class="form-control" id="InputCourseName'+count+'" placeholder="课程名" required="required" value="'+jsonArr[i].courseName+'">';
                        html+='</div><div class="form-group"><label for="InputScore">分数</label><input type="text" class="form-control" id="InputScore'+count+'" placeholder="分数" required="required" value="'+jsonArr[i].score+'"></div>';
                        html+='<div id="format'+count+'"></div><button onclick="updateScore('+count+++','+jsonArr[i].id+')" type="submit" class="btn btn-warning me-2">提交</button></form></div>';
                        html+='<div class="modal-footer">  <button type="button" class="btn btn-danger" data-dismiss="modal">关闭</button></div></div></div></div></td>';
                    }
                    $("#result").html(html)
                    $("#paging").html('')
                }
            })
        })

        $("#addScore").click(function () {
            $.ajaxSettings.async = false;
            <!--判断字段不为空和空格，减少服务器/数据库压力-->
            var pattern = /^\d{10}$/;
            if (!pattern.test($("#InputCode").val())){
                // $("#format").html("<h3 style='color: red'>学号必须为10位的数字</h3>");
                $("#format").html('<div class="alert alert-danger alert-dismissible fade show"><button type="button" class="btn-close" data-bs-dismiss="alert"></button><strong>错误!</strong> 学号必须为10位的数字。</div>');
                return;
            }
            var pattern = /^[\u4E00-\u9FA5A-Za-z0-9]+$/
            if (!pattern.test($("#InputCourseName").val())){
                // $("#format").html("<h3 style='color: red'>课程名应由数字英文汉字组成且不为空</h3>");
                $("#format").html('<div class="alert alert-danger alert-dismissible fade show"><button type="button" class="btn-close" data-bs-dismiss="alert"></button><strong>错误!</strong> 课程名应由数字英文汉字组成且不为空。</div>');
                return;
            }
            var pattern = /^([1-9][0-9]*)+(.[0-9]{1,2})?$/;
            if (!pattern.test($("#InputScore").val())){
                // $("#format").html("<h3 style='color: red'>分数必须为非零开头的最多带一位小数的数字</h3>");
                $("#format").html('<div class="alert alert-danger alert-dismissible fade show"><button type="button" class="btn-close" data-bs-dismiss="alert"></button><strong>错误!</strong> 分数必须为非零开头的最多带一位小数的数字。</div>');
                return;
            }
            $.post("${pageContext.request.contextPath}/instructor/addScore",
                {
                    code : $("#InputCode").val(),
                    semester : $("#SelectSemester").val(),
                    courseName : $("#InputCourseName").val(),
                    score : $("#InputScore").val()
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
    })

    var tip = 0;
    var pageSize = 10;
    function changePageSize(size) {
        pageSize = size;
        $("#result").html('')
        $.ajax({
            type : "get",
            url : "${pageContext.request.contextPath}"+"/instructor/getNumberByDept/${user.deptId}",
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
            url : "${pageContext.request.contextPath}/instructor/getByDept/${user.deptId}/"+tip+"/"+pageSize,
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
                        var pass = "及格";
                    }else
                        Queryhtml += '<tr class="table-danger">';
                    Queryhtml+='<td>'+count+'</td>';
                    Queryhtml+='<td>'+jsonArr[i].code+'</td>';
                    Queryhtml+='<td>'+jsonArr[i].name+'</td>';
                    Queryhtml+='<td>'+jsonArr[i].semester+'</td>';
                    Queryhtml+='<td>'+jsonArr[i].courseName+'</td>';
                    Queryhtml+='<td>'+jsonArr[i].score+'</td>';
                    Queryhtml+='<td>'+pass+'</td>';
                    Queryhtml+='<td><button style="margin-left:10px" onclick="deleteScore('+jsonArr[i].code+',\''+jsonArr[i].courseName+'\')" type="button" class="btn btn-danger btn-sm">删除</button>';
                    Queryhtml+='<button style="margin-left:10px" data-toggle="modal" data-target="#ModalP'+count+'" type="button" class="btn btn-warning btn-sm">修改</button>';

                    Queryhtml+='<div class="modal fade" id="ModalP'+count+'"><div class="modal-dialog modal-dialog-centered"> <div class="modal-content"> <div class="modal-header"><h4 class="modal-title">录入成绩信息</h4>';
                    Queryhtml+='<button type="button" class="close" data-dismiss="modal">×</button></div><div class="modal-body"><form class="forms-sample" onsubmit="return false"><div class="form-group"><label for="InputCode">学号</label>';
                    Queryhtml+='<input type="text" class="form-control" id="InputCode'+count+'" placeholder="学号" required="required" value="'+jsonArr[i].code+'"></div><div class="form-group"><label for="SelectSemester">学期</label>';
                    Queryhtml+='<select class="form-control" id="SelectSemester'+count+'" value="'+jsonArr[i].semester+'"><option>1</option><option>2</option><option>3</option><option>4</option><option>5</option><option>6</option><option>7</option><option>8</option></select></div>';
                    Queryhtml+='<div class="form-group"><label for="InputCourseName">课程名</label><input type="text" class="form-control" id="InputCourseName'+count+'" placeholder="课程名" required="required" value="'+jsonArr[i].courseName+'">';
                    Queryhtml+='</div><div class="form-group"><label for="InputScore">分数</label><input type="text" class="form-control" id="InputScore'+count+'" placeholder="分数" required="required" value="'+jsonArr[i].score+'"></div>';
                    Queryhtml+='<div id="format'+count+'"></div><button onclick="updateScore('+count+++','+jsonArr[i].id+')" type="submit" class="btn btn-warning me-2">提交</button></form></div>';
                    Queryhtml+='<div class="modal-footer">  <button type="button" class="btn btn-danger" data-dismiss="modal">关闭</button></div></div></div></div></td>';
                }
                $("#result").html(Queryhtml)
            }
        })
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
    function updateScore(count,id) {
        $.ajaxSettings.async = false;
        var InputCode = $("#InputCode"+count).val()
        var SelectSemester = $("#SelectSemester"+count).val()
        var InputCourseName = $("#InputCourseName"+count).val()
        var InputScore = $("#InputScore"+count).val()
        console.log(InputCode,SelectSemester,InputCourseName,InputScore)
        // <!--判断字段不为空和空格，减少服务器/数据库压力-->
        var pattern = /^\d{10}$/;
        if (!pattern.test(InputCode)){
            $("#format"+count).html("<h3 style='color: red'>学号必须为10位的数字</h3>");
            return;
        }
        var pattern = /^[\u4E00-\u9FA5A-Za-z0-9]+$/
        if (!pattern.test(InputCourseName)){
            $("#format"+count).html("<h3 style='color: red'>课程名应由数字英文汉字组成且不为空</h3>");
            return;
        }
        var pattern = /^([1-9][0-9]*)+(.[0-9]{1,2})?$/;
        if (!pattern.test(InputScore)){
            $("#format"+count).html("<h3 style='color: red'>分数必须为非零开头的最多带一位小数的数字</h3>");
            return;
        }
        // jsonstr = '{\"_method\":\"PUT\",\"InputCode\":\"'+InputCode+'\",\"SelectSemester\":\"'+SelectSemester+'\",\"InputCourseName\":\"'+InputCourseName+'\",\"InputScore\":\"'+InputScore+'\"}';
        // console.log(jsonstr);
            $.ajax({
                type:"POST",//此处仍然使用post
                url:"${pageContext.request.contextPath}/instructor/updateScore",
                async:false,
                traditional:true,
                dataType:"json",
                data:{
                    _method:"PUT", //这里是要修改的部分
                    id : id,
                    InputCode : InputCode,
                    SelectSemester : SelectSemester,
                    InputCourseName : InputCourseName,
                    InputScore : InputScore
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

