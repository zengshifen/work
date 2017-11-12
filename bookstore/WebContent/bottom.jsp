<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="bookstore.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="css/bottom.css" rel="stylesheet" type="text/css" />
</head>
<body>
<%
  long count=CountFileHandler2_5.readFile(request.getRealPath("/")+"count.txt");
  if(session.getAttribute("visited")==null){
    session.setAttribute("visited","y");
    session.setMaxInactiveInterval(60*60*24);
    count=count+1;
    CountFileHandler2_5.writeFile(request.getRealPath("/")+"count.txt",count);
}
%>
<%!
public String getCounter(long count){
	String countNumber=count+"";
	String newNumber="";
	for(int i=0;i<countNumber.length();i++){
		newNumber=newNumber+"<img src=\"images\\"+countNumber.charAt(i)+".gif\">";
	}
	return newNumber;
}
%>

<footer class="footer">
    <div class="layout fix user-info">
      <div class="user-name">
           <!-- a-统计网站的访问量 -->
           <span class="tongji1">当前网页已被访问过: <%=getCounter(count)%>次</span>
           <span class="tongji2">当前在线用户: 位</span>
      </div>
      <div class="fr"><a href="#" class="backTop" id="backTop">回顶部</a></div>
    </div>
    <div class="tc copyright">Copyright© 2012-2018 m.ebuy.com</div>
  </footer>
</body>
</html>