<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    .footer{
    background-color: #f2f2f2;
    height: 200px;
    text-align="center";
    
    }
    .row.background{
      align: center;
    
    }
  </style>

</head>
<body>

  <div class="footer">
    <div class="container">
      <div class="row justify-content-md-center">
        <div class="mt-5">
          <img src="${pageContext.request.contextPath}/resources/front_image/footer_logo128.png" width=100px;>
        </div>
        <div class="ml-5 mt-5">
          <h4>나에게 맞는 진짜 맛집을 찾아보세요!</h4>
          <p class="lead"><small>맛있는 녀석들은 당신에게 맞는 진짜 맛집을 추천해드립니다.<small></br>
          나의 맛집 취향을 기록하고 추천받으세요!</p>

          <div class="row ">
            <div class="mx-auto">
              <a href="#">맛있는녀석들 소개 </a>
            </div>
            <div class="mx-auto">
              <a href="#">서비스 이용약관 </a>
            </div>
            <div class="mx-auto">
              <a href="#">개인정보 처리방침 </a>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="pl-5 mt-5">
            <h5>coming soon!</h5>
            <img src="${pageContext.request.contextPath}/resources/front_image/android.png" width="100"><br><br>
            <img src="${pageContext.request.contextPath}/resources/front_image/apple.jpg" width="100">
          </div>
        </div>
      </div>
    </div>
  </div>


  <!-- Optional JavaScript -->
  <!-- jQuery first, then Popper.js, then Bootstrap JS -->
  <!-- <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script> -->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</body>
</html>