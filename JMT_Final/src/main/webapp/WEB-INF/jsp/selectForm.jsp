<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>SelectionPage</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" type="text/css" media="screen" href="main.css" />

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
                <input type="text" class="form-control" size="50px;" placeholder="음식점명을 입력하세요" required>
                    <button type="button" class="btn btn-danger">검색</button>
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
                <div class="col-sm-3">
                    <img src="https://upload.wikimedia.org/wikipedia/commons/2/2f/Culinary_fruits_front_view.jpg" class="img-responsive" style="width:100%" alt="Image">
                    <h2>Restaurant Name</h2>
                    <p>서울시 강남구</p>
                    <p id="hashTags">
                        <button type="button" class="btn btn-outline-danger">#소고기스테이크</button>
                        <button type="button" class="btn btn-outline-danger">#로제파스타</button>
                    </p>
                    <div class="ratingStarDiv">
                        <fieldset class="rate">
                            <input type="radio" id="rating10" name="rating" value="10" /><label for="rating10" title="5 stars"></label>
                            <input type="radio" id="rating9" name="rating" value="9" /><label class="half" for="rating9" title="4 1/2 stars"></label>
                            <input type="radio" id="rating8" name="rating" value="8" /><label for="rating8" title="4 stars"></label>
                            <input type="radio" id="rating7" name="rating" value="7" /><label class="half" for="rating7" title="3 1/2 stars"></label>
                            <input type="radio" id="rating6" name="rating" value="6" /><label for="rating6" title="3 stars"></label>
                            <input type="radio" id="rating5" name="rating" value="5" /><label class="half" for="rating5" title="2 1/2 stars"></label>
                            <input type="radio" id="rating4" name="rating" value="4" /><label for="rating4" title="2 stars"></label>
                            <input type="radio" id="rating3" name="rating" value="3" /><label class="half" for="rating3" title="1 1/2 stars"></label>
                            <input type="radio" id="rating2" name="rating" value="2" /><label for="rating2" title="1 star"></label>
                            <input type="radio" id="rating1" name="rating" value="1" /><label class="half" for="rating1" title="1 star"></label>
                        </fieldset>
                    </div>
                </div>
                <div class="col-sm-3">
                <img src="https://upload.wikimedia.org/wikipedia/commons/2/2f/Culinary_fruits_front_view.jpg" class="img-responsive" style="width:100%" alt="Image">
                <h2>Restaurant Name</h2>
                <p>서울시 강남구</p>
                <p id="hashTags">
                    <button type="button" class="btn btn-outline-danger">#돈코츠라멘</button>
                    <button type="button" class="btn btn-outline-danger">#차슈덮밥</button>
                    <button type="button" class="btn btn-outline-danger">#일본가정식</button>
                </p>
                <div class="ratingStarDiv">
                        <fieldset class="rate">
                            <input type="radio" id="rating10" name="rating" value="10" /><label for="rating10" title="5 stars"></label>
                            <input type="radio" id="rating9" name="rating" value="9" /><label class="half" for="rating9" title="4 1/2 stars"></label>
                            <input type="radio" id="rating8" name="rating" value="8" /><label for="rating8" title="4 stars"></label>
                            <input type="radio" id="rating7" name="rating" value="7" /><label class="half" for="rating7" title="3 1/2 stars"></label>
                            <input type="radio" id="rating6" name="rating" value="6" /><label for="rating6" title="3 stars"></label>
                            <input type="radio" id="rating5" name="rating" value="5" /><label class="half" for="rating5" title="2 1/2 stars"></label>
                            <input type="radio" id="rating4" name="rating" value="4" /><label for="rating4" title="2 stars"></label>
                            <input type="radio" id="rating3" name="rating" value="3" /><label class="half" for="rating3" title="1 1/2 stars"></label>
                            <input type="radio" id="rating2" name="rating" value="2" /><label for="rating2" title="1 star"></label>
                            <input type="radio" id="rating1" name="rating" value="1" /><label class="half" for="rating1" title="1 star"></label>
                        </fieldset>
                    </div>
                </div>
                <div class="col-sm-3"> 
                <img src="https://upload.wikimedia.org/wikipedia/commons/2/2f/Culinary_fruits_front_view.jpg" class="img-responsive" style="width:100%" alt="Image">
                <h2>Restaurant Name</h2>
                <p>서울시 강남구</p>
                <p id="hashTags">
                    <button type="button" class="btn btn-outline-danger">#전주비빔밥</button>
                    <button type="button" class="btn btn-outline-danger">#물만두</button>
                </p>
                    <div class="ratingStarDiv">
                        <fieldset class="rate">
                            <input type="radio" id="rating10" name="rating" value="10" /><label for="rating10" title="5 stars"></label>
                            <input type="radio" id="rating9" name="rating" value="9" /><label class="half" for="rating9" title="4 1/2 stars"></label>
                            <input type="radio" id="rating8" name="rating" value="8" /><label for="rating8" title="4 stars"></label>
                            <input type="radio" id="rating7" name="rating" value="7" /><label class="half" for="rating7" title="3 1/2 stars"></label>
                            <input type="radio" id="rating6" name="rating" value="6" /><label for="rating6" title="3 stars"></label>
                            <input type="radio" id="rating5" name="rating" value="5" /><label class="half" for="rating5" title="2 1/2 stars"></label>
                            <input type="radio" id="rating4" name="rating" value="4" /><label for="rating4" title="2 stars"></label>
                            <input type="radio" id="rating3" name="rating" value="3" /><label class="half" for="rating3" title="1 1/2 stars"></label>
                            <input type="radio" id="rating2" name="rating" value="2" /><label for="rating2" title="1 star"></label>
                            <input type="radio" id="rating1" name="rating" value="1" /><label class="half" for="rating1" title="1 star"></label>
                        </fieldset>
                    </div>
                </div>
                <div class="col-sm-3">
                <img src="https://upload.wikimedia.org/wikipedia/commons/2/2f/Culinary_fruits_front_view.jpg" class="img-responsive" style="width:100%" alt="Image">
                <h2>Restaurant Name</h2>
                <p>서울시 강남구</p>
                <p id="hashTags">
                    <button type="button" class="btn btn-outline-danger">#평양식물냉면</button>
                    <button type="button" class="btn btn-outline-danger">#특선비빔냉면</button>
                </p>
                <div class="ratingStarDiv">
                        <fieldset class="rate">
                            <input type="radio" id="rating10" name="rating" value="10" /><label for="rating10" title="5 stars"></label>
                            <input type="radio" id="rating9" name="rating" value="9" /><label class="half" for="rating9" title="4 1/2 stars"></label>
                            <input type="radio" id="rating8" name="rating" value="8" /><label for="rating8" title="4 stars"></label>
                            <input type="radio" id="rating7" name="rating" value="7" /><label class="half" for="rating7" title="3 1/2 stars"></label>
                            <input type="radio" id="rating6" name="rating" value="6" /><label for="rating6" title="3 stars"></label>
                            <input type="radio" id="rating5" name="rating" value="5" /><label class="half" for="rating5" title="2 1/2 stars"></label>
                            <input type="radio" id="rating4" name="rating" value="4" /><label for="rating4" title="2 stars"></label>
                            <input type="radio" id="rating3" name="rating" value="3" /><label class="half" for="rating3" title="1 1/2 stars"></label>
                            <input type="radio" id="rating2" name="rating" value="2" /><label for="rating2" title="1 star"></label>
                            <input type="radio" id="rating1" name="rating" value="1" /><label class="half" for="rating1" title="1 star"></label>
                        </fieldset>
                    </div>
                </div>
            </div>
        </div><br>
    
        <div class="container-fluid bg-3 text-center">    
            <div class="row">
                <div class="col-sm-3">
                <img src="https://upload.wikimedia.org/wikipedia/commons/2/2f/Culinary_fruits_front_view.jpg" class="img-responsive" style="width:100%" alt="Image">
                <h2>Restaurant Name</h2>
                <p>평점: 3.5</p>
                <p>서울시 강남구</p>
                </div>
                <div class="col-sm-3"> 
                <img src="https://upload.wikimedia.org/wikipedia/commons/2/2f/Culinary_fruits_front_view.jpg" class="img-responsive" style="width:100%" alt="Image">
                <h2>Restaurant Name</h2>
                <p>평점: 3.5</p>
                <p>서울시 강남구</p>
                </div>
                <div class="col-sm-3"> 
                <img src="https://upload.wikimedia.org/wikipedia/commons/2/2f/Culinary_fruits_front_view.jpg" class="img-responsive" style="width:100%" alt="Image">
                <h2>Restaurant Name</h2>
                <p>평점: 3.5</p>
                <p>서울시 강남구</p>
                </div>
                <div class="col-sm-3">
                <img src="https://upload.wikimedia.org/wikipedia/commons/2/2f/Culinary_fruits_front_view.jpg" class="img-responsive" style="width:100%" alt="Image">
                <h2>Restaurant Name</h2>
                <p>평점: 3.5</p>
                <p>서울시 강남구</p>
                </div>
            </div>
        </div><br>
    
            <div class="container-fluid bg-3 text-center">    
            <div class="row">
                <div class="col-sm-3">
                <img src="https://upload.wikimedia.org/wikipedia/commons/2/2f/Culinary_fruits_front_view.jpg" class="img-responsive" style="width:100%" alt="Image">
                <p>Restaurant Name</p>
                <p>평점: 3.5</p>
                <p>서울시 강남구</p>
                </div>
                <div class="col-sm-3"> 
                <img src="https://upload.wikimedia.org/wikipedia/commons/2/2f/Culinary_fruits_front_view.jpg" class="img-responsive" style="width:100%" alt="Image">
                <p>Restaurant Name</p>
                <p>평점: 3.5</p>
                <p>서울시 강남구</p>
                </div>
                <div class="col-sm-3"> 
                <img src="https://upload.wikimedia.org/wikipedia/commons/2/2f/Culinary_fruits_front_view.jpg" class="img-responsive" style="width:100%" alt="Image">
                <p>Restaurant Name</p>
                <p>평점: 3.5</p>
                <p>서울시 강남구</p>
                </div>
                <div class="col-sm-3">
                <img src="https://upload.wikimedia.org/wikipedia/commons/2/2f/Culinary_fruits_front_view.jpg" class="img-responsive" style="width:100%" alt="Image">
                <p>Restaurant Name</p>
                <p>평점: 3.5</p>
                <p>서울시 강남구</p>
                </div>
            </div>
        </div><br>
    
            <div class="container-fluid bg-3 text-center">    
            <div class="row">
                <div class="col-sm-3">
                <img src="https://upload.wikimedia.org/wikipedia/commons/2/2f/Culinary_fruits_front_view.jpg" class="img-responsive" style="width:100%" alt="Image">
                <p>Restaurant Name</p>
                <p>평점: 3.5</p>
                <p>서울시 강남구</p>
                </div>
                <div class="col-sm-3"> 
                <img src="https://upload.wikimedia.org/wikipedia/commons/2/2f/Culinary_fruits_front_view.jpg" class="img-responsive" style="width:100%" alt="Image">
                <p>Restaurant Name</p>
                <p>평점: 3.5</p>
                <p>서울시 강남구</p>
                </div>
                <div class="col-sm-3"> 
                <img src="https://upload.wikimedia.org/wikipedia/commons/2/2f/Culinary_fruits_front_view.jpg" class="img-responsive" style="width:100%" alt="Image">
                <p>Restaurant Name</p>
                <p>평점: 3.5</p>
                <p>서울시 강남구</p>
                </div>
                <div class="col-sm-3">
                <img src="https://upload.wikimedia.org/wikipedia/commons/2/2f/Culinary_fruits_front_view.jpg" class="img-responsive" style="width:100%" alt="Image">
                <p>Restaurant Name</p>
                <p>평점: 3.5</p>
                <p>서울시 강남구</p>
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

    <!-- 별점 저장 버튼-->
    <div style="text-align: center; margin: 20px;">
        <button class="btn btn-outline-danger btn-lg">저장하기</button>
    </div>



</body>
<div class=footer style="text-align: center">
        <hr>
        <hr>
        <h2>This area is belong to footer</h2>
        <hr>
</div>

</html>