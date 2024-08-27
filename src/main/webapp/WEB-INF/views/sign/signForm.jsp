<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
  <!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>

<!-- jQuery UI -->
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
 <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
 <script>
 $(function(){
 	//아이디 중복검사
 	$("input[value='중복확인']").click(function(){
 		if($("#userid").val()==""){
 			alert("아이디를 입력 후 중복검사 하세요");
 			return;
 		}
 		window.open("/sign/idCheck?userid="+$("#userid").val(),"idCheck","width=100px, height:100px;");
 	});
 	$("#userid").keyup(function(){
 		$("#chk").val("N");
 	});
 	//우편번호 찾기
 	$("input[value='우편번호 검색']").click(function(){
 		new daum.Postcode({
 			oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('zipcode').value = data.zonecode;
                document.getElementById("addr").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("addrdetail").focus();
            }
        }).open();
 	});
 	
 	//유효성검사
 	$("#userfrm").submit(function(){
 		var reg = /^\w{8,14}$/
 	if(!reg.test($("#userid").val())){
 		alert("아이디는 영어 대소문자, 숫자, 특수문자만 허용하며 길이는 8~14글자 사이여야 합니다.");
 		return false;
 	}
 	if($('#chk').val() === "N"){
 		alert("아이디 중복검사를 하세요.");
 		return false;
 	}
 	if($("#userpwd").val() === "" || $("#userpwd2").val() === ""){
 		alert("비밀번호를 입력하세요");
 		return false;
 	}
 	if($("#userpwd").val() !== $("#userpwd2").val()){
 		alert("비밀번호가 다릅니다.");
 		return false;
 	}
 	reg = /^[가-힣]{2,10}$/
 	if(!reg.test($("#username").val())){
 		alert("이름을 잘못입력하였습니다.");
 		return false;
 	}
 	reg=/^[0-9]{11}$/
 	let tel = $("#tel").val();
 	if(!reg.test(tel)){
 		alert("전화번호를 잘못입력하셨습니다.");
 		return false;
 	} 
 	
 	let email = $("#email1").val() + "@"+$("#email2").val();
 	return true;
  });
});
 
 </script>
 <main class="th-layout-main ">
 <!-- 미니 헤더 -->
    <div class="signup" data-bid="AYlOX3956t">
      <div class="contents-inner">
        <div class="contents-container container-md">
          <div class="textset">
            <h2 class="textset-tit">회원가입</h2>
            <p class="textset-desc">TEOTS에 오신 것을 환영합니다</p>
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
    <form method="post" action="${pageContext.servletContext.contextPath}/sign/userFormOk" id="userfrm">
    <div class="signup2" data-bid="cFLOX395dD">
      <div class="contents-inner">
        <div class="contents-container container-md">
          <div class="contents-top">
            <h2 class="contents-tit">정보입력</h2>
            <span>* 표시는 반드시 입력하셔야 하는 항목입니다</span>
          </div>
          <div class="contents-group">
            <div class="form-wrap">
              <h6 class="form-tit">아이디 <span>*</span>
              </h6>
              <div class="contents-form-group">
                <div class="inputset inputset-round">
                  <input type="text" name="userid" id="userid" class="inputset-input form-control" aria-label="내용" required="">
                </div>
                <!-- <button class="btnset btnset-round" type="button">중복확인</button> -->
                <input type="button" value="중복확인" class="btnset btnset-round">
                <input type="hidden" name="chk" id="chk" value="N"/>
              </div>
            </div>
            <div class="form-wrap">
              <h6 class="form-tit">비밀번호 <span>*</span>
              </h6>
              <div class="inputset inputset-round">
                <input type="password" name="userpwd" id="userpwd" class="inputset-input form-control" aria-label="내용" required="">
              </div>
            </div>
            <div class="form-wrap">
              <h6 class="form-tit">비밀번호 확인 <span>*</span>
              </h6>
              <div class="inputset inputset-round">
                <input type="password" name="userpwd2" id="userpwd2" class="inputset-input form-control" aria-label="내용" required="">
              </div>
            </div>
            <div class="form-wrap">
              <h6 class="form-tit">이름 <span>*</span>
              </h6>
              <div class="inputset inputset-round">
                <input type="text" name="username" id="username" class="inputset-input form-control" aria-label="내용" required="">
              </div>
            </div>
            <div class="form-wrap">
              <h6 class="form-tit">이메일 <span>*</span>
              </h6>
              <div class="contents-form-group">
                <div class="inputset inputset-round">
                  <div class="contents-mail">
                    <input type="text" class="inputset-input form-control" name="email1" id="email1" aria-label="내용" required="">
                    <span>@</span>
                    <input type="text" class="inputset-input form-control" name="email2" id="email2"aria-label="내용" required="">
                  </div>
                </div>
              </div>
              <div class="selectset selectset-round selectset-md">
                <button class="selectset-toggle btn" type="button">
                  <span>선택해주세요</span>
                </button>
                <ul class="selectset-list">
                  <li class="selectset-item">
                    <button class="selectset-link btn" type="button" data-value="직접입력" selected="">
                      <span>직접입력</span>
                    </button>
                  </li>
                  <li class="selectset-item">
                    <button class="selectset-link btn" type="button" data-value="naver.com">
                      <span>naver.com</span>
                    </button>
                  </li>
                  <li class="selectset-item">
                    <button class="selectset-link btn" type="button" data-value="gmail.com">
                      <span>gmail.com</span>
                    </button>
                  </li>
                  <li class="selectset-item">
                    <button class="selectset-link btn" type="button" data-value="nate.com">
                      <span>nate.com</span>
                    </button>
                  </li>
                  <li class="selectset-item">
                    <button class="selectset-link btn" type="button" data-value="daum.net">
                      <span>daum.net</span>
                    </button>
                  </li>
                </ul>
              </div>
            </div>
            <div class="form-wrap">
              <h6 class="form-tit">연락처 <span>*</span>
              </h6>
              <div class="inputset inputset-round">
                <input type="text" class="inputset-input form-control" id="tel"name="tel"aria-label="내용" placeholder="-없이 번호를 입력해주세요" required="">
              </div>
            </div>
            <div class="form-wrap">
              <h6 class="form-tit">주소</h6>
              <div class="contents-address">
                <div class="contents-form-group">
                  <div class="inputset inputset-round">
                    <input type="text" class="inputset-input form-control" name="zipcode" id="zipcode" aria-label="내용">
                  </div>
                  <!--<button class="btnset btnset-round btnset-line" type="buton">우편번호 검색</button>-->
                  <input type="button" value="우편번호 검색" class="btnset btnset-round btnset-line"/>
                </div>
                <div class="inputset inputset-round">
                  <input type="text" class="inputset-input form-control" name="addr" id="addr" aria-label="내용" required="">
                  <input type="text" class="inputset-input form-control" name="addrdetail" id="addrdetail" aria-label="내용" required="">
                </div>
              </div>
            </div>
          </div>
          <div class="contents-btn-group">
            <a href="/sign/check" class="btnset btnset-line btnset-round">이전단계</a>
            <input type="submit" class="btnset btnset-round" value="다음단계">
          </div>
        </div>
      </div>
    </div>
    </form>
    <!-- 정보 입력 끝 -->
  </main>