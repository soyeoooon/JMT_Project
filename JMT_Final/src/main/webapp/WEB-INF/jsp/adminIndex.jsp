<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>admin page</title>
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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		console.log('${restaurantCnt}')
		console.log('${reportCnt}')
		console.log('${memberCnt}')
		
		
		$('#restaurantCnt').text('${restaurantCnt}')
		$('#reportCnt').text('${reportCnt}');
		$('#memberCnt').text('${memberCnt}');
	})

</script>


</head>

<body>
  <div class="container-scroller">
    <!-- partial:partials/_navbar.html -->
    <jsp:include page="adminNavbar.jsp"></jsp:include>
    <!-- partial -->
    <div class="container-fluid page-body-wrapper">
      <!-- partial:partials/_sidebar.html -->
      <jsp:include page="adminSidebar.jsp"></jsp:include>
      <!-- partial -->
      <div class="main-panel">
        <div class="content-wrapper">
         
          <div class="row">
          
          
            <div class="col-xl-3 col-lg-3 col-md-3 col-sm-6 grid-margin stretch-card">
              <div class="card card-statistics">
                <div class="card-body">
                  <div class="clearfix">
                    <div class="float-left">
                      <i class="mdi mdi-cube text-danger icon-lg"></i>
                    </div>
                    <div class="float-right">
                      <p class="mb-0 text-right">신고 미처리 현황</p>
                      <div class="fluid-container">
                        <h3 class="font-weight-medium text-right mb-0" id="reportCnt"></h3>
                      </div>
                    </div>
                  </div>
                  <p class="text-muted mt-3 mb-0">
                    <i class="mdi mdi-alert-octagon mr-1" aria-hidden="true"></i> <a href="/reportList">자세히보기</a>
                  </p>
                </div>
              </div>
            </div>
            
            
            <div class="col-xl-3 col-lg-3 col-md-3 col-sm-6 grid-margin stretch-card">
              <div class="card card-statistics">
                <div class="card-body">
                  <div class="clearfix">
                    <div class="float-left">
                      <i class="mdi mdi-receipt text-warning icon-lg"></i>
                    </div>
                    <div class="float-right">
                      <p class="mb-0 text-right">등록된 음식점</p>
                      <div class="fluid-container">
                        <h3 class="font-weight-medium text-right mb-0" id="restaurantCnt"></h3>
                      </div>
                    </div>
                  </div>
                  <p class="text-muted mt-3 mb-0">
                    <i class="mdi mdi-bookmark-outline mr-1" aria-hidden="true"></i> <a href="/restaurantList">자세히보기</a>
                  </p>
                </div>
              </div>
            </div>
            
            
            
             <div class="col-xl-3 col-lg-3 col-md-3 col-sm-6 grid-margin stretch-card">
              <div class="card card-statistics">
                <div class="card-body">
                  <div class="clearfix">
                    <div class="float-left">
                      <i class="mdi mdi-account-location text-info icon-lg"></i>
                    </div>
                    <div class="float-right">
                      <p class="mb-0 text-right">회원 수</p>
                      <div class="fluid-container">
                        <h3 class="font-weight-medium text-right mb-0" id="memberCnt"></h3>
                      </div>
                    </div>
                  </div>
                  
                </div>
              </div>
            </div>
            
            <div class="col-xl-3 col-lg-3 col-md-3 col-sm-6 grid-margin stretch-card">
              <div class="card card-statistics">
                <div class="card-body">
                  <div class="clearfix">
                    <div class="float-left">
                      <i class="mdi mdi-poll-box text-success icon-lg"></i>
                    </div>
                    <div class="float-right">
                      <p class="mb-0 text-right">Coming Soon!</p>
                      <div class="fluid-container">
                        <h3 class="font-weight-medium text-right mb-0"></h3>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            
          </div>

            
            
            
          <!-- <div class="row">
            <div class="col-md-12 grid-margin">
              <div class="card">
                <div class="card-body">
                  <div class="row d-none d-sm-flex mb-4">
                    <div class="col-4">
                      <h5 class="text-primary">Unique Visitors</h5>
                      <p>34657</p>
                    </div>
                    <div class="col-4">
                      <h5 class="text-primary">Bounce Rate</h5>
                      <p>45673</p>
                    </div>
                    <div class="col-4">
                      <h5 class="text-primary">Active session</h5>
                      <p>45673</p>
                    </div>
                  </div>
                  <div class="chart-container">
                    <canvas id="dashboard-area-chart" height="80"></canvas>
                  </div>
                </div>
              </div>
            </div>
          </div> -->




        </div>
        <!-- content-wrapper ends -->
        <!-- partial:partials/_footer.html -->

        <!-- partial -->
      </div>
      <!-- main-panel ends -->
    </div>
    <!-- page-body-wrapper ends -->
  </div>
  <!-- container-scroller -->

  <!-- plugins:js -->
  <script src="${pageContext.request.contextPath}/resources/vendors/js/vendor.bundle.base.js"></script>
  <script src="${pageContext.request.contextPath}/resources/vendors/js/vendor.bundle.addons.js"></script>
  <!-- endinject -->
  <!-- Plugin js for this page-->
  <!-- End plugin js for this page-->
  <!-- inject:js -->
  <script src="${pageContext.request.contextPath}/resources/js/off-canvas.js"></script>
  <script src="${pageContext.request.contextPath}/resources/js/misc.js"></script>
  <!-- endinject -->
  <!-- Custom js for this page-->
  <script src="${pageContext.request.contextPath}/resources/js/dashboard.js"></script>
  <!-- End custom js for this page-->
</body>

</html>