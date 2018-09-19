<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- plugins:css -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/vendors/iconfonts/mdi/css/materialdesignicons.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/vendors/css/vendor.bundle.base.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/vendors/css/vendor.bundle.addons.css">
<!-- endinject -->
<!-- plugin css for this page -->
<!-- End plugin css for this page -->
<!-- inject:css -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
<!-- endinject -->
<link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/images/favicon.png" />
</head>
<body>
  <nav class="sidebar sidebar-offcanvas" id="sidebar">

    <ul class="nav">
      <li class="nav-item dropdown"><a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <img class="img-xs rounded-circle" src="${pageContext.request.contextPath}/resources/front_image/user.png" width="50" alt="Profile image">

      </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          
          <a class="dropdown-item" id="logout" href="/logout">로그아웃</a>
        </div></li>

      <li class="nav-item"><a class="nav-link" href="/adminIndex"> <i class="menu-icon mdi mdi-television"></i> <span class="menu-title">Dashboard</span>
      </a></li>
      <li class="nav-item"><a class="nav-link" href="/reportList"> <i class="menu-icon mdi mdi-alarm-light"></i> <span class="menu-title">신고 현황</span>
      </a></li>
      <!-- <li class="nav-item"><a class="nav-link" href="/chart"> <i class="menu-icon mdi mdi-chart-line"></i> <span class="menu-title">그래프</span>
      </a></li> -->
      <li class="nav-item"><a class="nav-link" href="/restaurantList"> <i class="menu-icon mdi mdi-table"></i> <span class="menu-title">음식점 리스트</span>
      </a></li>
      <li class="nav-item"><a class="nav-link" href="#"> <i class="menu-icon mdi mdi-table"></i> <span class="menu-title">회원현황</span>
      </a></li>
    </ul>
  </nav>

</body>
</html>