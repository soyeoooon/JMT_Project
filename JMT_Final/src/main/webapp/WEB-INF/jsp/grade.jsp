<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<style type="text/css">
.starRev {
	
}

.starR1 {
	background:
		url('http://miuu227.godohosting.com/images/icon/ico_review.png')
		no-repeat -69px 0;
	background-size: auto 100%;
	width: 20px;
	height: 40px;
	float: left;
	text-indent: -9999px;
	cursor: pointer;
	text-indent: -9999px;
}

.starR2 {
	background:
		url('http://miuu227.godohosting.com/images/icon/ico_review.png')
		no-repeat right 0;
	background-size: auto 100%;
	width: 20px;
	height: 40px;
	float: left;
	text-indent: -9999px;
	cursor: pointer;
}

.starR1.on {
	background-position: 0 0;
}

.starR2.on {
	background-position: -20px 0;
}
</style>
</head>
<body>
	<div class="starRev" align="center">
		<span class="starR1 on" id="1">별1_왼쪽</span>
		<span class="starR2" id="2">별1_오른쪽</span>
		<span class="starR1" id="3">별2_왼쪽</span>
		<span class="starR2" id="4">별2_오른쪽</span>
		<span class="starR1" id="5">별3_왼쪽</span>
		<span class="starR2" id="6">별3_오른쪽</span>
		<span class="starR1" id="7">별4_왼쪽</span>
		<span class="starR2" id="8">별4_오른쪽</span>
		<span class="starR1" id="9">별5_왼쪽</span>
		<span class="starR2" id="10">별5_오른쪽</span>
	</div>
	<script type="text/javascript">
		$(function(){
			$('#'+${info.user.e_grade}*2).addClass('on').prevAll('span').addClass('on');
		});
		
		$('.starRev span').click(function() {
			$(this).parent().children('span').removeClass('on');
			$(this).addClass('on').prevAll('span').addClass('on');
			var val = $('.starRev .on').length * 0.5;
			
			$.ajax({
				url:'/grade',
				//소연 수정 param.r_num 을 r_num으로
				//해야될거 login을 email.m_num으로 수정
				data:{'r_num': ${r_num}, 'm_num': ${login}, 'e_grade':val},
				type : "post",
	            success:function(data){
	            	$('#rv_h3').text(data.grade);
	            },
	            error : function(){
					alert('error');
				}
			})
			
		});
	</script>
</body>
</html>