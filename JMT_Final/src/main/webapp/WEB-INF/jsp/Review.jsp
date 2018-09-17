<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<link type="text/css" rel="stylesheet" href="css/jquery-te-1.4.0.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">

<script type="text/javascript" src="http://code.jquery.com/jquery.min.js" charset="utf-8"></script>
<script type="text/javascript" src="js/jquery-te-1.4.0.min.js" charset="utf-8"></script>

<style type="text/css">
#rest_div {
	margin-top: 30px;
}

#rest_h1 {
	font-size: 20pt;
	font-weight: bold;
}

.jqte_editor {
	height: 150px;
	max-height: 150px;
	width: 100%;
	max-width: 100%;
}

#reviewbtn {
	margin: 40px auto;
	float: right;
}

#preview {
	font-size: 0px;
}

#preview img {
	width: 130px;
	height: 100px;
}

#preview p {
	height: 30px;
	width: 140px;
	font-size: 16px;
	overflow: hidden;
	text-overflow: ellipsis;
}

.preview-box {
	width: 140px;
	height: 180px;
	border: 1px solid;
	padding: 5px;
	border-radius: 2px;
	margin: 5px;
	display: inline-block;
	vertical-align: top;
}
</style>

</head>
<body>

  <div>
 <br><br><br>

    <div>
      <form id="fileForm" action="fileUpload" method="post" enctype="multipart/form-data">
        <input type="hidden" name="r_num" value="${info.restaurant.r_num }"> <input type="hidden" name="m_num" value="${email.m_num}"> <input type="hidden" name="grade" id="grade">

        <table width="90%" id="r_table" align="center">
          <tr>
            <td rowspan="2" width="30%" valign="top">
              <div id="rest_div">
                <div align="center">
                  <img src="${info.imgs[0]}" class="rounded" width="400px">
                </div>
                <div id="rest_h_div" align="center">
                  <span id="rest_h1">${info.restaurant.r_name }</span> <span id="rest_h2">${info.evaluation.grade }</span>
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
              </div>
            </td>
            <td width="60%" valign="top">
              <div id="rv_div">
                <textarea name="textarea" class="jqte-test">${review.info.rev_content}</textarea>
                <div class="body">
                  <!-- 첨부 버튼 -->
                  <div id="attach">
                    <label for="uploadInputBox" class="btn btn-outline-dark">사진첨부</label> <input id="uploadInputBox" style="display: none" type="file" name="filedata" multiple />
                  </div>

                  <!-- 미리보기 영역 -->
                  <div id="preview" class="content">
                    <c:forEach var="img" items="${review.img}">
                      <div class="preview-box btn btn-outline-secondary" value="${img}">
                        <img class="thumbnail" src="${img}">
                        <p>${img}</p>
                        <button type="button" class="close" aria-label="Close" value="${img}" onclick="deleteImg(this)">
                          <span aria-hidden="true">&times;</span>
                        </button>
                      </div>
                    </c:forEach>
                  </div>
                </div>
                <button type="button" class="btn btn-success" id="reviewbtn">작성</button>
              </div>
            </td>
          </tr>
        </table>
      </form>
    </div>

  </div>

  <script>
		$(".jqte-test").jqte({source: false});
		
		//평점 기본정보
		$(function(){
			$('#grade').val(${info.user.e_grade});
			var grade=0;
			if(${review==null}){
				grade='${info.user.e_grade}';
			}else{
				grade='${review.info.rev_grade}';
			}
			$('#'+grade*2).addClass('on').prevAll('span').addClass('on');
		});
	</script>

  <script>
        //임의의 file object영역
        var files = {};
        var delfiles = {};
        var dcnt=0;
        var previewIndex = 0;
 
        // image preview 기능 구현
        // input = file object[]
        function addPreview(input) {
            if (input[0].files) {
                //파일 선택이 여러개였을 시의 대응
                for (var fileIndex = 0; fileIndex < input[0].files.length; fileIndex++) {
                	console.log(input[0].files.length);
                    var file = input[0].files[fileIndex];
                    if(validation(file.name)) continue;
                    setPreviewForm(file);
                }
                $('#uploadInputBox').val('');
            } else
                alert('invalid file input'); // 첨부클릭 후 취소시의 대응책은 세우지 않았다.
        }
        
        function setPreviewForm(file, img){
            var reader = new FileReader();
            
            //div id="preview" 내에 동적코드추가.
            //이 부분을 수정해서 이미지 링크 외 파일명, 사이즈 등의 부가설명을 할 수 있을 것이다.
            reader.onload = function(img) {
                var imgNum = previewIndex++;
                $("#preview").append(
                        "<div class=\"preview-box btn btn-outline-secondary\" value=\"" + imgNum +"\">" +
                        "<img class=\"thumbnail\" src=\"" + img.target.result + "\"\/>" +
                        "<p>" + file.name + "</p>" +
                        "<button type=\"button\" class=\"close\" aria-label=\"Close\" value=\"" + imgNum + "\" onclick=\"deletePreview(this)\">"
                        +"<span aria-hidden=\"true\">&times;</span>"
                        +"</button>"
                        + "</div>"
                );
                files[imgNum] = file;
            };
            reader.readAsDataURL(file);
        }
 
        //preview 영역에서 삭제 버튼 클릭시 해당 미리보기이미지 영역 삭제
        function deletePreview(obj) {
            var imgNum = obj.attributes['value'].value;
            delete files[imgNum];
            $("#preview .preview-box[value=" + imgNum + "]").remove();
        }
        
        function deleteImg(obj) {
            var img = obj.attributes['value'].value;
            delfiles[dcnt]=img;
            dcnt++;
            $(obj).parent().remove();
        }
 
        //client-side validation
        //always server-side validation required
        function validation(fileName) {
            fileName = fileName + "";
            var fileNameExtensionIndex = fileName.lastIndexOf('.') + 1;
            var fileNameExtension = fileName.toLowerCase().substring(
                    fileNameExtensionIndex, fileName.length);
            if (!((fileNameExtension === 'jpg')
                    || (fileNameExtension === 'gif') || (fileNameExtension === 'png'))) {
                alert('jpg, gif, png 확장자만 업로드 가능합니다.');
                return true;
            } else {
                return false;
            }
        }
 
        $(document).ready(function() {
            $('#reviewbtn').on('click',function() { 
            	var formData = new FormData($("#fileForm")[0]);
                for (var index = 0; index < previewIndex; index++) {
                    //formData 공간에 files라는 이름으로 파일을 추가한다.
                    if(files[index]!=null){
                    	formData.append('files',files[index]);
                    }
                }
                for (var index = 0; index < dcnt; index++) {
                   	formData.append('delfiles',delfiles[index]);
                }
                
                if(${review==null}){
                	formData.append('status',1);
                }else{
                	formData.append('status',2);
                	formData.append('rev_num',${review.info.rev_num});
                }
                
                //ajax 통신으로 multipart form을 전송한다.
                $.ajax({
                    type : 'POST',
                    enctype : 'multipart/form-data',
                    processData : false,
                    contentType : false,
                    cache : false,
                    timeout : 600000,
                    url : '/review_write',
                    dataType : 'JSON',
                    data : formData,
                    success : function(result) {
                        //이 부분을 수정해서 다양한 행동을 할 수 있으며,
                        //여기서는 데이터를 전송받았다면 순수하게 OK 만을 보내기로 하였다.
                        //-1 = 잘못된 확장자 업로드, -2 = 용량초과, 그외 = 성공(1)
                        if (result === -1) {
                            alert('jpg, gif, png 확장자만 업로드 가능합니다.');
                            // 이후 동작 ...
                        } else if (result === -2) {
                            alert('파일이 10MB를 초과하였습니다.');
                            // 이후 동작 ...
                        } else {
                        	location.href="/RestaurantView?r_num="+${info.restaurant.r_num}
                        }
                    }
                });
            });
            // <input type=file> 태그 기능 구현
            $('#attach input[type=file]').change(function() {
                addPreview($(this)); //preview form 추가하기
            });
        });
    </script>
   <div><br><br><br><br><br>
   <jsp:include page="footer.jsp"></jsp:include></div>
</body>
</html>