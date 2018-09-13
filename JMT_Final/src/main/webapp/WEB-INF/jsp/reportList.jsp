<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>신고현황</title>
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

		$.get('/getReportList', function(data) {
			$('tbody').empty();
			var txt = '';


			for (var i = 0; i < data['reportList'].length; i++) {
				var test = data['reportList'][i].rm_num;
				console.log(data['reportList'][i].r_name+", "+ test)
				
				txt += '<tr>';
				txt += '<td>' + data['reportList'][i].rep_num + '</td>';
				//txt += '<td><button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">Open modal</button>' + data['reportList'][i].r_name + '</td>';
				txt+='<td><a target="_blank" href="/RestaurantView?r_name='+data['restaurantList'][test-1].r_name+'&r_address='+data['restaurantList'][test-1].r_address+'">'+data['restaurantList'][test-1].r_name+'</a></td>';
				txt += '<td>' + data['reportList'][i].req + '</td>';
				txt += '<td>' + data['reportList'][i].resp + '</td>';
				txt += '<td>' + data['reportList'][i].replist_content + '</td>';
				txt += '<td>' + data['reportList'][i].represult_content + '</td>';
				txt += '<td>' + data['reportList'][i].rep_date1 + '</td>';
				txt += '<td>' + data['reportList'][i].rep_date2 + '</td>';
				txt += '<td>';
				if (data['reportList'][i].represult_content == '대기') {
					txt += '<button id="submit" onclick="location.href=' + "'"+'/reportSubmit?rep_num=' + data['reportList'][i].rep_num + '&rm_num=' + data['reportList'][i].rm_num + "'"+'">처리</button>';
					txt += '<button id="submit" onclick="location.href=' + "'"+'/reportCancel?rep_num=' + data['reportList'][i].rep_num + '&rm_num=' + data['reportList'][i].rm_num +  "'"+'">취소</button>';
				}
				txt += '</td>';
				txt += '</tr>';

				
				/* console.log(test);
				console.log(typeof(test)) */

				//가격, 편의시설, 영업일, 영업시간, 소개글, 대표메뉴, 
				$('#r_rundate').text('영업일 : ' + data['restaurantList'][test - 1].r_rundate);
				$('#r_runtime').text('영업시간 : ' + data['restaurantList'][test - 1].r_runtime);
				$('#r_price').text('가격대 : ' + data['restaurantList'][test - 1].r_price);
				$('#r_menu').text('대표메뉴 : ' + data['restaurantList'][test - 1].r_menu);
				$('#r_enjoy').text('편의시설 : ' + data['restaurantList'][test - 1].r_enjoy);
				$('#r_intro').text('소개글 : ' + data['restaurantList'][test - 1].r_intro);

			}

			$('#reportTable').append(txt);

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

			$.get('/getReportList?page=' + num, function(data) {
				$('tbody').empty();
				$('#ulPage').remove();

				var txt = '';
				for (var i = 0; i < data['reportList'].length; i++) {
					
					var test = data['reportList'][i].rm_num;
					console.log(data['reportList'][i].r_name+", "+ test)
					
					txt += '<tr>';
					txt += '<td>' + data['reportList'][i].rep_num + '</td>';
					//txt += '<td><button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">Open modal</button>' + data['reportList'][i].r_name + '</td>';
					
					txt+='<td><a href="/RestaurantView?r_name='+data['restaurantList'][test-1].r_name+'&r_address='+data['restaurantList'][test-1].r_address+'">'+data['restaurantList'][test-1].r_name+'</a></td>';
					txt += '<td>' + data['reportList'][i].req + '</td>';
					txt += '<td>' + data['reportList'][i].resp + '</td>';
					txt += '<td>' + data['reportList'][i].replist_content + '</td>';
					txt += '<td>' + data['reportList'][i].represult_content + '</td>';
					txt += '<td>' + data['reportList'][i].rep_date1 + '</td>';
					txt += '<td>' + data['reportList'][i].rep_date2 + '</td>';
					txt += '<td>';
					if (data['reportList'][i].represult_content == '대기') {
						txt += '<button id="submit" onclick=' + 'location.href="/reportSubmit?rep_num=' + data['reportList'][i].rep_num + '&rm_name=' + data['reportList'][i].r_name + '">처리</button>';
						txt += '<button id="submit" onclick=' + 'location.href="/reportCancel?rep_num=' + data['reportList'][i].rep_num + '&rm_name=' + data['reportList'][i].r_name + '">취소</button>';
					}
					txt += '</td>';
					txt += '</tr>';

					/* var test = data['reportList'][i].rm_num;
					console.log(data['reportList'][i].r_name+", "+ test) */
					//가격, 편의시설, 영업일, 영업시간, 소개글, 대표메뉴, 
					$('#r_rundate').text('영업일 : ' + data['restaurantList'][test].r_rundate);
					$('#r_runtime').text('영업시간 : ' + data['restaurantList'][test].r_runtime);
					$('#r_price').text('가격대 : ' + data['restaurantList'][test].r_price);
					$('#r_menu').text('대표메뉴 : ' + data['restaurantList'][test].r_menu);
					$('#r_enjoy').text('편의시설 : ' + data['restaurantList'][test].r_enjoy);
					$('#r_intro').text('소개글 : ' + data['restaurantList'][test].r_intro);

				}
				$('#reportTable').append(txt);

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

                  <div class="btn-group">
                    <button type="button" class="btn btn-info" id="btn1">분류</button>
                    <button type="button" class="btn btn-info dropdown-toggle dropdown-toggle-split" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                      <span class="sr-only">Toggle Dropdown</span>
                    </button>
                    <div class="dropdown-menu">
                      <a class="dropdown-item" href="#">Action</a> <a class="dropdown-item" href="#">Another action</a> <a class="dropdown-item" href="#">Something else here</a>
                      <div class="dropdown-divider"></div>
                      <a class="dropdown-item" href="#">Separated link</a>
                    </div>
                  </div>
                  <div class="table-responsive">
                    <table class="table table-hover">
                      <thead>
                        <tr>
                          <th>번호</th>
                          <th>게시물</th>
                          <th>신고자</th>
                          <th>피신고자</th>
                          <th>신고 내용</th>
                          <th>처리 상태</th>
                          <th>신고 날짜</th>
                          <th>처리 날짜</th>
                        </tr>
                      </thead>
                      <tbody id="reportTable">

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

                    <!-- The Modal -->
                    <div class="modal" id="myModal">
                      <div class="modal-dialog">
                        <div class="modal-content">

                          <!-- Modal Header -->
                          <div class="modal-header">
                            <h4 class="modal-title">상세정보 최근 기록</h4>
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                          </div>

                          <!-- Modal body -->
                          <div class="modal-body">
                            <p id="r_price">가격 :</p>
                            <p id="r_rundate">영업일:</p>
                            <p id="r_runtime">영업시간:</p>
                            <p id="r_intro">소개글:</p>
                            <p id="r_menu">대표메뉴:</p>
                            <p id="r_enjoy">편의시설:</p>



                          </div>

                          <!-- Modal footer -->
                          <div class="modal-footer">
                            <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                          </div>

                        </div>
                      </div>
                    </div>
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