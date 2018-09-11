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
        height: 100%;
        width: 99%;
        left: 0.5%;
        margin-bottom: 50px;
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

    .carousel-inner {
        height: 800px;
        width: 100%;
    }
    .d-block {
        height: 800px;
        width: 100%;
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
                    <img class="d-block w-100" src="https://www.publicdomainpictures.net/pictures/240000/velka/board-with-greek-food-kagyana-pan.jpg" alt="First slide">
                    <div class="carousel-caption d-md-block">
                        <h3>당신의 음식 취향은 무엇인가요?</h3>
                        <p>by 맛있는녀석들</p>
                    </div>
                </div>
                <div class="carousel-item">
                    <img class="d-block w-100" src="https://www.publicdomainpictures.net/pictures/240000/velka/board-with-greek-food-kagyana-pan.jpg" alt="Second slide">
                    <div class="carousel-caption d-md-block">
                            <h3>기록하고, 검색하고, 추천받으세요!</h3>
                            <p>by 맛있는녀석들</p>
                    </div>
                </div>
                <div class="carousel-item">
                    <img class="d-block w-100" src="https://www.publicdomainpictures.net/pictures/240000/velka/board-with-greek-food-kagyana-pan.jpg" alt="Third slide">
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

    <div style="text-align: center; margin-bottom: 50px;">
        <h3>당신을 위한 추천이 준비되었습니다.</h3><br>
        <button type="button" class="btn btn-outline-danger btn-lg" data-toggle="modal" data-target="#myModal">필터적용하기</button>
    </div>

<!-- 모달 페이지 -->
<div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog modal-lg">
      <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">필터적용</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            <div class="modal-body">
                <p>모달페이지</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary">적용하기</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
            </div>
            </div>
        </div>
    </div>
</div>

<!-- 이미지 슬라이드 영역-->
<div class="RestList">
    <div class="container-fluid bg-3 text-center">
        
        <div class="row">
            <div class="col-sm-3">
            <img src="https://upload.wikimedia.org/wikipedia/commons/2/2f/Culinary_fruits_front_view.jpg" class="img-responsive" style="width:100%" alt="Image">
            <h2>Restaurant Name</h2>
            <p>서울시 강남구</p>
            <p>평점: 3.5</p>
            <p>
                <button type="button" class="btn btn-outline-danger">#소고기스테이크</button>
                <button type="button" class="btn btn-outline-danger">#로제파스타</button>
                <button type="button" class="btn btn-outline-danger">#이색적인</button>
            </p>
            </div>
            <div class="col-sm-3">
            <img src="https://upload.wikimedia.org/wikipedia/commons/2/2f/Culinary_fruits_front_view.jpg" class="img-responsive" style="width:100%" alt="Image">
            <h2>Restaurant Name</h2>
            <p>서울시 강남구</p>
            <p>평점: 3.5</p>
            <p>
                <button type="button" class="btn btn-outline-danger">#돈코츠라멘</button>
                <button type="button" class="btn btn-outline-danger">#차슈덮밥</button>
                <button type="button" class="btn btn-outline-danger">#일본가정식</button>
            </p>
            </div>
            <div class="col-sm-3"> 
            <img src="https://upload.wikimedia.org/wikipedia/commons/2/2f/Culinary_fruits_front_view.jpg" class="img-responsive" style="width:100%" alt="Image">
            <h2>Restaurant Name</h2>
            <p>서울시 강남구</p>
            <p>평점: 3.5</p>
            <p>
                <button type="button" class="btn btn-outline-danger">#전주비빔밥</button>
                <button type="button" class="btn btn-outline-danger">#물만두</button>
            </p>
            </div>
            <div class="col-sm-3">
            <img src="https://upload.wikimedia.org/wikipedia/commons/2/2f/Culinary_fruits_front_view.jpg" class="img-responsive" style="width:100%" alt="Image">
            <h2>Restaurant Name</h2>
            <p>서울시 강남구</p>
            <p>평점: 3.5</p>
            <p>
                <button type="button" class="btn btn-outline-danger">#평양식물냉면</button>
                <button type="button" class="btn btn-outline-danger">#특선비빔냉면</button>
            </p>
            </div>
        </div>
    </div><br>

    <div class="container-fluid bg-3 text-center">    
        <div class="row">
            <div class="col-sm-3">
            <img src="https://upload.wikimedia.org/wikipedia/commons/2/2f/Culinary_fruits_front_view.jpg" class="img-responsive" style="width:100%" alt="Image">
            <h2>Restaurant Name</h2>
            <p>서울시 강남구</p>
            <p>평점: 3.5</p>
            </div>
            <div class="col-sm-3"> 
            <img src="https://upload.wikimedia.org/wikipedia/commons/2/2f/Culinary_fruits_front_view.jpg" class="img-responsive" style="width:100%" alt="Image">
            <h2>Restaurant Name</h2>
            <p>서울시 강남구</p>
            <p>평점: 3.5</p>
            </div>
            <div class="col-sm-3"> 
            <img src="https://upload.wikimedia.org/wikipedia/commons/2/2f/Culinary_fruits_front_view.jpg" class="img-responsive" style="width:100%" alt="Image">
            <h2>Restaurant Name</h2>
            <p>서울시 강남구</p>
            <p>평점: 3.5</p>
            </div>
            <div class="col-sm-3">
            <img src="https://upload.wikimedia.org/wikipedia/commons/2/2f/Culinary_fruits_front_view.jpg" class="img-responsive" style="width:100%" alt="Image">
            <h2>Restaurant Name</h2>
            <p>서울시 강남구</p>
            <p>평점: 3.5</p>
            </div>
        </div>
    </div><br>

        <div class="container-fluid bg-3 text-center">    
        <div class="row">
            <div class="col-sm-3">
            <img src="https://upload.wikimedia.org/wikipedia/commons/2/2f/Culinary_fruits_front_view.jpg" class="img-responsive" style="width:100%" alt="Image">
            <p>Restaurant Name</p>
            <p>서울시 강남구</p>
            <p>평점: 3.5</p>
            </div>
            <div class="col-sm-3"> 
            <img src="https://upload.wikimedia.org/wikipedia/commons/2/2f/Culinary_fruits_front_view.jpg" class="img-responsive" style="width:100%" alt="Image">
            <p>Restaurant Name</p>
            <p>서울시 강남구</p>
            <p>평점: 3.5</p>
            </div>
            <div class="col-sm-3"> 
            <img src="https://upload.wikimedia.org/wikipedia/commons/2/2f/Culinary_fruits_front_view.jpg" class="img-responsive" style="width:100%" alt="Image">
            <p>Restaurant Name</p>
            <p>서울시 강남구</p>
            <p>평점: 3.5</p>
            </div>
            <div class="col-sm-3">
            <img src="https://upload.wikimedia.org/wikipedia/commons/2/2f/Culinary_fruits_front_view.jpg" class="img-responsive" style="width:100%" alt="Image">
            <p>Restaurant Name</p>
            <p>서울시 강남구</p>
            <p>평점: 3.5</p>
            </div>
        </div>
    </div><br>

        <div class="container-fluid bg-3 text-center">    
        <div class="row">
            <div class="col-sm-3">
            <img src="https://upload.wikimedia.org/wikipedia/commons/2/2f/Culinary_fruits_front_view.jpg" class="img-responsive" style="width:100%" alt="Image">
            <p>Restaurant Name</p>
            <p>서울시 강남구</p>
            <p>평점: 3.5</p>
            </div>
            <div class="col-sm-3"> 
            <img src="https://upload.wikimedia.org/wikipedia/commons/2/2f/Culinary_fruits_front_view.jpg" class="img-responsive" style="width:100%" alt="Image">
            <p>Restaurant Name</p>
            <p>서울시 강남구</p>
            <p>평점: 3.5</p>
            </div>
            <div class="col-sm-3"> 
            <img src="https://upload.wikimedia.org/wikipedia/commons/2/2f/Culinary_fruits_front_view.jpg" class="img-responsive" style="width:100%" alt="Image">
            <p>Restaurant Name</p>
            <p>서울시 강남구</p>
            <p>평점: 3.5</p>
            </div>
            <div class="col-sm-3">
            <img src="https://upload.wikimedia.org/wikipedia/commons/2/2f/Culinary_fruits_front_view.jpg" class="img-responsive" style="width:100%" alt="Image">
            <p>Restaurant Name</p>
            <p>서울시 강남구</p>
            <p>평점: 3.5</p>
            </div>
        </div>
    </div><br>

        <div class="container-fluid bg-3 text-center">    
        <div class="row">
            <div class="col-sm-3">
            <img src="https://upload.wikimedia.org/wikipedia/commons/2/2f/Culinary_fruits_front_view.jpg" class="img-responsive" style="width:100%" alt="Image">
            <p>Restaurant 5</p>
            </div>
            <div class="col-sm-3"> 
            <img src="https://upload.wikimedia.org/wikipedia/commons/2/2f/Culinary_fruits_front_view.jpg" class="img-responsive" style="width:100%" alt="Image">
            <p>Restaurant 6</p>
            </div>
            <div class="col-sm-3"> 
            <img src="https://upload.wikimedia.org/wikipedia/commons/2/2f/Culinary_fruits_front_view.jpg" class="img-responsive" style="width:100%" alt="Image">
            <p>Restaurant 7</p>
            </div>
            <div class="col-sm-3">
            <img src="https://upload.wikimedia.org/wikipedia/commons/2/2f/Culinary_fruits_front_view.jpg" class="img-responsive" style="width:100%" alt="Image">
            <p>Restaurant 8</p>
            </div>
        </div>
    </div><br>

        <div class="container-fluid bg-3 text-center">    
        <div class="row">
            <div class="col-sm-3">
            <img src="https://upload.wikimedia.org/wikipedia/commons/2/2f/Culinary_fruits_front_view.jpg" class="img-responsive" style="width:100%" alt="Image">
            <p>Restaurant 5</p>
            </div>
            <div class="col-sm-3"> 
            <img src="https://upload.wikimedia.org/wikipedia/commons/2/2f/Culinary_fruits_front_view.jpg" class="img-responsive" style="width:100%" alt="Image">
            <p>Restaurant 6</p>
            </div>
            <div class="col-sm-3"> 
            <img src="https://upload.wikimedia.org/wikipedia/commons/2/2f/Culinary_fruits_front_view.jpg" class="img-responsive" style="width:100%" alt="Image">
            <p>Restaurant 7</p>
            </div>
            <div class="col-sm-3">
            <img src="https://upload.wikimedia.org/wikipedia/commons/2/2f/Culinary_fruits_front_view.jpg" class="img-responsive" style="width:100%" alt="Image">
            <p>Restaurant 8</p>
            </div>
        </div>
    </div><br>

        <div class="container-fluid bg-3 text-center">    
        <div class="row">
            <div class="col-sm-3">
            <img src="https://upload.wikimedia.org/wikipedia/commons/2/2f/Culinary_fruits_front_view.jpg" class="img-responsive" style="width:100%" alt="Image">
            <p>Restaurant 5</p>
            </div>
            <div class="col-sm-3"> 
            <img src="https://upload.wikimedia.org/wikipedia/commons/2/2f/Culinary_fruits_front_view.jpg" class="img-responsive" style="width:100%" alt="Image">
            <p>Restaurant 6</p>
            </div>
            <div class="col-sm-3"> 
            <img src="https://upload.wikimedia.org/wikipedia/commons/2/2f/Culinary_fruits_front_view.jpg" class="img-responsive" style="width:100%" alt="Image">
            <p>Restaurant 7</p>
            </div>
            <div class="col-sm-3">
            <img src="https://upload.wikimedia.org/wikipedia/commons/2/2f/Culinary_fruits_front_view.jpg" class="img-responsive" style="width:100%" alt="Image">
            <p>Restaurant 8</p>
            </div>
        </div>
    </div><br>

        <div class="container-fluid bg-3 text-center">    
        <div class="row">
            <div class="col-sm-3">
            <img src="https://upload.wikimedia.org/wikipedia/commons/2/2f/Culinary_fruits_front_view.jpg" class="img-responsive" style="width:100%" alt="Image">
            <p>Restaurant 5</p>
            </div>
            <div class="col-sm-3"> 
            <img src="https://upload.wikimedia.org/wikipedia/commons/2/2f/Culinary_fruits_front_view.jpg" class="img-responsive" style="width:100%" alt="Image">
            <p>Restaurant 6</p>
            </div>
            <div class="col-sm-3"> 
            <img src="https://upload.wikimedia.org/wikipedia/commons/2/2f/Culinary_fruits_front_view.jpg" class="img-responsive" style="width:100%" alt="Image">
            <p>Restaurant 7</p>
            </div>
            <div class="col-sm-3">
            <img src="https://upload.wikimedia.org/wikipedia/commons/2/2f/Culinary_fruits_front_view.jpg" class="img-responsive" style="width:100%" alt="Image">
            <p>Restaurant 8</p>
            </div>
        </div>
    </div><br>
</div>

<br><br>


<div>
    <jsp:include page="footer.jsp"></jsp:include>
</div>
</body>
</html>