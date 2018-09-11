<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<!-- 네이버 사용 스크립트(네이버,Jquery) -->
<script type="text/javascript"
	src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js"
	charset="utf-8"></script>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.11.3.min.js"></script>

</head>
<body>
	<script type="text/javascript">
		//client id와 callback 주소
		var naver_id_login = new naver_id_login("vLmPHRNNdF216wWVHew8",
				"");
		
	  	$.ajax({
			url:'/naver_login_profile',
			data:{'token':naver_id_login.oauthParams.access_token},
			type : "post",
            success:function(data){
            	alert(JSON.stringify(data));
            }
		})
	</script>
</body>
</html>