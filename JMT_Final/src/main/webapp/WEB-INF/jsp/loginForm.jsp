<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 네이버 사용 스크립트(네이버,Jquery) -->
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<!-- kakao 사용 스크립트 -->
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>

<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<style type="text/css">
body {
   -webkit-background-size: cover;
   -moz-background-size: cover;
   -o-background-size: cover;
   background-size: cover;
   font-family: 'HelveticaNeue', 'Arial', sans-serif;
}

a {
   color: #58bff6;
   text-decoration: none;
}

a:hover {
   color: #aaa;
}

.pull-right {
   float: right;
}

.pull-left {
   float: left;
}

.clear-fix {
   clear: both;
}

div.logo {
   text-align: center;
   margin: 20px 20px 30px 20px;
   fill: #566375;
}

.head {
   padding: 40px 0px;
   10
   px
   0
}

.logo-active {
   fill: #44aacc !important;
}

#formWrapper {
   background: rgba(0, 0, 0, .2);
   width: 100%;
   height: 100%;
   position: absolute;
   top: 0;
   left: 0;
   transition: all .3s ease;
}

.darken-bg {
   background: rgba(0, 0, 0, .5) !important;
   transition: all .3s ease;
}

div#form {
   position: absolute;
   width: 360px;
   height: 320px;
   height: auto;
   background-color: #fff;
   margin: auto;
   border-radius: 5px;
   padding: 20px;
   left: 50%;
   top: 30%; 
   margin-left: -180px;
   margin-top: -200px;
}

div.form-item {
   position: relative;
   display: block;
   margin-bottom: 40px;
}

input {
   transition: all .2s ease;
}

input.form-style {
   color: #8a8a8a;
   display: block;
   width: 90%;
   height: 44px;
   padding: 5px 5%;
   border: 1px solid #ccc;
   -moz-border-radius: 27px;
   -webkit-border-radius: 27px;
   border-radius: 27px;
   -moz-background-clip: padding;
   -webkit-background-clip: padding-box;
   background-clip: padding-box;
   background-color: #fff;
   font-family: 'HelveticaNeue', 'Arial', sans-serif;
   font-size: 105%;
   letter-spacing: .8px;
}

div.form-item .form-style:focus {
   outline: none;
   border: 1px solid #58bff6;
   color: #58bff6;
}

div.form-item p.formLabel {
   position: absolute;
   left: 26px;
   top: 10px;
   transition: all .4s ease;
   color: #bbb;
}

.formTop {
   top: -22px !important;
   left: 26px;
   background-color: #fff;
   padding: 0 5px;
   font-size: 14px;
   color: #58bff6 !important;
}

.formStatus {
   color: #8a8a8a !important;
}

input[type="button"].login {
   float: right;
   width: 112px;
   height: 37px;
   -moz-border-radius: 19px;
   -webkit-border-radius: 19px;
   border-radius: 19px;
   -moz-background-clip: padding;
   -webkit-background-clip: padding-box;
   background-clip: padding-box;
   background-color: #55b1df;
   border: 1px solid #55b1df;
   border: none;
   color: #fff;
   font-weight: bold;
}

input[type="button"].login:hover {
   background-color: #fff;
   border: 1px solid #55b1df;
   color: #55b1df;
   cursor: pointer;
}

input[type="button"].login:focus {
   outline: none;
}
</style>
</head>
<body>
  <div id="formWrapper">
   <!-- 성록 수정 form action 없앰 -->
    <div id="form">
      <div class="logo">
        <h1 class="text-center head">로그인</h1>
      </div>
      <div class="form-item">
        <p class="formLabel">이메일</p>
        <input type="email" name="email" id="email" class="form-style" autocomplete="off" />
      </div>
      <div class="form-item">
        <p class="formLabel">비밀번호</p>
        <input type="password" name="pwd" id="password" class="form-style" />
        <!-- <div class="pw-view"><i class="fa fa-eye"></i></div> -->
        <!-- <p><a href="#" ><small>Forgot Password ?</small></a></p> -->
      </div>
        <input type="button" class="login pull-right" id="dologin" value="로그인">
      <div class="form-item" style="width: 50%;">
        <p class="pull-left">
          <a href="/joinForm"><small>이메일로 시작하기</small></a>
        </p>
        <div class="clear-fix"></div>
      </div>
        <!-- 네이버 로그인(숨김) : 스크립트에 사용되는 Div -->
        <div id="naver_id_login" style="display: none;"></div>
        <!-- 네이버 로그인(보임) : 사용자 눈에 보여주는 Img-->
        <a href="#" onclick="document.getElementById('naver_id_login_anchor').click();"> <img src="img/naver_login.PNG" width="38" />
        </a> <a id="custom-login-btn" href="javascript:loginWithKakao()"> <img src="img/kakao_login.png" width="38" />
        </a>
    </div>
  </div>
  <div class="container">
      <!-- 모달 팝업 -->
      <div class="modal fade" id="myModal">
         <div class="modal-dialog">
            <div class="modal-content">
              <!--  <div class="modal-header">
                  <button type="button" class="close" data-dismiss="modal">
                     <span aria-hidden="true">×</span><span class="sr-only"></span>
                  </button>
                  <h4 class="modal-title" id="myModalLabel"></h4>
               </div>  -->
               <div class="modal-body" id="myModalBody">
               
               </div>
               <div class="modal-footer">
                  <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
               </div>
            </div>
         </div>
      </div>
   </div>
  <script type="text/javascript">
         $(document).ready(function() {
            var formInputs = $('input[type="email"],input[type="password"]');
            formInputs.focus(function() {
               $(this).parent().children('p.formLabel').addClass('formTop');
               $('div#formWrapper').addClass('darken-bg');
               $('div.logo').addClass('logo-active');
            });
            formInputs.focusout(function() {
               if ($.trim($(this).val()).length == 0) {
                  $(this).parent().children('p.formLabel').removeClass('formTop');
               }
               $('div#formWrapper').removeClass('darken-bg');
               $('div.logo').removeClass('logo-active');
            });
            $('p.formLabel').click(function() {
               $(this).parent().children('.form-style').focus();
            });
         });
      </script>
  <!-- <form action="/login" >
  이메일 <input type="email" name="email"><br>
  비밀번호 <input type="password" name="pwd"><br>
  <input type="submit" value="로그인">
</form> -->




  <script>
     // 성록 추가
     $(function(){
        function dolog(){
           $.ajax({
              url : 'login',
              data : {
                 email : $('#email').val(),
                 password : $('#password').val()
              },
              type : 'post',
              success : function(data){
                 if(data=='loginForm'){
                    $('#myModalBody').html('아이디/비밀번호를 확인하여 주시기 바랍니다.');
                    $('#myModal').modal()
                 }else{
                    location.href=data;
                 }
              }
           })
        }
        $('#dologin').on('click',function(){
           dolog();
        })
        $('#password').keyup(function(e){
           if(e.keyCode==13){
              dolog();
           }
        })
        $('#email').keyup(function(e){
           if(e.keyCode==13){
              dolog();
           }
        })
     })
    // 끝
      </script>

  <!-- 네이버 로그인 -->
  <script type="text/javascript">
         //client id와 callback 주소
         var naver_id_login = new naver_id_login("vLmPHRNNdF216wWVHew8", "http://192.168.0.105:8080/Naver_Login");
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

<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
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
							$.ajax({
								url:'/kakao_login',
								type:'post',
								data:{"id":res.id,"nick":res.properties.nickname,"img":res.properties.profile_image},
								success:function(data){
									location.href="sns_login?email="+data;
								}
							})
						}
					})
				},
				fail : function(err) {
					alert(JSON.stringify(err));
				}
			});
		};
	</script>
	
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
   <script
      src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
</body>
</html>