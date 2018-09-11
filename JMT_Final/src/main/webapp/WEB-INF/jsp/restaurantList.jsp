<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>음식점 등록현황</title>
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
	$(document).ready(function() {
		var start; //맨 첫페이지 '처음'
		var previous; //바로 이전 페이지 '이전'
		var next; //바로 다음 페이지 '다음'
		var last; //맨 마지막페이지 '마지막'
		
		var key = "${keyword}";
		if(key==null){
			
		
		$.get('/getRestaurantList', function(data) {
			
			$('tbody').empty();
			var txt = '';

			/* for ( var item in data.reportList) {
			  console.log(data.reportList[item]);
			  console.log(data.reportList['rep_num'])
			} */
			/*  $.each(data['reportList'],function(i,v){
			    //txt += '<tr>';
			    txt += '<td>' + v['rep_num'] + '</td>';
			    //txt += '</tr>';
			  }) */

			for (var i = 0; i < data['restaurantList'].length; i++) {

				txt += '<tr>';
				txt += '<td>' + data['restaurantList'][i].r_num + '</td>';
				txt += '<td>' + data['restaurantList'][i].r_name + '</td>';
				txt += '<td>' + data['restaurantList'][i].r_phone + '</td>';
				txt += '<td>' + data['restaurantList'][i].r_address + '</td>';
				txt += '<td>' + data['restaurantList'][i].r_category1 + '</td>';
				txt += '<td>' + data['restaurantList'][i].r_category2 + '</td>';
				txt += '<td>' + data['restaurantList'][i].r_price + '</td>';
				txt += '<td>' + data['restaurantList'][i].r_rundate + '</td>';
				txt += '<td>' + data['restaurantList'][i].r_runtime + '</td>';
				txt += '<td>' + data['restaurantList'][i].r_menu + '</td>';
				txt += '<td>' + data['restaurantList'][i].r_enjoy + '</td>';
				txt += '<td>' + data['restaurantList'][i].r_intro + '</td>';

				txt += '</tr>';

			}

			$('#restaurantTable').append(txt);

			var el = '';
			el += '<ul class="pagination pagination-sm" id="ulPage">';
			if (data['start'] != 1) {
				el += '<li class="page-item"><a class="page-link">처음</a><li>';
				el += '<li class="page-item"><a class="page-link">이전</a></li>';

			}
			var test = data['end'] < data['last'] ? data['end'] : data['last'];

			for (var i = data['start']; i <= test; i++) {
				if (data['page'] != i) {
					el += '<li class="page-item"><a class="page-link">' + i + '</a></li>';
				} else {
					el += '<li class="page-item active"><a class="page-link">' + i + '</a></li>';
				}
			}

			if (data['end'] < data['last']) {
				el += '<li class="page-item"><a class="page-link">다음</a></li>';
				el += '<li class="page-item"><a class="page-link">마지막</a></li>';
			}
			el += '<ul>';
			$('.card-body').after(el);
			start = 1;
			previous = data['start'] - 1;
			next = data['end'] + 1;
			last = data['last'];
		})

		$(document).on('click', '.page-link', function() {

			var num = $(this).text();

			if ($(this).text() == '처음') {
				num = start;
			} else if ($(this).text() == '이전') {
				num = previous;
			} else if ($(this).text() == '다음') {
				num = next;
			} else if ($(this).text() == '마지막') {
				num = last;
			}

			$.get('/getRestaurantList?page=' + num, function(data) {
				$('tbody').empty();
				$('#ulPage').remove();

				var txt = '';
				for (var i = 0; i < data['restaurantList'].length; i++) {
					txt += '<tr>';
					txt += '<td>' + data['restaurantList'][i].r_num + '</td>';
					txt += '<td>' + data['restaurantList'][i].r_name + '</td>';
					txt += '<td>' + data['restaurantList'][i].r_phone + '</td>';
					txt += '<td>' + data['restaurantList'][i].r_address + '</td>';
					txt += '<td>' + data['restaurantList'][i].r_category1 + '</td>';
					txt += '<td>' + data['restaurantList'][i].r_category2 + '</td>';
					txt += '<td>' + data['restaurantList'][i].r_price + '</td>';
					txt += '<td>' + data['restaurantList'][i].r_rundate + '</td>';
					txt += '<td>' + data['restaurantList'][i].r_runtime + '</td>';
					txt += '<td>' + data['restaurantList'][i].r_menu + '</td>';
					txt += '<td>' + data['restaurantList'][i].r_enjoy + '</td>';
					txt += '<td>' + data['restaurantList'][i].r_intro + '</td>';

					txt += '</tr>';

				}
				$('#restaurantTable').append(txt);

				var el = '';
				el += '<ul class="pagination pagination-sm" id="ulPage">';
				if (data['start'] != 1) {
					el += '<li class="page-item"><a class="page-link">처음</a><li>';
					el += '<li class="page-item"><a class="page-link">이전</a></li>';

				}
				var test = data['end'] < data['last'] ? data['end'] : data['last'];

				for (var i = data['start']; i <= test; i++) {
					if (data['page'] != i) {
						el += '<li class="page-item"><a class="page-link">' + i + '</a></li>';
					} else {
						el += '<li class="page-item active"><a class="page-link">' + i + '</a></li>';
					}
				}

				if (data['end'] < data['last']) {
					el += '<li class="page-item"><a class="page-link" >다음</a></li>';
					el += '<li class="page-item"><a class="page-link" >마지막</a></li>';
				}
				el += '<ul>';
				$('.card-body').after(el);
				start = 1;
				previous = data['start'] - 1;
				next = data['end'] + 1;
				last = data['last'];
			})

		})
		
	}
		//검색시 
		else{
			$.get('/getRestaurantList?keyword='+key, function(data) {
				
				$('tbody').empty();
				var txt = '';

				/* for ( var item in data.reportList) {
				  console.log(data.reportList[item]);
				  console.log(data.reportList['rep_num'])
				} */
				/*  $.each(data['reportList'],function(i,v){
				    //txt += '<tr>';
				    txt += '<td>' + v['rep_num'] + '</td>';
				    //txt += '</tr>';
				  }) */

				for (var i = 0; i < data['restaurantList'].length; i++) {

					txt += '<tr>';
					txt += '<td>' + data['restaurantList'][i].r_num + '</td>';
					txt += '<td>' + data['restaurantList'][i].r_name + '</td>';
					txt += '<td>' + data['restaurantList'][i].r_phone + '</td>';
					txt += '<td>' + data['restaurantList'][i].r_address + '</td>';
					txt += '<td>' + data['restaurantList'][i].r_category1 + '</td>';
					txt += '<td>' + data['restaurantList'][i].r_category2 + '</td>';
					txt += '<td>' + data['restaurantList'][i].r_price + '</td>';
					txt += '<td>' + data['restaurantList'][i].r_rundate + '</td>';
					txt += '<td>' + data['restaurantList'][i].r_runtime + '</td>';
					txt += '<td>' + data['restaurantList'][i].r_menu + '</td>';
					txt += '<td>' + data['restaurantList'][i].r_enjoy + '</td>';
					txt += '<td>' + data['restaurantList'][i].r_intro + '</td>';

					txt += '</tr>';

				}

				$('#restaurantTable').append(txt);

				var el = '';
				el += '<ul class="pagination pagination-sm" id="ulPage">';
				if (data['start'] != 1) {
					el += '<li class="page-item"><a class="page-link">처음</a><li>';
					el += '<li class="page-item"><a class="page-link">이전</a></li>';

				}
				var test = data['end'] < data['last'] ? data['end'] : data['last'];

				for (var i = data['start']; i <= test; i++) {
					if (data['page'] != i) {
						el += '<li class="page-item"><a class="page-link">' + i + '</a></li>';
					} else {
						el += '<li class="page-item active"><a class="page-link">' + i + '</a></li>';
					}
				}

				if (data['end'] < data['last']) {
					el += '<li class="page-item"><a class="page-link">다음</a></li>';
					el += '<li class="page-item"><a class="page-link">마지막</a></li>';
				}
				el += '<ul>';
				$('.card-body').after(el);
				start = 1;
				previous = data['start'] - 1;
				next = data['end'] + 1;
				last = data['last'];
			})

			$(document).on('click', '.page-link', function() {

				var num = $(this).text();

				if ($(this).text() == '처음') {
					num = start;
				} else if ($(this).text() == '이전') {
					num = previous;
				} else if ($(this).text() == '다음') {
					num = next;
				} else if ($(this).text() == '마지막') {
					num = last;
				}

				$.get('/getRestaurantList?page=' + num +'&keyword='+key, function(data) {
					$('tbody').empty();
					$('#ulPage').remove();

					var txt = '';
					for (var i = 0; i < data['restaurantList'].length; i++) {
						txt += '<tr>';
						txt += '<td>' + data['restaurantList'][i].r_num + '</td>';
						txt += '<td>' + data['restaurantList'][i].r_name + '</td>';
						txt += '<td>' + data['restaurantList'][i].r_phone + '</td>';
						txt += '<td>' + data['restaurantList'][i].r_address + '</td>';
						txt += '<td>' + data['restaurantList'][i].r_category1 + '</td>';
						txt += '<td>' + data['restaurantList'][i].r_category2 + '</td>';
						txt += '<td>' + data['restaurantList'][i].r_price + '</td>';
						txt += '<td>' + data['restaurantList'][i].r_rundate + '</td>';
						txt += '<td>' + data['restaurantList'][i].r_runtime + '</td>';
						txt += '<td>' + data['restaurantList'][i].r_menu + '</td>';
						txt += '<td>' + data['restaurantList'][i].r_enjoy + '</td>';
						txt += '<td>' + data['restaurantList'][i].r_intro + '</td>';

						txt += '</tr>';

					}
					$('#restaurantTable').append(txt);

					var el = '';
					el += '<ul class="pagination pagination-sm" id="ulPage">';
					if (data['start'] != 1) {
						el += '<li class="page-item"><a class="page-link">처음</a><li>';
						el += '<li class="page-item"><a class="page-link">이전</a></li>';

					}
					var test = data['end'] < data['last'] ? data['end'] : data['last'];

					for (var i = data['start']; i <= test; i++) {
						if (data['page'] != i) {
							el += '<li class="page-item"><a class="page-link">' + i + '</a></li>';
						} else {
							el += '<li class="page-item active"><a class="page-link">' + i + '</a></li>';
						}
					}

					if (data['end'] < data['last']) {
						el += '<li class="page-item"><a class="page-link" >다음</a></li>';
						el += '<li class="page-item"><a class="page-link" >마지막</a></li>';
					}
					el += '<ul>';
					$('.card-body').after(el);
					start = 1;
					previous = data['start'] - 1;
					next = data['end'] + 1;
					last = data['last'];
				})

			})
			
		}
		
		

	})
</script>
</head>

<body>
  <div class="container-scroller">
    <jsp:include page="adminNavbar.jsp"></jsp:include>
    <div class="container-fluid page-body-wrapper">
      <jsp:include page="adminSidebar.jsp"></jsp:include>
      <div class="main-panel">
        <div class="content-wrapper">

          <div class="row">
            <div class="col-lg-12 grid-margin stretch-card">
              <div class="card">
                <div class="card-body">
                <form class="form-inline my-2" action="/restaurantList">
                    <input class="form-control mr-sm-2" id="keyword" name="keyword" type="search" placeholder="맛집 검색!" aria-label="Search">
                    <button class="btn btn-warning my-2 my-sm-0" id="searchBtn">검색 
                    </button>
                </form>
              


                  <div class="table-responsive">
                    <table class="table table-hover">
                      <thead>
                        <tr>
                          <th>번호</th>
                          <th>음식점명</th>
                          <th>전화번호</th>
                          <th>주소</th>
                          <th>대분류</th>
                          <th>중분류</th>
                          <th>가격</th>
                          <th>영업일</th>
                          <th>영업시간</th>
                          <th>대표메뉴</th>
                          <th>편의시설</th>
                          <th>소개글</th>
                        </tr>
                      </thead>
                      <tbody id="restaurantTable">

                        <%-- <c:forEach var="r" items="${reportList }">
                          <tr>
                            <td>${r.rep_num}</td>
                            <td>${r.r_num}</td>
                            <td>${r.m_mail1}</td>
                            <td>${r.m_mail2}</td>
                            <td>${r.replist_num}</td>
                            <td>${r.replist_status}</td>
                            <td>${r.rep_date1}</td>
                            <td>${r.rep_date2}</td>
                          </tr>

                        </c:forEach> --%>
                      </tbody>
                    </table>
                    <%-- <ul class="pagination pagination-sm">
                      <c:if test="${start!=1 }">
                        <li class="page-item"><a class="page-link" href="/reportList?page=1"> 처음</a></li>
                        <li class="page-item"><a class="page-link" href="/reportList?page=${start-1 }">이전</a></li>
                      </c:if>
                      <c:forEach begin="${start }" end="${end<last? end:last }" var="i">
                        <c:choose>
                          <c:when test="${current!=i }">
                            <li class="page-item"><a class="page-link" href="/reportList?page=${i }">${i }</a></li>
                          </c:when>
                          <c:otherwise>
                            <li class="page-item active"><a class="page-link">${i }</a></li>
                          </c:otherwise>
                        </c:choose>
                      </c:forEach>
                      <c:if test="${end<last }">
                        <li class="page-item"><a class="page-link" href="/reportList?page=${end+1 }">다음</a></li>
                        <li class="page-item"><a class="page-link" href="/reportList?page=${last }">마지막</a></li>
                      </c:if>

                    </ul> --%>


                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>


    </div>
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
  <!-- End custom js for this page-->
</body>

</html>