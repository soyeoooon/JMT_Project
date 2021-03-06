<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ include file="header.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">

<!-- 네이버지도 API -->
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=rDqRFTNAaK_2mefWZroL&submodules=geocoder"></script>

<!-- 네이버지도 API -->
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=rDqRFTNAaK_2mefWZroL&submodules=panorama"></script>

<title></title>
<style type="text/css">
@import url(https://fonts.googleapis.com/earlyaccess/nanumpenscript.css)
	;

#message {
	font-family: 'Nanum Pen Script', serif;
	padding: 200px;
	border: #ddd;
}

.row .map {
	position: fixed;
	right: 10px;
	margin-bottom: 200px;
}

.row {
	padding-left: 10px;
}
</style>
</head>
<body>


  <div class="container-fluid mt-5 pt-5">
    <!-- <img src="resources/front_image/settings.png"> -->
    <div id="message"></div>
    <div class="row">
      <div class="row col-md-6 mr-3" id="cardList">
        <div class="card-deck" id="card-deck"></div>
      </div>
      <div class="row col-md-6 map">
        <div id="map" style="width: 100%; height: 300px;"></div>
        <div id="pano" style="width: 100%; height: 300px;"></div>
      </div>
    </div>
  </div>

  <!-- 푸터 시작 -->
  <jsp:include page="footer.jsp"></jsp:include>
  <!-- 푸터 끝 -->

  <!-- Optional JavaScript -->
  <!-- jQuery first, then Popper.js, then Bootstrap JS -->
  <!--  <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script> -->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

  <script type="text/javascript">
			$(document).ready(function() {
				var markers = new Object();
				var infowindows = new Object();
				var list = [];
				var cnt = 0;
				//-------------------------------용화수정(v1)--------------------------
				var keyword = "${keyword}";
				var result = 0;
				console.log("keyword: " + keyword)
				//검색어를 입력하지 않았을 경우
				if (keyword == '' || keyword == null || keyword == ' ') {
					keyword = "0";
					/* $('#cardList').text('검색어를 입력해주세요'); */
					$('#message').show();
					$('#message').html('<h1>검색어를 입력해주세요.</h1><h5>(강남구 맛집, 홍대 맛집 등..)</h5>');
					$('.row .map').hide();

					$('#cardList').css('height', '850px');
				}
				//검색어를 입력한 경우
				else {
					var map = new naver.maps.Map('map'); // 네이버 API에서 맵을가져옴

					$.get('/getSearchList?keyword=' + keyword + '&page=', function(data) {
						result = data['searchList'].length;

						if (result == 0) {
							$('#message').show();
							$('#message').html('<h1>검색결과가 없습니다</h1>');
							$('.row .map').hide();

							$('#cardList').css('height', '850px');
						} else {

							$('#message').remove();
							//-------------------------------용화수정끝--------------------------
							var txt = '';

							for (var i = 0; i < data['searchList'].length; i++) {
								txt += '<div class="card">';
								if (data['searchList'][i].r_photo != null)
									txt += '<img class="card-img-top savedImg" id = "'+data['searchList'][i].r_num+'" src="'+data['searchList'][i].r_photo+'" alt="Card image cap" style="height: 200px;">';//<img src="/icons/star.png" style="width : 32px;">
								else {
									$.ajax({
										data : {
											search : data['searchList'][i].r_name,
										},
										url : 'searchImage',
										type : 'post',
										async : false,
										success : function(image) {
											txt += '<img class="card-img-top saveImg" id = "'+data['searchList'][i].r_num+'" src="'+image+'" alt="Card image cap" style="height: 200px;">';
										}

									})
								}

								txt += '<div class="card-body">';
								txt += '<h5 class="card-title"><a href="/RestaurantView?r_num=' + data['searchList'][i].r_num + '">' + data['searchList'][i].r_name + '</a><img class="setCenter" id="'+data['searchList'][i].r_address+'" src="/icons/pin.png"></h5>';
								txt += '<p class="card-text">' + data['searchList'][i].r_address + '</p>';
								txt += '<p class="card-text"><small class="text-muted">' + data['searchList'][i].r_category1 + '</small></p>';
								txt += '<p class="card-text"><small class="text-muted">' + data['searchList'][i].r_category2 + '</small></p>';
								txt += '</div>';
								txt += '</div>';
								if ((i + 1) % 2 == 0) {
									txt += '<div class="w-100 mb-3"></div>';
								}
								var r_address = data['searchList'][i].r_address;
								list[cnt] = r_address;
								cnt++;
								console.log('r_address:' + r_address);

								naver.maps.Service.geocode({
									address : r_address
								}, function(status, response) { // 해당 주소로 네이버 맵 API 서비스 실행
									if (status !== naver.maps.Service.Status.OK) { // 뭔지모름
										return alert(myaddress + '의 검색 결과가 없거나 기타 네트워크 에러');
									}
									var result = response.result;
									// 검색 결과 갯수: result.total
									// 첫번째 결과 결과 주소: result.items[0].address
									// 첫번째 검색 결과 좌표: result.items[0].point.y, result.items[0].point.x
									var myaddr = new naver.maps.Point(result.items[0].point.x, result.items[0].point.y); // 네이버 맵에 x,y좌표 따옴
									map.setCenter(myaddr); // 검색된 좌표로 지도 이동
									console.log(result.userquery);

									// 마커 표시
									var marker = new naver.maps.Marker({
										position : myaddr,
										map : map,
										icon : {
											url : '/icons/pin.png',
											size : new naver.maps.Size(30, 32),
											origin : new naver.maps.Point(0, 0),
											anchor : new naver.maps.Point(15, 16)
										}
									});
									markers[result.userquery] = marker;

									var key = 0;
									for (var j = 0; j < data['searchList'].length; j++) { // 인덱스값 빼는 이유가 모든애들 이름이 마지막 data 값으로 남아서
										if (response.result.userquery == data['searchList'][j].r_address) { // response.result.userquery가 결과의 주소이름들
											key = j;
										}
									}

									// 마크 클릭시 인포윈도우 오픈
									var infowindow = new naver.maps.InfoWindow({
										content : data['searchList'][key].r_name
									});
									infowindows[result.userquery] = infowindow;

									// 마커 클릭 이벤트 처리
									naver.maps.Event.addListener(marker, "click", function(e) {
										if (infowindow.getMap()) {
											infowindow.close();
										} else {
											infowindow.open(map, marker);
										}

										var x = marker.getPosition().x;
										var y = marker.getPosition().y;
										console.log(x, y)
										var panoramaOptions = {
											position : new naver.maps.LatLng(y, x),
											pov : {
												pan : -135,
												tilt : 29,
												fov : 100
											}
										};
										var pano = new naver.maps.Panorama("pano", {
											position : new naver.maps.LatLng(y, x)
										});
									});

								});
							}
						}

						$("#card-deck").append(txt);
						function saveImg(r_num, src) {
							$.ajax({
								data : {
									r_num : r_num,
									src : src
								},
								url : 'saveImg',
								type : 'post',
								success : function(data) {
									console.log(data)
									alert(data);
								}
							})
						}
						$('.saveImg').click(function() {
							console.log($(this).attr('id'), $(this).attr('src'))
							saveImg($(this).attr('id'), $(this).attr('src'));
						})

						function savedImg(r_num) {
							$.ajax({
								data : {
									r_num : r_num
								},
								url : 'deleteImg',
								type : 'post',
								success : function(data) {
									alert(data);
								}
							})
						}
						$('.savedImg').click(function() {
							savedImg($(this).attr('id'));
						})

						function moveMap(map, r_address) {
							naver.maps.Service.geocode({
								address : r_address
							}, function(status, response) { // 해당 주소로 네이버 맵 API 서비스 실행
								var result = response.result;
								var myaddr = new naver.maps.Point(result.items[0].point.x, result.items[0].point.y);
								map.setCenter(myaddr);
								for (var i = 0; i < list.length; i++) {
									if (list[i] == result.userquery) {
										markers[list[i]].setAnimation(naver.maps.Animation.BOUNCE);
										infowindows[list[i]].open(map, markers[list[i]]);
										var x = markers[list[i]].getPosition().x;
										var y = markers[list[i]].getPosition().y;
										console.log(x, y)
										var panoramaOptions = {
											position : new naver.maps.LatLng(y, x),
											pov : {
												pan : -135,
												tilt : 29,
												fov : 100
											}
										};
										var pano = new naver.maps.Panorama("pano", {
											position : new naver.maps.LatLng(y, x)
										});
									} else {
										markers[list[i]].setAnimation(null);
										infowindows[list[i]].close();
									}
								}

							})
						}
						$('.setCenter').click(function() {
							moveMap(map, $(this).attr('id'));
						})

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
						$('#card-deck').after(el);
						start = 1;
						previous = data['start'] - 1;
						next = data['end'] + 1;
						last = data['last'];

						//get 끝
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

						$.get('/getSearchList?keyword=' + keyword + '&page=' + num, function(data) {
							$('#card-deck').empty();
							$('#ulPage').remove();

							var txt = '';
							for (var i = 0; i < data['searchList'].length; i++) {
								txt += '<div class="card">';
								if (data['searchList'][i].r_photo != null)
									txt += '<img class="card-img-top savedImg" id = "'+data['searchList'][i].r_num+'" src="'+data['searchList'][i].r_photo+'" alt="Card image cap" style="height: 200px;">';//<img src="/icons/star.png" style="width : 32px;">
								else {
									$.ajax({
										data : {
											search : data['searchList'][i].r_name,
										},
										url : 'searchImage',
										type : 'post',
										async : false,
										success : function(image) {
											txt += '<img class="card-img-top saveImg" id = "'+data['searchList'][i].r_num+'" src="'+image+'" alt="Card image cap" style="height: 200px;">';
										}

									})
								}

								txt += '<div class="card-body">';
								txt += '<h5 class="card-title"><a href="/RestaurantView?r_num=' + data['searchList'][i].r_num + '">' + data['searchList'][i].r_name + '</a><img class="setCenter" id="'+data['searchList'][i].r_address+'" src="/icons/pin.png"></h5>';
								txt += '<p class="card-text">' + data['searchList'][i].r_address + '</p>';
								txt += '<p class="card-text"><small class="text-muted">' + data['searchList'][i].r_category1 + '</small></p>';
								txt += '<p class="card-text"><small class="text-muted">' + data['searchList'][i].r_category2 + '</small></p>';
								txt += '</div>';
								txt += '</div>';
								if ((i + 1) % 2 == 0) {
									txt += '<div class="w-100 mb-3"></div>';
								}
								var r_address = data['searchList'][i].r_address;
								list[cnt] = r_address;
								cnt++;
								console.log('r_address:' + r_address);

								naver.maps.Service.geocode({
									address : r_address
								}, function(status, response) { // 해당 주소로 네이버 맵 API 서비스 실행
									if (status !== naver.maps.Service.Status.OK) { // 뭔지모름
										return alert(myaddress + '의 검색 결과가 없거나 기타 네트워크 에러');
									}
									var result = response.result;
									// 검색 결과 갯수: result.total
									// 첫번째 결과 결과 주소: result.items[0].address
									// 첫번째 검색 결과 좌표: result.items[0].point.y, result.items[0].point.x
									var myaddr = new naver.maps.Point(result.items[0].point.x, result.items[0].point.y); // 네이버 맵에 x,y좌표 따옴
									map.setCenter(myaddr); // 검색된 좌표로 지도 이동
									console.log(result.userquery);

									// 마커 표시
									var marker = new naver.maps.Marker({
										position : myaddr,
										map : map,
										icon : {
											url : '/icons/pin.png',
											size : new naver.maps.Size(30, 32),
											origin : new naver.maps.Point(0, 0),
											anchor : new naver.maps.Point(15, 16)
										}
									});
									markers[result.userquery] = marker;
									var key = 0;
									for (var j = 0; j < data['searchList'].length; j++) { // 인덱스값 빼는 이유가 모든애들 이름이 마지막 data 값으로 남아서
										if (response.result.userquery == data['searchList'][j].r_address) { // response.result.userquery가 결과의 주소이름들
											key = j;
										}
									}

									// 마크 클릭시 인포윈도우 오픈
									var infowindow = new naver.maps.InfoWindow({
										content : data['searchList'][key].r_name
									});
									infowindows[result.userquery] = infowindow;

									// 마커 클릭 이벤트 처리
									naver.maps.Event.addListener(marker, "click", function(e) {
										if (infowindow.getMap()) {
											infowindow.close();
										} else {
											infowindow.open(map, marker);
										}
										var x = marker.getPosition().x;
										var y = marker.getPosition().y;
										console.log(x, y)
										var panoramaOptions = {
											position : new naver.maps.LatLng(y, x),
											pov : {
												pan : -135,
												tilt : 29,
												fov : 100
											}
										};
										var pano = new naver.maps.Panorama("pano", {
											position : new naver.maps.LatLng(y, x)
										});

									});

								});

							}
							$('#card-deck').append(txt);
							function saveImg(r_num, src) {
								$.ajax({
									data : {
										r_num : r_num,
										src : src
									},
									url : 'saveImg',
									type : 'post',
									success : function(data) {
										console.log(data)
										alert(data);
									}
								})
							}
							$('.saveImg').click(function() {
								console.log($(this).attr('id'), $(this).attr('src'))
								saveImg($(this).attr('id'), $(this).attr('src'));
							})

							function savedImg(r_num) {
								$.ajax({
									data : {
										r_num : r_num
									},
									url : 'deleteImg',
									type : 'post',
									success : function(data) {
										alert(data);
									}
								})
							}
							$('.savedImg').click(function() {
								savedImg($(this).attr('id'));
							})
							function moveMap(map, r_address) {
								naver.maps.Service.geocode({
									address : r_address
								}, function(status, response) { // 해당 주소로 네이버 맵 API 서비스 실행
									var result = response.result;
									var myaddr = new naver.maps.Point(result.items[0].point.x, result.items[0].point.y);
									map.setCenter(myaddr);
									for (var i = 0; i < list.length; i++) {
										if (list[i] == result.userquery) {
											markers[list[i]].setAnimation(naver.maps.Animation.BOUNCE);
											infowindows[list[i]].open(map, markers[list[i]]);
											var x = markers[list[i]].getPosition().x;
											var y = markers[list[i]].getPosition().y;
											console.log(x, y)
											var panoramaOptions = {
												position : new naver.maps.LatLng(y, x),
												pov : {
													pan : -135,
													tilt : 29,
													fov : 100
												}
											};
											var pano = new naver.maps.Panorama("pano", {
												position : new naver.maps.LatLng(y, x)
											});
										} else {
											markers[list[i]].setAnimation(null);
											infowindows[list[i]].close();
										}
									}

								})
							}
							$('.setCenter').click(function() {
								moveMap(map, $(this).attr('id'));
							})

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
							$('#card-deck').after(el);
							start = 1;
							previous = data['start'] - 1;
							next = data['end'] + 1;
							last = data['last'];
						})

					})

				}

			});
		</script>

</body>
</html>



























