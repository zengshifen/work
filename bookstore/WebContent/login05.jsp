<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="UTF-8">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<title>登录_易购网触屏版</title>
<link rel="stylesheet" type="text/css" href="css/module.css">
<link rel="stylesheet" type="text/css" href="css/member.css">
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="validate.js" ></script>
<script type="text/javascript">
 function fun_getVcode(){
	document.getElementById("vcodeimg1").src = "validatecode?"+Math.random(); 
} 
</script>
<!--省略的JavaScript代码如表5-所示-->
</head>
<body>
<script type="text/javascript">
function checkForm(){
  var retFlag = true;
  var email2 =  $("#email2").val();
  var password = $("#password").val();
  if(email2 == ""){
	retFlag = false;
  }
  if (password == null || password == "") {
	retFlag = false;
  }
  return retFlag;
}

function submitForm(){
  if(!checkNormalLogonId() || !checkNormalLogonPwd()) {
	return;
  }
  if(checkForm()){
  $("#formlogon").submit();
  return true;
  }else{
  return false;
  }
}

$(function(){
  $("#email2").blur(function(){
	var email2 =  $("#email2").val();
	if($(this).val() == ''){
		$("#logonIdErrMsg").html('请输入昵称/邮箱/注册手机！');
		$("#logonIdErrMsg").show();
	  } else if (email2.match( /^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/ )) {
		$("#logonIdErrMsg").html('');
		return true;
	  }
	})
	
$("#password").blur(function(){
  var pwd = $('#password').val();
  if (pwd == null || pwd == "") {
	$("#passwordErrMsg").html('请输入密码！');
	$("#passwordErrMsg").show();
  } else if (pwd.length<6 || pwd.length>20) {
	$("#passwordErrMsg").html('请输入6-20位密码！');
	$("#passwordErrMsg").show();
  } else {
	$("#passwordErrMsg").html('');
	return true;
  }
  })
  showServerErrorMsg();
});

function checkNormalLogonId() {
  // 清掉服务器错误消息
  $("#normalLogonServerErrMsg").hide();
  var eml = $('#email2').val();
  if(eml=='昵称/邮箱/注册手机'){
	//$('#email2').val("");
	eml = "";
  }
  if (eml == null || eml == "") {
	$("#logonIdErrMsg").show().html('<em class="tipFalse"></em>请输入昵称/邮箱/注册手机！');
	return false;
  }
  var pattern = /^([0-9]+)$/;
  if(eml.length == 12 &&  pattern.test(eml)){
	$("#logonIdErrMsg").show().html("<em class='tipFalse'></em>抱歉无法使用会员卡号直接登录，请尝试用其他用户名（昵称/邮箱/注册手机）登录。");
	return false;
  }
  if (eml.length != 0 && eml.length < 50
	&& eml.match( /^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/ )){
	$('#logonId').val(eml.toLowerCase());
	} else {
	$('#logonId').val(eml);
	}
	$("#logonIdErrMsg").html('');
	return true;
}

function checkNormalLogonPwd() {
// 清掉服务器错误消息
  $("#normalLogonServerErrMsg").hide();
  var pwd = $('#password').val();
  if (pwd == null || pwd == "") {
	$("#passwordErrMsg").show().html('<em class="tipFalse"></em>请输入密码！');
	return false;
  } else if (pwd.length<6 || pwd.length>20) {
	$("#passwordErrMsg").show().html('<em class="tipFalse"></em>请输入6-20位密码！');
	return false;
  } else {
	$("#passwordErrMsg").html('');
	return true;
  }
}
//显示服务器端过来的错误信息
//能判断字段的，显示在输入框下方，不能判断的，显示在最下方按钮上方
function showServerErrorMsg() {
// 普通登录的服务器端过来的错误信息
}
</script>

<nav class="nav w pr">
  <a class="goback" href="javascript:history.back(1)">返回</a>
  <div class="nav-title wb">用户登录</div>
  <div class="title-submit-ui-a">
    <a href="">注册</a>
  </div>
</nav>

<div class="login w f14">
<form id="formlogon" name="formlogon" method="post" action="validateYZMServlet" >
  <ul class="input-list mt10" id="Login_Check">
    <li>
      <input type="text" class="input-ui-a" placeholder="用户名:手机/邮箱/昵称" name="login_username" id="email2" value="">
      <p class="err-tips mt5 hide" id="logonIdErrMsg">请输入用户名！</p>
    </li>
    <li>
      <input type="password" class="input-ui-a" placeholder="密码：" name="login_password" id="password" maxlength="20">
      <p class="err-tips mt5 hide" id="passwordErrMsg">请输入密码！</p>
    </li>    
    <li>
      <input type="text" class="input-ui-a half" id="validate" name="verifyCode" maxlength="4" placeholder="验证码：">
      <img id="vcodeimg1" src="validatecode" width="63" height="29" alt="验证码" onclick="fun_getVcode();">
      <a class="a" href="javascript:void(0);" onclick="fun_getVcode();">换一张</a>&nbsp;&nbsp;&nbsp;&nbsp;
      <p class="err-tips mt5 hide" id="vcodeErrMsg">验证码输入不正确！</p>
 
    </li>  
  </ul>  
  <div class="btn-ui-b mt10">
  <a href="javascript:void(0);" onclick="return submitForm();">登录</a>
    
 
  </div>
</form>
</div>

<div id="footer" class="w">
 
</div>
 
</body>
