<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta content="telephone=no" name="format-detection">
<link rel="apple-touch-icon-precomposed" href="images/appicon.png">
<link rel="apple-touch-startup-image" href="images/startup.png">
<title>图书搜索</title>
<link rel="stylesheet" type="text/css" href="css/base.css">
<link rel="stylesheet" type="text/css" href="css/view.css">
<script type="text/javascript" src="js/jquery.min.js"></script>
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
</head>
<body>

<div id="filterPage"> 
  <jsp:include page="SearchTop.html" /> 
  
  <div id="resultMsg" class="w f14 search-result">
    "<span class="a3" id="searchKeyword">${requestScope.searchName}</span>"，共找到<span id="productAmount">（${requestScope.booksCount}）条相关结果。</span>
  </div>
  
  
  <div class="search-list w">
    <ul class="my-order-list pro-list list-ui-c" id="productList">
     <c:forEach var="goods" items="${requestScope.goodsList}" 
     begin="${currentPage*2-2 }" end="${currentPage*2-1}">	
      <li>
        <a href="${goods.booksCode}.jsp">
          <div class="wbox">
            <div class="pro-img" ><img width="150" height="150" src="${goods.booksImageAddress}" alt="${goods.booksName}"></div>

            <div class="pro-info">
              <p class="pro-name">书名：${goods.booksName}</p>
              <p class="pro-tip gray6 mt5">作者：${goods.booksAuthor}</p>
               <p class="pro2-tip2 gray8 mt7">图书类型：${goods.booksType}</p>
              <p class="mt5">
                <span class="snPrice" style="font-size:16px;">价格：¥ ${goods.booksPrice}</span>
              </p>
               <p class="pleft">
                <a href="buy?action=add&code=${goods.booksCode}">
                   <img src="images/buybutton.gif" width="71" height="21" border="0" />
                </a>
              </p>
            </div>
          </div>

          <span class="arrow"></span>
      </li>
    </c:forEach>
    
   <p align="center">
       <!--  跳转到：<input type="text" name="page" size="3"/> -->当前页数：[${currentPage }/${ maxPage} ] 
       <c:if test="${currentPage >1}">
        <a href="GoodsServlet?page=1">第一页</a> 
        <a href="GoodsServlet?page=${currentPage-1 }">上一页</a> 
        </c:if>
            
        <c:if test="${currentPage < maxPage}">
        <a href="GoodsServlet?page=${currentPage+1 }">下一页</a> 
        <a href="GoodsServlet?page=${maxPage }">最后一页  </a> 
         </c:if>
        
    </p>	 
    </ul>
  </div>
 
  <!-- 公用尾部 -->
<jsp:include page="SearchEnd.html" /> 
</div>

</body>
</html>
    