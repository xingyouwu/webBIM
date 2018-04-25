<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
    <head>
        <base href="<%=basePath%>">
    
        <title>上传模型</title>
    
        <meta http-equiv="pragma" content="no-cache">
        <meta http-equiv="cache-control" content="no-cache">
        <meta http-equiv="expires" content="0">    
        <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
        <meta http-equiv="description" content="This is my page">
        <meta http-equiv="Content-type" content="text/html;charset=UTF-8">
        <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
   
        <link href="<%=basePath%>css/reset.css" rel="stylesheet">
        <link href="<%=basePath%>css/Style.css" rel="stylesheet">
        <link href="<%=basePath%>css/responsive.css" rel="stylesheet">
        <link href="<%=basePath%>Content/bootstrap/css/bootstrap.css" rel="stylesheet">
        <link rel="icon" href="<%=basePath%>webimg/bimlogo.ico" type="img/x-ico">
  
        <link href="<%=basePath%>Content/plugins/plupload-2.1.2/js/jquery.plupload.queue/css/jquery.plupload.queue.css" rel="stylesheet" type="text/css" media="screen">
        <style>
            /*.ztree li a {
                color: white;
            }*/
        </style>

        <script src="<%=basePath%>Scripts/jquery.min.js"></script>
        <script src="<%=basePath%>Scripts/Common.js"></script>
        <link rel="stylesheet" href="<%=basePath%>Content/plugins/layer/skin/layer.css" id="layui_layer_skinlayercss">
    </head>
    <body class="skin-blue sidebar-mini fixed  pace-done">
        <div class="pace  pace-inactive">
            <div class="pace-progress" data-progress-text="100%" data-progress="99" style="transform: translate3d(100%, 0px, 0px);">
                <div class="pace-progress-inner"></div>
            </div>
            <div class="pace-activity"></div>
        </div>
        <div class="wrapper" style="margin-top: -50px;">
            <div class="content-wrapper" id="content-wrapper" style="min-height: 500px;">
                <div>
                    <div class="mymodel_right">
                        <form id="UploadModelForm" action="<%=basePath%>User/UploadFileTow.do" method="post" enctype="multipart/form-data" novalidate="novalidate">
                            <div class="title" style=" width: 100px; float: left;margin-top: -7px;">模型名称：</div>
                            <div class="box" style="width: 370px; float: left;">
                                <input name="ModelName" id="ModelName" type="text" class="txtbox" style="height: 27px;width: 320px;">
                            </div>
                            <div class="modellist">
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
                                                        <ul id="uploader_filelist" class="plupload_filelist" style="position: relative; height: 200px;">
                                                            <li class="plupload_droptext" style="width: 200px;height: 200px;">把文件拖到这里。</li>
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
                                                            <div class="plupload_file_status">
                                                                <span class="plupload_total_status">0%</span>
                                                            </div>
                                                            <div class="plupload_file_size">
                                                                <span class="plupload_total_file_size">0 b</span>
                                                            </div>
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
                                    </div>
                                </div>
                                <div id="divreupload">
                                    <!-- <div class="button float-none" id="BtnReupload">重新上传</div>-->
                                </div>
                                <span style="color: red; margin-left: 10px;">注：支持上传格式:rar,引擎支持文件格式有：ifc、obj、dae、3ds、fbx,转化时请注意将文件或文件夹压缩成*.rar(注意：（obj、dae、3ds、fbx）在压缩时需要用文件夹包含),ifc格式不需要文件夹包含。</span>
                            </div>
                            <div class="title" style=" width: 220px; float: left;">建模所使用的工具软件及版本：</div>
                            <div class="box" style=" width: 150px; float: left;">
                                <select id="selTools" name="selTools" style="height:25px!important; margin-top: 6px;" class="txtbox">
                                    <option value="">请选择</option>
                                    <c:forEach items="${projectToolS}" var="projectTool">
                                        <option value="${projectTool.id}">${projectTool.project_tool}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="title" style="display:none">是否公开:
                                <label><input type="radio" name="rboIsPublic" value="0" checked="">是</label>&nbsp;&nbsp;
                                <label><input type="radio" name="rboIsPublic" value="1">否</label>
                            </div>
                            <div class="box" style="padding-top: 40px;">
                                <input name="MileageID" id="MileageID" type="hidden">
                                <input value="确定" onclick="uploadModelFile()" class="up_btn_grey" type="button" id="btn_submit" disabled="disabled">
                            </div>
                        </form>
                    </div>
                    <hr>
                </div>
            </div>
        </div>

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
    
        <script src="<%=basePath%>Content/plugins/jquery-validation/jquery.unobtrusive-ajax.js"></script>
        <script src="<%=basePath%>Content/plugins/jquery-validation/jquery.validate.js"></script>
        <script src="<%=basePath%>Content/plugins/jquery-validation/jquery.validate.unobtrusive.js"></script>
        <script src="<%=basePath%>Content/plugins/jQuery/jquery.form.js"></script>
        <script src="<%=basePath%>Content/plugins/momentjs/moment.js"></script>
        <script src="<%=basePath%>Content/plugins/daterangepicker/daterangepicker.js"></script>
        <script src="<%=basePath%>Content/plugins/datepicker/bootstrap-datepicker.js"></script>
        <script src="<%=basePath%>Content/plugins/datepicker/locales/bootstrap-datepicker.zh-CN.js"></script>
   
        <script src="<%=basePath%>Content/plugins/plupload-2.1.2/js/plupload.full.min.js" type="text/javascript"></script>
        <script src="<%=basePath%>Content/plugins/plupload-2.1.2/js/jquery.plupload.queue/jquery.plupload.queue.min.js" type="text/javascript"></script>
        <script src="<%=basePath%>Content/plugins/plupload-2.1.2/js/i18n/zh_CN.js" type="text/javascript"></script>

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
                            $(".boxloading").show();
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
                $("#MileageID").val("${MileageID}");
                if ($.trim($("#ModelName").val()) == "") {
                    layer.msg("请填写模型名称！", { icon: 0 });
                } else if ($.trim($("#selTools").val()) == "") {
                    layer.msg("请选择建模工具！", { icon: 0 });
                } else {
                    if ($("#hid_modelFile").val()) {
                        layer.load();
                        $("#UploadModelForm").ajaxSubmit(function (data) {
                            layer.closeAll();
                            if (data.success) {
                                layer.msg('添加成功！', {
                                    icon: 1, time: 2000, end: function () {
                                        parent.window.location.href = "<%=basePath%>User/ModelList.do";
                                        var index = parent.layer.getFrameIndex(window.name);
                                        parent.layer.close(index);
                                    }
                                });
                            } else {
                                layer.msg('上传失败！', { icon: 2 });
                            }
                        });
                    }
                    else {
                        alert("请选择文件！");
                    }
                }
            }
            //验证中文
            function validFormat(val) {
                if (escape(val).indexOf("%u") < 0) {
                    return true;
                }
                else {
                    return false;
                }
            }
        </script>
    </body>
</html>
