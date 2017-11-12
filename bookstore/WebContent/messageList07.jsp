<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE HTML>
<html>
<head>
  <meta charset="UTF-8">
<title>查看留言</title>
<link rel="stylesheet" type="text/css" href="cssliuyan/style.css">
<link rel="stylesheet" type="text/css" href="cssliuyan/base.css">
<link rel="stylesheet" type="text/css" href="cssliuyan/view.css">
</head> 
<body>
<jsp:include page="top07.jsp" />
<div id="wrapper"> 
<div id="wrapperInner">
<div id="mainContent">
 <div id="gbcontent">
  <c:choose>
  <c:when test="${empty pageModel.list}">
    <span>暂没有留言内容!</span>
  </c:when>
  <c:otherwise>
  <!-- 循环输出留言信息 -->
  <c:forEach items="${pageModel.list}" var="m">
  <div class="msgArea">
  <div class="msgArea-left"> <!--头像、称呼  -->
   <ul>
     <li class="userFace"><img src="${m.user.face}" alt="${m.user.username}" width="40" height="40" class="face-normal"></li>
     <li class="userName"><span class="userName-istop">${m.user.username}</span></li>
   </ul>
  </div>
  <div class="msgArea-right">
   <div class="msgTitle"><span class="msgTitle-istop">留言标题：【${m.title}】</span></div>
   <div class="msgTime">留言时间：<fmt:formatDate pattern="yyyy-MM-dd"
                            value="${m.createTime}" /></div>
    <div class="userContact">
    <!-- 判断管理员用户是否登录 -->
      <c:if test="${!empty manager}">
       <c:if test="${empty m.revert}">
          <a id="msg607" href="managerServlet?method=revert&id=${m.id}">【回复】</a>
       </c:if>
          <a id="msg607" href="managerServlet?method=delete&id=${m.id}">【删除】</a>
      </c:if>
    </div>
    <div class="msgContent">${m.content}</div>
   <!-- 判断是否存在回复信息 -->
   <c:if test="${!empty m.revert.content}">
   <!-- 输出回复信息 -->
   <div class="msgReply">
     <div class="msgReply-top">
      <img src="images/admin.jpg" width="13" height="18" />
      <b>管理员回复 : </b>( <fmt:formatDate pattern="yyyy-MM-dd"
                            value="${m.revert.revertTime}" /> )
      <div class="userContact">						
        <!-- 判断是否是管理登录 -->
        <c:if test="${!empty manager}">
          <a id="msg607" href="managerServlet?method=revert&id=${m.id}">【修改】</a>
        </c:if>
      </div>
     </div>
     <div class="msgReply-content">${m.revert.content}</div>
   </div>
   </c:if> 
  </div>              
  <div class="msgArea-clear"></div>
  </div>
  </c:forEach>
  <!-- 分页条 -->   
  <div id="more_load">
    <div class="load-more-lay" style="" id="loadingMore">
      <a href="messageServlet?method=view&currPage=${pageModel.nextPage}">点击加载更多</a>
    </div>
  </div>
  </c:otherwise>
  </c:choose>	          
 </div> 
</div>
</div>
</div> 
<jsp:include page="user_login07.jsp"></jsp:include>
<jsp:include page="bottom07.jsp" />
</body>
</html>