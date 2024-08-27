<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script>
function findidCheck(){
	if(document.getElementById("userid").value==""){
		alert("아이디를 입력하세요.");
		return false;
	}
	if(document.getElementById("email").value==""){
		alert("이메일을 입력하세요.");
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
        <h2 class="textset-tit">아이디 찾기</h2>
        <p class="textset-desc">이름과 이메일을 입력해주세요.</p>
      </div>
      <ul class="contents-list">
        <li class="contents-item item-active">
          <span>1</span>
        </li>
        <li class="contents-item">
          <span>2</span>
      </ul>
    </div>
  </div>
</div>
<!-- 미니 헤더 -->



    <!-- 정보 입력 -->
    <form method="get" action="/sign/findId2" onsubmit="return findidCheck()" name="findform" id="findform">
    <div class="signup2" data-bid="cFLOX395dD">
      <div class="contents-inner">
        <div class="contents-container container-md">
          <div class="contents-top">
            <h2 class="contents-tit">정보 입력</h2>
            <span>이름, 이메일을 입력해주세요.</span>
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
              <h6 class="form-tit">이메일 <span>*</span>
              </h6>
              <div class="contents-form-group">
                <div class="inputset inputset-round">
                  <input type="text" name="email" id="email" class="inputset-input form-control" aria-label="내용">
                </div>
              </div>
            </div>
            <!-- 이름과 전화번호가 일치하지 않을 때-->
			<c:if test="${check == 1}">
				<script>
					opener.document.findform.username.value = "";
					opener.document.findform.email.value = "";
				</script>
				
				
			</c:if>

			<!-- 이름과 비밀번호가 일치하지 않을 때 -->
			<c:if test="${check == 0 }">
				window.location.href="/sign/findId2";
			
			</c:if>
            
              </div>
            </div>
 		  <div class="contents-btn-group">
            <input type="submit" class="btnset btnset-round" value="다음">
          </div>
          </div>
         
        </div>
      </div>
    </div>
    <!-- 정보 입력 끝 -->
    </form>
  </main>