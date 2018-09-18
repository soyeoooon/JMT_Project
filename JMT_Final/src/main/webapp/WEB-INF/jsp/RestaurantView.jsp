<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">

<!-- <script type="text/javascript"
	src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=6T8ZIXE0kc7v8_jMHLiQ"></script> -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
<!-- 네이버지도 API -->
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=rDqRFTNAaK_2mefWZroL&submodules=geocoder"></script>
<title>Insert title here</title>
<style type="text/css">
#rv_div {
	text-align: center;
}

#rv_h1 {
	font-size: 20pt;
	font-weight: bold;
}

#rv_eva_div {
	margin: 10px auto;
}

#rv_eva_div div {
	display: inline-block;
	margin-left: 15px;
	margin-right: 15px;
	cursor: pointer;
}

/* 수정(v2) */
#slide_div {
	height: 320px;
	overflow: hidden;
}

#rv_tab_table {
	width: 80%;
	margin: 30px auto;
}

.tabs td {
	border: 1px solid;
	background: none;
	cursor: pointer;
	width: 33%;
	height: 60px;
	font-size: 16px;
}

.tabs td.current {
	background: #ff9480;
	font-weight: bold;
}

.tab-content {
	padding-top: 10px;
	display: none;
}

.tab-content.current {
	display: inherit;
}

#tab-1_btn {
	text-align: right;
}

#tab-1 table {
	text-align: left;
}

#tab-1 table img {
	text-align: left;
	margin: 15px;
}

.rev_div {
	margin-top: 30px;
}

.info {
	display: inline-block;
	margin-right: 30px;
}

.content {
	display: inline-block;
	vertical-align: top;
	width: 70%;
	text-align: left;
	word-wrap: break-word;
}

.tool {
	display: inline-block;
	vertical-align: top;
}

.grade {
	display: inline-block;
	vertical-align: top;
	font-size: 20pt;
}

.imgs {
	text-align: left;
	word-wrap: break-word;
}

.imgs img {
	margin-top: 5px;
}

.nick {
	margin-top: 5px;
}

.level {
	font-weight: bold;
	margin-top: 5px;
}

.info img {
	margin: 10px;
}

#u_img {
	margin: 30px;
}

#img_more_div {
	width: 90%;
}

.img_more_img img {
	margin-bottom: 5px;
	border: 5px solid white;
}

#reportlb {
	color: red;
	font-weight: bold;
}

.off {
	display: none;
}

.modal-header {
	background: #ff9f40;
	color: #330000;
}

/*편집버튼*/
.btn.btn-outline-info{
  border-color: #00A178 ;
  color:#00A178 ;
}

.btn.btn-outline-info:hover{
  background-color: #00A178 ;
  color:#fff;
}

/*신고버튼*/
.btn.btn-outline-danger{
  border-color: #ff9480;
  color:#ff9480;
}

.btn.btn-outline-danger:hover{
  background-color: #ff9480;
  color:#fff;
}

/*사진+ 버튼*/
.btn.btn-outline-primary{
  border-color: #00A178 ;
  color:#00A178 ;
}

.btn.btn-outline-primary:hover{
  background-color: #00A178 ;
  color:#fff;
}


</style>
</head>
<body>
  <!-- 슬라이드 -->
  <div id="slide_div">
    <jsp:include page="Slide.jsp"></jsp:include>
  </div>

  <div id="img_more_div" align="right">
    <button class="btn btn-outline-primary" data-toggle="modal" data-target="#imgModal" id="img_more_btn">사진+</button>
  </div>

  <!-- 음식점 정보 -->
  <div id="rv_div">
    <div id="rv_h_div">
      <span id="rv_h1">${info.restaurant.r_name }</span> <span id="rv_h3">${info.evaluation.grade }</span>
    </div>

    <!-- 평가 -->
    <div id="rv_eva_div">
      <div id="rv_like">
        <c:if test="${info.user.e_like }">
          <img src="img/eva/하트on.png" id="rv_like_img" class="on">
        </c:if>
        <c:if test="${!info.user.e_like }">
          <img src="img/eva/하트off.png" id="rv_like_img">
        </c:if>
        <span id="rv_like_text">${info.evaluation.like }</span>
      </div>

      <div id="rv_mark">
        <c:if test="${info.user.e_mark }">
          <img src="img/eva/마크on.png" id="rv_mark_img" class="on">
        </c:if>
        <c:if test="${!info.user.e_mark }">
          <img src="img/eva/마크off.png" id="rv_mark_img">
        </c:if>
        <span id="rv_mark_text">${info.evaluation.mark }</span>
      </div>

      <div id="rv_review">
        <img src="img/eva/리뷰.png" id="rv_review_img">리뷰쓰기
      </div>
    </div>

    <!-- 별점입력 -->
    <table width="100%">
      <tr>
        <td></td>
        <td width="210px"><jsp:include page="grade.jsp"></jsp:include>
        </td>
        <td></td>
      </tr>
    </table>

    <!-- 정보 탭 -->
    <div id="rv_tab">
      <table id="rv_tab_table">
        <tr class="tabs">
          <td class="tab-link current" data-tab="tab-1">상세정보</td>
          <td class="tab-link" data-tab="tab-2">위치</td>
          <td class="tab-link" data-tab="tab-3">리뷰</td>
        </tr>

        <tr>
          <td colspan="3">
            <div>
              <div id="tab-1" class="tab-content current">
                <div id="tab-1_btn">
                  <label id="reportlb" class="off">신고 처리중입니다.</label>
                  <button type="button" class="btn btn-outline-danger" data-toggle="modal" data-target="#reportModal" id="reportbtn">신고</button>
                  <button type="button" class="btn btn-outline-info" data-toggle="modal" data-target="#myModal" id="modifybtn">편집</button>
                </div>
                <table width="100%">
                  <tr>
                    <td>
                      <img src="img/restaurant/전화번호.png" data-toggle="tooltip" title="전화번호"> <span id="r_info_phone">${info.restaurant.r_phone}</span>
                    </td>
                  </tr>
                  <tr>
                    <td>
                      <img src="img/restaurant/위치.png" data-toggle="tooltip" title="위치"> <span id="r_info_address">${info.restaurant.r_address}</span>
                    </td>
                  </tr>
                  <tr>
                    <td>
                      <img src="img/restaurant/영업시간.png" data-toggle="tooltip" title="영업시간"> <span id="r_info_rundate">${info.restaurant.r_rundate}</span> <span id="r_info_runtime">${info.restaurant.r_runtime}</span>
                    </td>
                  </tr>
                  <tr>
                    <td>
                      <img src="img/restaurant/메뉴.png" data-toggle="tooltip" title="메뉴"> <span id="r_info_menu">${info.restaurant.r_menu}</span>
                    </td>
                  </tr>
                  <tr>
                    <td>
                      <img src="img/restaurant/소개.png" data-toggle="tooltip" title="소개"> <span id="r_info_intro">${info.restaurant.r_intro}</span>
                    </td>
                  </tr>
                  <tr>
                    <td>
                      <img src="img/restaurant/편의시설.png" data-toggle="tooltip" title="편의시설"> <span id="r_info_enjoy">${info.restaurant.r_enjoy}</span>
                    </td>
                  </tr>
                </table>
              </div>

              <div id="tab-2" class="tab-content">
                <div id="map" style="width: 100%; height: 500px;"></div>
              </div>

              <div id="tab-3" class="tab-content">
                <hr>
                <c:forEach var="review" items="${info.review}">
                  <div class="rev_div" id="rev${review.rev_num}">
                    <div class="info">
                      <div>
                        <img src=<c:if test="${review.m_photo==null}">"img/No_Image.jpg"</c:if> <c:if test="${review.m_photo!=null}">"${review.m_photo }"</c:if> width="150px" data-toggle="modal" data-target="#UserModal" id="${review.m_num}" class="u_img">
                      </div>
                      <div class="nick">${review.m_nick }</div>
                      <div class="level">${review.m_level }</div>
                    </div>
                    <div class="content">
                      <div>${review.rev_content }</div>
                      <div class="imgs">
                        <c:forEach var="img" items="${review.rev_path}">
                          <img src="${img}" width="100px">
                        </c:forEach>
                      </div>
                    </div>
                    <div class="tool">
                      <div class="grade">${review.rev_grade }</div>
                      <c:if test="${review.m_num==email.m_num}">
                        <div>
                          <button class="btn btn-success Review_Modify_Btn" value="${review.rev_num}">편집</button>
                        </div>
                        <div>
                          <button class="btn btn-danger Review_Delete_Btn" value="${review.rev_num}">삭제</button>
                        </div>
                      </c:if>
                    </div>
                  </div>
                  <hr>
                </c:forEach>
              </div>
            </div>
          </td>
        </tr>
      </table>
    </div>
  </div>

  <!-- 편집 모달 -->
  <div class="modal fade" id="myModal">
    <div class="modal-dialog">
      <div class="modal-content">
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">맛집 정보 수정</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>

        <!-- Modal body -->
        <form name="modify_info">
          <input type="hidden" name="r_num" value="${info.restaurant.r_num}"> <input type="hidden" name="m_num" value="${email.m_num}">

          <div class="modal-body">
            <table width="100%" class="info">
              <tr>
                <td height="20px">
                  <img src="img/restaurant/전화번호.png" data-toggle="tooltip" title="전화번호">
                </td>
                <td width="100%">
                  <input type="text" class="form-control" name="rm_phone" id="modify_phone">
                </td>
              </tr>
              <tr>
                <td height="20px">
                  <img src="img/restaurant/영업시간.png" data-toggle="tooltip" title="영업시간">
                </td>
                <td width="100%">
                  <input type="text" class="form-control" name="rm_rundate" id="modify_rundate"> <input type="text" class="form-control" name="rm_runtime" id="modify_runtime">
                </td>
              </tr>
              <tr>
                <td height="20px">
                  <img src="img/restaurant/메뉴.png" data-toggle="tooltip" title="메뉴">
                </td>
                <td width="100%">
                  <input type="text" class="form-control" name="rm_menu" id="modify_menu">
                </td>
              </tr>
              <tr>
                <td height="20px">
                  <img src="img/restaurant/소개.png" data-toggle="tooltip" title="소개">
                </td>
                <td width="100%">
                  <input type="text" class="form-control" name="rm_intro" id="modify_intro">
                </td>
              </tr>
              <tr>
                <td height="20px">
                  <img src="img/restaurant/편의시설.png" data-toggle="tooltip" title="편의시설">
                </td>
                <td width="100%">
                  <input type="text" class="form-control" name="rm_enjoy" id="modify_enjoy">
                </td>
              </tr>
            </table>
          </div>
        </form>

        <!-- Modal footer -->
        <div class="modal-footer">
          <button type="button" class="btn btn-success" data-dismiss="modal" id="modify_btn">Modify</button>
          <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
        </div>
      </div>
    </div>
  </div>

 <!-- 신고 모달 -->
   <div class="modal fade" id="reportModal">
      <div class="modal-dialog">
         <div class="modal-content">
            <!-- Modal Header -->
            <div class="modal-header">
               <h4 class="modal-title">편집자 신고</h4>
               <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>

            <!-- Modal body -->
            <form name="report_info">
               <input type="hidden" name="rm_num" id="report_rm_num">
               <input type="hidden" name="m_mail1" id="report_email" value="${email.email_num}">
                <input type="hidden" name="m_mail2" id="report_email2">

               <div class="modal-body">
                  <table width="100%" class="info">
                     <tr>
                        <td height="20px"><img src="img/restaurant/편의시설.png"
                           data-toggle="tooltip" title="편집자"></td>
                        <td width="100%"><input type="text" class="form-control"
                           id="report_nick" readonly></td>
                     </tr>

                     <tr>
                        <td height="20px"><img src="img/restaurant/편의시설.png"
                           data-toggle="tooltip" title="신고목록"></td>
                        <td width="100%"><select class="form-control"
                           name="replist_num">
                              <c:forEach var="list" items="${info.reportlist}">
                                 <option value="${list.replist_num}">${list.replist_content}</option>
                              </c:forEach>
                        </select></td>
                     </tr>


                  </table>
               </div>
            </form>

            <!-- Modal footer -->
            <div class="modal-footer">
               <button type="button" class="btn btn-success" data-dismiss="modal"
                  id="report_btn">Report</button>
               <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
            </div>
         </div>
      </div>
   </div>

  <!-- 유저 모달 -->
  <div class="modal fade" id="UserModal">
    <div class="modal-dialog">
      <div class="modal-content">
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">유저 정보</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>

        <!-- Modal body -->
        <form name="user_info">
          <input type="hidden" name="req_mail" value="${email.email_num}"> <input type="hidden" name="resp_mail" id="u_mail">

          <div class="modal-body">
            <table width="100%" class="info">
              <tr>
                <td rowspan="3">
                  <img src="img/No_Image.jpg" width="150px" id="u_img">
                </td>
                <td>
                  <label id="u_nick">Mr.Smith</label>
                </td>
                <td rowspan="2" width="100%" align="right" style="vertical-align: top;">
                  <button type="button" class="btn btn-success" data-dismiss="modal" id="u_btn">친구신청</button>
                </td>
              </tr>
              <tr>
                <td width="100%">
                  <label id="u_level"></label>
                </td>
              </tr>
              <tr>
                <td colspan="2">
                  <img src="img/eva/하트on.png" id="u_like_img" width="20px"><label id="u_like">95</label> <img src="img/eva/마크on.png" id="u_mark_img" width="20px"><label id="u_mark">35</label> <img src="img/eva/리뷰.png" id="u_review_img" width="20px"><label id="u_review">105</label>
                </td>
              </tr>
              <tr>
                <td colspan="3">
                  <textarea rows="6" cols="60"></textarea>
                </td>
              </tr>
            </table>
          </div>
        </form>

        <!-- Modal footer -->
        <div class="modal-footer"></div>
      </div>
    </div>
  </div>

  <!-- 이미지 모달 -->
  <div class="modal fade" id="imgModal">
    <div class="modal-dialog">
      <div class="modal-content">
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">이미지 모두보기</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>

        <!-- Modal body -->
        <form name="img_info">
          <div class="modal-body">
            <c:forEach var="img" items="${info.imgs_more}" varStatus="i">
              <span class="img_more_img"> <img src="${img}" width="32%">
              </span>

              <c:if test="${i.count%3==0 }">
                <br>
              </c:if>
            </c:forEach>
          </div>
        </form>

        <!-- Modal footer -->
        <div class="modal-footer"></div>
      </div>
    </div>
  </div>

  <!-- 수정(v2) -->
  <!-- 메세지 -->
  <div class="modal fade" id="MsgModal">
    <div class="modal-dialog">
      <div class="modal-content">
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">안내</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>

        <!-- Modal body -->
        <div class="modal-body">
          <h3>로그인 후 사용가능합니다.</h3>
        </div>

        <!-- Modal footer -->
        <div class="modal-footer"></div>
      </div>
    </div>
  </div>


  <script type="text/javascript">
		$(document).ready(function() {
			
			/*소연수정*/
			
			/*소연수정 끝*/
			
			//Boot 툴팁
		    $('[data-toggle="tooltip"]').tooltip();
			
		    if(${info.report>=3}){
	            $('#reportlb').removeClass('off');
	            $('#reportbtn').attr('data-toggle','');
	            $('#modifybtn').attr('data-toggle','');
	            $('#r_info_phone').html('신고처리중');
	            $('#r_info_address').html('신고처리중');
	              $('#r_info_rundate').html('신고');
	              $('#r_info_runtime').html('처리중');
	              $('#r_info_menu').html('신고처리중');
	              $('#r_info_intro').html('신고처리중');
	              $('#r_info_enjoy').html('신고처리중');
	         }
	         
	         //수정(v2)
	         if(${email.m_num==0}){
	            $('#reportbtn').attr('data-toggle','');
	            $('#modifybtn').attr('data-toggle','');
	            $('.u_img').attr('data-toggle','');
	            $('#MsgModal h3').text('로그인 후 사용가능합니다.');
	         }
			
			//탭 이동
			$('.tabs td').click(function() {
				var tab_id = $(this).attr('data-tab');

				$('.tabs td').removeClass('current');
				$('.tab-content').removeClass('current');

				$(this).addClass('current');
				$("#" + tab_id).addClass('current');
				
				if(tab_id=="tab-2"){
					var HOME_PATH = window.HOME_PATH || '.';
					/*var cityhall = new naver.maps.LatLng(${info.restaurant.r_lat}, ${info.restaurant.r_lon}),
					map = new naver.maps.Map('map', {
				        center: cityhall,
				        zoom: 10
					}),
				    marker = new naver.maps.Marker({
				        map: map,
				        position: cityhall
				    });*/
				    var map = new naver.maps.Map('map');
					naver.maps.Service.geocode({
						address : "${info.restaurant.r_address}"
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

						// 마커 표시
						var marker = new naver.maps.Marker({
							position : myaddr,
							map : map
						});
						
					
					});
				}
			})
			
			//상태값
			var val='';
			//이미지경로
			var path='';

			//수정(v2)시작
			//좋아요 버튼
			$('#rv_like').click(function(){
				if(${email.m_num==0}){
					$('#MsgModal').modal();
					return;
				}
				var img=document.getElementById('rv_like_img');
				var like_class = $('#rv_like_img').attr('class');
				
				if(like_class=="on"){
					val=0;
					path="img/eva/하트off.png";
					$('#rv_like_img').removeClass('on');
				}else{
					val=1;
					path="img/eva/하트on.png";
					$('#rv_like_img').addClass('on');
				}
				
				$.ajax({
					url:'/like',
					data:{'r_num': ${info.restaurant.r_num}, 'm_num': ${email.m_num}, 'e_like':val},
					type : "post",
		            success:function(data){
		            	img.src=path;
		            	$('#rv_like_text').text(data.like);
		            },
		            error : function(){
						alert('error');
					}
				})
			})
			
			//즐겨찾기 버튼
			$('#rv_mark').click(function(){
				if(${email.m_num==0}){
					$('#MsgModal').modal();
					return;
				}
				var img=document.getElementById('rv_mark_img');
				var mark_class = $('#rv_mark_img').attr('class');
				
				if(mark_class=="on"){
					val=0;
					path="img/eva/마크off.png";
					$('#rv_mark_img').removeClass('on');
				}else{
					val=1;
					path="img/eva/마크on.png";
					$('#rv_mark_img').addClass('on');
				}
				
				$.ajax({
					url:'/mark',
					data:{'r_num': ${info.restaurant.r_num}, 'm_num': ${email.m_num}, 'e_mark':val},
					type : "post",
		            success:function(data){
		            	img.src=path;
		            	$('#rv_mark_text').text(data.mark);
		            },
		            error : function(){
						alert('error');
					}
				})
			})
			
			//평점 기본정보
			$(function(){
				$('#'+${info.user.e_grade}*2).addClass('on').prevAll('span').addClass('on');
			});
			
			//평점 버튼
			$('.starRev span').click(function() {
				if(${email.m_num==0}){
					$('#MsgModal').modal();
					return;
				}
				var grade_val=0;
				$(this).parent().children('span').removeClass('on');
				$(this).addClass('on').prevAll('span').addClass('on');
				grade_val = $('.starRev .on').length * 0.5;
				
				$.ajax({
					url:'/grade',
					data:{'r_num': ${info.restaurant.r_num}, 'm_num': ${email.m_num}, 'e_grade':grade_val},
					type : "post",
		            success:function(data){
		            	$('#rv_h3').text(data.grade);
		            },
		            error : function(){
						alert('error');
					}
				})
			});
			
			//리뷰쓰기 버튼
			$('#rv_review').click(function(){
				if(${email.m_num==0}){
					$('#MsgModal').modal();
					return;
				}
				//리뷰 페이지 연결
				location.href='/review?r_num='+${info.restaurant.r_num};
			})
			
			//리뷰편집 버튼
			$('.Review_Modify_Btn').click(function(){
				//리뷰 페이지 연결
				location.href='/review?r_num='+${info.restaurant.r_num}+'&rev_num='+$(this).val();
			})
			
			//리뷰삭제 버튼
         $('.Review_Delete_Btn').click(function(){
            //리뷰 페이지 연결
            $.ajax({
               data : {r_num : '${info.restaurant.r_num}', rev_num : $(this).val()},
               url : '/review_delete',
               success : function(data){
                  $('#rev'+data).remove();
               }
            })
         })
			
			//편집모달 띄우기
			$('#modifybtn').click(function(){
				if(${email.m_num==0}){
					$('#MsgModal').modal();
					return;
				}
				$.ajax({
					url:'/r_view_modify_info',
					data:{'r_num':${info.restaurant.r_num}},
					type : "post",
		            success:function(data){
		            	$('#modify_phone').val(data.r_phone);
		            	$('#modify_rundate').val(data.r_rundate);
		            	$('#modify_runtime').val(data.r_runtime);
		            	$('#modify_menu').val(data.r_menu);
		            	$('#modify_intro').val(data.r_intro);
		            	$('#modify_enjoy').val(data.r_enjoy);
		            },
		            error : function(){
						alert('error');
					}
				})
			})
			
			//신고모달 띄우기
	
         $('#reportbtn').click(function(){
            if(${email.m_num==0}){
               $('#MsgModal').modal();
               return;
            }
            $.ajax({
               url:'/r_view_report_info',
               data:{'r_num':${info.restaurant.r_num}},
               type : "post",
                  success:function(data){
                     $('#report_email2').val(data.email_num);
                     $('#report_nick').val(data.m_nick);
                     $('#report_rm_num').val(data.rm_num);
                  },
                  error : function(){
                  alert('error');
               }
            })
         })
			
			//편집모달 편집버튼
			$('#modify_btn').click(function(){
				var restModify = $("form[name=modify_info]").serialize() ;
				
				$.ajax({
					url:'/r_view_modify',
					data:restModify,
					type : "post",
		            success:function(data){
		            	$('#r_info_phone').text(data.r_phone);
		            	$('#r_info_rundate').text(data.r_rundate);
		            	$('#r_info_runtime').text(data.r_runtime);
		            	$('#r_info_menu').text(data.r_menu);
		            	$('#r_info_intro').text(data.r_intro);
		            	$('#r_info_enjoy').text(data.r_enjoy);
		            },
		            error : function(){
						alert('error');
					}
				})
			})
			
			          //신고모달 신고버튼
         $('#report_btn').click(function(){
               var report = $("form[name=report_info]").serialize() ;
               
               $.ajax({
                  url:'/r_view_report',
                  data:report,
                  type : "post",
                     success:function(data){
                       if(data>=3){
                         $('#reportlb').removeClass('off');
                         $('#reportbtn').attr('data-toggle','');
                         $('#modifybtn').attr('data-toggle','');
                         $('#r_info_phone').html('신고처리중');
                         $('#r_info_address').html('신고처리중');
                           $('#r_info_rundate').html('신고');
                           $('#r_info_runtime').html('처리중');
                           $('#r_info_menu').html('신고처리중');
                           $('#r_info_intro').html('신고처리중');
                           $('#r_info_enjoy').html('신고처리중');
                      }else if(data==-1){
                         $('#MsgModal h3').text('중복신고는 불가능합니다.');
                         $('#MsgModal').modal();
                      }
                     },
                     error : function(){
                       }
                  })
             })
			
			//유저모달 띄우기
			$('#tab-3 .u_img').click(function(){
				if(${email.m_num==0}){
					$('#MsgModal').modal();
					return;
				}
				$.ajax({
					url:'/r_view_user_info',
					data:{'m_num':$(this).attr('id'), 'email':${email.email_num}},
		            success:function(data){
		            	$('#u_img').attr('src',data.m_photo);
		            	$('#u_mail').val(data.email_num);
		            	$('#u_nick').text(data.m_nick);
		            	$('#u_level').text(data.m_level);
		            	
		            	$('#u_like').text(data.like);
		            	$('#u_mark').text(data.mark);
		            	$('#u_review').text(data.review);
		            	
	            		$('#u_btn').text(data.status);
		            },
		            error : function(){
						alert('error');
					}
				})
			})
			//수정(v2)끝
			
			//유저모달 친추버튼
			$('#u_btn').click(function(){
				var btn=$('#u_btn').text();
				var url='';
				var data = '';
				
				if(btn=='친구'){
					url='';
					data='';
				}else if(btn=='친구신청'){
					url='/r_view_friendSend';
					data=$("form[name=user_info]").serialize();
				}else if(btn=='대기'){
					url='';
					data='';
				}else if(btn=='수락'){
					url='/r_view_friendAccept';
					data=$("form[name=user_info]").serialize();
				}else if(btn=='본인'){
					url='';
					data='';
				}
				
				$.ajax({
					url:url,
					data:data,
					type : "post"
				})
			})
			
		})
	</script>
</body>
</html>