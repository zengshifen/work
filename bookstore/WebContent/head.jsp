<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import="package05.*" %>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="css/head.css" rel="stylesheet" type="text/css" />
</head>
<body>



<div class="top">

<div class="m-headertop">
  <div class="huanying">
    <%
    String info=(String)request.getAttribute("info");
    if(info !=null){
   	out.println(info);
   }
    UserInfo user=(UserInfo)session.getAttribute("loginUser");
    if(user!=null){
	 out.println("欢迎"+user.getName()+"光临书城");
    }
 %>
   </div>
 <div class="m-clouds">
 <ul>
 <li><a class="m-cloudzx" href="http://localhost:8080/bookstore/index.jsp" target="_blank" onclick="_gaq.push(['_trackEvent', 'yuedu', 'mycenter', 'manage_subs']);">顾客留言</a></li>
 <li><a class="m-cloudsj" href="/shelf.do?operation=query_current" target="_blank">我的购物车</a></li>
 <li><a class="m-denglu" href="http://localhost:8080/bookstore/login05.jsp" target="_blank">登录</a></li>
 <li><a class="m-zhuce" href="http://localhost:8080/bookstore/register05.jsp">注册</a></li>
 </ul>
 </div>
</div>
<div class="m-headercenter">
 <div class="shousuo">   		
 <form id="form" name="form" method="post" action="task3-2.jsp" >      
 <input type="text" name="keywords" size="70" class="input1"/>
 <select name="selected" class="selected" onchange="">
 <option selected>=请选择=</option>
 <option value="书名">书名</option>
 <option value="作者">作者</option>
 <option value="图书类型">图书类型</option>
 </select>
 <input type="submit" class="search-btn" value="检索" >
 </form>
 </div>
</div>

<div class="m-headerbottom">  
 <ul class="m-mianlist">
  <li><a class="" href="/index" onclick="_gaq.push(['_trackEvent', 'navi', 'home']);">首页</a></li>
  <li><a class="crt" href="/book" onclick="_gaq.push(['_trackEvent', 'navi', 'publish']);">出版图书</a></li>
  <li><a class="" href="/yc" onclick="_gaq.push(['_trackEvent', 'navi', 'yc']);">国风中文网</a></li>
  <li><a class="" href="/ycmm" onclick="_gaq.push(['_trackEvent', 'navi', 'ycmm']);">采薇书院</a></li>
  <li><a class="" href="/manhua" onclick="_gaq.push(['_trackEvent', 'navi', 'comic']);">漫画</a></li>
  <li><a class="" href="/contentcenter" onclick="_gaq.push(['_trackEvent', 'navi', 'sub']);">订阅</a></li>
  <li><a class="" href="/rank" onclick="_gaq.push(['_trackEvent', 'navi', 'rank']);">排行榜</a></li>
  <li class="fr"><a href="/client" target="_blank" onclick="_gaq.push(['_trackEvent', 'navi', 'client']);"><b class="icon-download"></b>客户端</a></li>
  <li class="fr"><a href="/recharge.do?operation=form" onclick="_gaq.push(['_trackEvent', 'navi', 'recharge']);"><b class="icon-recharge"></b>充值</a></li>
  <li class="fr"><a href="http://open.yuedu.163.com/" target="_blank" onclick="_gaq.push(['_trackEvent', 'navi', 'open']);"><b class="icon-open"></b>作者中心</a></li>
 </ul>
</div>

<div class="m-headerson">
 <ul class="f-cb">
  <li><a href="jump2.jsp?keywords3=全部" >全部</a></li>
  <li><span class="sep">|</span></li>
  <li><a href="jump2.jsp?keywords3=小说作品" >小说作品</a></li>
  <li><span class="sep">|</span></li>
  <li><a href="jump2.jsp?keywords3=人文社科" >人文社科</a></li>
  <li><span class="sep">|</span></li>
  <li><a href="jump2.jsp?keywords3=成功励志" >成功励志</a></li>
  <li><span class="sep">|</span></li>
  <li><a href="jump2.jsp?keywords3=经济管理" >经济管理</a></li>
  <li><span class="sep">|</span></li>
  <li><a href="jump2.jsp?keywords3=品质生活" >品质生活</a></li>
  <li><span class="sep">|</span></li>
  <li><a href="jump2.jsp?keywords3=计算机" >计算机</a></li>
  <li><span class="sep">|</span></li>
  <li><a href="jump2.jsp?keywords3=文学作品" >文学作品</a></li>
  <li><span class="sep">|</span></li>
  <li><a href="jump2.jsp?keywords3=两性情感" >两性情感</a></li>
  <li><span class="sep">|</span></li>
  <li><a href="jump2.jsp?keywords3=亲子少儿" >亲子少儿</a></li>
  <li><span class="sep">|</span></li>
  <li><a href="jump2.jsp?keywords3=培训考试" >培训考试</a></li>
  <li><span class="sep">|</span></li>
  <li><<a href="jump2.jsp?keywords3=杂志期刊" >杂志期刊</a></li>
  <li><span class="sep">|</span></li>
  <li><a href="jump2.jsp?keywords3=外文外版" >外文外版</a></li>
 </ul>
</div>


</div>

<script type="text/javascript">
  $(function(){
  pHolder();
  });
  //顶部搜索框获取焦点后文本变空
  function pHolder(){
	var elem = $("#keywordsTop");
	var dValue = $("#keywordsTop").val();
	elem.focus(function(){
	  if(elem.val() == dValue){
	     elem.val("");
	    }
	  });
	  elem.blur(function(){
		if(elem.val() == ""){
		   elem.val(dValue);
	  }
	});
  }
</script>
</body>
</html>