<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<!--  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"> -->
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js" charset="utf-8"></script>
<script type="text/javascript" src="/editor/jquery-te-1.4.0.min.js" charset="utf-8"></script>


<script src="https://d3js.org/d3.v5.min.js"></script>
<script src="http://d3js.org/d3.v3.min.js" charset="utf-8"></script>
<script src="https://rawgit.com/jasondavies/d3-cloud/master/build/d3.layout.cloud.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/d3/4.5.0/d3.min.js"></script>
<link type="text/css" rel="stylesheet" href="/editor/jquery-te-1.4.0.css">
<script defer src="https://use.fontawesome.com/releases/v5.3.1/js/all.js" integrity="sha384-kW+oWsYx3YpxvjtZjFXqazFpA7UP/MbiY4jvs+RWZo2+N94PFZ36T6TFkc9O3qoB" crossorigin="anonymous"></script>
<style type="text/css">
@import url(https://fonts.googleapis.com/earlyaccess/nanumpenscript.css)
	;

#diary {
	font-size: 15px;
	font-family: 'Nanum Pen Script', serif;
	line-height: 1.5;
}

/* 별점주기 css */
.starR1 {
	background:
		url('http://miuu227.godohosting.com/images/icon/ico_review.png')
		no-repeat -52px 0;
	background-size: auto 100%;
	width: 15px;
	height: 30px;
	float: left;
	text-indent: -9999px;
	cursor: pointer;
}

.starR2 {
	background:
		url('http://miuu227.godohosting.com/images/icon/ico_review.png')
		no-repeat right 0;
	background-size: auto 100%;
	width: 15px;
	height: 30px;
	float: left;
	text-indent: -9999px;
	cursor: pointer;
}

.starR1.on {
	background-position: 0 0;
}

.starR2.on {
	background-position: -15px 0;
}

.jqte_editor {
	height: 500px;
	width: 100%;
	max-height: 500px;
}

#myModal3cont th {
	width: 100px;
}

#calendar .doclick {
	cursor: pointer;
}

#calendar {
	border: 1px solid #ddd;
	padding: 10px;
}

#diary {
	padding: 10px;
}

#myModal .modal-dialog {
	width: 300px;
	height: 100px;
	position: absolute;
}

#myModal3 .modal-dialog {
	width: 300px;
	height: 100px;
	position: absolute;
}

#myModal4Body th {
	width: 100px;
}

#myModal4Body input[type=text] {
	width: 400px;
}

#myModal th {
	width: 80px;
}

body {
	margin-top: 100px;
	/* font-family: 'Trebuchet MS', serif; */
	line-height: 1.6
}

.container {
	width: 1000px;
	margin: 0 auto;
}

ul.tabs {
	margin: 0px;
	padding: 0px;
	list-style: none;
}

ul.tabs li {
	/* background: none;
  color: #222; */
	display: inline-block;
	/* padding: 10px 15px; */
	/* cursor: pointer; */
	margin: 0 0 -1px;
	padding: 15px 25px;
	font-weight: 600;
	text-align: center;
	color: #bbb;
	border: 1px solid transparent;
	font-family: FontAwesome;
}

/*소연 추가*/
ul.tabs li:hover {
	color: #888;
	cursor: pointer;
}

img {
	cursor: pointer;
}

/*선택된 탭 꾸미기*/
ul.tabs li.current {
	color: #555;
	border: 1px solid #ddd;
	border-top: 2px solid orange;
	border-bottom: 1px solid #fff;
}

.tab-content {
	display: none;
	/* background: #ededed; */
	padding: 15px;
	border-top: 1px solid #ddd; /* 검은색 */
	height: 600px;
}

.tab-content.current {
	display: inherit;
}

#calendar td, th {
	text-align: center;
	width: 50px;
	height: 50px;
}

.pagingTable {
	text-align: center;
	width: 30px;
	height: 30px;
}

#anotherDiary td {
	width: 35px;
	height: 50px;
	text-align: center;
}

.width50 td {
	width: 50px;
	text-align: center;
}

#photos td {
	text-align: center;
}

#icons td {
	height: 80px;
	text-align: center;
}

#myModal3Image {
	width: 550px;
}

#chart1, #chart2 {
	height: 550px;
	width: 500px;
	margin: 5px;
  border: 1px solid #ddd;
}

#chart1, #chart2{
	padding: 50px;
    
}

#info, #infoImg {
	margin: 20px;
}

#info{
  width: 300px;
}

.btn.btn-outline-light{
color: #888;
}

#preYear, #preMonth, #nextYear, #nextMonth{
  background-color: #FFEFA3;
}

#fri_searchBtn, #searchResDiary{
  background-color: #2C656B;
  width: 75px;
  padding:0;
  font-size: 12px;
  color: #fff;
}
#div_res_search{
margin: 10px;
}

#res_searchBtn{
  margin-left: 10px;
  background-color: #2C656B;
  color: #fff;
}

</style>

</head>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=rDqRFTNAaK_2mefWZroL&submodules=geocoder"></script>
<body>

  <!-- <div>
    <input type="text" id="searchThing">
    <button id="searchThingBtn">서치</button>
  </div> -->
  <script type="text/javascript">
	$(function(){
		$('#searchThingBtn').on('click',function(){
			$.ajax({
				url : "searchRestaurant",
				type : "post",
				data : {
					res_search : $('#searchThing').val()
				},
				success : function(data){
					alert("ㅇㅋ");
				}
			})
		})
	})
</script>
  <br>
  <div class="container mt-5 pt-5">
    <div class="row justify-content-md-center">
      <div class="card text-center">
        <div class="card-header">나의 프로필</div>
        <div class="card-body">
          <table>
            <tr>
              <td rowspan="3">
                <img class="img-md rounded-circle" src="${memberList.m_photo }" style="width: 150px; height: 150px;">
              </td>
              <td colspan="5" align="center">
                <h4>${memberList.m_nick }</h4>
              </td>
              <td align="center">
                <img src="/icons/edit.png" id="updatePicAndInt" data-toggle="modal" data-target="#PicAndInt">
              </td>
            </tr>
            <tr>
              <td colspan="6" align="center">${memberList.m_intro }</td>
            </tr>
            <tr class="width50">
              <td>
                <img src="/icons/like.png">
              </td>
              <td>${countLike }</td>
              <td>
                <img src="/icons/marker.png">
              </td>
              <td>${countMark }</td>
              <td>
                <img src="/icons/write.png">
              </td>
              <td>${countDiary }(${countReview })</td>
            </tr>
          </table>
        </div>
      </div>
    </div>
  </div>
  <br>
  <br>
  <div class="container">

    <ul class="tabs">
      <li class="tab-link current" data-tab="tab-1" id="firstmenu"><i class="fas fa-chart-pie"></i> 내 정보</li>
      <li class="tab-link" data-tab="tab-2" id="secondmenu"><i class="fas fa-pen-square"></i> 다이어리</li>
      <li class="tab-link" data-tab="tab-3" id="thirdmenu"><i class="fas fa-map-marked-alt"></i> 즐겨찾기</li>
      <li class="tab-link" data-tab="tab-4" id="fourthmenu"><i class="fas fa-user-friends"></i> 나의 친구</li>
      <li class="tab-link" data-tab="tab-5" id="fifthmenu"><i class="far fa-id-card"></i> 정보수정</li>
    </ul>

    <div id="tab-1" class="tab-content current">
     
      <div class="row">
        <fieldset id="chart1">
        <legend> 나의 음식 카테고리</legend>
          <div class="graph" style="display: inline-block;"></div>
          <div id="graphlist" style="display: inline-block;"></div>
        </fieldset>
        
        <fieldset id="chart2">
        <legend>내가 기록한 음식들</legend>
          <div id="wordcloud" style="display: inline-block;"></div>
        </fieldset>
      </div>


    </div>


    <script type="text/javascript">
	$(function(){
		$.get('wordcloud',function(data){
	         var fill = d3.scale.category20();
	         var words = [];
	         var sizes = [];
	         for(var i =0;i<data.length;i++){
	            words.push(data[i].word);
	         }
	         console.log(words);
	         function returnCount(d){
	            for(var i=0;i<data.length;i++){
	               if(data[i].word==d){
	                  console.log(data[i].weight);
	                  return data[i].weight;
	               }
	            }
	         }
	         var layout = d3.layout.cloud().size([400, 400])
	             .words(words.map(function(d) {
	               return {text: d, size: returnCount(d)*10, test: "haha"};
	             }))
	             .padding(5)
	             .rotate(function() { return ~~(Math.random() * 2) * 90; })
	             .font("Impact")
	             .fontSize(function(d) { return d.size; })
	             .on("end", draw);
	          
	         layout.start();
	          
	         function draw(words) {
	           d3.select("#wordcloud").append("svg")
	               .attr("width", layout.size()[0])
	               .attr("height", layout.size()[1])
	             .append("g")
	               .attr("transform", "translate(" + layout.size()[0]/2 + "," + layout.size()[1] / 2 + ")")
	             .selectAll("text")
	               .data(words)
	             .enter().append("text")
	               .style("font-size", function(d) { return d.size + "px"; })
	               .style("font-family", "Impact")
	               .style("fill", function(d, i) { return fill(i); })
	               .attr("text-anchor", "middle")
	               .attr("transform", function(d) {
	                 return "translate(" + [d.x, d.y] + ")rotate(" + d.rotate + ")";
	               })
	               .text(function(d) { return d.text; });
	         }
	   })
		function myPageTab1(){
			$.get('myPageTab1',function(data){
				$('.graph').html('');
				var w = 300, h = 300;
				var graphData = [];
				for(var i =0;i<data.length;i++){
					graphData.push(data[i].count);
				}
				var colorData = ["#fe4365", "#fc9d9a", "#f9cdad", "#c8c8a9", "#f8ca00","#e97f02","#bd1550"];
				var pie = d3.pie();
				var arc = d3.arc().innerRadius(40).outerRadius(150); 
				var result = '<table>';
				
				for(var i = 0;i<data.length;i++){
					result += '<tr><td style="background-color : '+colorData[i]+'">&nbsp&nbsp&nbsp&nbsp&nbsp</td><td>&nbsp&nbsp&nbsp'+data[i].category+','+Math.round(data[i].grade/data[i].count*100)/100+'</td></tr>'
				}
				result += '</table>'
				$('#graphlist').html(result);
				
				var svg = d3.select(".graph")
				    .append("svg")
				    .attr("width", w)
				    .attr("height", h)
				    .attr("id", "graphWrap");
				 
				var g = svg.selectAll(".pie")
				    .data(pie(graphData))
				    .enter()
				    .append("g")
				    .attr("class", "pie")
				    .attr("transform","translate("+w/2+","+h/2+")");
				 
				g.append("path")
			    .style("fill", function(d, i) {
			        return colorData[i];
			    }) 
			    .transition()
			    .duration(500)
			    .delay(function(d, i) { 
			        return i * 500;
			    })
			    .attrTween("d", function(d, i) { 
			        var interpolate = d3.interpolate(
			            {startAngle : d.startAngle, endAngle : d.startAngle}, 
			            {startAngle : d.startAngle, endAngle : d.endAngle} 
			        );
			        return function(t){
			            return arc(interpolate(t)); 
			        }
			    });
				g.append("text")
			    .attr("transform", function(d) { return "translate(" + arc.centroid(d) + ")"; })
			    .attr("dy", ".35em")
			    .style("text-anchor", "middle")
			    .text(function(d, i) {
			        return graphData[i];
			    });
				svg.append("text")
				    .attr("class", "total")
				    .attr("transform", "translate("+(w/2-35)+", "+(h/2+5)+")")
				    .text("합계:" + d3.sum(graphData));
				
				
				})
		}
		$('#firstmenu').on('click',myPageTab1);
		myPageTab1();
	})
	</script>
    <div id="tab-2" class="tab-content">
      <table>
        <tr>
          <td style="text-align: center;">
            <button class="btn btn-outline-light" id="ListorCalendar">리스트로보기</button>
          </td>
          <td colspan="3" id="deleteD"></td>
          <td colspan="3" id="writeD"></td>
        </tr>
        <tr>
          <td rowspan="4" style="vertical-align: top;">
            <div id="calendar" style="width: 400px; height: 440px;">
              <!-- 달력테이블이 만들어지는 자리 -->

            </div>
          </td>
          <td colspan="6">
            <div id="diary" style="width: 350px; height: 200px; padding: 10px;">
              <!-- 다이어리 제목과 내용이 만들어지는 자리  -->
            </div>
          </td>
        </tr>
        <tr id="icons">
        </tr>
        <tr id="photos">
        </tr>
        <tr id="anotherDiary">

        </tr>
      </table>
      <!-- <table border="2" style="float: right;">
      </table> -->
    </div>


    <div id="tab-3" class="tab-content">
      <div class="card-deck">
        <div class="card">
          <div class="card-header">즐겨찾기 목록을 오른쪽 지도에서 확인하세요</div>
          <div id="tab3List" style="display: inline-block;"></div>
        </div>
        <div class="card">
          <div class="card-header">

            <!-- <div style="position: absolute;"> -->
            <div style="position: relative;">
              <img id="relateLike" src="/icons/like.png"> <img id="relateMark" src="/icons/star.png">
            </div>
            <!-- </div> -->
          </div>
          <div class="card-body">
            <div id="likestarmap" style="width: 400px; height: 300px; position: relative;"></div>
          </div>

        </div>


      </div>
    </div>






    <div id="tab-4" class="tab-content">
      친구찾기
      <button class="btn btn-outline-info">
        <img src="/icons/search.png" id="findFriendBtn" data-toggle="modal" data-target="#findFriend">
      </button>
      <div class="card-deck">
        <div class="card">
          <div class="card-header">나의 친구목록</div>
          <div class="card-body">
            <div id="myFriends" style="display: inline-block;"></div>
          </div>
        </div>

        <div class="card">
          <div class="card-header">친구 요청목록</div>
          <div class="card-body">
            <div id="forRespFriends" style="display: inline-block;"></div>
          </div>
        </div>
      </div>
    </div>



    <div id="tab-5" class="tab-content">
      <div class="row justify-content-md-center">

        <div style="display: inline-block;" id="infoImg">
          <table>
            <tr>
              <td style="text-align: center; vertical-align: top;">
                <img id="profilePhoto" src="" style="width: 250px;" />
              </td>
            </tr>
            <tr>
              <td style="text-align: center;">
                <button class="btn btn-outline-dark" id="changePP" data-toggle="modal" data-target="#myModal7">사진변경</button>
              </td>
            </tr>
          </table>
        </div>
        <div class="card text-center" id="info">
          <div class="card-body" style="display: inline-block;">
            <table align="center">
              <tr>
                <th>이메일</th>
              </tr>
              <tr>
                <td id="profileEmail"></td>
              </tr>
              <tr>
                <th>닉네임</th>
              </tr>
              <tr>
                <td>
                  <input type="text" id="profileNickName">
                </td>
              </tr>
              <tr>
                <th>새 비밀번호 입력</th>
              </tr>
              <tr>
                <td>
                  <input type="password" id="profileNewPwd1">
                </td>
              </tr>
              <tr>
                <th>새 비밀번호 확인</th>
              </tr>
              <tr>
                <td>
                  <input type="password" id="profileNewPwd2">
                </td>
              </tr>
              <tr>
                <td>
                  <button class="btn btn-outline-dark" style="width: 100px; height: 50px;" id="changeID">변경</button>
                </td>
              </tr>
            </table>
            <div id="checkPwd"></div>
          </div>

        </div>
      </div>
    </div>
  </div>
  <br>
  <!-- ///////////////////////////////////////////////// 두번째 탭 ///////////////////////////////////////////////// -->
  <div class="container1">
    <!-- 모달 팝업 -->
    <div class="modal fade" id="myModal">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <p class="modal-title" id="myModalLabel"></p>
            <button type="button" class="close" data-dismiss="modal">
              <span aria-hidden="true">×</span><span class="sr-only"></span>
            </button>
          </div>
          <div class="modal-body" id="listmodal"></div>
          <div class="modal-footer">
            <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
          </div>
        </div>
      </div>
    </div>
    <!-- 모달 팝업 -->
    <div class="modal fade" id="myModal2">
      <div class="modal-dialog">
        <div class="modal-content" style="width:600px">
          <div class="modal-body" id="myModal2Body"></div>
          <div class="modal-footer">
            <button type="button" class="btn btn-default" data-dismiss="modal">확인</button>
            <button type="button" class="btn btn-danger" data-dismiss="modal" id="deleteImageBtn" data-toggle="modal" data-target="#confirmModal">삭제</button>
          </div>
        </div>
      </div>
    </div>

    <!-- 모달 팝업 -->
    <div class="modal fade" id="myModal4">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <h4 class="modal-title" id="myModalLabel">다이어리쓰기</h4>
            <button type="button" class="close" data-dismiss="modal">
              <span aria-hidden="true">×</span><span class="sr-only"></span>
            </button>
          </div>
          <div class="modal-body" id="myModal4Body">
            <table>
              <tr>
                <th>글제목</th>
                <td colspan="5">
                  <input id="w_diary_title" type="text">
                </td>
              </tr>
              <tr>
                <th>음식점<button id="searchResDiary" class="btn" data-toggle="modal" data-target="#myModal5">음식점검색</button></th>
                <td colspan="5">
                  <input id="res_search" type="text" readonly="readonly" style="border: 1px solid #ddd; height: 50px;">
                
                </td>
              </tr>
              <tr>
                <th>글내용</th>
                <td colspan="5">
                  <textarea name="textarea" class="jqte-test" id="w_diary_content" style="height: 350px; max-height: 350px; width: 400px;"></textarea>
                </td>
              </tr>
              <tr align="center">
                <th rowspan="2">날씨</th>
                <td>
                  <img src="/icons/sun.png">
                </td>
                <td>
                  <img src="/icons/cloud.png">
                </td>
                <td>
                  <img src="/icons/rain.png">
                </td>
                <td>
                  <img src="/icons/snow.png">
                </td>
                <td>
                  <img src="/icons/moon.png">
                </td>
              </tr>
              <tr align="center">
                <td>
                  <input type="radio" name="weather" value="1" checked="checked" />
                </td>
                <td>
                  <input type="radio" name="weather" value="2" />
                </td>
                <td>
                  <input type="radio" name="weather" value="3" />
                </td>
                <td>
                  <input type="radio" name="weather" value="4" />
                </td>
                <td>
                  <input type="radio" name="weather" value="5" />
                </td>
              </tr>
              <tr>
                <th><button id="fri_searchBtn" class="btn" data-toggle="modal" data-target="#myModal8">친구검색</button></th>
                <td colspan="5">
                  <input id="fri_search" type="text" readonly="readonly" style="border: 1px solid #ddd; height: 50px;">
                </td>
              </tr>
            </table>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
            <button type="button" class="btn btn-primary" id="writeDiaryBtn" data-dismiss="modal">저장</button>
          </div>
        </div>
      </div>
    </div>
    <!-- 모달 팝업 -->
    <div class="modal fade" id="myModal5">
      <div class="modal-dialog" style="width: 500px; height: 500px;">
        <div class="modal-content">
          <div class="row" id="div_res_search">
          <input type="text" id="res_searchText" style="width: 250px;">
          <button id="res_searchBtn" class="btn">검색</button>
          </div>
          <div class="modal-body" id="myModal5Body" style="width: 495px; height: 300px;"></div>
          <div class="modal-footer">
            <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
          </div>
        </div>
      </div>
    </div>

    <!-- 친구목록보기 -->
    <div class="modal fade" id="myModal8">
      <div class="modal-dialog" style="width: 310px; height: 500px;">
        <div class="modal-content">
          <div class="modal-body" id="myModal8Body"></div>
          <div class="modal-footer">
            <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
            <button type="button" class="btn btn-primary" id="checkFriends" data-dismiss="modal">저장</button>
          </div>
        </div>
      </div>
    </div>
    <div class="modal fade" id="confirmModal">
      <div class="modal-dialog" style="width: 310px; height: 500px;">
        <div class="modal-content">
          <div class="modal-body" id="confirmModalBody"></div>
          <div class="modal-footer">
            <button type="button" class="btn btn-default" data-dismiss="modal">아니오</button>
            <button type="button" class="btn btn-primary" id="confirmYes" data-dismiss="modal">네</button>
          </div>
        </div>
      </div>
    </div>
    <div class="modal fade" id="PicAndInt">
      <div class="modal-dialog" style="width: 400px;">
        <div class="modal-content">
          <div class="modal-body" id="PicAndIntBody">
            <table>
              <tr>
                <td style="text-align: center; vertical-align: top;">
                  <img id="PicAndIntPhoto" src="" style="width: 100px;" data-toggle="modal" data-target="#myModal7" />
                </td>
                <td>
                  <input type="text" style="width: 250px; height: 100px;" id="PicAndIntIntro" value="${memberList.m_intro }">
                </td>
              </tr>
            </table>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
            <button type="button" class="btn btn-primary" id="PicAndIntSave">저장</button>
          </div>
        </div>
      </div>
    </div>
    <!-- 업로드 모달 팝업 -->
    <div class="modal fade" id="myModal6">
      <div class="modal-dialog" style="width: 600px;">
        <div class="modal-content" style="width: 600px;">
          <form action="uploadDiaryImage" id="diaryImageForm" enctype="multipart/form-data">
            <input type="hidden" id="diaryImageNum">
            <div class="modal-body" id="myModal6Body">
              <input type="file" id="diary_pic" name="diary_pic" accept=".jpg, .jpeg, .png">
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
              <button type="button" class="btn btn-primary" data-dismiss="modal" id="diaryImageSave1">저장</button>
            </div>
          </form>
        </div>
      </div>
    </div>
    <div class="modal fade" id="myModal7">
      <div class="modal-dialog" style="width: 600px;">
        <div class="modal-content">
          <form action="uploadProfileImage" id="profileImageForm" enctype="multipart/form-data">
            <div class="modal-body" id="myModal7Body">
              <input type="file" id="profile_pic" name="profile_pic" accept=".jpg, .jpeg, .png">
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
              <button type="button" class="btn btn-primary" data-dismiss="modal" id="diaryImageSave2">저장</button>
            </div>
          </form>
        </div>
      </div>
    </div>
    <!-- photodeco -->
    <div class="modal fade" id="myModal3">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-body" id="myModal3cont">
            <table>
              <tr>
                <th>음식이름</th>
                <td colspan="3">
                  <input type="text" id="p_foodname">
                </td>
              </tr>
              <tr>
                <th>음식가격</th>
                <td colspan="3">
                  <input type="text" id="p_price">
                </td>
              </tr>
              <tr style="text-align: center;">
                <th rowspan="2">좋아요</th>
                <td>
                  <img src="/icons/emo1.png">
                </td>
                <td>
                  <img src="/icons/emo2.png">
                </td>
                <td>
                  <img src="/icons/emo3.png">
                </td>
              </tr>
              <tr style="text-align: center;">
                <td>
                  <input type="radio" name="emo" value="1" checked="checked" />
                </td>
                <td>
                  <input type="radio" name="emo" value="2" />
                </td>
                <td>
                  <input type="radio" name="emo" value="3" />
                </td>
              </tr>
              <tr>
                <th>코멘트</th>
                <td colspan="3">
                  <input type="text" style="height: 100px; word-spacing: break-word;" id="p_comment">
                </td>
              </tr>
            </table>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
            <button type="button" class="btn btn-primary" id="tagSaveBtn" data-dismiss="modal">저장</button>
          </div>
        </div>
      </div>
    </div>
    <div class="modal fade" id="detailView">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-body">
            <table border="1" align="center">
              <tr>
                <td rowspan="3">
                  <img id="detailViewImg" src="" style="width: 150px; height: 150px;" data-toggle="modal" data-target="#largeView">
                </td>
                <td colspan="6" align="center" id="detailViewNick"></td>
              </tr>
              <tr>
                <td colspan="6" align="center" id="detailViewLevel"></td>
              </tr>
              <tr class="width50">
                <td>
                  <img src="/icons/like.png" id="detailViewLike">
                </td>
                <td id="detailViewCountLike"></td>
                <td>
                  <img src="/icons/marker.png" id="detailViewMark">
                </td>
                <td id="detailViewCountMark"></td>
                <td>
                  <img src="/icons/write.png" id="detailViewWrite">
                </td>
                <td id="detailViewCountWrite"></td>
              </tr>
              <tr>
                <td colspan="7" id="detailViewIntro"></td>
              </tr>
            </table>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
          </div>
        </div>
      </div>
    </div>
    <div class="modal fade" id="largeView">
      <div class="modal-dialog" style="width: 600px;">
        <div class="modal-content">
          <div class="modal-body">
            <img src="" id="largeViewBody">
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
          </div>
        </div>
      </div>
    </div>
    <div class="modal fade" id="findFriend">
      <div class="modal-dialog">
        <div class="modal-content" style="width: 400px;">
          <div class="modal-body" style="width: 400px; height: 600px; max-height: 600px;">
            이메일/닉네임<input type="text" id="searchFriend" width="400px">
            <div id="searchFriendList"></div>
          </div>

          <div class="modal-footer">
            <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
          </div>
        </div>
      </div>
    </div>
  </div>
  <jsp:include page="footer.jsp"></jsp:include>

  <script type="text/javascript">
	$(function(){
		// $('.jqte-test').jqte({source: false});
		
		
		
		//모달 hidden 정리///////////////////////////////////////////////////////////////////////////////////////////////
		function PicAndIntHidden(){
			$('#PicAndInt').on('hidden.bs.modal', function () {
				$('#PicAndIntIntro').val('${memberList.m_intro }');
				$('#myModal6 .modal-dialog').css('width','600px');
			})
		}
		function myModalHidden(){
			$('#myModal').on('hidden.bs.modal', function () {
            	infowindow.close();
            });
		}
		function findFriendHidden(){
			$('#findFriend').on('hidden.bs.modal', function () {
				$('#searchFriendList').html('');
				$('#searchFriend').val('');
			})
		}
		function myModal7Hidden(){
			$('#myModal7').on('hidden.bs.modal', function () {
				$('#profile_pic').off('click');
				$('#profile_pic').val('');
				$('#profile_pic').siblings().remove();
				$('#tagSaveBtn').off('click');
			})
			
		}
		function myModal6Hidden(diary_num){
			$('#myModal6').on('hidden.bs.modal', function () {
				if(diary_num!=null){
					$.ajax({
						url : "deletePhotoDeco",
						data : {
							p_imgname : '/diary/'+diary_num+'/'+$('#diary_pic').val().replace('C:\\fakepath\\', '')
						},
						type : "post",
						success : function(){
							
						}
					})
				}
				$('#diary_pic').off('click');
				$('#diary_pic').val('');
				$('#diary_pic').siblings().remove();
				$('#tagSaveBtn').off('click');
			})
			
		}
		function myModal5Hidden(){
			$('#myModal5').on('hidden.bs.modal', function () {
				$('#res_searchText').val('');
				map = new naver.maps.Map('myModal5Body');
			})
		}
		function myModal4Hidden(){
			$('#myModal4').on('hidden.bs.modal', function () {
				$('#w_diary_title').val('');
				$('#w_diary_content').val('');
				$('#res_search').val('');
				$('#fri_search').val('');
				$('input:radio[name="weather"]:input[value="1"]').prop('checked',true);
			})
		}
		function myModal3Hidden(){
			$('#myModal3').on('hidden.bs.modal', function () {
				$('#tagSaveBtn').off('click');
				$('input:radio[name="emo"]:input[value="1"]').prop('checked',true);
			})
		}
		function myModal2Hidden(){
			$('#myModal2').on('hidden.bs.modal', function () {
				$('#myModal3Image').siblings().remove();
				$('#myModal3Image').attr('src','');
			})
		}
		//////////////////////////////////////////////////////////////////////////////////////////////
		
		//1. myPage 메인 화면의 Edit 버튼
		$('#updatePicAndInt').off().on('click',function(){
			$('#myModal6 .modal-dialog').css('width','300px');
			$('#PicAndIntPhoto').attr('src','${memberList.m_photo}')
			function readURL(input){
	          if (input.files && input.files[0]) {
	            var reader = new FileReader();
	            var formData = null;
	            reader.onload = function(e) {
	            	$('#PicAndIntPhoto').attr('src',e.target.result);
					formData = new FormData($('#profileImageForm')[0]);
					$('#myModal6').modal('hide');
	            }
				 $('#PicAndIntSave').off().on('click',function(){
					 $.ajax({
			            type : 'post',
			            url : 'uploadProfileImage',
			            data : formData,
			            processData : false,
			            contentType : false,
			            async : false,
			            success : function(data) {
			                alert(data);
			            },
			            error : function(error) {
			                alert('파일 업로드에 실패하였습니다.');
			            }
				      });
					 $.ajax({
						 url : 'updateIntro',
						 data : {
							 m_intro : $('#PicAndIntIntro').val()
						 },
						 type : "post",
						 async : false,
						 success : function(){
							 
						 },
						 //소연 error추가
						 error : function(error) {
				                alert('수정실패.');
				          }
					 })
					 location.href="/myPage";
				})
	            reader.readAsDataURL(input.files[0]);
	          }
			}
			$("#profile_pic").change(function() {
	          readURL(this);
	        });
			$("#PicAndIntIntro").change(function() {
	          readURL(this);
	        });
			PicAndIntHidden();
			
		})
		
		// 탭을 눌렀을때
		$('ul.tabs li').click(function(){
			var tab_id = $(this).attr('data-tab');

			$('ul.tabs li').removeClass('current');
			$('.tab-content').removeClass('current');

			$(this).addClass('current');
			$("#"+tab_id).addClass('current');
		});
		
		// 지도마커생성
		function makeMarker(map,r_name,r_address,starorlike,firstaddress){
			naver.maps.Service.geocode({address: r_address}, function(status, response) { // 해당 주소로 네이버 맵 API 서비스 실행
				if (status !== naver.maps.Service.Status.OK) { // 뭔지모름
				    return alert(myaddress + '의 검색 결과가 없거나 기타 네트워크 에러');
				}
				var result = response.result;
				// 검색 결과 갯수: result.total
				// 첫번째 결과 결과 주소: result.items[0].address
				// 첫번째 검색 결과 좌표: result.items[0].point.y, result.items[0].point.x
				var myaddr = new naver.maps.Point(result.items[0].point.x, result.items[0].point.y); // 네이버 맵에 x,y좌표 따옴
				firstaddress = myaddr;
				map.setCenter(myaddr); // 검색된 좌표로 지도 이동
				// 마커 표시
				var iconUrl = '';
				if(starorlike =='like'){
					iconUrl = '/icons/like.png';
				}else if(starorlike =='mark'){
					iconUrl = '/icons/star.png';
				}else if(starorlike =='pin'){
					iconUrl = '/icons/pin.png';
				}
				
				var marker = new naver.maps.Marker({
				  position: myaddr,
				  map: map,
				  icon: {
				        url: iconUrl,
				        size: new naver.maps.Size(30, 32),
				        origin: new naver.maps.Point(0, 0),
				        anchor: new naver.maps.Point(15, 16)
			    	}
				});
				clickMarkerSet(map,r_name,r_address,marker);
			})
		}
		
		// 마커클릭시 별점주기가능
		function clickMarkerSet(map,r_name,r_address,marker){
	      	// 마크 클릭시 인포윈도우 오픈
	        var infowindow = new naver.maps.InfoWindow({
	        	  content : '<p>'+r_name+'</p>'+ // 그안에 담기는 내용들
	        	  '<div id="starRev">'+
		          '<span class="starR1 on" id="0.5">별1_왼쪽</span>'+
		          '<span class="starR2" id="1">별1_오른쪽</span>'+
		          '<span class="starR1" id="1.5">별2_왼쪽</span>'+
		          '<span class="starR2" id="2">별2_오른쪽</span>'+
		          '<span class="starR1" id="2.5">별3_왼쪽</span>'+
		          '<span class="starR2" id="3">별3_오른쪽</span>'+
		          '<span class="starR1" id="3.5">별4_왼쪽</span>'+
		          '<span class="starR2" id="4">별4_오른쪽</span>'+
		          '<span class="starR1" id="4.5">별5_왼쪽</span>'+
		          '<span class="starR2" id="5">별5_오른쪽</span>'+
		       	  '<button class="btn" id="starbtn">선택하기</button></div>'
	        });
	      	
	     	// 마커 클릭 이벤트 처리
	          naver.maps.Event.addListener(marker, "click", function clickMarker(e) {
	        	  naver.maps.Service.geocode({address: r_address}, function(status, response) { // 해당 주소로 네이버 맵 API 서비스 실행
	  				if (status !== naver.maps.Service.Status.OK) { // 뭔지모름
	  				    return alert(myaddress + '의 검색 결과가 없거나 기타 네트워크 에러');
	  				}
	  				var result = response.result;
	  				// 검색 결과 갯수: result.total
	  				// 첫번째 결과 결과 주소: result.items[0].address
	  				// 첫번째 검색 결과 좌표: result.items[0].point.y, result.items[0].point.x
	  				var myaddr = new naver.maps.Point(result.items[0].point.x, result.items[0].point.y); // 네이버 맵에 x,y좌표 따옴
	  				map.setCenter(myaddr); // 검색된 좌표로 지도 이동
	        	  })
		            if (infowindow.getMap()) {
		                infowindow.close();
		            } else {
	                	var totaldom = '<p>'+r_name+'</p>'+'<div id="starRev">'; // 위에 인포윈도우 컨텐트의 내용을 다시담기위한것
	                	var juststar = 0.5;
	                	var placename = r_name.replace("<b>","").replace("</b>","")+",."+r_address;
	                	$.ajax({ // 원래 별점 몇점이었는지 알아오는애 없으면 기본인 0.5개가나옴
	                		data : {
	                			place : placename
	                		},
	                		url : 'howstar',
	                		type : 'post',
	                		async : false,
	                		success : function(data){
	                			juststar = data;
	                		}
	                	})
	               	for(var i=1;i<=5;i++){
	               		var on1 = '';
	               		var on2 = '';
	               		if(juststar>=(i-0.5)) // 가져온 점수에 맞게 span class 에 on 을 더해줌
	               			on1 = 'on';
	               		if(juststar>=i)
	               			on2 = 'on';
	               		totaldom += '<span class="starR1 '+on1+'" id="'+(i-0.5)+'"></span>'
	               		totaldom += '<span class="starR2 '+on2+'" id="'+i+'"></span>'
	               	}
	               	totaldom += '<button class="btn" id="starbtn">선택하기</button></div>';
	               	
	               	if(juststar==null||juststar==0.5){}
	               	else{
	               		infowindow.setContent(totaldom); // infowindow 에 컨텐츠 바꿔줌
	               	}
	               	
	                infowindow.open(map, marker); // 염
	                
	                $('#starRev span').click(function () { // 별 클릭할때  
	                    $(this).parent().children('span').removeClass('on'); // on 다 지움
	                    $(this).addClass('on').prevAll('span').addClass('on'); // on으로 되어있는애 앞에있는애 다 on 붙여주고
	                    $(this).parent().children('span').removeClass('point'); // point 다 지움
	                    $(this).addClass('point'); // 마지막별점에 point 넣어줌
	                    return false;
	                });
	                $('#starbtn').off().on('click',function(){ // 별점주기 버튼 클릭시
	                   	var stargrade = $('#starRev span.on.point').attr("id"); // 온이랑 포인트 붙은애 id 가져옴 이게 점수
	                   	var placename = r_name.replace("<b>","").replace("</b>","")+",."+r_address;
	                   	$.ajax({ // 점수 저장
	                   		data : {
	                   			point : stargrade,
	                   			place : placename
	                   		},
	                   		url : 'givegrade',
	                   		type : 'post',
	                   		success : function(){
	                   			infowindow.close(); // infowindow 닫고
	                   			$('#starRev span').parent().children('span').removeClass('point'); // point 전체 징
	                   			$('#res_search').val(placename);
	                   			alert("입력되었습니다.");
	                   			//성공하고나서 별점 주었음 이라고 하고 fadeout 하고싶음
	                   		}
	                   	})
	                });
	                myModalHidden();
	            }
	          });
		}
		
		//레스토랑 넘버로 총평점 가져오기
		function getGrade(r_num){
			var grade = '';
			$.ajax({
				url : "getGrade",
				data : {
					r_num : r_num
				},
				async : false,
				type : "post",
				success : function(data){
					grade = data;
				}
			})
			return grade;
		}
		
		
		var Tab3Page = 1;
		var thirdMenu = function(pageNum){
			var map = new naver.maps.Map('likestarmap');
			$.ajax({
				url : 'myPageTab3',
				data : {
					like : $('#relateLike').attr('src'),
					mark : $('#relateMark').attr('src')
				},
				type : 'post', //gggg
				success : function(data){
					if(pageNum!=null)
						Tab3Page = pageNum;
					var startPage = (Math.floor((Tab3Page-1)/3))*3+1;
					var endPage = (Math.floor((Tab3Page-1)/3))*3+3;
					var lastPage = Math.floor((data.length-1)/3)+1;
					var result = '<table>';
					for(var i =(Tab3Page-1)*3;i<(Tab3Page-1)*3+3;i++){
						if(i<data.length){
							result += '<tr><td rowspan="4">';
							$.ajax({
								url : 'restaurantPhoto',
								data : {
									r_num : data[i].r_num
								},
								type : "post",
								async : false,
								success : function(data){
									if(data){
										result += '<img src="/restaurant/'+data[i].r_num+'.jpg" style="width : 60px;"></td>';
									}else{
										result += '<img src="/icons/nophoto.png" style="width : 60px;"></td>';
									}
								}
							})
							result += '<td style="width :250px;"><h4><b>&nbsp;'+data[i].r_name+'</b></h4></td>';
							result += '<td rowspan="2">&nbsp;<img src="/icons/';
							if(data[i].e_like==1){
								makeMarker(map,data[i].r_name,data[i].r_address,'like');
								result += 'like';
							}
							else if(data[i].e_mark==1){
								makeMarker(map,data[i].r_name,data[i].r_address,'mark');
								result += 'star';
							}
							result += '.png"></td></tr>';
							result += '<tr><td>&nbsp;'+data[i].r_address+'</td></tr>';
							result += '<tr><td colspan="2">&nbsp;'+data[i].r_category1+', ';
							if(data[i].r_category2!=null&&data[i].r_category2!=undefined){
								result += data[i].r_category2;
							}
							result += '</tr><tr><td>&nbsp;'+getGrade(data[i].r_num)+'</td><td></td></tr>'
						}
					}
					result += '</table>';
					result += '<table><tr>';
					if(startPage>1){
						result += '<td><button id="tab3ListBePage"><</button></td>'
					}
					for(var i =startPage;i<=endPage;i++){
						if(i<=lastPage)
							result += '<td><button class ="btn btn-warning tab3ListBtn" id="'+i+'">'+i+'</button></td>'
					}
					if(endPage<lastPage){
						result += '<td><button id="tab3ListAfPage">></button></td>'
					}
					result += '</tr></table>';
					$('#tab3List').html(result);
					$('.tab3ListBtn').off().on('click',function(){
						$('#tab3List').html('');
						$('#likestarmap').html('');
						thirdMenu($(this).attr('id'));
					})
					$('#tab3ListBePage').off().on('click',function(){
						$('#tab3List').html('');
						$('#likestarmap').html('');
						thirdMenu(startPage-1);
					})
					$('#tab3ListAfPage').off().on('click',function(){
						$('#tab3List').html('');
						$('#likestarmap').html('');
						thirdMenu(endPage+1);
					})
					$('#relateLike').off().on('click',function(){
						if($(this).attr('src')=='/icons/like.png'){
							$(this).attr('src','/icons/blanklike.png');
						}else{
							$(this).attr('src','/icons/like.png');
						}
						thirdMenu(1);
					})
					$('#relateMark').off().on('click',function(){
						if($(this).attr('src')=='/icons/star.png'){
							$(this).attr('src','/icons/blankstar.png');
						}else{
							$(this).attr('src','/icons/star.png');
						}
						thirdMenu(1);
					})
				}
			})
		}
		//세번째 탭 시작
		$('#thirdmenu').on('click',thirdMenu(1));
		
		function applyFriend(){
			$.ajax({
				url : "applyFriend",
				data : {
					email_num : $(this).attr('id'),
				},
				type : "post",
				success : function(data){
					alert(data);
					fourthMenu(1,1);
				}
			})
		}
		function deleteFriend(){
			$.ajax({
				url : "deleteFriend",
				data : {
					email_num : $(this).attr('id'),
				},
				type : "post",
				success : function(data){
					alert(data);
					fourthMenu(1,1);
				}
			})
		}
		
		function seeLarge(src){
			$('#largeViewBody').attr('style','width:550px;');
			$('#largeViewBody').attr('src',src);
		}
		
		var temp_email_num = 0;
		function seeDetail(){
			$.ajax({
				url : "getMemberList",
				data : {
					email_num : $(this).parent().attr('class')
				},
				type : "post",
				async : false,
				success : function(data){
					var clix = event.clientX;
					var cliy = event.clientY-25;
					$('#detailView .modal-dialog').attr('style','left : ' + clix + 'px; top : '+ cliy + 'px; position : absolute;'); // 가운데뜨게 하고싶으면 지우면됨
					$('#detailViewImg').attr('src',data.m_photo);
					$('#detailViewNick').html(data.m_nick);
					$('#detailViewLevel').html(data.m_level);
					$('#detailViewIntro').html('<input type="text" readonly="readonly" style="width:100%; height: 100px; max-height : 100px;" value="'+data.m_intro+'">');
					
					$.ajax({
						url : "getCountList",
						data : {
							email_num : data.email_num
						},
						type : "post",
						async : false,
						success : function(data){
							$('#detailViewCountLike').html(data.countLike);
							$('#detailViewCountMark').html(data.countMark);
							$('#detailViewCountWrite').html(data.countDiary+'('+data.countReview+')');
						}
					})
					seeLarge(data.m_photo);
					temp_email_num = data.email_num;
					var t = 0;
					function moveRes1(s){
						$('#detailViewIntro').html('');
						if(s>=t||s==0){
							t=s;
						}
						$.ajax({
							url : "getLikeList",
							data : {
								email_num : temp_email_num
							},
							type : "post",
							async : false,
							success : function(data){
								var result = '<table border="1" style="width : 100%">';
								result += '<tr><td rowspan="3"><img id="moveleft1" src="/icons/moveleft.png"></td><td rowspan="3">';
								$.ajax({
									url : 'restaurantPhoto',
									data : {
										r_num : data[t].r_num
									},
									type : "post",
									async : false,
									success : function(data){
										if(data){
											result += '<img src="/restaurant/'+data[t].r_num+'.jpg" style="width:100px; height:100px; text-align:center;"></td>';
										}else{
											result += '<img src="/icons/nophoto.png" style="width:100px; height:100px; text-align:center;"></td>';
										}
									}
								})
								result += '<td>'+data[t].r_name+'</td><td rowspan="2"><img src="/icons/star.png"></td><td rowspan="3"><img id="moveright1" src="/icons/moveright.png"></td></tr>';
								result += '<tr><td>'+data[t].r_address+'</td></tr>';
								result += '<tr><td>'+data[t].r_category1+'/'+data[t].r_category2+'</td><td>'+getGrade(data[t].r_num)+'</td></tr>';
								result += '</table>';
								$('#detailViewIntro').html(result);
								$('#moveleft1').on('click',function(){
									if(t>0){
										moveRes1(t-1)
									}
								})
								$('#moveright1').on('click',function(){
									if(t<data.length-1){
										moveRes1(t+1)
									}
								})
							}
						})
					}
					var u=0;
					function moveRes2(v){
						$('#detailViewIntro').html('');
						if(v>=u||v==0){
							u=v;
						}
						$.ajax({
							url : "getMarkList",
							data : {
								email_num : temp_email_num
							},
							type : "post",
							async : false,
							success : function(data){
								var result = '<table border="1" style="width : 100%">';
								result += '<tr><td rowspan="3"><img id="moveleft2" src="/icons/moveleft.png"></td><td rowspan="3">';
								$.ajax({
									url : 'restaurantPhoto',
									data : {
										r_num : data[u].r_num
									},
									type : "post",
									async : false,
									success : function(data){
										if(data){
											result += '<img src="/restaurant/'+data[u].r_num+'.jpg" style="width:100px; height:100px; text-align:center;"></td>';
										}else{
											result += '<img src="/icons/nophoto.png" style="width:100px; height:100px; text-align:center;"></td>';
										}
									}
								})
								result += '<td>'+data[u].r_name+'</td><td rowspan="2"><img src="/icons/star.png"></td><td rowspan="3"><img id="moveright2" src="/icons/moveright.png"></td></tr>';
								result += '<tr><td>'+data[u].r_address+'</td></tr>';
								result += '<tr><td>'+data[u].r_category1+'/'+data[u].r_category2+'</td><td>'+getGrade(data[t].r_num)+'</td></tr>';
								result += '</table>';
								$('#detailViewIntro').html(result);
								if(u>0){
									$('#moveleft2').on('click',function(){
										moveRes2(u-1)
									})
								}
								if(u<data.length-1){
									$('#moveright2').on('click',function(){
										moveRes2(u+1)
									})
								}
							}
						})
					}
					if($('#detailViewCountLike').text()>0){
						$('#detailViewLike').off().on('click',function(){
							moveRes1(0);
						})
					}
					if($('#detailViewCountMark').text()>0){
						$('#detailViewMark').off().on('click',function(){
							moveRes2(0);
						})
					}
					$('#detailView').modal('show');
				}
			})
		}
		
		var Tab4Page = 1;
		var FNum = 1;
		var ReqFNum = 1;
		function fourthMenu(FpageNum,ReqFpageNum){
			$.get("getFriendList",function(data){
				if(FpageNum>0){
		               Fnum = FpageNum
		            }
		            var result = '<table style ="align : center;">'
		            var forlast = data.length>Fnum*5?Fnum*5:data.length
		            for(var i=(Fnum-1)*5;i<forlast;i++){
		               result += '<tr class="'+data[i].email_num+'">'
		              
		               result += '<td rowspan="2" style="width : 50px;" class="'+data[i].email_num+'"><img class="detailView" src="'+data[i].m_photo+'" style="width : 40px;"/></td>';
		               
		               result += '<td style="width: 220px;" class="detailView"><h3> '+data[i].m_nick+'</h3></td><td rowspan="2"><button class="btn btn-outline-danger deleteFriend1" id="'+data[i].email_num+'">삭제</button></td>';
		               result += '</tr>'
		               result += '<tr class="'+data[i].email_num+'">'
		               result += '<td  class="detailView"> '+data[i].m_intro+'</td>';
		               result += '</tr>'
		            }
				result += '</table>'
				result += '<table><tr>'
				for(var i =1;i<data.length/5+1;i++){
					result += '<td><button class="btn btn-warning getF" id="'+i+'">'+i+'</button></td>'
				}
				result += '</tr></table>'
				$('#myFriends').html(result);
				$('.getF').off().on('click',function(){
					console.log($(this).attr('id'),ReqFNum)
					fourthMenu($(this).attr('id'),ReqFNum);
				})
				$('.deleteFriend1').bind('click',deleteFriend);
				$('.detailView').bind('click',seeDetail);
			})
			$.get("getReqFriendList",function(data){
				if(ReqFpageNum>0){
					ReqFNum = ReqFpageNum
				}
				var forlast = data.length>ReqFNum*5?ReqFNum*5:data.length
				var result = '<table style ="align : center;">'
				for(var i=(ReqFNum-1)*5;i<forlast;i++){
					result += '<tr>'
						result += '<td rowspan="2" style="width : 50px;"><img src="'+data[i].m_photo+'" style="width : 40px;" /></td>';
					
					result += '<td style="width: 220px;"><h3> '+data[i].m_nick+'</h3></td><td rowspan="2"><button class="btn btn-outline-success applyFriend" id="'+data[i].email_num+'">수락</button><button class="btn btn-outline-danger deleteFriend2" id="'+data[i].email_num+'">거절</button></td>';
					result += '</tr>'
					result += '<tr>'
					result += '<td> '+data[i].m_intro+'</td>';
					result += '</tr>'
				}
				result += '</table>'
				result += '<table><tr>'
				for(var i =1;i<data.length/5+1;i++){
					result += '<td><button class="btn btn-warning getReqF" id="'+i+'">'+i+'</button></td>'
				}
				result += '</tr></table>'
				$('#forRespFriends').html(result);
				$('.getReqF').off().on('click',function(){
					fourthMenu(FNum,$(this).attr('id'));
				})
				$('.applyFriend').bind('click',applyFriend);
				$('.deleteFriend2').bind('click',deleteFriend);
			})
			
			var findPage = 1;
			$('#findFriendBtn').off().on('click',function(){
				$('#searchFriend').off().on('input',function searchFriend2(findFriendPage){
					if(findFriendPage>0){
						findPage = findFriendPage;
					}
					$.ajax({
						url : "findFriend",
						data : {
							search : $('#searchFriend').val()
						},
						type : 'post',
						success : function(data){
							var result = '<table border="1">';
							console.log(findPage);
							var forlast = findPage*5>data.length?data.length:findPage*5
							for(var i =(findPage-1)*5;i<forlast;i++){
								console.log(findPage);
								
											result += '<tr><td rowspan="2"><img style="width : 100px;" src="'+data[i].m_photo+'"></td>';
								result += '<td style="width : 200px;">'+data[i].m_nick+'</td>'
								result += '<td rowspan="2">'
								$.ajax({
									url : "isFriend",
									data : {
										email_num : data[i].email_num
									},
									type : 'post',
									async : false,
									success : function(is){
										if(is==1){
											result += '<button class="btn btn-outline-success" style="height : 25px;">이미친구</button></td></tr>'
										}else if(is==2){
											result += '<button class="btn btn-outline-info"style="height : 25px;">이미신청</button></td></tr>'
										}else if(is==3){
											result += '<button class="btn btn-outline-primary" style="height : 25px;">신청받음</button></td></tr>'
										}else{
											result += '<button class="btn btn-primary sendApply" id="'+data[i].email_num+'" style="height : 25px;">친구신청</button></td></tr>'
										}
									}
								})
								$.ajax({
									url : "getEmailByNum",
									data : {
										email_num : data[i].email_num
									},
									type : 'post',
									async : false,
									success : function(email){
										result += '<tr><td>'+email+'</td></tr>'
									}
								})
							}
							result += '</table>'
							result += '<table><tr>'
							for(var i =1;i<data.length/5+1;i++){
								result += '<td><button class="btn btn-info findP" id="'+i+'">'+i+'</button></td>'
							}
							result += '</tr></table>'
							$('#searchFriendList').html(result);
							$('.findP').off().on('click',function(){
								searchFriend2($(this).attr('id'));
							})
							$('.sendApply').off().on('click',function(){
								$.ajax({
									url : "sendApplyFriend",
									data : {
										email_num : $(this).attr('id')
									},
									type : 'post',
									async : false,
									success : function(data){
										alert(data);
										searchFriend2(findPage);
									}
								})
							})
							findFriendHidden();
						}
					})
				})
			})
		}
		
		
		//네번째 탭 시작
		$('#fourthmenu').on('click',fourthMenu(1));
		
		
		function fifthMenu(){
			$.get('myPageTab5',function(data){
				$('#profilePhoto').attr('src',data.m_photo);
				$('#profileEmail').text('${sessionScope.email}');
				$('#profileNickName').val(data.m_nick);
				$('#changePP').off().on('click',function(){
					function readURL(input){
			          if (input.files && input.files[0]) {
			            var reader = new FileReader();
			            reader.onload = function(e) {
							$('#profile_pic').after('<img id="uploadPreview" style="width : 550px;" src="'+e.target.result+'">');
							 $('#diaryImageSave2').off().on('click',function(){
								var formData = new FormData($('#profileImageForm')[0]);
								 $.ajax({
						            type : 'post',
						            url : 'uploadProfileImage',
						            data : formData,
						            processData : false,
						            contentType : false,
						            success : function(data) {
						                alert(data);
						            },
						            error : function(error) {
						                alert("파일 업로드에 실패하였습니다.");
						            }
							      });
								 location.href="/myPage";
							})
			            }
			            reader.readAsDataURL(input.files[0]);
			          }
					}
					$("#profile_pic").off().change(function() {
			          readURL(this);
			        });
					myModal7Hidden();
				});
				$('#profileNewPwd2').focus(function(){
					if($('#profileNewPwd1').val()!=null){
						$('#profileNewPwd2').on('change',function(){
							if($('#profileNewPwd1').val()==$('#profileNewPwd2').val()){
								$('#checkPwd').html('');
							}else{
								$('#checkPwd').html('<span style="color : red;"><b>비밀번호가 맞지 않습니다.</b></span>');
							}
						})
					}else{
						alert('새 비밀번호를 입력하여주세요');
					}
				})
				$('#changeID').on('click',function(){
					$.ajax({
						url : "updateID",
						data : {
							m_nick : $('#profileNickName').val(),
							m_pwd : $('#profileNewPwd1').val()
						},
						type : "post",
						success : function(data){
							alert(data);
							location.href="/myPage"
						}
					})
				})
			})
		}
			
		//다섯번째 탭 시작
		$('#fifthmenu').on('click',fifthMenu);
		
		
	
		///////////////////////////////////////////////// 두번째 탭 /////////////////////////////////////////////////
		var today=null;
		//두번째 탭 시작
		$('#secondmenu').on('click',function(){
			today = new Date();
			$('#ListorCalendar').html('리스트로보기');
			makeCalendar();
		})
		
		//리스트 또는 달력으로 보기 버튼 눌렀을때
		$('#ListorCalendar').on('click',function(){
			if($(this).html()=='리스트로보기'){
				$(this).html('달력으로보기');
				makeList(1);
			}else if($(this).html()=='달력으로보기'){
				$(this).html('리스트로보기');
				makeCalendar();
			}
		})
		
		function diarySave(diary_date){
			$('#writeDiaryBtn').off().on('click',function(){
				$.ajax({
					url : "writeDiary",
					data : {
						diary_title : $('#w_diary_title').val(),
						diary_content : $('#w_diary_content').val(),
						res_search : $('#res_search').val(),
						diary_weather : $('input:radio[name="weather"]:checked').val(),
						diary_friends : $('#fri_search').val(),
						diary_dateStr : diary_date
					},
					type : "post",
					success : function(data){
						alert(data);
						$('#writeDiaryBtn').off('click');
					}
				})
			})
		}
		function getFriendList(){
			$.get('getFriendList',function(data){
				var result = '<table style ="align : center;" id="friendListTable">'
				for(var i=0;i<data.length;i++){
					result += '<tr>'
						result += '<td rowspan="2" style="width : 50px;"><img src="'+data[i].m_photo+'" style="width : 40px;" /></td>';
					
					result += '<td style="width: 220px;"><h3> '+data[i].m_nick+'</h3></td><td rowspan="2"><input type="checkbox" name = "writeFriends" value ="'+data[i].m_nick+'/'+data[i].email_num+'"></td>';
					result += '</tr>'
					result += '<tr>'
					result += '<td><h4> '+data[i].m_intro+'</h4></td>';
					result += '</tr>'
				}
				result += '</table>'
				$('#myModal8Body').html(result);
			})
			$('#checkFriends').off().on('click',function(){
				var checkbox = $("input[name=writeFriends]:checked");
				var result = '';
				for(var i =0;i<checkbox.length;i++){
					result += checkbox[i].value+",";
				}
				$('#fri_search').val(result);
			})
		}
		
		function searchRestaurant(){
			var map = new naver.maps.Map('myModal5Body'); // 네이버 API에서 맵을가져옴
			$('#res_searchBtn').off().on('click',function(){
				$.ajax({
					url : "searchRestaurant",
					data : {
						res_search : $('#res_searchText').val()
					},
					type : "post",
					success : function(data){
						if($('#res_searchText').val()!=null&&$('#res_searchText').val()!=""){
							for(var i =0;i<data.length;i++){
								var r_address = data[i].r_address;
								var r_name = data[i].r_name;
								makeMarker(map,r_name,r_address,'pin');
							}
							myModal5Hidden();
						}
					},
					error : function(){
						alert('검색결과 없음');
					}
				})
			})
		}
		function deleteDiary(diary_num){
			$('#deleteDiaryBtn').off().on('click',function(){
				$('#confirmModalBody').html('<h5>정말 삭제 하시겠습니까?</h5>');
				$('#confirmYes').off().on('click',function(){
					$.ajax({
						url : "deleteDiary",
						data : {
							diaryNum : diary_num
						},
						type : "post",
						success : function(data){
							alert(data);
						}
					})
				})
			})
		}
		
		function updatePhotoDeco(plat,plon,pimgname){
			$('#tagSaveBtn').on('click',function(){
				$.ajax({
					url : "updatePhotoDeco",
					data : {
						p_lat : plat,
						p_lon : plon,
						p_imgname : pimgname,
						p_foodname : $('#p_foodname').val(),
						p_price : $('#p_price').val(),
						p_emo : $('input:radio[name="emo"]:checked').val(),
						p_comment : $('#p_comment').val()
					},
					type: "post",
					success : function(data){
						alert(data);
					}
				})
			})
		}
		function deleteImage(imgname){
			$('#deleteImageBtn').off().on('click',function(){
				$('#confirmModalBody').html('<h5>정말 삭제 하시겠습니까?</h5>');
				
				$('#confirmYes').off().on('click',function(){
					console.log($('#myModal3Image').attr('src'));
					$.ajax({
						url : "deleteImage",
						data : {
							imageName : imgname
						},
						type : "post",
						success : function(data){
							alert(data);
						}
					})
				})
			})
		}
		function readDeco(){
			$('.photoTag').off().on('click',function(){
				var pimgname = $(this).attr('id').split(',.')[0];
				var plat = $(this).attr('id').split(',.')[1];
				var plon = $(this).attr('id').split(',.')[2];
				$('#tagSaveBtn').text('저장');
				var clix = event.clientX;
				var cliy = event.clientY-25;
				$.ajax({
					url : "readDeco",
					data : {
						p_lat : plat,
						p_lon : plon,
						p_imgname : pimgname
					},
					type : "post",
					success : function(data){
						$('#p_foodname').val(data.p_foodname);
						$('#p_price').val(data.p_price);
						$('input:radio[name="emo"]:input[value="'+data.p_emo+'"]').prop("checked", true);
						$('#p_comment').val(data.p_comment);
						$('#myModal3 .modal-dialog').attr('style','left : ' + clix + 'px; top : '+ cliy + 'px; position : absolute;');
						updatePhotoDeco(plat,plon,pimgname);
					}
				})
				myModal3Hidden();
			})
		}
		function readPhotoDeco(thisid){
			$.ajax({
				url : "readPhotoDeco",
				data : {
					p_imgname : thisid
				},
				type : "post",
				success : function(data){
					for(var i = 0;i<data.length;i++){
						var p_lat = data[i].p_lat;
						var p_lon = data[i].p_lon;
						var p_imgname = data[i].p_imgname;
						var p_foodname = data[i].p_foodname;
						var p_price = data[i].p_price;
						var p_emo = data[i].p_emo;
						var p_comment = data[i].p_comment;
						$('#myModal3Image').after('<img src = "/icons/photoTag.png" id="'+p_imgname+',.'+p_lat+',.'+p_lon+'" class="photoTag" data-toggle="modal" data-target="#myModal3" style="left :' + p_lat + 'px; top :'+ p_lon + 'px; z-index: 1; position: absolute;">');
						// 태그 있는거 클릭시
						readDeco();
					}
				} 
			})
		}
		
		function writePhotoDeco(diary_num,offx,offy){
			$('#tagSaveBtn').off().on('click',function(){
				var imgname = null;
				if($('#diary_pic').val()!=null&&$('#diary_pic').val()!=''){
					imgname = '/diary/'+diary_num+'/'+$('#diary_pic').val().replace('C:\\fakepath\\', '');
				}else{
					imgname = $('#myModal3Image').attr('src')
				}
				
				$('#uploadPreview').after('<img src = "/icons/photoTag.png" id="'+imgname+',.'+offx+',.'+offy+'" class="photoTag" data-toggle="modal" data-target="#myModal3" style="left :' + offx + 'px; top :'+ (offy+60) + 'px; position: absolute;">')
				$.ajax({
					url : "writePhotoDeco",
					data : {
						p_lat : offx,
						p_lon : offy,
						p_imgname : imgname,
						p_foodname : $('#p_foodname').val(),
						p_price : $('#p_price').val(),
						p_emo : $('input:radio[name="emo"]:checked').val(),
						p_comment : $('#p_comment').val()
					},
					type : "post",
					success : function(data){
						alert(data);
						readPhotoDeco(imgname);
					}
				})
				
			})
		}
		
		
		function writeFormPhotoDeco(diary_num){
			$('#myModal3Image').off().on('click',function(){
				$('#tagSaveBtn').text('저장');
				var clix = event.clientX;
				var cliy = event.clientY-25;
				$('#myModal3 .modal-dialog').attr('style','left : ' + clix + 'px; top : '+ cliy + 'px;');
				var offx = event.offsetX;
				var offy = event.offsetY;
				$('#p_foodname').val('');
				$('#p_price').val('');
				$('#p_comment').val('');
				$('input:radio[name="emo"]:input[value="1"]').prop('checked',true);
				//save 버튼 눌렀을때
				writePhotoDeco(diary_num,offx,offy);
				myModal2Hidden();
				myModal3Hidden();
			})
		}
		function makeIcons(friendlist,r_name,r_phone,r_address,r_rundate,r_runtime){
			
			$('#icon1').off().on('click',function(){
				var x = event.clientX-250; // X좌표 저장
				var y = event.clientY-200; // Y좌표 저장
				var result = '<table style="text-align : center;"><tr>';
				for(var i =0; i<friendlist.length-1;i++){
					$.ajax({
						url : "getFriendPhoto",
						data : {
							friendNumStr : friendlist[i].split("/")[1]
						},
						type : "post",
						async : false,
						success : function(data){
							if(data=="0"){
								result += '<td><img alt="error" src="/icons/friend'+(i%6+1)+'.png" id="'+friendlist[i].split("/")[1]+'"></td>'
							}else{
								result += '<td><img alt="error" style="width : 40px;"src="'+data+'" id="'+friendlist[i].split("/")[1]+'"></td>'
							}
						}
					})
				}
				result += '</tr><tr>'
				for(var i =0;i<friendlist.length;i++){
					result += '<td style="width:80px;">'+friendlist[i].split("/")[0]+'</td>'
				}
				result += '</tr></table>'
				$('#myModal .modal-dialog').attr('style','left : '+x+'px; top : '+y+'px;');
				$('#listmodal').attr('style','');
				$('#listmodal').html(result);
				$('#myModalLabel').text('같이 간 친구 목록');
			});
			
			$('#icon2').off().on('click',function(){
				var x = event.clientX-250; // X좌표 저장
				var y = event.clientY-400; // Y좌표 저장
				var result = '<table>';
				result += '<tr><th>전화번호 :</th><td>'+r_phone+'</td></tr>'
				result += '<tr><th>주소 :</th><td>'+r_address+'</td></tr>'
				result += '<tr><th>영업일 :</th><td>'+r_rundate+'</td></tr>'
				result += '<tr><th>영업시간 :</th><td>'+r_runtime+'</td></tr>'
				result += '</table>'
				$('#myModal .modal-dialog').attr('style','left : '+x+'px; top : '+y+'px;');
				$('#listmodal').attr('style','');
				$('#listmodal').html(result);
				$('#myModalLabel').html('<h5>'+r_name+'</h5>');
			});
			
			$('#icon3').off().on('click',function(){
				var x = event.clientX-500; // X좌표 저장
				var y = event.clientY-400; // Y좌표 저장
				$('#myModalLabel').text('위치');
				$('#myModal .modal-dialog').attr('style','left : '+x+'px; top : '+y+'px; width : 510px; height : 300px;');
				$('#listmodal').attr('style','width :500px; height : 250px;');
				var map = new naver.maps.Map('listmodal'); // 네이버 API에서 맵을가져옴
				makeMarker(map,r_name,r_address,'pin');
			});
		}
		
		//리스트로 보기
		function makeList(page){
			$.ajax({
				url : "myPageTab2Type2",
				type : "post",
				data : {
					readPage : page
				},
				success : function(data){
					
					$('#diary').html('');
					$('#icons').html('');
					$('#photos').html('');
					$('#anotherDiary').html('');
					$('#diary_weather').attr('src','');
					$('#deleteD').html('');
					
					var result = '<ul style="font-size : 15px; line-height : 200%; height: 350px">';
					var thispage = page;
					var startPage = Math.floor(thispage/6)*5+1;
					var endPage = Math.floor(thispage/6)*5+5;
					var lastPage = data.lastPage;
					for(var i =0 ; i<data.diarylist.length;i++){
						result += '<li class="diaryList" style="cursor : pointer;" id="'+data.diarylist[i].diary_num+'">';
						result += '<b>'+data.diarylist[i].diary_date+'</b>&nbsp;&nbsp;&nbsp;';
						result += '<span>'+data.diarylist[i].diary_title+'</span>';
						result += '</li>';
					}
					result += '</ul>';
					result += '<table class="pagingTable" ><tr>';
					if(startPage>1){
						result += '<td><button class="btn btn-warning" id="BePage"><</button></td>';
					}
					for(var i =startPage;i<=endPage;i++){
						if(i==lastPage+1)
							break;
						result += '<td><button class="btn btn-warning diaryPage" id="'+i+'">'+i+'</button></td>';
					}
					if(endPage<lastPage){
						result += '<td><button class="btn btn-warning" id="AfPage">></button></td>';
					}
					result += '</tr></table>';
					
					$('#calendar').html(result);
					
					$('#BePage').on('click',function(){
						makeList(startPage-1);
					})
					$('#AfPage').on('click',function(){
						makeList(endPage+1);
					})
					$('#writeD').html('<button class="btn btn-outline-dark"style="float : right;" data-toggle = "modal" data-target="#myModal4">다이어리쓰기</button>');
					myModal4Hidden();
					$('.diaryPage').off().on('click',function(){
						makeList($(this).attr('id'));
					})
					
					//친구검색버튼
					$('#fri_searchBtn').off().on('click',function(){
						getFriendList();
					})
					//레스토랑찾기버튼
					searchRestaurant();
						
					//다이어리쓰기의 save버튼
					diarySave(new Date());
					
					
					$('.diaryList').off().on('click',function(){
						var diary_num = $(this).attr('id');
						$('.diaryList').css('color','black');
						$('#'+diary_num).css('color','red');
						// 리스트 클릭 후 오른쪽 내용 구성
						$.ajax({
							url : "selectDiary",
							type : "post",
							data : {
								diary_num : diary_num,
							},
							success : function(data){
									var title = data.diary_title;
									var content = data.diary_content;
									var weather = data.diary_weather;
									var friendlist = '';
									if(data.diary_friends!=null&&data.diary_friends.indexOf(",")>1){
										friendlist = data.diary_friends.split(",");
									}
									var r_num = data.r_num;
									var r_name = data.r_name;
									var r_phone = data.r_phone;
									var r_address = data.r_address;
									var r_lat = data.r_lat;
									var r_lon = data.r_lon;
									var r_rundate = data.r_rundate;
									var r_runtime = data.r_runtime;
									var r_lat = data.r_lat;
									var r_lon = data.r_lon;
									$('#deleteD').html('<button class="btn btn-outline-dark" style="float : right;" data-toggle = "modal" data-target="#confirmModal" id="deleteDiaryBtn">다이어리지우기</button>');
									$('deleteDiaryBtn').bind('click',deleteDiary(diary_num));
									
									
									$('#icons').html('<td><img id="diary_weather"></td><td colspan="2"></td><td><img src="/icons/icon1.png" id="icon1" data-toggle="modal" data-target="#myModal"></td><td><img src="/icons/icon2.png" id="icon2" data-toggle="modal" data-target="#myModal"></td><td><img src="/icons/icon3.png" id="icon3" data-toggle="modal" data-target="#myModal"></td>');
									$('#diary').html('<h2>'+title+'</h2>'+'<br>'+content);
									if(weather==1){
										$('#diary_weather').attr('src','/icons/sun.png');
									}else if(weather==2){
										$('#diary_weather').attr('src','/icons/cloud.png');
									}else if(weather==3){
										$('#diary_weather').attr('src','/icons/rain.png');
									}else if(weather==4){
										$('#diary_weather').attr('src','/icons/snow.png');
									}else if(weather==5){
										$('#diary_weather').attr('src','/icons/moon.png');
									}
									
									$.ajax({
										url : "diaryImage",
										data : {
											diary_num : diary_num
										},
										type : "post",
										success : function(data){
											var imagelist = data.split(",");
											var start = 0;
											var makeDiaryImage = function(){
												var result ='<td><img src="/icons/lessthan.png" id="lessthan"></td>';
												for(var i = start ; i<start+4;i++){
													if(imagelist[i]=="/icons/plusBtn.png"){
														result += '<td><img src="'+imagelist[i]+'" style="width : 50px; height : 50px; text-align : center;" class="diaryImageBtn" id = "'+imagelist[i]+'" data-toggle="modal" data-target="#myModal6"></td>';
													}else{
														if(imagelist[i]==undefined){
															result += '<td><img style="width : 50px; height : 50px; text-align : center;" class="diaryImageNotBtn"></td>';
														}else{
															result += '<td><img src="'+imagelist[i]+'" style="width : 50px; height : 50px; text-align : center;" class="diaryImageBtn" id = "'+imagelist[i]+'" data-toggle="modal" data-target="#myModal2"></td>';
														}
													}
												}
												result +='<td><img src="/icons/greaterthan.png" id="greaterthan"></td>';
												$('#photos').html(result);
												
												
												
												function readURL(input) {
										          if (input.files && input.files[0]) {
										            var reader = new FileReader();
										            reader.onload = function(e) {
														$('#diary_pic').after('<img id="uploadPreview" style="z-index: 0; width : 550px;" src="'+e.target.result+'" data-toggle="modal" data-target="#myModal3">');
														$('#diary_pic').after('<p id="tagExp">이미지를 클릭하여 태그를 입력해주세요</p>');
														$('#uploadPreview').on('click',function(){
															$('#tagSaveBtn').text('Save');
															var clix = event.clientX;
															var cliy = event.clientY-25;
															$('#myModal3 .modal-dialog').attr('style','left : ' + clix + 'px; top : '+ cliy + 'px;');
															var offx = event.offsetX;
															var offy = event.offsetY;
															$('#p_foodname').val('');
															$('#p_price').val('');
															$('#p_comment').val('');
															$('input:radio[name="emo"]:input[value="1"]').prop('checked',true);
															
															//save 버튼 눌렀을때
															writePhotoDeco(diary_num,offx,offy);
															myModal3Hidden();
														})
										            }
										            reader.readAsDataURL(input.files[0]);
										          }
										        }
												
										        $("#diary_pic").off().change(function() {
										          readURL(this);
										        });
										        $('#diaryImageSave1').off().on('click',function(){
													$.ajax({
														type : 'post',
														url : 'getDiaryNum',
														async : false,
														data : {diary_num : diary_num},
														success : function() {
														    alert("저장되었습니다.");
														}
													});
													$('#diaryImageNum').val(diary_num);
														var formData = new FormData($('#diaryImageForm')[0]);
														$.ajax({
														type : 'post',
														url : 'uploadDiaryImage',
														data : formData,
														processData : false,
														contentType : false,
														success : function(data) {
														    alert(data);
														    myModal6Hidden();
														},
														error : function(error) {
														    alert("파일 업로드에 실패하였습니다.");
														    myModal6Hidden(diary_num);
														}
													});
												})
												
										        
												
												$('#greaterthan').on('click',function(){
													if(imagelist.length<=start+4)
														start--;
													start++;
													makeDiaryImage();
												})
												$('#lessthan').on('click',function(){
													if(0==start)
														start++;
													start--;
													makeDiaryImage();
												})
												$('#photos .diaryImageBtn').off().on('click',function(){ // 밑에 4개 이미지 눌렀을때
													deleteImage(thisid);
													var thisid = $(this).attr('id');
													//데코들읽어옴
													readPhotoDeco(thisid);
													$('#myModal2Body').html('<img id="myModal3Image" style="z-index: 0;" src="'+thisid+'" data-toggle="modal" data-target="#myModal3">');
													// 모달안의 이미지 눌렀을때
													writeFormPhotoDeco(diary_num);
												})
											}
											makeDiaryImage();
										}
									})
									makeIcons(friendlist,r_name,r_phone,r_address,r_rundate,r_runtime);
							}
						})
					})
				}
			});
		}
		
		//달력으로 보기
		function makeCalendar(){
			$('#diary').html('');
			$('#icons').html('');
			$('#photos').html('');
			$('#anotherDiary').html('');
			$('#diary_weather').attr('src','');
			$('#deleteD').html('');
			$('#writeD').html('');
			var result='';
			//result+='<div class="card">';
			//result+='<div class="card-body">';
			
			result+='<table>';
			today = new Date(today.getFullYear()+'-'+(today.getMonth()+1)+'-'+today.getDate());
			result += '<tr><td><button class="btn" id = "preYear"><i class="fas fa-arrow-left"></i>Y</button></td>'
			result += '<td><button class="btn" id = "preMonth"><i class="fas fa-arrow-left"></i>M</button></td>'
			if(today.getMonth()+1<10){
				result += '<td colspan="3" id="today"><b>'+today.getFullYear()+'-0'+(today.getMonth()+1);
			}else{
				result += '<td colspan="3" id="today"><b>'+today.getFullYear()+'-'+(today.getMonth()+1);
			}
			if(today.getDate()<10){
				result += '-0'+today.getDate()+'</b></td>';
			}else{
				result += '-'+today.getDate()+'</b></td>';
			}
			result += '<td><button class="btn" id = "nextMonth">M<i class="fas fa-arrow-right"></i></button></td>'
			result += '<td><button class="btn" id = "nextYear">Y<i class="fas fa-arrow-right"></i></button></td></tr>'
			result += '<tr align="center"><th style=" color: red">Sun</th><th>Mon</th><th>Tue</th><th>Wed</th><th>Thu</th><th>Fri</th><th style=" color: blue">Sat</th></tr>'
			var startDay = new Date(today.getFullYear()+'-'+(today.getMonth()+1)+'-'+1);
			var lastDay = new Date(today.getFullYear(),(today.getMonth()+1),0);
			result += '<tr>'
			for(var i = 0; i<startDay.getDay(); i++){
				result += '<td></td>';
			}
			for(var i = 1; i<=lastDay.getDate(); i++){
				var dayId = '';
				if(today.getMonth()+1<10){
					dayId = today.getFullYear()+'-0'+(today.getMonth()+1);
				}else{
					dayId = today.getFullYear()+'-'+(today.getMonth()+1);
				}
				if(i<10){
					dayId += '-0'+i;
				}else{
					dayId += '-'+i;
				}
				var tempday = new Date(dayId);
				if(tempday.getDay()%7==6){
					result += '<td style=" color: blue" class ="doclick" id = "'+dayId+'">'+i+'</td>';
				}else if(tempday.getDay()%7==0){
					result += '<td style=" color: red" class ="doclick" id = "'+dayId+'">'+i+'</td>';
				}else{
					result += '<td id = "'+dayId+'" class ="doclick">'+i+'</td>';
				}
				if(tempday.getDay()%7==6){
					result += '</tr><tr>';
				}
			}
			result += '</tr></table>';
			
			$('#calendar').html(result);
			
			$('#preYear').on('click',function(){
				today = new Date((today.getFullYear()-1)+'-'+(today.getMonth()+1)+'-'+today.getDate());
				makeCalendar();
			});
			$('#preMonth').on('click',function(){
				if(today.getMonth()+1==1){
					today = new Date((today.getFullYear()-1)+'-'+(today.getMonth()+12)+'-'+today.getDate());
				}else{
					today = new Date(today.getFullYear()+'-'+today.getMonth()+'-'+today.getDate());
				}
				makeCalendar();
			});
			$('#nextMonth').on('click',function(){
				if(today.getMonth()+1==12){
					today = new Date((today.getFullYear()+1)+'-'+(today.getMonth()-10)+'-'+today.getDate());
				}else{
					today = new Date(today.getFullYear()+'-'+(today.getMonth()+2)+'-'+today.getDate());
				}
				makeCalendar();
			});
			$('#nextYear').on('click',function(){
				today = new Date((today.getFullYear()+1)+'-'+(today.getMonth()+1)+'-'+today.getDate());
				makeCalendar();
			});
			
			var thisid = '';
			var beforeid = '';
			var pageNum = 1;
			var startPage = 1;
			//달력 클릭했을때 실행
			$('#calendar .doclick').off().on('click',function calendarDoingClick(pagenum){
				if(pagenum.data!=undefined){
					pageNum = pagenum;
				}
				beforeid = thisid;
				
				if($(this).attr('id')!=undefined){
					thisid = $(this).attr('id');
				}
				if(thisid!=beforeid){
					pageNum = 1;
					startPage = 1;
				}
				today = new Date(thisid);
				$('#today').html(thisid);
				
				$('.doclick').css('background-color','');
				$('.doclick').css('font-weight','normal');
				$('#'+thisid).css('background-color','#ff9480');
				$('#'+thisid).css('font-weight','bold');
				
				$('#today').css('font-weight','bold');
				
				//초기화
				$('#diary').html('');
				$('#icons').html('');
				$('#photos').html('');
				$('#anotherDiary').html('');
				$('#deleteD').html('');
				$('#diary_weather').attr('src','');
				
				$('#writeD').html('<button class="btn btn-outline-secondary" data-toggle = "modal" data-target="#myModal4">다이어리쓰기</button>');
				
				myModal4Hidden();
				
				//레스토랑찾기버튼
				searchRestaurant();
				
				//친구검색버튼
				$('#fri_searchBtn').off().on('click',function(){
					getFriendList();
				})
				
				//다이어리쓰기의 save버튼
				diarySave(thisid);
				var diary_num = '';
				// 달력 클릭 후 오른쪽 내용 구성
				$.ajax({
					url : "myPageTab2Type1",
					type : "post",
					data : {
						diary_date : thisid,
					},
					success : function(data){
						if(data.length==0){
							$('#icons').html('');
							$('#photos').html('');
							$('#anotherDiary').html('');
							$('#diary_weather').html('');
							$('#diary').html('<h1>작성된 다이어리가 없습니다</h1>');
						}else{
							var index = pageNum-1;
							diary_num = data[index].diary_num;
							var title = data[index].diary_title;
							var content = data[index].diary_content;
							var weather = data[index].diary_weather;
							var friendlist = '';
							if(data[index].diary_friends!=null&&data[index].diary_friends.indexOf(",")>1){
								friendlist = data[index].diary_friends.split(",");
							}
							
							var r_name = data[index].r_name;
							var r_phone = data[index].r_phone;
							var r_address = data[index].r_address;
							var r_lat = data[index].r_lat;
							var r_lon = data[index].r_lon;
							var r_rundate = data[index].r_rundate;
							var r_runtime = data[index].r_runtime;
							var r_lat = data[index].r_lat;
							var r_lon = data[index].r_lon;
							$('#deleteD').html('<button class="btn btn-outline-secondary" data-toggle = "modal" data-target="#confirmModal" id="deleteDiaryBtn">다이어리지우기</button>');
							$('deleteDiaryBtn').bind('click',deleteDiary(diary_num));
							
							$('#icons').html('<td><img id="diary_weather"></td><td colspan="2"></td><td><img src="/icons/icon1.png" id="icon1" data-toggle="modal" data-target="#myModal"></td><td><img src="/icons/icon2.png" id="icon2" data-toggle="modal" data-target="#myModal"></td><td><img src="/icons/icon3.png" id="icon3" data-toggle="modal" data-target="#myModal"></td>');
							$('#diary').html('<h2>'+title+'</h2>'+'<br>'+content);
							if(weather==1){
								$('#diary_weather').attr('src','/icons/sun.png');
							}else if(weather==2){
								$('#diary_weather').attr('src','/icons/cloud.png');
							}else if(weather==3){
								$('#diary_weather').attr('src','/icons/rain.png');
							}else if(weather==4){
								$('#diary_weather').attr('src','/icons/snow.png');
							}else if(weather==5){
								$('#diary_weather').attr('src','/icons/moon.png');
							}
							var anotherDiary = '';
							if(startPage>4){
								anotherDiary += '<td><button class="btn btn-outline-dark" id="bePage"><</button></td>';
							}
							for(var i=startPage;i<=startPage+3;i++){
								if(i<=data.length){
									if(pageNum == i){
										anotherDiary += '<td><button class = "anotherPage" id="'+i+'"><b>'+i+'</b></button></td>';
									}else{
										anotherDiary += '<td><button class = "anotherPage" id="'+i+'">'+i+'</button></td>';
									}
								}
							}
							if(data.length>4&&startPage+3<data.length){
								anotherDiary += '<td><button id="afPage">></button></td>';
							}
							anotherDiary += '<td></td><td></td>';
							$('#anotherDiary').html(anotherDiary);
							
							$('.anotherPage').off().on('click',function(){
								pageNum = $(this).attr('id')*1;
								calendarDoingClick(pageNum);
							})
							$('#afPage').on('click',function(){
								startPage += 4;
								pageNum = startPage;
								calendarDoingClick(pageNum);
							})
							$('#bePage').on('click',function(){
								pageNum = startPage-1;
								startPage -= 4; 
								calendarDoingClick(pageNum);
							})
							$.ajax({
								url : "diaryImage",
								data : {
									diary_num : diary_num
								},
								type : "post",
								success : function(data){
									var imagelist = data.split(",");
									var start = 0;
									var makeDiaryImage = function(){
										var result ='<td><img src="/icons/lessthan.png" id="lessthan"></td>';
										for(var i = start ; i<start+4;i++){
											if(imagelist[i]=="/icons/plusBtn.png"){
												result += '<td><img src="'+imagelist[i]+'" style="width : 50px; height : 50px; text-align : center;" class="diaryImageBtn" id = "'+imagelist[i]+'" data-toggle="modal" data-target="#myModal6"></td>';
											}else{
												if(imagelist[i]==undefined){
													result += '<td><img style="width : 50px; height : 50px; text-align : center;" class="diaryImageNotBtn"></td>';
												}else{
													result += '<td><img src="'+imagelist[i]+'" style="width : 50px; height : 50px; text-align : center;" class="diaryImageBtn" id = "'+imagelist[i]+'" data-toggle="modal" data-target="#myModal2"></td>';
												}
											}
										}
										result +='<td><img src="/icons/greaterthan.png" id="greaterthan"></td>';
										$('#photos').html(result);
										function readURL(input) {
								          if (input.files && input.files[0]) {
								            var reader = new FileReader();
								            reader.onload = function(e) {
												$('#diary_pic').after('<img id="uploadPreview" style="z-index: 0; width : 550px;" src="'+e.target.result+'" data-toggle="modal" data-target="#myModal3">');
												$('#diary_pic').after('<p id="tagExp">이미지를 클릭하여 태그를 입력해주세요</p>');
												$('#uploadPreview').on('click',function(){
													$('#tagSaveBtn').text('Save');
													var clix = event.clientX;
													var cliy = event.clientY-25;
													$('#myModal3 .modal-dialog').attr('style','left : ' + clix + 'px; top : '+ cliy + 'px;');
													var offx = event.offsetX;
													var offy = event.offsetY;
													$('#p_foodname').val('');
													$('#p_price').val('');
													$('#p_comment').val('');
													$('input:radio[name="emo"]:input[value="1"]').prop('checked',true);
													//save 버튼 눌렀을때
													writePhotoDeco(diary_num,offx,offy);
													myModal3Hidden();
												})
								            }
								            reader.readAsDataURL(input.files[0]);
								          }
								        }
										
								        $("#diary_pic").off().change(function() {
								          readURL(this);
								        });
								        $('#diaryImageSave1').off().on('click',function(){
											 $.ajax({
									            type : 'post',
									            url : 'getDiaryNum',
									            async : false,
									            data : {diary_num : diary_num},
									            success : function() {
									                alert("업로드 완료.");
									            }
										      });
								        	$('#diaryImageNum').val(diary_num);
											var formData = new FormData($('#diaryImageForm')[0]);
											 $.ajax({
									            type : 'post',
									            url : 'uploadDiaryImage',
									            data : formData,
									            processData : false,
									            contentType : false,
									            success : function(data) {
									                alert(data);
									                myModal6Hidden();
									            },
									            error : function(error) {
									                alert("파일 업로드에 실패하였습니다.");
									                myModal6Hidden(diary_num);
									            }
										      });
										})
								        
										
										$('#greaterthan').on('click',function(){
											if(imagelist.length<=start+4)
												start--;
											start++;
											makeDiaryImage();
										})
										$('#lessthan').on('click',function(){
											if(0==start)
												start++;
											start--;
											makeDiaryImage();
										})
										$('#photos .diaryImageBtn').off().on('click',function(){ // 밑에 4개 이미지 눌렀을때
											var thisid = $(this).attr('id');
											deleteImage(thisid);
											readPhotoDeco(thisid);											
											$('#myModal2Body').html('<img id="myModal3Image" style="z-index: 0;" src="'+thisid+'" data-toggle="modal" data-target="#myModal3">');
											// 모달안의 이미지 눌렀을때
											
											writeFormPhotoDeco(diary_num);
										})
									}
									makeDiaryImage();
								}
							})
							makeIcons(friendlist,r_name,r_phone,r_address,r_rundate,r_runtime)
						}
					}
				})
			})
		}
	})
	
</script>
  <script src="http://code.jquery.com/jquery-latest.min.js"></script>
  <!-- <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script> -->

  <!-- bootstrap 4 버전 스크립트로 추가 -->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>

</body>

</html>