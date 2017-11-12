<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="UTF-8">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<title>注册_易购网触屏版</title>
<link rel="stylesheet" type="text/css" href="css/module.css">
<link rel="stylesheet" type="text/css" href="css/member.css">
<script type="text/javascript" src="js/jquery.min.js"></script>
<!-- <script type="text/javascript" src="js/userReg.js"></script>
<script type="text/javascript" src="js/password.js"></script> -->
<script type="text/javascript">
function submitForm(){	
  $("#formRegister").submit();
  return true;
}
</script>
<script type="text/javascript">
 function fun_getVcode(){
	document.getElementById("vcodeimg1").src = "validatecode?"+Math.random(); 
} 
</script>
<!--<script type="text/javascript">
function fun_getVcode(){
  var timenow = new Date().getTime();
  var uid = document.getElementById("uuid").value;  
  document.getElementById("vcodeimg1").src =  "https://vcs.suning.com/vcs/imageCode.htm?uuid="+ uid +"&yys=" + timenow;
} 
</script>-->
</head>
<body>
<nav class="nav w pr">  
  <a class="goback" href="javascript:history.back(1)">返回</a>
  <div class="nav-title wb">用户注册</div>  
  <a href="" class="my-account" ></a>
  <a href="" class="my-cart my-cart-in"></a>
  <a href="" class="home"></a>  
</nav>
<div class="login w f14">
  <div class="signup layout f14" id="Sign_Check">
    <div class="regist-box" id="Login_Check">
      <div class="signup-tab-box tabBox ">
        <form  id="formRegister" name="formRegister" method="post" action="validateServlet">
          <ul class="input-list mt10">
            <li>
              <input type="text" class="input-ui-a" name="username" id="username" value="" placeholder="请输入您的邮箱地址">
              <p class="err-tips mt5 hide" id="p_egoAccountOfEmail_info">邮箱格式不正确</p>
            </li>
            <li>
              <input type="password" class="input-ui-a" name="password" maxlength="20" id="emailLogonPassword" value="" placeholder="请输入6-20位密码">
              <p class="err-tips mt5 hide" id="p_egoAcctEmailPwd_info">请输入6-20位密码</p>
            </li>
            <li>
              <input type="password" class="input-ui-a" name="PasswordVerify" maxlength="20" id="emailLogonPasswordVerify" value="" placeholder="请再次输入您的密码">
              <p class="err-tips mt5 hide" id="p_egoAcctEmailConfirmPwd_info">请再次输入密码</p>
            </li>
            <li>
              <input type="text" class="input-ui-a half" name="verifyCode" id="verifyCode" maxlength="4" value="" placeholder="请输入验证码：">
              <input type="hidden" name="uuid" id="uuid" value="196f8850-5bda-4a68-b395-d0547549d4d1">
              <img id="vcodeimg1" src="validatecode" width="63" height="29" alt="验证码" onclick="fun_getVcode();">
              <a class="a" href="javascript:void(0);" onclick="fun_getVcode();">换一张</a>
              <p class="err-tips mt5 hide" id="p_emailValCode_info">验证码输入不正确！</p>
            </li>
            <p class="err-tips mt10" id="normalLogonServerErrMsg"></p>
          </ul>
          <div class="btn-ui-b mt10"><a href="javascript:void(0);" onclick="formRegister.submit();">注册</a></div>
          <div class="wbox a label-bind zhmm mt10">
            <label><input type="checkbox" class="input-checkbox-a f-les m-tops" id="epp_email_checked"></label>
            <div class="wbox-flex">
              <p>同意易购网触屏版会员章程</p>
              <p>同意易付宝协议，创建易付宝账户</p>
              <p class="err-tips mt5 hide" id="epp_email_checked_error">请确认此协议！</p>
            </div>
          </div>
        </form>
      </div>
    </div>
  </div>
</div>

<div id="footer" class="w">
  <div class="layout fix user-info">
    <div class="fr"><a id="backTop" href="javascript:;" >回顶部</a></div>
  </div>
  <ul class="list-ui-a">
    <li>
    <div class="w user-login">
    <a href="#" name="wap_home_bottom02001" id="footerLogin" style="">登录</a>
    <a href="#" name="wap_home_bottom02002" id="footerRegister" style="">注册</a>
    <a href="#" name="wap_home_bottom03001" id="footerLogout" style="display:none">注销</a>
    <a href="#" name="wap_home_bottom03002">购物车</a>
    </div>
    </li>
  </ul>
  <div class="copyright">Copyright© 2002-2012 m.suning.com</div>
</div>
</body>
</html>