<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>SelectionPage</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<style>
@import url(//netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.css);

    h1 {
        font-size: 50px;
    }

    p {
        font-size: 25px;
    }

    div.RestList{
        height: 700px;
        width: 75%
        border: 1px solid black;
        overflow: auto;
    }

    div.RestList::-webkit-scrollbar {
        display: none;
    }

    #container {
        height: 500px;
        background-color: rgb(240, 64, 33);
        margin: 0 auto;
    }

    #hashTags {
        margin-bottom: 0;
    }

    .searchArea {
        text-align: center;
        vertical-align: middle;
        color: aliceblue;
        padding: 100px;
    }

    .selectGroup {
        width: 100%;
        position: relative;
    }

    .ratingStarDiv {
        text-align: center;
        height: 70px;
    }
/*------------- star test ---------------*/


/* Ratings widget */
.rate {
    display: inline-block;
    border: 0;
}
/* Hide radio */
.rate > input {
    display: none;
}
/* Order correctly by floating highest to the right */
.rate > label {
    float: right;
}
/* The star of the show */
.rate > label:before {
    display: inline-block;
    font-size: 3rem;
    padding: .3rem .2rem;
    margin: 0;
    cursor: pointer;
    font-family: FontAwesome;
    content: "\f005"; /* full star */
}

/* Zero stars rating */
.rate > label:last-child:before {
    content: "\f005"; /* empty star outline */
}
/* Half star trick */
.rate .half:before {
    content: "\f089 "; /* half star no outline */
    position: absolute;
    padding-right: 0;
}

/* Click + hover color */
input:checked ~ label, /* color current and previous stars on checked */
label:hover, label:hover ~ label { color:tomato;  } /* color previous stars on hover */

/* Hover highlights */
input:checked + label:hover, input:checked ~ label:hover, /* highlight current and previous stars */
input:checked ~ label:hover ~ label, /* highlight previous selected stars for new rating */
label:hover ~ input:checked ~ label /* highlight previous selected stars */ { color: tomato;  } 

/*용화수정*/
.starRev{
	margin-top: 10px;
}

.starR1 {
	background:
		url('http://miuu227.godohosting.com/images/icon/ico_review.png')
		no-repeat -69px 0;
	background-size: auto 100%;
	width: 20px;
	height: 40px;
	float: left;
	text-indent: -9999px;
	cursor: pointer;
	text-indent: -9999px;
}

.starR2 {
	background:
		url('http://miuu227.godohosting.com/images/icon/ico_review.png')
		no-repeat right 0;
	background-size: auto 100%;
	width: 20px;
	height: 40px;
	float: left;
	text-indent: -9999px;
	cursor: pointer;
}

.starR1.on {
	background-position: 0 0;
}

.starR2.on {
	background-position: -20px 0;
}

.x_btn{
	border-radius: 30px;
	background: rgba(100,100,100,0.4);
	margin-bottom: 10px;
}
/*용화수정끝*/

</style>

<div class="header" style="text-align: center;">
        <h2>This area is belong to header</h2>
        <hr>
</div>

<body>
<!-- 검색 영역 -->
    <div id="container">
        <div class="searchArea">
            <h1>당신이 다녀왔던 맛집을 평가해주세요!</h1><br><br>
            <p>평가가 많을수록 나만을 위한 맛집 추천이 정확해집니다!</p>
            <br>
        </div>
        <form class="form-inline text-center">
            <div class="selectGroup">
                <select class="form-control" id="group1">
                    <option>시/도</option>
                    <option>1</option>
                    <option>2</option>
                    <option>3</option>
                    <option>4</option>
                </select>
                <select class="form-control" id="group2">
                    <option>구/군/동</option>
                    <option>1</option>
                    <option>2</option>
                    <option>3</option>
                    <option>4</option>
                </select>
                <input type="text" id='search' class="form-control" size="50px;" placeholder="음식점명을 입력하세요" required>
                    <button type="button" id='searchBtn' class="btn btn-danger">검색</button>
            </div>
            <div class="input-group">
            </div>
        </form>
    </div>

    <hr><br>

<!-- 버튼 영역(다음에 할게요)-->
    <div style="text-align: right; margin-bottom: 20px;">
        <button type="button" class="btn btn-outline-danger" onclick='location.href="/main"'>다음에 할게요</button>
    </div>

<!-- 음식점 리스트 영역 -->
    <div class="RestList">
        <div class="container-fluid bg-3 text-center">
            <br><br>

            <div class="row">
              
              </div><br>
         </div>
    </div>

   <script type="text/javascript">
   /* -----------------------------성록----------------------------- *//*-----------------------용화수정--------------------*/
      $(function(){
         var si = ['서울특별시','부산광역시','대구광역시','인천광역시','광주광역시','대전광역시','울산광역시','경기도','강원도','충청북도','충청남도','전라북도','전라남도','경상북도','경상남도','제주특별자치도']
         var gu = {
               '서울특별시' : ['종로구','중구','용산구','성동구','광진구','동대문구','중랑구','성북구','강북구','도봉구','노원구','은평구','서대문구','마포구','양천구','강서구','구로구','금천구','영등포구','동작구','관악구','서초구','강남구','송파구','강동구'],
               '부산광역시' : ['중구','서구','동구','영도구','부산진구','동래구','남구','북구','강서구','해운대구','사하구','금정구','연제구','수영구','사상구','기장군'],
               '대구광역시' : ['중구','동구','서구','남구','북구','수성구','달서구','달성군'],
               '인천광역시' : ['중구','동구','미추홀구','연수구','남동구','부평구','계양구','서구','강화군','옹진군'],
               '광주광역시' : ['동구','서구','남구','북구','광산구'],
               '대전광역시' : ['동구','중구','서구','유성구','대덕구'],
               '울산광역시' : ['중구','남구','동구','북구','울주군'],
               '경기도' : ['장안구','권선구','팔달구','영통구','수정구','중원구','분당구','만안구','동안구','상록구','단원구','처인구','기흥구','수지구','양평군','덕양구','일산동구','일산서구','연천군','가평군','광명시','평택시','과천시','오산시','시흥시','군포시','의왕시','하남시','이천시','안성시','김포시','화성시','광주시','여주시','부천시'],
               '강원도' : ['춘천시','원주시','강릉시','동해시','태백시','속초시','삼척시','홍천군','횡성군','영월군','평창군','정선군','철원군','화천군','양구군','인제군','고성군','양양군'],
               '충청북도' : ['상당구','서원구','흥덕구','청원구','보은군','옥천군','영동군','진천군','괴산군','음성군','단양군','증평군','충주시','제천시'],
               '충청남도' : ['동남구','서북구','금산군','부여군','서천군','청양군','홍성군','예산군','태안군','공주시','보령시','아산시','서산시','논산시','계룡시','당진시'],
               '전라북도' : ['완산구','덕진구','완주군','진안군','무주군','장수군','임실군','순창군','고창군','부안군','군산시','익산시','정읍시','남원시','김제시'],
               '전라남도' : ['담양군','곡성군','구례군','고흥군','보성군','화순군','장흥군','강진군','해남군','영암군','무안군','함평군','영광군','장성군','완도군','진도군','신안군','목포시','여수시','순천시','나주시','광양시'],
               '경상북도' : ['남구','북구','군위군','의성군','청송군','영양군','영덕군','청도군','고령군','성주군','칠곡군','예천군','봉화군','울진군','울릉군','경주시','김천시','안동시','구미시','영주시','영천시','상주시','문경시','경산시'],
               '경상남도' : ['의창구','성산구','마산합포구','마산회원구','진해구','의령군','함안군','창녕군','고성군','남해군','하동군','산청군','함양군','거창군','합천군','진주시','통영시','사천시','김해시','밀양시','거제시','양산시'],
               '제주특별자치도' : ['제주시','서귀포시']
         }
         var sigroup = '';
         var grade_list=new Object();
         
         for(var i =0;i<si.length;i++){
            sigroup += '<option value="'+si[i]+'">'+si[i]+'</option>'
         }
         $('#group1').html(sigroup);
         $('#group1').on('change',function(){
            var key = $('#group1').val();
            var gugroup = ''
            for(var i=0;i<gu[key].length;i++){
               gugroup += '<option value="'+gu[key][i]+'">'+gu[key][i]+'</option>'
            }
            $('#group2').html(gugroup);
         })
         function search(){
            $.ajax({
               url : 'searchRes',
               data : {
                  search : $('#group1').val()+' '+$('#group2').val()+' '+$('#search').val()
               },
               type : 'post',
               success : function(data){
            	   $('.row').html('');
                  for(var i = 0;i<data.length;i++){
	                 var result = '';
                     result += '<div class="col-sm-3" id="'+data[i].r_num+'">';
                     if(data[i].r_photo!=null)
                        result += '<img src="'+data[i].r_photo+'" class="img-responsive" style="width:100%" alt="Image">';
                     else
                        result += '<img src="https://upload.wikimedia.org/wikipedia/commons/2/2f/Culinary_fruits_front_view.jpg" class="img-responsive" style="width:100%" alt="Image">'; 
                     result += '<h2>'+data[i].r_name+'</h2>';
                     result += '<p class="name_p">'+data[i].r_address+'</p>';
                     /*수정(v1)*/
                     $.ajax({
                         url : 'getHashTag',
                         data : {
                            r_name : data[i].r_name,
                            r_address : data[i].r_address
                         },
                         type : 'post',
                         async : false,
                         success : function(foodNames){
                            if(foodNames.length>0){
                               result += '<p id="hashTags">'
                               for(var i =0;i<foodNames.length;i++){
                                  result += '<button type="button" class="btn btn-outline-danger">#'+foodNames[i]+'</button>'
                               }
                               result += '</p>';
                            }else{
                               result += '<p id="hashTags"></p>';
                            }
                         }
                      })
                     result += '<table width="100%"><tr><td></td><td width="210px"><div class="starRev" align="center"><span class="starR1 1">별1_왼쪽</span><span class="starR2 2">별1_오른쪽</span><span class="starR1 3">별2_왼쪽</span><span class="starR2 4">별2_오른쪽</span><span class="starR1 5">별3_왼쪽</span><span class="starR2 6">별3_오른쪽</span><span class="starR1 7">별4_왼쪽</span><span class="starR2 8">별4_오른쪽</span><span class="starR1 9">별5_왼쪽</span><span class="starR2 10">별5_오른쪽</span></div></td><td></td></tr></table><button class="x_btn">X</button></div>';
	                 $('.row').append(result);
	                 $("#"+data[i].r_num).find('.'+data[i].e_grade*2).addClass('on').prevAll('span').addClass('on');
	                 $("#"+data[i].r_num).find('.'+grade_list[data[i].r_num]*2).addClass('on').prevAll('span').addClass('on');
	                 
                  }
                  
                  $('.starRev span').click(function() {
               		var grade_val=0;
               		$(this).parent().children('span').removeClass('on');
               		$(this).addClass('on').prevAll('span').addClass('on');
               		grade_val = $(this).parent().children('.on').length * 0.5;
               		
               		var key=$(this).closest('.col-sm-3').attr('id');
               		grade_list[key]=grade_val;
               	  })
               	  $('.x_btn').click(function() {
               		var grade_val=0;
               		$(this).parent().find('span').removeClass('on');
               		
               		var key=$(this).closest('.col-sm-3').attr('id');
               		grade_list[key]=grade_val;
               	  })
               }
            })
         }
         $('#searchBtn').on('click',function(){
            search();
         })
         
         $('#saveBtn').on('click',function(){
             $.ajax({
                 type : 'POST',
                 url : '/select_save',
                 data : grade_list,
                 success : function(result) {
                	 
                 }
             })
         })

         search();
      })
      
      /* -----------------------------성록 끝----------------------------- */
   </script>
    <!-- 별점 저장 버튼-->
    <div style="text-align: center; margin: 20px;">
        <button class="btn btn-outline-danger btn-lg" id="saveBtn">저장하기</button>
    </div>
	<!-----------------------용화수정끝-------------------->    
    <div class="container1">
      <!-- 모달 팝업 -->
      <div class="modal fade" id="myModal">
         <div class="modal-dialog" style="width: 500px; height: 500px;">
            <div class="modal-content">
               <div class="modal-header">
                  <button type="button" class="close" data-dismiss="modal">
                     <span aria-hidden="true">×</span><span class="sr-only"></span>
                  </button>
                  <h4 class="modal-title" id="myModalLabel"></h4>
               </div>
               <div class="modal-body" id="myModalBody">
                  
               </div>
               <div class="modal-footer">
                  <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
               </div>
            </div>
         </div>
      </div>
   </div>

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
   <script
      src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
</body>
<div class=footer style="text-align: center">
        <hr>
        <hr>
        <h2>This area is belong to footer</h2>
        <hr>
</div>
</html>