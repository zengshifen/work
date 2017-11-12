<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="bookstore.BooksInfo" %>
<!DOCTYPE html>
<html>
  <head>
    <title>类型</title>
  </head>  
  <body>
  <%
  	String StrLx = request.getParameter("keywords3").trim();; 
  	session.setAttribute("keywords3", StrLx); 
  %>
  
   <c:redirect url="BooksServlet3">
	 <c:param name="keywords" value="${sessionScope.keywords3 }"/>
       </c:redirect>  	   	
	 
  </body>
</html>
