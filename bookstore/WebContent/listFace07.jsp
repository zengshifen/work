<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="package07.dao.UserDao"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<%
  UserDao dao = new UserDao(); // 实例化UserDao
  request.setAttribute("imageList", dao.getAllFace());
%>  
<div class=" qn_pa10">
  <div class="qn_item qn_border"> 
   <c:if test="${!empty imageList}"> 
    <c:forEach items="${imageList}" var="image">      
    <img class="qn_captcha"  src="${image.face}" >
    <span class="qn_ml">
      <input type="radio" name="face" value="${image.face}" style="width:20px;">
    </span>
    </c:forEach>
    </c:if>
  </div>
</div>  
   