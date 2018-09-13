<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>

<link type="text/css" rel="stylesheet" href="css/jquery-te-1.4.0.css">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">

<script type="text/javascript"
	src="http://code.jquery.com/jquery.min.js" charset="utf-8"></script>
<script type="text/javascript" src="js/jquery-te-1.4.0.min.js"
	charset="utf-8"></script>

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

#preview{
	font-size: 0px;
}
#preview img {
	width: 130px;
	height: 100px;
}

#preview p {
	height: 30px;
	width: 140px;
	font-size : 16px;
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
	<form id="fileForm" action="fileUpload" method="post"
		enctype="multipart/form-data">
		<input type="hidden" name="r_num" value="${info.restaurant.r_num }">
		<input type="hidden" name="m_num" value="${email.m_num}"> <input
			type="hidden" name="grade" id="grade">

		<table width="90%" id="r_table" align="center">
			<tr>
				<td rowspan="2" width="30%" valign="top">
					<div id="rest_div">
						<div align="center">
							<img src="${info.imgs[0]}" class="rounded" width="400px">
						</div>
						<div id="rest_h_div" align="center">
							<span id="rest_h1">${info.restaurant.r_name }</span> <span
								id="rest_h2">${info.evaluation.grade }</span>
						</div>

						<!-- �����Է� -->
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
							<!-- ÷�� ��ư -->
							<div id="attach">
								<label for="uploadInputBox" class="btn btn-outline-dark">����÷��</label>
								<input id="uploadInputBox" style="display: none" type="file"
									name="filedata" multiple />
							</div>

							<!-- �̸����� ���� -->
							<div id="preview" class="content">
								<c:forEach var="img" items="${review.img}">
									<div class="preview-box btn btn-outline-secondary" value="${img}">
										<img class="thumbnail" src="${img}">
										<p>${img}</p>
										<button type="button" class="close" aria-label="Close"
											value="${img}" onclick="deleteImg(this)">
											<span aria-hidden="true">&times;</span>
										</button>
									</div>
								</c:forEach>
							</div>
						</div>
						<button type="button" class="btn btn-success" id="reviewbtn">�ۼ�</button>
					</div>
				</td>
			</tr>
		</table>
	</form>

	<script>
		$(".jqte-test").jqte({source: false});
		
		//���� �⺻����
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
        //������ file object����
        var files = {};
        var delfiles = {};
        var dcnt=0;
        var previewIndex = 0;
 
        // image preview ��� ����
        // input = file object[]
        function addPreview(input) {
            if (input[0].files) {
                //���� ������ ���������� ���� ����
                for (var fileIndex = 0; fileIndex < input[0].files.length; fileIndex++) {
                	console.log(input[0].files.length);
                    var file = input[0].files[fileIndex];
                    if(validation(file.name)) continue;
                    setPreviewForm(file);
                }
                $('#uploadInputBox').val('');
            } else
                alert('invalid file input'); // ÷��Ŭ�� �� ��ҽ��� ����å�� ������ �ʾҴ�.
        }
        
        function setPreviewForm(file, img){
            var reader = new FileReader();
            
            //div id="preview" ���� �����ڵ��߰�.
            //�� �κ��� �����ؼ� �̹��� ��ũ �� ���ϸ�, ������ ���� �ΰ������� �� �� ���� ���̴�.
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
 
        //preview �������� ���� ��ư Ŭ���� �ش� �̸������̹��� ���� ����
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
                alert('jpg, gif, png Ȯ���ڸ� ���ε� �����մϴ�.');
                return true;
            } else {
                return false;
            }
        }
 
        $(document).ready(function() {
            $('#reviewbtn').on('click',function() { 
            	var formData = new FormData($("#fileForm")[0]);
                for (var index = 0; index < previewIndex; index++) {
                    //formData ������ files��� �̸����� ������ �߰��Ѵ�.
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
                
                //ajax ������� multipart form�� �����Ѵ�.
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
                        //�� �κ��� �����ؼ� �پ��� �ൿ�� �� �� ������,
                        //���⼭�� �����͸� ���۹޾Ҵٸ� �����ϰ� OK ���� ������� �Ͽ���.
                        //-1 = �߸��� Ȯ���� ���ε�, -2 = �뷮�ʰ�, �׿� = ����(1)
                        if (result === -1) {
                            alert('jpg, gif, png Ȯ���ڸ� ���ε� �����մϴ�.');
                            // ���� ���� ...
                        } else if (result === -2) {
                            alert('������ 10MB�� �ʰ��Ͽ����ϴ�.');
                            // ���� ���� ...
                        } else {
                        	location.href="/RestaurantView?r_num="+${info.restaurant.r_num}
                        }
                    }
                });
            });
            // <input type=file> �±� ��� ����
            $('#attach input[type=file]').change(function() {
                addPreview($(this)); //preview form �߰��ϱ�
            });
        });
    </script>
</body>
</html>