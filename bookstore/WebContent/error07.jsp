<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML>
<html>
<head>
  <meta charset="UTF-8">
  <title>错误信息页面</title>
  <link rel="stylesheet" type="text/css" href="css/base.css">
</head>
<body>
<jsp:include page="top07.jsp"/>
<div class="info w">
  <img alt="页面出错"  src="images/error_img.gif">
</div>
<div class="info w">
  <c:if test="${!empty error}">
   		${error}
  </c:if> 
</div>
<div class="info w">
   <a href="javascript:history.go(-1);">返 回</a>
</div>
<jsp:include page="bottom07.jsp"></jsp:include>
</body>
</html>