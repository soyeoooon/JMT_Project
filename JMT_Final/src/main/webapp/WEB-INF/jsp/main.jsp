<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="header.jsp" %>
    
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>mainTest</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- <link rel="stylesheet" type="text/css" media="screen" href="main.css" /> -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
</head>

<style>

    #carouselExampleIndicators{
        text-align: center;
        height: 450px; 
        width: 99%; 
        
        left: 0.5%;
        margin-bottom: 50px;
    }

    div.RestList{
        height: 700px;
        width: 75%
        border: 1px solid black;
        overflow: auto;
        text-align: center;
    }

    div.RestList::-webkit-scrollbar {
        display: none;
    }

    .carousel-inner {
        height: 800px;
        width: 100%;
    } 
    .d-block {
        height: 800px;
        width: 100%;
    }
    
    .carousel-item{
    background-size:cover;
    }

</style>

<!-- <div class="header" style="text-align: center;">
        <h2>This area is belong to header</h2>
        <hr>
</div> -->

<body>
    <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
            <ol class="carousel-indicators">
                <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
            </ol>
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img class="d-block w-100" src="https://www.publicdomainpictures.net/pictures/240000/velka/board-with-greek-food-kagyana-pan.jpg" style="width: auto; height: 406px;" alt="First slide">
                    <div class="carousel-caption d-md-block">
                        <h3>당신의 음식 취향은 무엇인가요?</h3>
                        <p>by 맛있는녀석들</p>
                    </div>
                </div>
                <div class="carousel-item">
                    <img class="d-block w-100" src="https://www.publicdomainpictures.net/pictures/240000/velka/board-with-greek-food-kagyana-pan.jpg" style="height: 406px;" alt="Second slide">
                    <div class="carousel-caption d-md-block">
                            <h3>기록하고, 검색하고, 추천받으세요!</h3>
                            <p>by 맛있는녀석들</p>
                    </div>
                </div>
                <div class="carousel-item">
                    <img class="d-block w-100" src="https://www.publicdomainpictures.net/pictures/240000/velka/board-with-greek-food-kagyana-pan.jpg" style="height: 406px;" alt="Third slide">
                    <div class="carousel-caption d-md-block">
                        <h3>당신의 음식 취향을 위해!</h3>
                        <p>by 맛있는녀석들</p>
                    </div>
                </div>
            </div>
            <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
            </a>
            <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
            </a>
        </div>
    <script>

    $('.carousel').carousel({
        interval: 5000
    })
    </script>

    <div id="message1" style="text-align: center; margin-bottom: 50px;">
        <h3>당신을 위한 추천이 준비되었습니다.</h3><br>
        <button type="button" class="btn btn-outline-danger btn-lg" data-toggle="modal" data-target="#myModal" id="filter">필터적용하기</button>
    </div>

<!-- 모달 페이지 -->
<div class="modal fade" id="myModal">
    <div class="modal-dialog modal-lg">
      <div class="modal-content">
        <div class="modal-header">
            <h4 class="modal-title">필터적용</h4>
            <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        <div class="modal-body">
        
        </div>
        <div class="modal-footer">
            <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
            <button type="button" class="btn btn-warning" id="reset">초기화</button>
            <button type="button" class="btn btn-primary" id="apply" data-dismiss="modal">적용하기</button>
        </div>
        </div>
    </div>
</div>

<!-- 이미지 슬라이드 영역-->

<div class="RestList">

</div>        

<br><br>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
   $(function(){
      
      var getFilter = ''
      function filterInitialize(){
         getFilter = '';
         filterClick()
      }
      
      function deleteElse(str,big_num) {
         var tempstr = str.split('@');
         var returnStr = '';
         for(var i=0;i<tempstr.length;i++){
            if(tempstr[i].split('-')[0]==big_num){
               tempstr[i]='';
            }else{
               tempstr[i] = '@'+tempstr[i];
            }
         }
         for(var i=0;i<tempstr.length;i++){
            returnStr += tempstr[i];
         }
           return returnStr.substring(1,returnStr.length);
      }
      
      function midcateClick(big_num){
         $('.midcate').off().on('click',function inMidcateClick(conf){
            var   confirm = $(this).attr('class').split(' ')[3];
            if(confirm==big_num){
               if($(this).attr('class')=='btn btn-outline-info midcate '+big_num){
                  if($(this).text()=='ALL'){
                     $(this).siblings('button.'+big_num).attr('class','btn btn-outline-info midcate '+big_num)
                     $(this).attr('class','btn btn-info midcate '+big_num);
                     getFilter = deleteElse(getFilter,big_num)
                  }else{
                     $(this).attr('class','btn btn-info midcate '+big_num);
                     $('#ALL'+big_num).attr('class','btn btn-outline-info midcate '+big_num)
                     getFilter = getFilter.replace('@'+big_num+'-ALL','')
                  }
                  getFilter += '@'+big_num+'-'+$(this).text();
               }
               else{
                  $(this).attr('class','btn btn-outline-info midcate '+big_num);
                  getFilter = getFilter.replace('@'+big_num+'-'+$(this).text(),'')
               }
            }else{
               midcateClick(confirm);
            }
         })
      }
      function getMidCate(big_num,big_name,lastbig_num){
         midcateClick(big_num);
         $.ajax({
            data : {
               big_num : big_num
            },
            url : 'getMidCate',
            type : 'post',
            success : function(midcate){
               var result2 ='<h2 class="'+big_num+'">'+big_name+'</h2><hr class="'+big_num+'">';
               result2 += '<button class="btn btn-outline-info midcate '+big_num+'" id="ALL'+big_num+'">ALL</button>'
               for(var i=0;i<midcate.length;i++){
                  result2 += '<button class="btn btn-outline-info midcate '+big_num+'">'+midcate[i].mid_name+'</button>'
               }
               $('#'+lastbig_num).after(result2);
               midcateClick(big_num);
            }
         })
      }
      function deleteMidCate(big_num){
         $('.'+big_num).remove();
      }
      function bigcateClick(lastbig_num){
         $('.bigcate').on('click',function(){
            if($(this).attr('class')=='btn btn-outline-danger bigcate'){
               $(this).attr('class','btn btn-danger bigcate');
               getMidCate($(this).attr('id'),$(this).text(),lastbig_num)
            }
            else{
               $(this).attr('class','btn btn-outline-danger bigcate');
               deleteMidCate($(this).attr('id'));
            }
         })
      }
      
      function filterClick(){
         $('#modal-body').html('');
         var result = '';
         $.get('getBigCate',function(bigcate){
            for(var i=0;i<bigcate.length;i++){
               result += '<button class="btn btn-outline-danger bigcate" id="'+bigcate[i].big_num+'">'+bigcate[i].big_name+'</button>'
            }
            $('.modal-body').html(result);
            bigcateClick(bigcate[bigcate.length-1].big_num)
         })
      }
      
      $('#filter').off().on('click',function(){
         filterClick();
      })
      $('#reset').on('click',function(){
         filterInitialize();
      });
      
      function makeList(data){
         if(data.length==0){
        	//$('#message1').hide();
            $('.RestList').html('<h1>표시할 데이터가 존재하지 않습니다.</h1><br><button class="btn btn-outline-warning" onclick="location.href='+"'/selectForm'"+'">취향선택하기</button>');
         }else{
            var result = ''
            result +='<div class="container-fluid bg-3 text-center">';
            result +='<div class="row">';
            for(var i =0;i<data.length;i++){
               result +='<div class="col-sm-3">'
               result+='<div class="card">';
            	   $.ajax({
                       data : {
                            search : data[i].r_name,
                            //sigu : $('#group1').val()+' '+$('#group2').val()
                         },
                         url : 'searchImage',
                         type : 'post',
                         async : false,
                         success : function(image){
                          if(data[i].r_photo!=null)
                             result += '<img src="'+data[i].r_photo+'"  class="card-img-top" style="height: 200px;" alt="Image">';
                          else
                             result += '<img src="'+image+'"  class="card-img-top" style="height: 200px;" alt="Image" style="width:364px; height:243px;">'; 
                         }
                    })
				result += '<div class="card-body">';
               result +='<h5><a href="/RestaurantView?r_num='+data[i].r_num+'">'+data[i].r_name+'</a></h5>'
               result +='<p>'+data[i].r_address+'</p>'
               $.ajax({
                  url : 'getGrade',
                  data : {
                     r_num : data[i].r_num
                  },
                  type : 'post',
                  async : false,
                  success : function(data){
                     if(data!=0)
                        result +='<p>평점: '+data+'</p>'
                  }
               })
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
               result +='</div>'
               
               result+='</div></div>'
            }
               result +='</div>'
               result +='</div>'
            	  
            $('.RestList').html(result);
         }
      }
      function onload(getFilter){
         $.ajax({
            data :{
               filter : getFilter
            },
            url : 'getRecommend',
            type : 'post',
            success : function(data){
               makeList(data);
            }
         })
      }
      onload();
      $('#apply').on('click',function(){
         onload(getFilter)
      })
      
   })
</script>
<div>
    <jsp:include page="footer.jsp"></jsp:include>
</div>
</body>
</html>