$(function() {
	//banner描述右侧输出

	var $p = $(".b_d_content").parent();
	$(".body").css({
		"overflow-x": "hidden"
	});

	$(".b_d_content").css({
		"position": "absolute",
		"top": "-250px",
		"right": "-350px"
	}).animate({
		"top": $p.offset().top + "px",
		"right": $p.offset().left + "px"
	}, 800, function() {
		$(this).css({
			"position": "static",
			"top": "0px",
			"right": "0px"
		});
	});
	//	var $p=$(".b_d_content").parent();
	//console.log($p.offset().left+"/"+$p.offset().top);

	//silde轮播商品列表
	var frist = true;
	$(".page a:first").click(function() {
		$(".ul_con").stop(true); //停止动画
		if(frist) {
			$(".ul_con ul:last").prependTo($(".ul_con"));
			$(".ul_con").css("margin-left", "-1000px");
		}
		$(".ul_con").animate({
			"margin-left": "0px"
		}, 2000, function() {
			frist = false;
			$(".ul_con ul:last").prependTo($(".ul_con"));
			$(".ul_con").css("margin-left", "-1000px");
		});
	});

	$(".page a:last").click(function() {
		next();
	});

	//自动滚动定时器	
	var timer =
		setInterval(function() {
			next();
		}, 3000);
	//左右翻动获得焦点时，停止或重新开始定时器
	$(".page a:first,.page a:last").hover(function() {
		clearInterval(timer);
	}, function() {
		timer = setInterval(function() {
			next();
		}, 3000);
	});

	//显示隐藏backtop
	$(window).scroll(function() {
		var winHeight = $(window).height(); //获得浏览器可视窗口高度
		var scrolltop = $(window).scrollTop();//获得位置
		//alert(winHeight);
		if(winHeight > scrolltop) {
			$(".back_top").hide();
		} else {
			$(".back_top").show();
		}	
	});
	
	//回到顶部
     $(".back_top").click(function(){
     	$("html,body").animate({"scrollTop":"0px"},500);
     });
     
     
});

//下翻
function next() {
	$(".ul_con").stop(true); //停止动画
	$(".ul_con").animate({
		"margin-left": "-1000px"
	}, 2000, function() {
		$(".ul_con").find("ul:first").appendTo($("ul_con"));
		$(".ul_con").css({
			"margin-left": "0px"
		});
	});
}