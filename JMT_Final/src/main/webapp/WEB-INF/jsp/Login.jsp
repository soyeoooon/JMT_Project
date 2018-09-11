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
<!-- kakao 사용 스크립트 -->
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>

<meta name="google-signin-scope" content="profile email">
<meta name="google-signin-client_id"
	content="153041349247-tnlo9sap0gqfbsrugjn3tvhmvjupd6cn.apps.googleusercontent.com">
<script src="https://apis.google.com/js/platform.js" async defer></script>

</head>
<body>
	<!-- 네이버 로그인(숨김) : 스크립트에 사용되는 Div -->
	<div id="naver_id_login" style="display: none;"></div>
	<!-- 네이버 로그인(보임) : 사용자 눈에 보여주는 Img-->
	<a href="#"
		onclick="document.getElementById('naver_id_login_anchor').click();">
		<img src="img/naver_login.PNG" width="38" />
	</a>

	<a id="custom-login-btn" href="javascript:loginWithKakao()"> <img
		src="img/kakao_login.png" width="38" />
	</a>

	<div class="g-signin2" data-onsuccess="onSignIn" data-theme="dark"></div>
	<script>
		function onSignIn(googleUser) {
			// Useful data for your client-side scripts:
			var profile = googleUser.getBasicProfile();
			console.log("ID: " + profile.getId()); // Don't send this directly to your server!
			console.log('Full Name: ' + profile.getName());
			console.log('Given Name: ' + profile.getGivenName());
			console.log('Family Name: ' + profile.getFamilyName());
			console.log("Image URL: " + profile.getImageUrl());
			console.log("Email: " + profile.getEmail());

			// The ID token you need to pass to your backend:
			var id_token = googleUser.getAuthResponse().id_token;
			console.log("ID Token: " + id_token);
		};
	</script>

	<!-- 네이버 로그인 -->
	<script type="text/javascript">
		//client id와 callback 주소
		var naver_id_login = new naver_id_login("vLmPHRNNdF216wWVHew8",
				"http://192.168.0.11:8080/Naver_Login");
		//사이트 간 요청 위조 공격을 방지하기 위해 애플리케이션에서 생성한 상태 토큰으로 URL 인코딩을 적용한 값
		var state = naver_id_login.getUniqState();
		naver_id_login.setState(state);

		//네이버 기본제공 버튼설정(현재는 숨김상태)
		naver_id_login.setButton("green", 3, 38);
		// 상태토큰 비교를 위한 domain 설정
		naver_id_login.setDomain("");

		//팝업 형태로 로그인 창 띄움
		naver_id_login.setPopup();

		//로그인 시작
		naver_id_login.init_naver_id_login();
	</script>

	<script type='text/javascript'>
		// 사용할 앱의 JavaScript 키를 설정해 주세요.
		Kakao.init('65a793362e117400ccd8a9a8d6e1c784');
		function loginWithKakao() {
			// 로그인 창을 띄웁니다.
			Kakao.Auth.login({
				success : function(authObj) {
					Kakao.API.request({
						url : '/v2/user/me',
						success : function(res) {
							alert(JSON.stringify(res));
						}
					})
				},
				fail : function(err) {
					alert(JSON.stringify(err));
				}
			});
		};
	</script>

</body>
</html>