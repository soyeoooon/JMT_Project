<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<title>Hello, world!</title>

<style type="text/css">

/*수정(v2) 전체 복붙*/
#ViewTimer{
  color: blue;
}

body {
  -webkit-background-size: cover;
  -moz-background-size: cover;
  -o-background-size: cover;
  background-size: cover;
  font-family: 'HelveticaNeue', 'Arial', sans-serif;
}

a {
  color: #58bff6;
  text-decoration: none;
}

a:hover {
  color: #aaa;
}

.pull-right {
  float: right;
}

.pull-left {
  float: left;
}

.clear-fix {
  clear: both;
}

div.logo {
  text-align: center;
  margin: 20px 20px 30px 20px;
  fill: #566375;
}

.head {
  padding: 40px 0px;
  10
  px
  0
}

.logo-active {
  fill: #44aacc !important;
}

#formWrapper {
  background: rgba(0, 0, 0, .2);
  width: 100%;
  height: 100%;
  position: absolute;
  top: 0;
  left: 0;
  transition: all .3s ease;
}

.darken-bg {
  background: rgba(0, 0, 0, .5) !important;
  transition: all .3s ease;
}

div#form {
  position: absolute;
  width: 360px;
  height: 320px;
  height: auto;
  background-color: #fff;
  margin: auto;
  border-radius: 5px;
  padding: 20px;
  left: 50%;
  top: 30%;
  margin-left: -180px;
  margin-top: -200px;
}

div.form-item {
  position: relative;
  display: block;
  margin-bottom: 40px;
}

input {
  transition: all .2s ease;
}

input.form-style {
  color: #8a8a8a;
  display: block;
  width: 100%;
  height: 44px;
  padding: 5px 5%;
  border: 1px solid #ccc;
  -moz-border-radius: 27px;
  -webkit-border-radius: 27px;
  border-radius: 27px;
  -moz-background-clip: padding;
  -webkit-background-clip: padding-box;
  background-clip: padding-box;
  background-color: #fff;
  font-family: 'HelveticaNeue', 'Arial', sans-serif;
  font-size: 105%;
  letter-spacing: .8px;
}

div.form-item .form-style:focus {
  outline: none;
  border: 1px solid #58bff6;
  color: #58bff6;
}

div.form-item p.formLabel {
  position: absolute;
  left: 26px;
  top: 10px;
  transition: all .4s ease;
  color: #bbb;
}

.formTop {
  top: -22px !important;
  left: 26px;
  background-color: #fff;
  padding: 0 5px;
  font-size: 14px;
  color: #58bff6 !important;
}

.formStatus {
  color: #8a8a8a !important;
}

button[type="button"].login {
  /* float: right; */
  align: center;
  width: 112px;
  height: 37px;
  -moz-border-radius: 19px;
  -webkit-border-radius: 19px;
  border-radius: 19px;
  -moz-background-clip: padding;
  -webkit-background-clip: padding-box;
  background-clip: padding-box;
  background-color: #55b1df;
  border: 1px solid #55b1df;
  border: none;
  color: #fff;
  font-weight: bold;
}

button[type="button"].login:hover {
  background-color: #fff;
  border: 1px solid #55b1df;
  color: #55b1df;
  cursor: pointer;
}

button[type="button"].login:focus {
  outline: none;
}

#line1{
  text-align: center;
}
</style>
</head>
<body>
  <!-- 수정(v2) -->
  <script type="text/javascript">
    //타이머
    var SetTime = '';
    //실행되고 있는 Interval고유번호
    var tid='';
    
    //카운트하면서 시각화
    function msg_time() { // 1초씩 카운트
      m = ("0" + Math.floor(SetTime / 60)).slice(-2) + ":" + ("0" + (SetTime % 60)).slice(-2);  // 남은 시간 계산
      $('#ViewTimer').text(m); 
      SetTime--;          // 1초씩 감소
      if (SetTime < 0) {      // 시간이 종료 되었으면..
        clearInterval(tid);   // 타이머 해제
      }
    }
    
    //재발급 횟수
    var cnt=0;
    
    //타이머 작동
    function TimerStart(){
      cnt++;
      $('#cnt').val(cnt);
      SetTime = 179;
      clearInterval(tid);
      tid=setInterval('msg_time()',1000)
      
      //이메일 보내기+타이머 초기화
      $.ajax({
        url:'/email_send',
        data:{'email':$('#email').val()},
        type:'post',
              success:function(data){
                if(data!=""){
                  $('#pw').val(data);
                }
              }
      })
    }
    
    //인증번호 확인버튼
    function Pw_Check(){
      $.ajax({
        url:'/pw_check',
        data:{'pw':$('#pw').val(),'pw_check':$('#pw_check').val(),'time':SetTime},
        type:'post',
              success:function(data){
                if(data=="인증"){
            $('#joinform').submit();
                }else{
                  alert(data);
                }
              }
      })
    }
  </script>






  <div id="formWrapper">

<div id="form">
<div class="logo">
<h1 class="text-center head">회원가입</h1>
</div>
      <form id="joinform" action="/join">
        <div class="form-item">
          <p class="formLabel">이메일</p>
          <input type="email" name="email" id="email" class="form-style" autocomplete="off" />
        </div>
        <div class="form-item">
          <p class="formLabel">이름 및 닉네임</p>
          <input type="text" name="name" id="name" class="form-style" autocomplete="off" />
        </div>
        <div class="form-item">
          <p class="formLabel">비밀번호 입력</p>
          <input type="password" name="pwd" id="password1" class="form-style" />
          <!-- <div class="pw-view"><i class="fa fa-eye"></i></div> -->
        </div>
        <div class="form-item">
          <p class="formLabel">비밀번호 확인</p>
          <input type="password" name="pwd" id="password2" class="form-style" />
        </div>
        <div id="line1">
          <button type="button" id="Modalbtn" class="login" class="close" data-target="#EmailModal" >가입하기</button>
          <div class="clear-fix"></div>
        </div>
      </form>
    </div>
</div>

  <!-- 수정(v2) -->
  <div class="modal fade" id="EmailModal">
    <div class="modal-dialog">
      <div class="modal-content">
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">인증절차</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
  
        <!-- Modal body -->
        <div class="modal-body">
          <form>
            <!-- 재발급 횟수 -->
            <input type="hidden" name="cnt" id="cnt">
            <!-- 발급 인증번호 -->
            <input type="hidden" name="pw" id="pw" value="478F2C25A413B65988">
            <!-- 입력 인증번호 -->
            <table width="100%" align="center">
              <tr>
                <td>
                  <input type="text" name="pw_check" id="pw_check" class="form-control">
                </td>
                <td>
                  <button type="button" onclick="TimerStart();" class="btn btn-primary">재발급</button>
                </td>
                <td>
                  남은시간
                  <div id="ViewTimer" align="center">
                    03:00
                  </div>
                </td>
              </tr>
            </table>
          </form>
        </div>
  
        <!-- Modal footer -->
        <div class="modal-footer">
          <button type="button" onclick="Pw_Check();" class="btn btn-success">확인</button>
        </div>
      </div>
    </div>
  </div>
     
  <!-- Optional JavaScript -->
  <!-- jQuery first, then Popper.js, then Bootstrap JS -->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
  
  <script type="text/javascript">
  $(document).ready(function(){
    var formInputs = $('input[type="email"],input[type="password"],input[type="text"]');
    formInputs.focus(function() {
         $(this).parent().children('p.formLabel').addClass('formTop');
         $('div#formWrapper').addClass('darken-bg');
         $('div.logo').addClass('logo-active');
    });
    formInputs.focusout(function() {
      if ($.trim($(this).val()).length == 0){
      $(this).parent().children('p.formLabel').removeClass('formTop');
      }
      $('div#formWrapper').removeClass('darken-bg');
      $('div.logo').removeClass('logo-active');
    });
    $('p.formLabel').click(function(){
       $(this).parent().children('.form-style').focus();
    });
    
    $('#password1,#password2').on('input',function(){
      if($('#password1').val()!='' && $('#password2').val()!=''){
             if($('#password1').val()!=$('#password2').val()){
                $('#password2').css('border','1px solid red')
             }
             else{
               $('#password2').css('border','')
             }
      }
      })
      
      $('#email').on('focusout',function(){
        if($('#email').val()==null){
          $('#email').css('border','1px solid red')
        }else{
          $.ajax({
              url:'/email_check',
              data:{'email':$('#email').val()},
              success:function(data){
                if(data==true){
                  $('#email').css('border','')
                }else{
                  $('#email').css('border','1px solid red')
                }
              }
             })         
        }
      })
      
      $('#Modalbtn').on('click',function(){
        $.ajax({
            url:'/email_check',
            data:{'email':$('#email').val()},
            success:function(data){
              if(data==true){
                if($('#password1').val()==$('#password2').val()){
                      $('#Modalbtn').attr('data-toggle','modal');
                      $('#EmailModal').modal();
                      TimerStart();
                    }else{
                      $('#Modalbtn').attr('data-toggle','');
                    }
              }
            }
           })         
      })
  });
  </script>

</body>
</html>




