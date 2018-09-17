<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
<script src="/js/Carousel.js"></script>
<title>jQuery Carousel.js Rotator Plugin Demo</title>
<style>
.poster-item img {
	border-radius: 5px;
}

.poster-main {
	position: relative;
	margin: 100px auto;
	max-width: 1000px;
}

.poster-main .poster-list .poster-item {
	position: absolute;
	left: 0;
	top: 0;
	list-style: none;
}

.poster-main .poster-btn {
	position: absolute;
	top: 0;
	cursor: pointer;
}

.poster-main .poster-prev-btn {
	left: 0;
	background: url("img/btn_l.png") no-repeat center center;
}

.poster-main .poster-next-btn {
	right: 0;
	background: url("img/btn_r.png") no-repeat center center;
}

#img_modify_img{width: 100%;}
</style>
</head>
<body>
	<div class="poster-main" id="carousel"
		data-setting='{
							"width":1000,
							"height":300,
							"posterWidth":300,
							"posterHeight":300,
							"scale":0.8,
							"speed":1000,
							"autoPlay":false,
							"delay":3000,
							"verticalAlign":"middle"
							}'>

		<div class="poster-btn poster-prev-btn"></div>
		<ul class="poster-list">
			<c:forEach var="img" items="${info.imgs}" varStatus="i">
				<li class="poster-item">
					<a href="#">
						<img src=${img} alt="" width="100%" id="slide_img${i.count}"/>
					</a>
				</li>
			</c:forEach>
		</ul>
		<div class="poster-btn poster-next-btn"></div>
	</div>
	
	<!-- 
	<div class="modal fade" id="imageModal">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title">대표이미지 설정</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>

				<div class="modal-body">
					<form id="fileForm" action="fileUpload" method="post" enctype="multipart/form-data">
						<input type="hidden" name="r_num" value="${info.restaurant.r_num}">
						<input type="hidden" name="r_photo" id="f_r_photo">
						<table width="100%">
							<tr>
								<td colspan="2">
									<img src="img/No_Image.jpg" id="img_modify_img" class="rounded">
								</td>
							</tr>
							<tr>
								<td>
									<div class="input-group-prepend">
								      <span class="input-group-text"><img src="img/restaurant/이미지.png"></span>
								    </div>
								</td>
								<td>
							        <input type="file" id="img_modify_name" name="fileUp" class="form-control-file border"/>
								</td>
							</tr>
						</table>
				    </form>
				</div>

				<div class="modal-footer">
					<button type="button" class="btn btn-success" data-dismiss="modal" onClick="fileSubmit();">Modify</button>
					<button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
	 -->
	 
	<script>
		$(function() {
			Carousel.init($("#carousel"));
			$("#carousel").init();
		});
		
		$('.poster-item img').click(function(){
			$('#imageModal').modal('show');
			$('#img_modify_img').attr('src', $(this).attr('src'));
			$('#f_r_photo').val($(this).attr('src'));
		})
		
		/*
		$('#img_modify_name').on('change',function(){
			var input=this;
            if (input.files && input.files[0]) {
	            var reader = new FileReader();
	            reader.onload = function (e) {
                    $('#img_modify_img').attr('src', e.target.result);
                }
              reader.readAsDataURL(input.files[0]);
            }
		})
		
		function fileSubmit() {
	        var formData = new FormData($("#fileForm")[0]);
	        $.ajax({
	            type : 'post',
	            url : 'fileUpload',
	            data : formData,
	            processData : false,
	            contentType : false,
	            success : function(data) {
	                for (var i = 0; i < data.length; i++) {
	                	$('#slide_img'+(i+1)).attr('src',data[i]);
					}
	            },
	            error : function(error) {
	            	alert(error);
	            }
	        });
	    }	
		*/
	</script>
</body>
</html>
