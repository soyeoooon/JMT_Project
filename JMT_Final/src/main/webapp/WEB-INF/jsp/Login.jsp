<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<!-- ���̹� ��� ��ũ��Ʈ(���̹�,Jquery) -->
<script type="text/javascript"
	src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js"
	charset="utf-8"></script>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<!-- kakao ��� ��ũ��Ʈ -->
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>

<meta name="google-signin-scope" content="profile email">
<meta name="google-signin-client_id"
	content="153041349247-tnlo9sap0gqfbsrugjn3tvhmvjupd6cn.apps.googleusercontent.com">
<script src="https://apis.google.com/js/platform.js" async defer></script>

</head>
<body>
	<!-- ���̹� �α���(����) : ��ũ��Ʈ�� ���Ǵ� Div -->
	<div id="naver_id_login" style="display: none;"></div>
	<!-- ���̹� �α���(����) : ����� ���� �����ִ� Img-->
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

	<!-- ���̹� �α��� -->
	<script type="text/javascript">
		//client id�� callback �ּ�
		var naver_id_login = new naver_id_login("vLmPHRNNdF216wWVHew8",
				"http://192.168.0.11:8080/Naver_Login");
		//����Ʈ �� ��û ���� ������ �����ϱ� ���� ���ø����̼ǿ��� ������ ���� ��ū���� URL ���ڵ��� ������ ��
		var state = naver_id_login.getUniqState();
		naver_id_login.setState(state);

		//���̹� �⺻���� ��ư����(����� �������)
		naver_id_login.setButton("green", 3, 38);
		// ������ū �񱳸� ���� domain ����
		naver_id_login.setDomain("");

		//�˾� ���·� �α��� â ���
		naver_id_login.setPopup();

		//�α��� ����
		naver_id_login.init_naver_id_login();
	</script>

	<script type='text/javascript'>
		// ����� ���� JavaScript Ű�� ������ �ּ���.
		Kakao.init('65a793362e117400ccd8a9a8d6e1c784');
		function loginWithKakao() {
			// �α��� â�� ���ϴ�.
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