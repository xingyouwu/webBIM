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
        <link href="<%=basePath%>css/style_help.css" rel="stylesheet" />
        <link href="<%=basePath%>Content/plugins/plupload-2.1.2/js/jquery.plupload.queue/css/jquery.plupload.queue.css" rel="stylesheet" type="text/css" media="screen">
        <link href="<%=basePath%>Content/plugins/layer/skin/layer.css" rel="stylesheet" id="layui_layer_skinlayercss">
        <script src="<%=basePath%>Scripts/jquery.min.js"></script>
        <script src="<%=basePath%>Scripts/Common.js"></script>
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
                    <div class="helpHeader"></div>
                </div>
            </div>
            <footer>© 2015 glendale 陕西葛兰岱尔网络科技有限公司.All Rights Reserved</footer>
        </div>
        
        <!-- 登录  begin -->
        <div class="wrapper" style="display: none;" id="login_main">
            <div class="content-wrapper1" id="content-wrapper1" style="height: 390px;min-height: 0px;">
                <div>
                    <div class="login_cont">
                        <div class="login_title">欢迎登录</div>
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
            
            
            var index;
            $('#close_add_modal').on('click', function(){
                layer.close(index);
            })
            
            // 登录
            function login(){
                index=   layer.open({
                    title: '添加',
                    type: 1,
                    skin: 'layui-layer-lan', //样式类名
                    anim: 2,
                    shadeClose: true, //开启遮罩关闭
                    area: ['500px', '400px'], //宽高
                    offset:['100px','35%'],
                    content: $('#login_main')
                });
            }
            
            // 刷新页面
            function replace(){
                location.replace(location.href);
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
    </body>
</html>
