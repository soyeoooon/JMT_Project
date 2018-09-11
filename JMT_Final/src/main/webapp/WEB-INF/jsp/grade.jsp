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
		<span class="starR1 on" id="1">��1_����</span>
		<span class="starR2" id="2">��1_������</span>
		<span class="starR1" id="3">��2_����</span>
		<span class="starR2" id="4">��2_������</span>
		<span class="starR1" id="5">��3_����</span>
		<span class="starR2" id="6">��3_������</span>
		<span class="starR1" id="7">��4_����</span>
		<span class="starR2" id="8">��4_������</span>
		<span class="starR1" id="9">��5_����</span>
		<span class="starR2" id="10">��5_������</span>
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
				//�ҿ� ���� param.r_num �� r_num����
				//�ؾߵɰ� login�� email.m_num���� ����
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