<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
  <head>
    <title>搜索商品列表</title>
  </head>  
  <body>
<% 
request.setCharacterEncoding("UTF-8");
String bname=request.getParameter("keywords").trim();
session.setAttribute("keywords", bname);

String strVar=request.getParameter("selected");
session.setAttribute("slectedType", strVar);
%>
       <c:redirect url="GoodsServlet">
	   <c:param name="keywords" value="${sessionScope.keywords }"/>
	   <c:param name="keywords" value="${sessionScope.slectedType }"/>
       </c:redirect>  
    	  
  </body>
</html>
