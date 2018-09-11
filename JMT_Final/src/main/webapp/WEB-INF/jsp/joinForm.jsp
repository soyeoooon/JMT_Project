<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">

<title>Hello, world!</title>

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
	top: 50%;
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

input[type="submit"].login {
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

input[type="submit"].login:hover {
	background-color: #fff;
	border: 1px solid #55b1df;
	color: #55b1df;
	cursor: pointer;
}

input[type="submit"].login:focus {
	outline: none;
}
</style>
</head>
<body>
  <div id="formWrapper">

<div id="form">
<div class="logo">
<h1 class="text-center head">회원가입</h1>
</div>
      <form action="/join">
        <div class="form-item">
          <p class="formLabel">Email</p>
          <input type="email" name="email" id="email" class="form-style" autocomplete="off" />
        </div>
        <div class="form-item">
          <p class="formLabel">Name</p>
          <input type="text" name="name" id="name" class="form-style" autocomplete="off" />
        </div>
        <div class="form-item">
          <p class="formLabel">Password</p>
          <input type="password" name="pwd" id="password" class="form-style" />
          <!-- <div class="pw-view"><i class="fa fa-eye"></i></div> -->
        </div>
        <div class="form-item">
          <input type="submit" class="login pull-right" value="Sign up">
          <div class="clear-fix"></div>
        </div>
      </form>
    </div>
</div>

  
     
  <!-- Optional JavaScript -->
  <!-- jQuery first, then Popper.js, then Bootstrap JS -->
  <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
  
  <script type="text/javascript">
  $(document).ready(function(){
		var formInputs = $('input[type="email"],input[type="password"],input[type="text"]');
		formInputs.focus(function() {
	       $(this).parent().children('p.formLabel').addClass('formTop');
	       $('div#formWrapper').addClass('darken-bg');
	       $('div.logo').addClass('logo-active');
		});
		formInputs.focusout(function() {
			if ($.trim($(this).val()).length == 0){
			$(this).parent().children('p.formLabel').removeClass('formTop');
			}
			$('div#formWrapper').removeClass('darken-bg');
			$('div.logo').removeClass('logo-active');
		});
		$('p.formLabel').click(function(){
			 $(this).parent().children('.form-style').focus();
		});
	});
  </script>

</body>
</html>




