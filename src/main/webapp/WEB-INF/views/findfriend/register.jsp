<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<link rel="stylesheet" href="/css/petregister.css">

<script>
  document.addEventListener('DOMContentLoaded', function() { //페이지 로딩이 완료되면
    // '업로드' 버튼에 클릭 이벤트 추가
    document.querySelector("#sendButton").addEventListener('click', function() {
    // 파일 입력 필드에서 파일 가져오기
    let selectFile = document.querySelector("#inputimg").files[0];
      // 파일이 선택되었는지 확인
      if (selectFile) {
        // 선택한 파일을 이미지로 표시
        const file = URL.createObjectURL(selectFile);
        document.querySelector("#profile").src = file;
      }else {
        alert('파일을 선택하세요.');
      }
    });
  });
</script>
<main class="main">
	<div class="main-container">
		 <form method ="post" action="${pageContext.servletContext.contextPath}/findfriend/petRegisterWriteOk">
             <div id="petregister"> <!-- 프로필 창-->
              <div id="petregister_title">
                <h1>등록하기</h1>                   
              </div>

              <div style="margin-top:20px;margin-left:50px;">
	              <div style="display: flex; width:150px; float:left; margin-right : 50px;">
	              	<img id="profile" src="${pageContext.servletContext.contextPath}/icons/pets.png" alt="프로필 사진" name="petimg" style="width:140px;height:100px;"/>
	              </div>
	              <p style="float:left;width:300px;height:50px;line-height:40px;margin-left:20px;">USER&nbsp;&nbsp;&nbsp;<input type="text" value="${logId}" name="userid" readonly><br><br><br><br><br>
              	  <p style="float:left;width:300px;line-height:40px;margin-left:20px;">펫 이름&nbsp;&nbsp;&nbsp;<input type="text" name="petname"></p>
	              <div style="width:150px;">
	                  <label for="inputimg" style="cursor: pointer; font-size: 1.1em;">
	                        🐶이미지 가져오기🐶
	                  </label>
	              </div>
	              <input type="file" id="inputimg" name="petimg" accept="image/*" style="display: none;">
	              <div style="width:150px;">
	              	<input type="button" value="업로드" id="sendButton" style="width:140px;"/>
	              </div>
	               
		           <div>
		             <input type="text" id="writing" name="introducing" style="width:500px; height:300px;margin-top:20px;">
		           </div>
              </div>
              <input type="submit" value="등록하기" id="register_submit">
              <input type="button" value="뒤로가기" id="profile_out"  onclick="location.href='/findfriend/list'" style="width:200px;height:50px;margin-left:70px;">
            </div>
          </form>
	</div>
</main>