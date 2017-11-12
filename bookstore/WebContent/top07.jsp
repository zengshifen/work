<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
  <nav class="nav w nav-sub pr">  
  <a class="goback" href="javascript:history.back(1)">返回</a>
   <c:choose>
	 <c:when test="${empty user}">
		<div class="nav-title wb">您尚未登录，请先进行登录</div>
	 </c:when>
	 <c:otherwise>
		<div class="nav-title wb">${user.username}：欢迎您！</div>
	 </c:otherwise>
	</c:choose>
    <a name="shouye_none_toubu_head0002" href="index.jsp" class="my-account"></a>
    <a href="index.jsp" class="home"></a>
  </nav>  