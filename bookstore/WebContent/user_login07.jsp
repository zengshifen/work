<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="package07.dao.UserDao"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>   
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="UTF-8">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta content="telephone=no" name="format-detection">
<title>登录_易购网触屏版</title>
<link rel="stylesheet" type="text/css" href="cssliuyan/module.css">
<link rel="stylesheet" type="text/css" href="cssliuyan/member.css">
<link rel="stylesheet" type="text/css" href="cssliuyan/base.css">
<link rel="stylesheet" type="text/css" href="cssliuyan/view.css">
<link rel="stylesheet" type="text/css" href="cssliuyan/common.css" >
<script type="text/javascript">
function submitForm(){
  formlogon.submit();
  return true; 
}
function login(form){
	if(form.elements["username"].value == ""){
		alert("用户名不能空！");
		return false;
	}
	if(form.elements["password"].value == ""){
		alert("密码不能空！");
		return false;
	}
}
function message(form){
	if(form.elements["title"].value == ""){
		alert("留言标题不能为空！");
		return false;
	}
	if(form.elements["content"].value == ""){
		alert("留言内容不能空！");
		return false;
	}
}
</script>
</head>
<body>
<c:choose>
<c:when test="${empty user}">
<div class="login layout f14 w">
  <div class="title">用户登录</div>
  <form id="formlogon" name="formlogon" method="post" action="userServlet" onsubmit="return login(this);">
    <input type="hidden" name="method" value="userLogin">
    <ul class="input-list mt10" id="Login_Check">
    <li>
      <input type="text" class="input-ui-a" placeholder="请输入您的用户名" name="username" id="username" value="">
      <p class="err-tips mt5 hide" id="logonIdErrMsg">请输入用户名！</p>
    </li>
    <li>
      <input type="password" class="input-ui-a" placeholder="请输入您的密码" name="password" id="password" maxlength="20">
      <p class="err-tips mt5 hide" id="passwordErrMsg">请输入密码！</p>
    </li>  
    </ul>  
    <div>
      <input type="submit" value="登 录" />
      <input type="reset" value="重 置" />
    </div>
  </form>
</div>
</c:when>
<c:otherwise>
<div class="qn_main">
  <div class="login">
      <div class="title">我要留言</div>
    <form action="messageServlet" method="post" id="form1" onSubmit="return message(this);">
      <input type="hidden" name="method" value="save">
      <div class="qn_pa10 qn_lh"  style="padding-bottom:1px;">
        <span>留言标题：</span>
        <input name="title" placeholder="请输入留言的标题" maxlength="11" value="">	
        <span>留言内容：</span>
        <textarea name="content" placeholder="请输入您的意见，500字以内" maxlength="500"></textarea>	
      </div>
      <div>
           <input name="submit1"  type="submit" value="留 言" /> 
      </div>
    </form>
  </div>
</div>
</c:otherwise>
</c:choose>
</body>
</html>