<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
    <head>
        <base href="<%=basePath%>">
        <title>GL WebGL BIM Engine</title>
        <meta http-equiv="pragma" content="no-cache">
        <meta http-equiv="cache-control" content="no-cache">
        <meta http-equiv="expires" content="0">    
        <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
        <meta http-equiv="description" content="This is my page">
        
        <meta http-equiv="Content-type" content="text/html;charset=UTF-8" />
        <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
        
        <link href="<%=basePath%>css/reset.css" rel="stylesheet" />
        <link href="<%=basePath%>css/Style.css" rel="stylesheet" />
        <link href="<%=basePath%>css/responsive.css" rel="stylesheet" />
        <link rel="icon" href="<%=basePath%>webimg/bimlogo.ico" type="img/x-ico" />
        <link href="<%=basePath%>Content/plugins/plupload-2.1.2/js/jquery.plupload.queue/css/jquery.plupload.queue.css" rel="stylesheet" type="text/css" media="screen">
        <script src="<%=basePath%>Scripts/jquery.min.js"></script>
        <script src="<%=basePath%>Scripts/Common.js"></script>
        <link href="<%=basePath%>Content/plugins/layer/skin/layer.css" rel="stylesheet" id="layui_layer_skinlayercss">
        <link href="<%=basePath%>Content/plugins/zTree_v3/css/zTreeStyle/zTreeStyle.css" rel="stylesheet">
    </head>
  
    <body class=" pace-done">
        <div class="pace  pace-inactive">
            <div class="pace-progress" data-progress-text="100%" data-progress="99" style="transform: translate3d(100%, 0px, 0px);">
                <div class="pace-progress-inner"></div>
            </div>
            <div class="pace-activity"></div>
        </div>
        <div class="pageContent pageBody">
            <div class="main-header">
                <header>
                    <section class="wrapper_body">
                        <div class="float_right login_content">
                            <c:if test="${empty USER_INFO}">
                                <span style="cursor:pointer;" onclick="login()">登录</span>
                            </c:if>
                            <c:if test="${!empty USER_INFO}">
                                <span>${USER_INFO.tel}</span><a style="cursor:pointer;margin-left:20px;" href="<%=basePath%>User/Logout.do">退出</a>
                            </c:if>
                        </div>
                    </section>
                </header>
            </div> 
            <div class="wrapper_body">
                <div class="content-wrapper" id="content-wrapper" style="min-height: 626px;">
                    <style>
                        .pagination {
                            display: inline-block;
                            padding-left: 0;
                            margin: 20px 0;
                            border-radius: 4px;
                        }
                        .pagination > li {
                            display: inline;
                        }
                        .pagination > li > a,
                        .pagination > li > span {
                            position: relative;
                            float: left;
                            padding: 6px 12px;
                            margin-left: -1px;
                            line-height: 1.42857143;
                            color: #337ab7;
                            text-decoration: none;
                            background-color: #fff;
                            border: 1px solid #ddd;
                        }
                        .pagination > li:first-child > a,
                        .pagination > li:first-child > span {
                            margin-left: 0;
                            border-top-left-radius: 4px;
                            border-bottom-left-radius: 4px;
                        }
                        .pagination > li:last-child > a,
                        .pagination > li:last-child > span {
                            border-top-right-radius: 4px;
                            border-bottom-right-radius: 4px;
                        }
                        .pagination > li > a:hover,
                        .pagination > li > span:hover,
                        .pagination > li > a:focus,
                        .pagination > li > span:focus {
                            z-index: 2;
                            color: #23527c;
                            background-color: #eee;
                            border-color: #ddd;
                        }
                        .pagination > .active > a,
                        .pagination > .active > span,
                        .pagination > .active > a:hover,
                        .pagination > .active > span:hover,
                        .pagination > .active > a:focus,
                        .pagination > .active > span:focus {
                            z-index: 3;
                            color: #fff;
                            cursor: default;
                            background-color: #337ab7;
                            border-color: #337ab7;
                        }
                        .pagination > .disabled > span,
                        .pagination > .disabled > span:hover,
                        .pagination > .disabled > span:focus,
                        .pagination > .disabled > a,
                        .pagination > .disabled > a:hover,
                        .pagination > .disabled > a:focus {
                            color: #777;
                            cursor: not-allowed;
                            background-color: #fff;
                            border-color: #ddd;
                        }
                        .pagination-lg > li > a,
                        .pagination-lg > li > span {
                            padding: 10px 16px;
                            font-size: 18px;
                            line-height: 1.3333333;
                        }
                        .pagination-lg > li:first-child > a,
                        .pagination-lg > li:first-child > span {
                            border-top-left-radius: 6px;
                            border-bottom-left-radius: 6px;
                        }
                        .pagination-lg > li:last-child > a,
                        .pagination-lg > li:last-child > span {
                            border-top-right-radius: 6px;
                            border-bottom-right-radius: 6px;
                        }
                        .pagination-sm > li > a,
                        .pagination-sm > li > span {
                            padding: 5px 10px;
                            font-size: 12px;
                            line-height: 1.5;
                        }
                        .pagination-sm > li:first-child > a,
                        .pagination-sm > li:first-child > span {
                            border-top-left-radius: 3px;
                            border-bottom-left-radius: 3px;
                        }
                        .pagination-sm > li:last-child > a,
                        .pagination-sm > li:last-child > span {
                            border-top-right-radius: 3px;
                            border-bottom-right-radius: 3px;
                        }
                        .pager {
                            padding-left: 0;
                            margin: 20px 0;
                            text-align: center;
                            list-style: none;
                        }
                        .pager li {
                            display: inline;
                        }
                        .pager li > a,
                        .pager li > span {
                            display: inline-block;
                            padding: 5px 14px;
                            background-color: #fff;
                            border: 1px solid #ddd;
                            border-radius: 15px;
                        }
                        .pager li > a:hover,
                        .pager li > a:focus {
                            text-decoration: none;
                            background-color: #eee;
                        }
                        .pager .next > a,
                        .pager .next > span {
                            float: right;
                        }
                        .pager .previous > a,
                        .pager .previous > span {
                          float: left;
                        }
                        .pager .disabled > a,
                        .pager .disabled > a:hover,
                        .pager .disabled > a:focus,
                        .pager .disabled > span {
                            color: #777;
                            cursor: not-allowed;
                            background-color: #fff;
                        }
                    </style>
                    <section class="wrapper_body wrapper_content">
                        <div class="uploadbtndiv">
                            <a href="javascript:void(0);" onclick="add_project()" class="button">创建项目</a>
                            <a href="javascript:void(0);" id="refresh" onclick="refresh()" class="button">刷新状态</a>
                        </div> 
                        <div class="hash_1_h"></div>
                        <div class="modelList">
                            <ul>
                                <c:forEach items="${data.list}" var="project">
                                    <li>
                                        <div style="cursor:pointer" onclick="javascript:IsTrans(${project.id},${project.analysis_flag })">
                                            <div>
                                                <c:if test="${empty project.img_url}">
                                                    <img src="<%=basePath%>webimg/model.png" width="268" height="168">
                                                </c:if>
                                                <c:if test="${!empty project.img_url}">
                                                    <img src="<%=basePath%>Tools/RAR_BACKUPS/${project.img_url}" width="268" height="168">
                                                </c:if>
                                            </div>
                                            <div class="modelName">${project.project_name}</div>
                                            <div>
                                                <table>
                                                    <tbody>
                                                        <tr>
                                                            <td>建模所用工具</td>
                                                            <td>${project.project_tool}</td>
                                                        </tr>
                                                        <tr>
                                                            <td>上传时间</td>
                                                            <td>
                                                                <fmt:formatDate pattern="yyyy-MM-dd" value="${project.add_time}" />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>是否公开</td>
                                                            <td>
                                                                <c:if test="${project.whether_open == 0}">
                                                                    <span>是</span>
                                                                </c:if>
                                                                <c:if test="${project.whether_open  == 1}">
                                                                    <span>否</span>
                                                                </c:if>
                                                            </td>
                                                        </tr>
                                                         <tr>
                                                            <td>转码状态</td>
                                                            <td>
                                                                <c:if test="${project.analysis_flag != 0}">
                                                                    <span style="color:red"> 正在轻量化</span>
                                                                </c:if>
                                                                <c:if test="${project.analysis_flag == 0}">
                                                                    <span > 轻量化完成</span>
                                                                </c:if>
                                                            </td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </li>
                                </c:forEach>
                            </ul>
                        </div>
                        <div class="clear"></div>
                    </section>
                    <div class="page  text-center">
                        <ul class="pagination">
                            <c:forEach begin="1"  end="${page_num}" var="pbstage" varStatus="cstatus">
                                <c:if test="${pbstage !=  now_page}">
                                    <li class="paginate_button">
                                        <a href="<%=basePath%>User/ModelList.do?now_page=${pbstage}" aria-controls="example2" data-dt-idx="1" tabindex="0">${pbstage}</a>
                                    </li>
                                </c:if>
                                <c:if test="${pbstage ==  now_page}">
                                    <li class="paginate_button active">
                                        <a href="<%=basePath%>User/ModelList.do?now_page=${pbstage}" aria-controls="example2" data-dt-idx="1" tabindex="0">${pbstage}</a>
                                    </li>
                                </c:if>
                            </c:forEach>
                        </ul>
                    </div>
                    <footer>© 2015 glendale 陕西葛兰岱尔网络科技有限公司.All Rights Reserved</footer>
                </div>
            </div>
        </div>
        
        <!-- 登录  begin -->
        <div class="wrapper" style="display: none;" id="login_main">
            <div class="content-wrapper1" id="content-wrapper1" style="height: 390px;min-height: 0px;">
                <div>
                    <div class="login_cont">
<!--                         <div class="login_title">欢迎登录</div> -->
                        <form action="<%=basePath%>User/RegisterFast.do" class="login-form" id="RegisterFast_form" method="post" novalidate="novalidate">
                            <input name="__RequestVerificationToken" type="hidden" value="ZdROLS9TMXkBAEtYLUazCWcn0_3lFfzM5xhTqM8eKoIFkfJlfrATxnKQsUYrkKltiFEIqKtLpIuRZYGuXOswpWqLRhIOVvS7EIErZER9NB4EbOxg0VzfaW_fE_hN2NimwL5vavkQsg0ffl2tMLFJLBVQnUKfvhhPXuHph64lSQ81">
                            <div class="log_cont">
                                <label><i>*</i>手机号：</label>
                                <input class="login-input col-xs-8" style="width: 266px;padding-right: 15px;padding-left: 15px;" data-val="true" data-val-regex="手机号不合法" data-val-regex-pattern="^1[34578][0-9]{9}$" data-val-required="手机号码 字段是必需的。" id="Moblie" name="Moblie" placeholder="请输入11位手机号码" type="text" value="">
                                <span class="field-validation-valid" data-valmsg-for="Moblie" data-valmsg-replace="true"></span>
                            </div>
                            <div class="log_cont">
                                <label><i>*</i>单位名称：</label>
                                <input class="login-input col-xs-8" style="width: 266px;padding-right: 15px;padding-left: 15px;" data-val="true" data-val-required="单位名称 字段是必需的。" id="CorporateName" name="CorporateName" placeholder="请输入公司名称" type="text" value="">
                                <span class="field-validation-valid" data-valmsg-for="CorporateName" data-valmsg-replace="true"></span>
                            </div>
                            <div class="log_cont">
                                <label><i>*</i>图片验证码：</label>
                                <input class="login-input col-xs-5" style="width: 158px;padding-right: 15px;padding-left: 15px;" data-val="true" data-val-required="验证码 字段是必需的。" id="CheckCode" name="CheckCode" placeholder="请输入右侧验证码结果" type="text" value="">
                                <img class="login-input-btn col-xs-3" id="imgCheckCode" src="<%=basePath%>User/identifyingCode.do" style="cursor: pointer;" onclick="$('#imgCheckCode').attr('src','<%=basePath%>User/identifyingCode.do?v='+Math.random()+'')">
                                <span class="field-validation-valid" data-valmsg-for="CheckCode" data-valmsg-replace="true"></span>
                            </div>
                            <div class="log_cont">
                                <label><i>*</i>验证码：</label>
                                <input autocomplete="off" class="login-input col-xs-5" style="width: 158px;padding-right: 15px;padding-left: 15px;" data-val="true" data-val-required="手机动态码 字段是必需的。" id="DynamicCode" name="DynamicCode" placeholder="请输入手机短信验证码" type="text" value="">
                                <input type="button" id="btnSendCode" class="login-input-btn col-xs-3" value="获取验证码" onclick="SendMobile()">
                                <span class="field-validation-valid" data-valmsg-for="DynamicCode" data-valmsg-replace="true"></span>
                            </div>
                            <div class="xieyi">
                                <input name="check" checked="checked" value="" type="checkbox">阅读并同意<a href="<%=basePath%>User/protocal.do" target="_blank">《使用协议》</a></div>
                            <div class="log_cont">
                                <input type="submit" class="login-btn  zhuce1" value="登&nbsp;&nbsp;录">
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <!-- 登录  end -->
        
        <!-- 创建项目  begin -->
        <div class="wrapper" style="display: none;" id="project_main">
            <div class="content-wrapper1" id="content-wrapper1" style="height: 450px;min-height: 0px;">
                <div>
                    <div class="login_cont">
<!--                         <div class="layui-layer-title" style="height: 42px;background: rgb(73, 157, 243); color: rgb(255, 255, 255); cursor: move;" move="ok">创建项目</div> -->
                        <form id="UploadModelForm" action="<%=basePath%>User/UploadFile.do" style="margin-top: -20px;" method="post" enctype="multipart/form-data" novalidate="novalidate">
                            <div class="title" style="width: 100px; float: left;margin-left: 20px;">项目名称：</div>
                            <div class="box" style="width: 300px;  float: left;">
                                <input name="SpecialtyName" id="SpecialtyName" type="text" style="height:27px;" class="txtbox">
                            </div>
                            <div class="title" style=" width: 100px; float: left;margin-left: 20px;margin-top: 16px;">模型名称：</div>
                            <div class="box" style="width: 300px; float: left;margin-top: 16px;">
                                <input name="ModelName" id="ModelName" type="text" style="height:27px;" class="txtbox">
                            </div>
                            <div class="modellist" style="margin-left: 10px;margin-right:10px;">
                                <input type="hidden" id="hid_modelFile" name="hid_modelFile" value="">
                                <div id="divuploader">
                                    <div id="uploader" style="overflow: hidden; padding: 0px; width: 480px; position: relative;">
                                        <div class="plupload_wrapper plupload_scroll">
                                            <div id="uploader_container" class="plupload_container" title="">
                                                <div class="plupload">
                                                    <div class="plupload_content">
                                                        <div class="plupload_filelist_header">
                                                            <div class="plupload_file_name">文件名</div>
                                                            <div class="plupload_file_action">&nbsp;</div>
                                                            <div class="plupload_file_status"><span>状态</span></div>
                                                            <div class="plupload_file_size">大小</div>
                                                            <div class="plupload_clearer">&nbsp;</div>
                                                        </div>
                                                        <ul id="uploader_filelist" class="plupload_filelist" style="position: relative; height: 45px;">
                                                            <li class="plupload_droptext" style="width: 100%;height: 100%;">把文件拖到这里。</li>
                                                        </ul>
                                                        <div class="plupload_filelist_footer">
                                                            <div class="plupload_file_name">
                                                                <div class="plupload_buttons">
                                                                    <a href="#" class="plupload_button plupload_add" id="uploader_browse" style="position: relative; z-index: 1;">增加文件</a>
                                                                    <a href="#" class="plupload_button plupload_start plupload_disabled">开始上传</a>
                                                                </div>
                                                                <span class="plupload_upload_status"></span>
                                                            </div>
                                                            <div class="plupload_file_action"></div>
                                                            <div class="plupload_file_status"><span class="plupload_total_status">0%</span></div>
                                                            <div class="plupload_file_size"><span class="plupload_total_file_size">0 b</span></div>
                                                            <div class="plupload_progress">
                                                                <div class="plupload_progress_container">
                                                                    <div class="plupload_progress_bar"></div>
                                                                </div>
                                                            </div>
                                                            <div class="plupload_clearer">&nbsp;</div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <input type="hidden" id="uploader_count" name="uploader_count" value="0">
                                        </div>
                                        <div id="html5_1c179o5u1120uojf18ij1qmh1s2t3_container" class="moxie-shim moxie-shim-html5" style="position: absolute; top: 236px; left: 16px; width: 78px; height: 23px; overflow: hidden; z-index: 0;">
                                            <input id="html5_1c179o5u1120uojf18ij1qmh1s2t3" type="file" style="font-size: 999px; opacity: 0; position: absolute; top: 0px; left: 0px; width: 100%; height: 100%;" accept=".rar">
                                        </div>
                                    </div>
                                </div>
                                <div id="divreupload">
                                    <!-- <div class="button float-none" id="BtnReupload">重新上传</div>-->
                                </div>
                                <span style="color: red; margin-left: 10px;font-size: 85%;">注：支持上传格式:rar,引擎支持文件格式有：ifc、obj、dae、3ds、fbx,转化时请注意将文件或文件夹压缩成*.rar(注意：（obj、dae、3ds、fbx）在压缩时需要用文件夹包含),ifc格式不需要文件夹包含。
                                </span>
                            </div>
                            <div class="title" style=" width: 235px; float: left;margin-left: 20px;">建模所使用的工具软件及版本：</div>
                            <div class="box" style=" width: 150px; float: left;">
                                <select id="selTools" name="selTools" style="height:25px!important" class="txtbox">
                                    <option value="">请选择</option>
                                    <c:forEach items="${projectToolS}" var="projectTool">
                                        <option value="${projectTool.id}">${projectTool.project_tool}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <br>
                            <div class="title" style=" width:37%; float:left;margin-left: 20px;margin-top: 7px">是否公开:
                                <label style="margin-top: -35px;margin-left: 85px;"><input type="radio" name="rboIsPublic" value="0" checked="">是</label>&nbsp;&nbsp;
                                <label style="margin-top: -39px;margin-left: 170px;">
                                    <input type="radio" name="rboIsPublic" value="1">否
                                </label>
                            </div>
                            <div class="box" style="padding-top: 30px;">
                                <input name="MileageID" id="MileageID" type="hidden">
                                <input value="确定" onclick="uploadModelFile()" class="up_btn_grey" type="button" id="btn_submit" disabled="disabled">
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <!-- 创建项目  end -->
        
        <script>
            function checkUserName() {
                var CorporateName = $("#CorporateName").val();
                if (CorporateName == "") {
                    layer.msg('单位名称不能为空！', { icon: 2 });
                    return false;
                }
                else {
                    return true;
                }
            }
            function checkCheckCode() {
                var CheckCode = $("#CheckCode").val();
                if (CheckCode == "") {
                    layer.msg('请填写验证码！', { icon: 2 });
                    return false;
                } else {
                    return true;
                }
            }
            function checkAll() {
                if (!checkUserName()) {
                    return false;
                }
                else if (!checkCheckCode()) {
                    return false;
                }
                else if (!checkDynamicCode()) {
                    return false;
                }
                else {
                    return true;
                }
            }
            function checkMoblie() {
                var Moblie = $("#Moblie").val();
                if (Moblie == "") {
                    layer.msg("手机号不能为空", { icon: 2 });
                    return false;
                }
                else if (!/^1[34578]\d{9}$/.test(Moblie)) {
                    layer.msg("手机号格式不正确", { icon: 2 });
                    return false;
                }
                else {
                    return true;
                }
            }
            function checkImage() {
                var imgcode = $("#CheckCode").val();
                if (imgcode == "") {
                    layer.msg("请输入右侧验证码结果", { icon: 2 });
                    return false;
                }
                else if (!ajaxcheckImage(imgcode)) {
                    layer.msg("验证码输入错误", { icon: 2 });
                    return false;
                }
                return true;
            }
            function ajaxcheckImage(vcode) {
                var result = false;
                jQuery.ajax({
                    url: '<%=basePath%>User/checkImgCode.do',
                    type: 'post',
                    async: false,
                    data: { 'checkcode': vcode },
                    success: function (data) {
                        if (data.success){
                            result = true;
                        }
                    }
                });
                return result;
            }
            function checkDynamicCode() {
                ///从数据库中查验证码  对比输入的验证码是否一致
                var DynamicCode = $("#DynamicCode").val();
                if (DynamicCode == "") {
                    layer.msg("请将收到的短信验证码输入", { icon: 2 });
                    return false;
                }
                else if (!ajaxcheckDynamicCode($("#Moblie").val(), DynamicCode)) {
                    layer.msg("验证码错误或已过期", { icon: 2 });
                    return false;
                } else
                    return true;
            }
            function ajaxcheckDynamicCode(Moblie, DynamicCode) {
                var result = false;
                jQuery.ajax({
                    url: '<%=basePath%>User/ajaxcheckDynamicCode.do',
                    type: 'post',
                    async: false,
                    data: { 'mobile': Moblie, 'checkcode': DynamicCode },
                    success: function (data) {
                        if (data.success) {
                            result = true;
                        }else {
                            result = false;
                        }
                    }
                });
                return result;
            }
            function SendMobile() {
                if (checkMoblie($("#Moblie").val()) && checkImage($("#CheckCode").val())) {
                    var obj = $("#btnSendCode");
                    //  obj.addClass('disable');
                    obj.attr('disabled', 'disabled');
                    obj.val('正在发送…');
                    $.ajax({
                        type: 'Post',
                        url: '<%=basePath%>User/SendMessage.do',
                        data: { Mobile: $("#Moblie").val() },
                        success: function (data) {
                            if (data.success) {
                                var waitSecond = 60;
                                var intervalHandler = 0;
                                intervalHandler = window.setInterval(function () {
                                    obj.val(waitSecond + '秒后重发');
                                    waitSecond--;
                                    if (waitSecond < 0) {
                                        obj.val('发送验证码');
                                        obj.removeAttr("disabled");
                                        window.clearInterval(intervalHandler);
                                    }
                                },
                                1000);
                                //   alert("验证码已发送至你手机，请填写验证码巴拉巴拉 ");
                            } else {
                                layer.msg("验证码发送失败", { icon: 2 });
                                obj.removeAttr("disabled");
                            }
                            obj.val('获取验证码');
                        }
                    });
                }
            }
            $(function () {
                $("#Moblie").blur(function () {
                    if ($("#Moblie").val() != "") {
                        if (ajaxcheckMobile($("#Moblie").val())) {
                            layer.msg('手机号已存在,将为您直接登录！', { icon: 1,time:1000},replace());
                        }
                    }
                });
        
                $("#RegisterFast_form").validate({
                    onkeyup: false,
                    focusCleanup: true,
                    success: "valid",
                    submitHandler: function (form) {
                        if (!checkAll()) {
                            $('#imgCheckCode').attr('src', '<%=basePath%>User/identifyingCode.do?v=' + Math.random() + '')
                            return false;
                        }
                        $(form).ajaxSubmit(function (data) {
                            if (data.success) {
                                layer.msg('恭喜您注册成功！', {
                                    icon: 1, time: 20000, btn: ['知道了'],
                                    end: function () {
                                        location.replace(location.href);
                                    }
                                });
                            } else {
                                layer.msg('提交失败！', { icon: 2 });
                                jQuery("input[type=submit]").val("注册");
                                jQuery("input[type=submit]").attr("disabled", false);
                            }
                        });
                    }
                });
            });
        
            function ajaxcheckMobile(Mobile) {
                var result = false;
                jQuery.ajax({
                    url: '<%=basePath%>User/CheckMobile.do',
                    type: 'post',
                    async: false,
                    data: { 'Mobile': Mobile },
                    success: function (data) {
                        if (data.success) {
                            result = true;
                        }
                    }
                });
                return result;
            }
        </script>
        
        <script type="text/javascript">
            $(document).ready(function () {
                uploadFile();
            });
    
            function uploadFile() {
                $("#btn_submit").attr('disabled', true);
                var url = '/Content/plugins/plupload-2.1.2/js/Moxie.swf';
                var serverUrl = '<%=basePath%>fileupload';
                var maxfilesize = '1024' + 'MB';
                $("#uploader").pluploadQueue({
                    url: serverUrl, //服务器端响应页面
                    max_file_size: maxfilesize, //最大文件限制
                    chunk_size: '1024MB', //一次上传数据大小
                    silverlight_xap_url: '/Content/plugins/plupload-2.1.2/js/Moxie.xap',
                    unique_names: false, //是否自动生成唯一名称
                    multi_selection: false, //是否可以一次选择多个文件
                    filters: [
                          { title: "模型", extensions: 'rar' }
                    ],
    
                    // SWF文件位置
                    flash_swf_url: url,
                    init: {
                        FilesAdded: function (up, files) {
                            var filename = files[0].name;
                            //验证是否包含中文
                            if (validFormat(filename)) {
                                //判断模型是否存在
                                $.get("<%=basePath%>User/GetModelIsExist.do", { PlanPath: filename }, function (data) {
                                    if (!data.success) {
                                        $('a.plupload_start').addClass('plupload_disabled');
                                        layer.msg("模型文件名已经存在,请重新命名！", { icon: 0 });
                                        jQuery.each(up.files, function (i, file) {
                                            //clearuploadFile("uploader", up, file, 1);
                                            if (up.files.length <= 1) {
                                                return;
                                            }
                                            up.removeFile(file);
                                        });
                                        up.getFile(files[i].id);
                                    } else {
                                        $('a.plupload_start').removeClass('plupload_disabled');
                                    }
                                })
                            } else {
                                $('a.plupload_start').addClass('plupload_disabled');
                                layer.msg("模型文件名不能含有中文！", { icon: 0 });
                            }
                            
                        },
                        FileUploaded: function (up, file, info) {
                            //一个文件上传成功
                            var newres = JSON.parse(info.response);
                            if(newres.success){
                                jQuery("#hid_modelFile").val(newres.saveName);
                                $("#btn_submit").attr('disabled', false);
                                $("#btn_submit").removeClass("up_btn_grey").addClass("up_btn");
                                $(".boxloading").hide();
                            }else{
                                layer.msg("上传失败！", { icon: 0 });
                            }
                        },
                        BeforeUpload: function (up, file) {
                            //$(".boxloading").show();
                        },
                        Init: function (up) {
                            
                            jQuery("#uploader_filelist").height(45);
                        },
                        Error: function (up, args) {
                            //发生错误
                            if (args.code == up.FILE_SIZE_ERROR) {
                                //alert("单个文件不得大于 " + maxfilesize + "（" + args.file.name + "）");
                                layer.msg(("单个文件不得大于 " + maxfilesize + "（" + args.file.name + "）", { icon: 0 }));
                            }
                        }
                    }
                });
    
    
            }
            function uploadModelFile() {
                $("#MileageID").val(GetUrlParam("MileageID"));
                if ($.trim($("#SpecialtyName").val()) == "") {
                    layer.msg("请填写项目名称！", { icon: 0 });
                }else if ($.trim($("#ModelName").val()) == "") {
                    layer.msg("请填写模型名称！", { icon: 0 });
                }else if ($.trim($("#selTools").val()) == "") {
                    layer.msg("请选择建模工具！", { icon: 0 });
                } else {
                    if ($("#hid_modelFile").val()) {
                        layer.load();
                        $("#UploadModelForm").ajaxSubmit(function (d) {
                            layer.closeAll();
                            if (d.success) {
                                layer.msg('添加成功！', {
                                    icon: 1, time: 2000, end: function () {
                                        location.href = "<%=basePath%>User/ModelList.do";
                                    }
                                });
                            } else {
                                layer.msg('上传失败！', {
                                    icon: 2, time: 2000,
                                    end: function () { 
                                        location.href = "<%=basePath%>User/ModelList.do"; 
                                    }
                                });
                                
                            }
                        });
                    }
                    else {
                        alert("请选择文件！");
                    }
                }
    
            }
            var setting = {
                view: { selectedMulti: false },
                callback: { onClick: onClick },
                data: {
                    simpleData: {
                        enable: true,
                        idKey: "MileageID",
                        pIdKey: "ParentMileageID",
                        rootPId: ""
                    },
                    key: {
                        name: "MileageName",
                        title: ""
                    }
                }
            };
            function onClick(event, treeId, treeNode, clickFlag) {
                $("#treeSelectedNodeName").val(treeNode.MileageName);
                $("#treeSelectedNodeId").val(treeNode.MileageID);
                $("#MileageID").val(treeNode.MileageID);
                $("#treeSelectedNodePId").val(treeNode.ParentMileageID);
                var parentNode = treeNode.getParentNode();
                if (parentNode) {
                    $("#treeParentNodeName").text(parentNode.MileageName);
                }
                else {
                    $("#treeParentNodeName").text("根节点");
                }
                $("#TreeForm input[type='button']").show();
                $("#TreeForm input[type='submit']").hide();
                $("#TreeForm #submitbutton").hide();
                $("#treeSelectedNodeName").attr("readonly", "readonly");
            }
            var zNodes = [
                { id: 4, pId: 0, name: "父节点2" },
                { id: 34, pId: 4, name: "叶子节点4" },
                { id: 89, pId: 34, name: "叶子节点9" },
                { id: 35, pId: 4, name: "叶子节点5" },
                { id: 36, pId: 4, name: "叶子节点6" }
            ];
            function appendChildNode() {
                $("#treeParentNodeName").text($("#treeSelectedNodeName").val());
                $("#treeSelectedNodePId").val($("#treeSelectedNodeId").val());
                $("#treeSelectedNodeName").val("");
                $("#treeSelectedNodeId").val("");
                $("#TreeForm input[type='button']").hide();
                $("#TreeForm #submitbutton").show();
                $("#treeSelectedNodeName").attr("readonly", false);
                if (!$("#treeSelectedNodePId").val()) {
                    $("#treeParentNodeName").text("根节点");
                }
            }
            function editThisNode() {
                if (!$("#treeSelectedNodeId").val()) {
                    layer.msg("请选择一个节点！", { icon: 0 });
                    return;
                }
                $("#TreeForm input[type='button']").hide();
                $("#TreeForm #submitbutton").show();
                $("#treeSelectedNodeName").attr("readonly", false);
            }
            function submitFun() {
                if ($("#treeSelectedNodeName").val()) {
                    $("#TreeForm").ajaxSubmit(function (d) {
                        if (d == 1) {
                            layer.msg("提交成功！", { icon: 1 });
                            window.location.reload();
                        }
                    });
                }
                else {
                    layer.msg("节点名必填！", { icon: 0 });
                    return false;
                }
            }
//             $(function () {
//                 $.get("/Ajax/GetModelTreeData", function (d) {
//                     zNodes = d;
//                     $.fn.zTree.init($("#tree"), setting, zNodes);
//                 })
//             })
    
            //获取URL参数
            function GetUrlParam(name) {
                var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
                var r = window.parent.location.search.substr(1).match(reg);
                if (r != null) return decodeURI(r[2]); return null;
            }
    
            //验证中文
            function validFormat(val) {
                if (escape(val).indexOf("%u") < 0) {
                    return true ;
                }
                else {
                    return false;
                }
            }
           
        </script>
        
        
        
        <script src="<%=basePath%>Content/plugins/jquery-validation/jquery.unobtrusive-ajax.js"></script>
        <script src="<%=basePath%>Content/plugins/jquery-validation/jquery.validate.js"></script>
        <script src="<%=basePath%>Content/plugins/jquery-validation/jquery.validate.unobtrusive.js"></script>
        <script src="<%=basePath%>Content/plugins/jQuery/jquery.form.js"></script>
        <script src="<%=basePath%>Content/plugins/momentjs/moment.js"></script>
        <script src="<%=basePath%>Content/plugins/daterangepicker/daterangepicker.js"></script>
        <script src="<%=basePath%>Content/plugins/datepicker/bootstrap-datepicker.js"></script>
        <script src="<%=basePath%>Content/plugins/datepicker/locales/bootstrap-datepicker.zh-CN.js"></script>
        
        <script src="<%=basePath%>Content/plugins/zTree_v3/js/jquery.ztree.core.js"></script>
        <script src="<%=basePath%>Content/plugins/plupload-2.1.2/js/plupload.full.min.js" type="text/javascript"></script>
        <script src="<%=basePath%>Content/plugins/plupload-2.1.2/js/jquery.plupload.queue/jquery.plupload.queue.min.js" type="text/javascript"></script>
        <script src="<%=basePath%>Content/plugins/plupload-2.1.2/js/i18n/zh_CN.js" type="text/javascript"></script>
        
        <script src="<%=basePath%>Content/bootstrap/js/bootstrap.js"></script>
        <script src="<%=basePath%>Content/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.js"></script>
        <script src="<%=basePath%>Content/plugins/slimScroll/jquery.slimscroll.js"></script>
        <script src="<%=basePath%>Content/plugins/fastclick/fastclick.js"></script>
        <script src="<%=basePath%>Content/AdminLTE/js/app.js"></script>
        <script src="<%=basePath%>Content/AdminLTE/js/demo.js"></script>
        <script src="<%=basePath%>Content/plugins/pace/pace.js"></script>
        <script src="<%=basePath%>Content/plugins/layer/layer.js"></script>
        <script src="<%=basePath%>Content/plugins/datatables/jquery.dataTables.js"></script>
        <script src="<%=basePath%>Content/plugins/datatables/dataTables.bootstrap.js"></script>
        <script src="<%=basePath%>Scripts/Common.js"></script>
        <script type="text/javascript">
            // 刷新
            function refresh(){
                location.reload();
            }
            
            var index;
            $('#close_add_modal').on('click', function(){
                layer.close(index);
            })
            
            // 登录
            function login(){
                index=   layer.open({
                    title: '欢迎登录',
                    type: 1,
                    skin: 'layui-layer-lan', //样式类名
                    anim: 2,
                    shadeClose: true, //开启遮罩关闭
                    area: ['500px', '435px'], //宽高
                    offset:['100px','35%'],
                    content: $('#login_main')
                });
            }
            
            
            var index2;
            $('#close_add_project').on('click', function(){
                layer.close(index2);
            })
            
            var USER_INFO = "${USER_INFO}";
            // 创建项目
            function add_project(){
                if(USER_INFO == "" || USER_INFO == null){
                    login();
                }else{
                    index2=   layer.open({
                        type: 1,
                        skin: 'layui-layer-lan', //样式类名
                        anim: 2,
                        title: '创建项目',
                        shadeClose: true, //开启遮罩关闭
                        area: ['500px', '460px'], //宽高
                        offset:['100px','35%'],
                        content: $('#project_main')
                    });
                }
            }
            
            // 打开模型
            function IsTrans(id,flag ){
                if(flag == 0){
                    location.href = "<%=basePath%>Model/index.do?id="+id;
                }else{
                    layer.msg('请稍等,正在轻量化处理！', { icon: 0 ,time:2000});
                }
            }
            // 刷新页面
            function replace(){
                location.replace(location.href);
            }
            
            if(USER_INFO == "" || USER_INFO == null){
                login();
            }
        </script>
    </body>
</html>
