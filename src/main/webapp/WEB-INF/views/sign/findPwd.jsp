<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>

<!-- jQuery UI -->
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
<script>
function findPwdCheck(){
	if(document.getElementById("userid").value==""){
		alert("아이디를 입력하세요.");
		return false;
	}
	if(document.getElementById("username").value==""){
		alert("이름을 입력하세요.");
		return false;
	}
	if(document.getElementById("email").value==""){
		alert("이메일을 입력하세요.");
		return false;
	}
	return true;
}
</script>
<script>
var code="";
$(function(){
	$("#findBtn").click(function(){
		var email = $("#email").val();
		var checkBox = $("#mail_check_input");
		var boxWrap = $("#mail_check_input_box");
		
		$.ajax({
			type:"GET",
			url	: "mailCheck?email="+email,
			success : function(data){
				console.log("data : "+data);
				checkBox.attr("disabled", false);
				boxWrap.attr("id", "mail_check_input_box_true");
				code = data;
			}
		});
	});
	$("#mail_check_input").blur(function(){
		var inputCode = $("#mail_check_input").val();
		var checkResult = $("#mail_check_input_box_warn");
		
		if(inputCode == code){
			checkResult.html("인증번호가 일치합니다.");
			checkResult.attr("class","correct");
		}else{
			checkResult.html("인증번호를 다시 확인해주세요.");
			checkResult.attr("class", "incorrect");
		}
	})
});
</script>

<style>
	 #mail_check_input_box_false{
	 	background-color:white;
	 }
	 #mail_check_input_box_true{
	 	background-color:gery;
	 }
	 .correct{
	 	color:green;
	 }
	 .incorrect{
	 	color:red;
	 }
</style>
 <main class="th-layout-main ">
 <!-- 미니 헤더 -->
 <div class="signup" data-bid="AYlOX3956t">
  <div class="contents-inner">
    <div class="contents-container container-md">
      <div class="textset">
        <h2 class="textset-tit">비밀번호 찾기</h2>
        <p class="textset-desc">아이디와 이메일 인증을 통해 비밀번호를 변경할 수 있습니다.</p>
      </div>
      <ul class="contents-list">
        <li class="contents-item item-active">
          <span>1</span>
        </li>
        <li class="contents-item">
          <span>2</span>
        </li>
        <li class="contents-item">
          <span>3</span>
        </li>
      </ul>
    </div>
  </div>
</div>
<!-- 미니 헤더 -->



    <!-- 정보 입력 -->
 <form method="get" action="/sign/findPwd2" onsubmit="return findPwdCheck()">
    <div class="signup2" data-bid="cFLOX395dD">
      <div class="contents-inner">
        <div class="contents-container container-md">
          <div class="contents-top">
            <h2 class="contents-tit">정보 입력</h2>
            <span>이름, 아이디, 이메일을 입력해주세요.</span>
          </div>
          <div class="contents-group">

            <div class="form-wrap">
              <h6 class="form-tit">이름 <span>*</span>
              </h6>
              <div class="inputset inputset-round">
                <input type="text" name="username" id="username" class="inputset-input form-control" aria-label="내용">
              </div>
            </div>

            <div class="form-wrap">
              <h6 class="form-tit">아이디 <span>*</span>
              </h6>
              <div class="inputset inputset-round">
                <input type="text" name="userid" id="userid" class="inputset-input form-control" aria-label="내용">
              </div>
            </div>


            <div class="form-wrap">
              <h6 class="form-tit">이메일 <span>*</span>
              </h6>
              <div class="contents-form-group">
                <div class="inputset inputset-round"  id="mail_check_input_box_false">
                  <input type="text" name="email" id="email" class="inputset-input form-control" aria-label="내용">
                </div>
                <input type="button" class="btnset btnset-round" id="findBtn" value="인증번호 받기">
              </div>
            </div>

            
            <div class="form-wrap">
              <h6 class="form-tit">인증 번호 <span>*</span>
              </h6>
              <div class="inputset inputset-round" id="mail_check_input_box">
                <input type="text" id="mail_check_input" disabled="disabled" class="inputset-input form-control" aria-label="내용" required="">
                <button class="showTooltipButton">인증 번호가 오지 않나요?</button>
                <div class="tooltip" id="tooltip">TEOTS가 발송한 메일이 스팸 메일로 분류된 것은 아닌지 확인해 주세요. <br> 스팸 메일함에도 메일이 없다면, 다시 한 번 '인증 번호 받기'를 눌러주세요.</div>
              </div>
              <span id="mail_check_input_box_warn"></span>
            </div>
              </div>
            </div>

          </div>
              
          <div class="contents-btn-group">
          	<input type="submit" class="btnset btnset-round"  value="다음">
          </div>
        </div>
      </div>
    </div>
    <!-- 정보 입력 끝 -->
   </form>
  </main>