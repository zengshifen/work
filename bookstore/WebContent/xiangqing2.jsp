<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="css/xiangqing2.css" rel="stylesheet" type="text/css" />
<link href="css/xiangqing3.css" rel="stylesheet" type="text/css" />
<script src="js/xiangqing2.js" type="text/javascript"></script>
<script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="js/jquery.min.js"></script>
</head>
<body>

<div  class="zong">
<div class="box1">
 <c:forEach var="goods" items="${requestScope.goodsList}">
    <div id="magnifier"><img src="${goods.booksdaImageAddress}"id="img" />
    <div id="Browser"></div>
    </div>
  <div id="mag"><img id="magnifierImg" /></div> 
</div>
    
   <div class="box2">
    
    <div class="biao">
    <table width="690">
    <tr class="product_para_name">
      <td>书名：${goods.booksName}</td>
    </tr>
                        
    <tr class="product_para2">
      <td>
    
      <a href="${goods.booksCode}.jsp">
      <div style="width:475px">商品编号：<span><span id="productDetails_sku">${goods.booksCode}</span><input id="productDetails_sku_v" name="productDetails_sku_v" type="hidden" value="1282959_0" /><input id="producttypeid" name="producttypeid" type="hidden" value="46932" /></span></div>
      <div style="width:475px">线上售价：<b>￥<span><span id="ProductDetails_lblBuyPrice">${goods.booksPrice}</span></span></b></div>
      <div class="price">定价：<del>￥<span id="ProductDetails_lblMarkerPrice">${goods.booksPrice}</span></del></div>
      <div>ISBN：<span id="tryReadISBN">9787535497994</span></div>
      <div>出版社：<span>长江文艺</span></div>
      <div>出版日期：<span>2017-08</span></div>
      <div>作者：<span>${goods.booksAuthor}</span></div>
      <div>浏览次数：<span>368 次</span></div>
    </a>
      </td>
    </tr>
</table>

<div class="jianjie">
     <p> 简介：${goods.booksXiang}</p>
     </div>
</div>    
         
  <div class="content2">
       <div class="content2_1">
         <ul>
          <li>月销量 <span class="sp1">1141</span></li>
          <li>累计评价 <span class="sp1">249</span></li>
          <li>送积分 <span class="sp2">8</span></li>
         </ul>
        </div>
       <div class="content2_2">
          <p class="p1">	数量
            <select name="select" class="s1">
              <option>1</option>
              <option>2</option>
              <option>3</option>
            </select>
            件</p>
          <p class="p2">库存件：163件</p>
       </div>
       <div class="content2_3">
         <a href="buy?action=add&code=${goods.booksCode}">
         <input name="add_button" type="button" class="btn1" value="加入购物车" />
         </a>
         <input name="mai_button" type="button" class="btn2" value="立即购买" />
       </div>
   </div>
     </c:forEach>     
  <div class="content3">
        	<ul>
            	<li><a href="#">服务保证</a></li>
                <li><a href="#">正品保证</a></li>
                <li><a href="#">极速退款</a></li>
                <li><a href="#">七天无理由退换</a></li>
                <li><select name="xuanze" class="s2" >
                 <option>支付方式</option>
                  <option>支付宝</option>
                  <option>微信</option>
                  <option>朋友代付</option>
                </select></li>
          </ul>
  </div>
    
 </div>          

</div>


</body>
</html>