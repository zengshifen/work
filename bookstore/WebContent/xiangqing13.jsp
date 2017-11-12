<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>无标题文档</title>
<script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>
<link href="css/xiangqing.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
$(function(){
$("div img").mouseover(function(){
  var big_src= $(this).attr("src");
  $("#test").attr("src",big_src);
});
});
</script>
</head>

<body>
<div class="zong">
  <div class="box1"><img id="test" title="test" src="images/test1.jpg" /><br />
                <div>
               <img src="images/test1.jpg" />
               <img src="images/test2.jpg" />
               <img src="images/test3.jpg" />
               <img src="images/test4.jpg" />
               </div>
      </div>
  
 <div class="box2">
  <div class="content1">
    <div class="content1_1">
        	<h2>海洋与文明 （精装）：The Sea and Civilization A Maritime History of the World</h2>
            <h3><span class="hesd_title_name">《海洋与文明》（汗青堂009）：本书荣获美国《选择》杂志2014年度“杰出学术著作奖” 一部海洋视角的世界史，一部关于航海者的史诗 </span></h3>
            <br>
          <span class="hot" ><a target="_blank" href="http://book.dangdang.com/20170929_4lr0">20万图书每满100减40，相当于折上6折，点击查看社科专场&gt;&gt;&gt;</a></span>
     </div>
             
    <div class="content1_2">
             <ul>
             <li class="l1">运费</li>
             <li class="l2">南京 至 南京﹀</li>
             <li class="l3">快递：0.00</li>
             </ul>
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
        <a href="buy?action=add&code=13">
         <input name="add_button" type="button" class="btn1" value="加入购物车" />
         </a>
          <a href="buy?action=add&code=1">
         <input name="mai_button" type="button" class="btn2" value="立即购买" />
         </a>
       </div>
   </div>
        
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