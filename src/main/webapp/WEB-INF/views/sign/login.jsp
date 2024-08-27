<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script>
function loginCheck(){
	if(document.getElementById("userid").value==""){
		alert("아이디를 입력하세요.");
		return false;
	}
	if(document.getElementById("userpwd").value==""){
		alert("비밀번호를 입력하세요.");
		return false;
	}
	return true;
}
</script>

<main class="th-layout-main ">
    <!-- 로그인 시작 -->
    <form method="post" action="/sign/loginOk" onsubmit="return loginCheck()">
    <div class="login" data-bid="VIloWO5yJS" id="">
      <div class="contents-inner">
        <div class="contents-container">
          <div class="textset">
            <h2 class="textset-tit">로그인</h2>
            <p class="textset-desc">TEOTS에 오신 것을 환영합니다</p>
          </div>
          <div class="contents-form">
            <div class="inputset inputset-round">
              <input type="text" name="userid" id="userid" class="inputset-input form-control" aria-label="내용" placeholder="아이디를 입력해주세요">
            </div>
            <div class="inputset inputset-round">
              <input type="password" name="userpwd" id="userpwd" class="inputset-input form-control" aria-label="내용" placeholder="비밀번호를 입력해주세요">
            </div>
            <div class="contents-util">
              <div class="checkset">
                <input id="checkset-a-1-1" class="checkset-input input-round" type="checkbox" value="" checked="">
                <div class="contents-find">
                <a href="/sign/check" class="contents-find">회원가입</a>
             </div>
             </div>
              
              <div class="contents-find">
                <a href="/sign/findId">아이디 찾기</a>
                <a href="/sign/findPwd">비밀번호 찾기</a>
              </div>
            </div>
            <div class="contents-btnset">
           	  <input type="submit" value="로그인" class="btnset btnset-round">
              <input type="button" value="회원가입" class="btnset btnset-round btnset-line" onclick="redirectToSignUp()">
              
              <script>
			    function redirectToSignUp() {
			        // JavaScript를 사용하여 페이지 이동
			       location.href = "/sign/check";
			    }
			</script>
            </div>
          </div>
          <div class="contents-start">
          </div>
        </div>
      </div>
    </div>
    <!-- 로그인 끝 -->
    </form>
  </main>
