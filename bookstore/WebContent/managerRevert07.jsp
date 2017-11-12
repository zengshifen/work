<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户留言－意见反馈</title>
<link rel="stylesheet" type="text/css" href="cssliuyan/module.css">
<link rel="stylesheet" type="text/css" href="cssliuyan/member.css">
<link rel="stylesheet" type="text/css" href="cssliuyan/base.css">
<link rel="stylesheet" type="text/css" href="cssliuyan/view.css">
<link rel="stylesheet" type="text/css" href="cssliuyan/common.css" >
<script type="text/javascript">
function submitForm(){
  formRevert.submit();
  return true; 
}
</script>
</head>
<body>
<c:if test="${empty message or empty manager}">
	<c:set scope="request" var="error" value="您无权访问此页！"></c:set>
	<jsp:forward page="error07.jsp"></jsp:forward>
</c:if>
<jsp:include page="top07.jsp" />
<div class="qn_main login" style="width:308px;">
  <div class="qn_header">
    <div class="title">回复留言</div>
  </div>
    <div class="qn_pa10 qn_lh"  style="padding-bottom:1px;">
    <span>留言标题：</span> 
    <input type="tel" name="title" placeholder="请输入留言的标题" maxlength="11" value="${message.title}">	
    <span>留言内容：</span> 
    <textarea name="content" placeholder="请输入您的意见，500字以内" maxlength="500">${message.content}</textarea>	
    <span>网友：</span> 
    <input type="tel" name="title" placeholder="" maxlength="11" value="${message.user.username}">
  	</div>
   <div class="qn_pa10 qn_lh">	
   <span>回复留言：</span> 
   <form action="managerServlet" method="post" id="formRevert"  name="formRevert">   
	<input type="hidden" name="method" value="saveOrUpdateRevert">
	<input type="hidden" name="id" value="${message.id}">
    <textarea name="content" placeholder="" maxlength="500"  rows="5" cols="50" >
       ${message.revert.content}
    </textarea>	
    <div class="qn_btn qn_plr10">
         <input name="submit1" type="button" value="回复" onclick="submitForm();">             
    </div>
  </form>
  </div>
</div>
<jsp:include page="bottom07.jsp"></jsp:include>
</body>
</html>