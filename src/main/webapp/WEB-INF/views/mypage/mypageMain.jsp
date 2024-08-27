<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<!-- 우편번호 찾기(다음 우편번호 api) -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<style>
    main{
        align-items: center;
        display: flex;
        margin: 70px auto;
    }
    #list{ /*마이 리스트*/
        width: 180px;
        height: 700px;
        margin: 40px;
        border: 1px solid #ddd;
        border-radius: 10px;
        background-color:  white;
        box-shadow: 0 19px 38px rgba(0,0,0,0.30), 0 15px 12px rgba(0,0,0,0.22);
    }
    #list li{
        padding: 10px;
        text-align: center;
        list-style: none;
        margin:20px 0;
    }
    #list ul{
      margin:0; padding: 0;
    }
    #list li a{
        color: black;
        font-size: 1.1em;
        text-decoration:none;
    }
    #list li:hover{
      	box-shadow: 0 8px 16px rgba(0,0,0,0.2), 0 4px 4px rgba(0,0,0,0.1);
      	border-bottom: 1px solid #ddd;
    }
    #list li:active{
    	background-color:#ddd;
    }
    #myPage{ /*내 정보 창*/
        width: 1200px;
        height: 700px;
        margin: 40px 20px;
        background-color:ghostwhite;
        box-shadow: 0 19px 38px rgba(0,0,0,0.30), 0 15px 12px rgba(0,0,0,0.22);
    }
    td{ /*테이블 간격조절*/
        padding: 15px;
        margin: 20px;
        height: 30px;
        line-height: 30px;
        vertical-align:middle;
    }
    #sub{ /*수정버튼*/
        border: 1px solid black;
        border-radius: 5px;
        width: 100px;
        height: 40px;
        background-color:black;
        color: aliceblue;
        font-size: 1.1em;
        box-shadow: 1px 3px 0 rgb(0,0,0,0.5);
    }
    #sub:hover{
    	cursor:pointer;
    	background-color:ghostwhite;
    	color:black;
    }
    #sub:active{
      top: 1px;
      position: relative;
      box-shadow: 1px 1px 0 rgb(0,0,0,0.5);
    }
    input[type="text"], input[type="password"]{
    	height:25px;
    	line-height:25px;
    	width:150px;
    }
    input[type="button"]{ 
    	width:80px; height:30px; line-height:30px;
    	border:1px solid blue;
    	border-radius:5px;
    	background-color:ghostwhite;
    	color: blue;
    }
    input[type="button"]:hover{
    	background-color:blue;
    	color:white;
    	cursor:pointer;
    }
</style>
<script>
	$(document).ready(function(){
		$("#checkbtn").click(function(){
			if($("#username").val()==""){
				alert("닉네임을 입력하세요.");
				return false;
			}
		});
		
		$("#sub").click(function(event){
			event.preventDefault();
			if($("#pass1").val()=="" || $("#pass2").val()==""){
				alert("비밀번호를 입력하세요.");
				return false;
			}
	        if ($("#pass1").val() != $("#pass2").val()) {
	            alert("비밀번호가 다릅니다.");
	            return false;
	        }
	        if($("#tel").val()==""){
	        	alert("전화번호를 입력하세요.");
	        	return false;
	        }
	        if($("#username").val()==""){
				alert("닉네임을 입력하세요.");
				return false;
			}
	        if($("#addr").val()==""){
	        	alert("주소를 입력하세요.");
	        	return false;
	        }
	        
	        var formData = {	        	
				username : $("#username").val(),
				userpwd : $("#pass1").val(),
				email : $("#email").val(),
				addr : $("#addr").val(),
				tel : $("#tel").val()
			}
			
	        $.ajax({
	        	type:'POST',
	        	url:'/mypagesubmit',
	        	data : formData,
	        	success : function(result){
	        		console.log('성공');
	        	},error : function(error){
	        		console.log('에러', error);
	        	}
	      
	        
	        alert("수정이 완료되었습니다.");
	        return true;
	    });
		
		
		});
		// 우편번호 찾기
		$("input[value='주소검색']").click(function() {
			new daum.Postcode({
				
	            oncomplete: function(data) {
					console.log(data);
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
	                document.getElementById("addr").value = addr;
	                
	            }
	        }).open();
		});	// 우편번호찾기 - end
	});
</script>
	 <main>
        <div id="list">
            <h4 style="text-align: center; margin: 20px auto;">마이페이지</h4>
            <ul>
              <li><a href="/mypage/mypageMain">정보</a></li>
              <li><a href="/mypage/mycourse">나만의 코스</a></li>
              <li><a href="/mypage/mypet">펫 정보</a> </li>
              <li><a href="/mypage/myfavorite">내 즐겨 찾기</a></li>
              <li><a href="/mypage/mywrite">내가 쓴 글</a></li>
              <li><a href="/mypage/mygroup">내 모임</a></li>
              <li><a href="/mypage/myfriend">내 친구</a></li>
              <li><a href="/mypage/applyList">모임/친구 관리</a></li>
              <li><a href="/mypage/outmember">회원탈퇴</a></li>
            </ul>          
        </div>
        <div id="myPage">
            <h2 style="margin:20px 40px;">내 정보</h2>
            <form method='post'>
                <table id="myinfo" style="display: flex; justify-content: center;">
                    <tr><td>아이디</td><td><input type="text" disabled value="${uVO.userid }"/></td></tr>
                    <tr><td>이름</td><td><input type="text" id="username" value="${uVO.username}"readonly/>
                    <tr><td>비밀번호</td><td><input type="password" id="pass1" value="${uVO.userpwd}"  disabled/></td></tr>
                    <tr><td>비밀번호확인</td><td><input type="password" id="pass2" value="${uVO.userpwd}"/></td></tr>
                    <tr><td>전화번호</td><td><input type="text" id="tel" value="${uVO.tel}"/></td></tr>
                    <tr><td>이메일</td><td><input type="text" id="email" value="${uVO.email}"/></td></tr>
                    <tr><td>주소</td><td><input type="text" id="addr" value="${uVO.addr}"/>
                        <input type="button" class="btn btn-outline-primary" value="주소검색" style="margin: 0 5px;"/></td></tr>
                </table>
                <div style="display: flex; justify-content: center; margin-top: 30px;"><input type="submit" id="sub" value="수정하기"/></div>     
            </form>
        </div>
    </main>