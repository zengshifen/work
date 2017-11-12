 $(document).ready(function(){
	function showTime()	{					
	var myDate=new Date();
	var hour=myDate.getHours();
	var minutes=myDate.getMinutes();
	var seconds=myDate.getSeconds();
	if(hour<10)
	hour="0"+hour;
	if(minutes<10)
	minutes="0"+minutes;
	if(seconds<10)
	seconds="0"+seconds;
	document.getElementById("time").innerHTML="当前时间为:"+hour+":"+minutes+":"+seconds;}
	 setInterval(showTime, 1000); 

	})
	

	function openwindow(){
		window.open("xiangqing13.jsp");
	}
		
		
	function showw(menu){
           if(document.getElementById(menu).style.display =='none'){
	          document.getElementById(menu).style.display ='block';
           }else{
	         document.getElementById(menu).style.display ='none';
}
 }
 
    




	
	$(document).ready(function() {
			var navNum;
			$(".nav-list li[id]").hover(function() {
				var navObj = $(this).attr("id");
				//				alert(navObj);
                                //substring 截取
				navNum = navObj.substring(6, navObj.length);
				//				alert(navNum);
                                //添加.siblings().stop(true, true) ，解决了多个下拉子菜单共存的情况
				$("#navbox-" + navNum).slideDown(300).siblings().stop(true, true)
			}, function() {
				$("#navbox-" + navNum).hide();
			});
			$(".nav-hidden-box").hover(function() {
				$(this).show();
			}, function() {
				$(this).slideUp(300)
			})

		})
		
		
		
	  window.onload = function () {
            //当前年月日ID
            var fulldate = document.getElementById("fulldate");
            //当前日  ID
            var nowdate = document.getElementById("nowdate");
            //倒计时ID
            var time = document.getElementById("time");
            //问候语ID
            var hllo = document.getElementById("hllo");

            //获取现在的年月日小时
            var fullTime = new Date();
            var year = fullTime.getFullYear();//年
            var month = fullTime.getMonth();//月
            var date = fullTime.getDate();//日
            var hours = fullTime.getHours();//小时
            var dayArr = [ "星期日","星期一","星期二","星期三","星期四","星期五","星期六"];
            //设置年月日
            fulldate.innerHTML = year+" 年 "+(month+1)+" 月 "+date+" 日  "+dayArr[fullTime.getDay()];
            //设置当前日
            nowdate.innerHTML = date;
            
            //名言数组
            var hlloarr = [
                "只有登上山顶，才能看到那边的风光",
                "山路曲折盘旋，但毕竟朝着顶峰延伸",
                "勤奋是你生命的密码，能译出你一部壮丽的史诗",
                "左右一个人成功的，不是能力，而是选择",
                "我们这个世界，从不会给一个伤心的落伍者颁发奖牌",
                "没有天生的信心，只有不断培养的信心",
                "每一发奋努力的背后，必有加倍的赏赐",
                "不要等待机会，而要创造机会",
                "含泪播种的人一定能含笑收获",
                "让信念坚持下去，梦想就会实现",
                "不要给自己的失败找借口",
                "要学会新东西，要不断进步，就必须放低自己的姿势"
            ];
            //当前时间段默认的名言
            hllo.innerHTML = hlloarr[parseInt(hours/2)];


            var endTime = new Date(year,month,date,23,59,59);//获取未来结束的时间
            setInterval(fun,1000);//开启定时器
            function fun() {
                var newTime = new Date();//得到最新的时间
                var ms = parseInt((endTime - newTime) / 1000); //得到毫秒，并取整
                var s = parseInt(ms % 60);//秒
                var m = parseInt((ms / 60) % 60); //分
                var h = parseInt((ms / 3600) % 24);//小时
                //var d = parseInt((ms / 3600) / 24);//天

                s<10? s="0"+s:s;
                m<10? m="0"+m:m;
                h<10? h="0"+h:h;
                //d<10? d="0"+d:d;
                time.innerHTML = h +" 时 "+m+" 分 "+s+" 秒 ";
                //每60秒切换一次名言
                if(s == 0 ){
                    hllo.innerHTML = hlloarr[parseInt(m%12)];
                }
            }
        }
		
		
		
	
	