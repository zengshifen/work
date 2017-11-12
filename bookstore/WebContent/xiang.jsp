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
  	String bname = request.getParameter("keywords88").trim();; 
  	session.setAttribute("keywords88", bname); 
  %>
  
   <c:redirect url="XiangServlet">
	 <c:param name="keywords" value="${sessionScope.keywords88 }"/>
       </c:redirect>  	   	
	 
  </body>
</html>
