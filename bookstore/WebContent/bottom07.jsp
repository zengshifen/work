<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>   
<footer class="footer w">  
  <div class="layout fix user-info">
    <div class="fr"><a href="#" class="backTop" id="backTop">回顶部</a></div>
  </div>  
  <ul class="list-ui-a foot-list tc">    
    <li>
     <c:choose>
      <c:when test="${empty user}">  
        <a href="index.jsp" name="wap_home_bottom02001" id="footerLogin" class="foot1">登录</a>
        <a href="user_register07.jsp" name="wap_home_bottom02002" id="footerRegister" class="foot2">注册</a> 
      </c:when>
      <c:when test="${!empty manager}">
        <a href="userServlet?method=exit" name="wap_home_bottom03001" id="footerLogout" class="foot6">退出</a>      
      <span>管理员：${user.username}</span>
      </c:when>
      <c:otherwise> 
      <a href="userServlet?method=exit" name="wap_home_bottom03001" id="footerLogout" class="foot6">退出</a>             
      <span>用户名：${user.username}</span>
      </c:otherwise>
     </c:choose>        
    </li>
  </ul>
  <div class="tc copyright">Copyright© 2012-2018 m.ebuy.com</div>
</footer>