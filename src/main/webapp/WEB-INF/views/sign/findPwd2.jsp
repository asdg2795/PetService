<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>

<!-- jQuery UI -->
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
<script>
 function findPwdCheck(){
	if(document.getElementById("userpwd").value==""){
		alert("비밀번호를 입력하세요.");
		return false;
	}
	if(document.getElementById("userpwd2").value==""){
		alert("비밀번호 재입력을 입력하세요.");
		return false;
	}
	if(document.getElementById("userpwd").value != document.getElementById("userpwd2").value){
		alert("비밀번호가 다릅니다.");
        return false;
	}
	return true;
}
 

 </script>
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
        <li class="contents-item item-check">
          <span>1</span>
        </li>
        <li class="contents-item item-active">
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
    <form method="get" action="/sign/findPwd3" onsubmit="return findPwdCheck()">
    <input type="hidden" name="userid" value="${svo.userid}">
    
    
    <div class="signup2" data-bid="cFLOX395dD">
      <div class="contents-inner">
        <div class="contents-container container-md">
          <div class="contents-top">
            <h2 class="contents-tit">비밀번호 변경</h2>
            <span>새로운 비밀번호를 입력해주세요.</span>
          </div>
          <div class="contents-group">

            <div class="form-wrap">
              <h6 class="form-tit">비밀번호<span>*</span>
              </h6>
              <div class="inputset inputset-round">
                <input type="password" name="userpwd" id="userpwd" class="inputset-input form-control" aria-label="내용" >
              </div>
            </div>

            <div class="form-wrap">
              <h6 class="form-tit">비밀번호 재입력 <span>*</span>
              </h6>
              <div class="inputset inputset-round">
                <input type="password" name="userpwd2" id="userpwd2" class="inputset-input form-control" aria-label="내용">
              </div>
            </div>
            <br><br>
            <span>* 비밀번호는 8~32자의 영문 대소문자, 숫자, 특수문자를 조합하여 설정해주세요.</span><br>
            <span>* 다른 사이트에서 사용하는 것과 동일하거나 쉬운 비밀번호는 사용하지 마세요.</span><br>
            <span>* 안전한 계정 사용을 위해 비밀번호는 주기적으로 변경해 주세요.</span>

          </div>
          
          <div class="contents-btn-group">
          	<input type="submit" class="btnset btnset-round" value="확인">
          </div>
        </div>
      </div>
    </div>
    <!-- 정보 입력 끝 -->
    </form>
  </main>