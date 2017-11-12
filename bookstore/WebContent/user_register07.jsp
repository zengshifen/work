<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="UTF-8">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta content="telephone=no" name="format-detection">
<title>用户注册_易购网触屏版</title>
<link rel="stylesheet" type="text/css" href="cssliuyan/module.css">
<link rel="stylesheet" type="text/css" href="cssliuyan/member.css">
<link rel="stylesheet" type="text/css" href="cssliuyan/base.css">
<link rel="stylesheet" type="text/css" href="cssliuyan/view.css">
<link rel="stylesheet" type="text/css" href="cssliuyan/common.css" >
</head>
<body>
<script type="text/javascript">
function registerSubmit(){
	if(checkForm()){
		registerForm.submit();		
		  return true;
	  }else{
		  return false;
	  }
	}	

function checkForm(){
	if(registerForm.elements["username"].value == ""){
	  alert("用户名不能空！");
	  return false;
	}
	if(registerForm.elements["password"].value == ""){
	  alert("密码不能空！");
	  return false;
	}
	if(registerForm.elements["repassword"].value == ""){
	  alert("确认密码不能空！");
	  return false;
	}
	if(registerForm.elements["repassword"].value != registerForm.elements["password"].value){
	  alert("两次密码输入不一致！");
	  return false;
	}
	if(registerForm.elements["email"].value == ""){
	  alert("电子邮件地址不能空！");
	  return false;
	}
	
    return true;
}


</script>
<jsp:include page="top07.jsp" />
  <div class="layout f14 w">
    <div class="signup layout f14" id="Sign_Check">
      <div class="regist-box" id="Login_Check">
        <div class="signup-tab-box tabBox ">
          <form action="userServlet" method="post" id="registerForm" >
          <input type="hidden" name="method" value="guestRegister" /> 
          <ul class="input-list mt10">
            <li>
              <input type="text" class="input-ui-a" placeholder="请输入您的用户名" name="username" id="username" value="">
              <p class="err-tips mt5 hide" id="logonIdErrMsg">请输入用户名！</p>
            </li>
            <li>
              <input type="password" class="input-ui-a" name="password" maxlength="20" id="password" value="" placeholder="请输入6-20位密码">
              <p class="err-tips mt5 hide" id="p_egoAcctEmailPwd_info">请输入6-20位密码</p>
            </li>
            <li>
              <input type="password" class="input-ui-a" name="repassword" maxlength="20" id="repassword" value="" placeholder="请再次输入您的密码">
              <p class="err-tips mt5 hide" id="p_egoAcctEmailConfirmPwd_info">请再次输入密码</p>
            </li>
            <li>
              <input type="text" class="input-ui-a" name="email" id="email" value="" placeholder="请输入您的邮箱地址">
              <p class="err-tips mt5 hide" id="p_egoAccountOfEmail_info">邮箱格式不正确</p>
            </li>
            <li>
              <span>选择头像：</span> 
              <jsp:include page="listFace07.jsp" />
            </li>              
          </ul>
            <div class="btn-ui-b">
                <a href="javascript:void(0);" onclick="registerSubmit()">注册</a>
            </div>
          </form>
        </div>
      </div>
    </div>
  </div>  
<jsp:include page="bottom07.jsp" />
</body>
</html>