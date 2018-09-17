<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<!-- ³×ÀÌ¹ö »ç¿ë ½ºÅ©¸³Æ®(³×ÀÌ¹ö,Jquery) -->
<script type="text/javascript"
	src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js"
	charset="utf-8"></script>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.11.3.min.js"></script>

</head>

<body>
	<script type="text/javascript">
		//client id¿Í callback ÁÖ¼Ò
		var naver_id_login = new naver_id_login("vLmPHRNNdF216wWVHew8","http://localhost:8080/Naver_Login");
		console.log(naver_id_login);
	  	$.ajax({
			url:'/naver_login_profile',
			data:{'token':naver_id_login.oauthParams.access_token},
			type : "post",
			success:function(data){
				opener.location.href="sns_login?email="+data;
				window.close();
			}
		})
		
	</script>
</body>
</html>