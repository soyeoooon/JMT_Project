<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

<title></title>
<style type="text/css">
  .navbar.fixed-top{
    opacity: 0.8;
    
  
  }
</style>


</head>
<body>
  <nav class="navbar fixed-top navbar-expand-lg navbar-light bg-light">
    <a class="navbar-brand" href="/main"><img src="${pageContext.request.contextPath}/resources/front_image/logo.png"></a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <form class="form-inline my-2" action="/search">
        <input class="form-control mr-sm-2" name="keyword" type="search" placeholder="맛집 검색!" aria-label="Search">
        <button class="btn btn-warning my-2 my-sm-0" type="submit">
          <img src="${pageContext.request.contextPath}/resources/front_image/find.png"> 찾기!
        </button>
      </form>
      <p id="session"></p>
    </div>
    <ul class="navbar-nav">
      <li class="nav-item dropdown"><a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> 
      <img class="img-xs rounded-circle" src="resources/front_image/user.png" width="50" alt="Profile image">

      </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" id="myPage" href="/myPage">My Page</a>
          <a class="dropdown-item" id="selection" href="/selectForm">취향 선택</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" id="logout" href="/logout">로그아웃</a>
        </div></li>
    </ul>

  </nav>

  <!-- Optional JavaScript -->
  <!-- jQuery first, then Popper.js, then Bootstrap JS -->
  <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
  <script type="text/javascript">
			$(document).ready(function() {
				var session = "${sessionScope.email}";
				var member="${member}";
				if (session) {
					if(session=='admin123@naver.com'){
						$('#myPage').text('관리자 페이지')
						$('#myPage').attr('href','/adminIndex');
						$('#selection').hide();
					}
					$('#session').text(session);
					$('#logout').text('로그아웃');
					$('.img-xs').attr('src','${sessionScope.profile}');
					console.log("헤더프로필:" +'${sessionScope.profile}')
					
					
				} else if (!session) {
					$('#logout').text('로그인');
					$('#logout').attr('href', '/loginForm');
					$('#session').text('로그인을 해주세요');
					$('.img-xs').attr('src','resources/front_image/login.png');
					$('#myPage').hide();
					$('#selection').hide();
				}

			})
		</script>
</body>
</html>