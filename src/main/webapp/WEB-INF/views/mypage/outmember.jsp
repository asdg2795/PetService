<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
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
    #list li:hover{
      box-shadow: 0 8px 16px rgba(0,0,0,0.2), 0 4px 4px rgba(0,0,0,0.1);
      border-bottom: 1px solid #ddd;
    }
    #list li{
        padding: 10px;
        text-align: center;
        list-style: none;
        margin:20px 0;
    }
    #list li:active{
    	background-color:#ddd;
    }
    #list ul{
      margin:0; padding: 0;
    }
    #list li a{
        color: black;
        font-size: 1.1em;
        text-decoration: none;
    }
    #myPage{ /*내 정보 창*/
        width: 1200px;
        height: 700px;
        margin: 40px 20px;
        background-color:ghostwhite;
        box-shadow: 0 19px 38px rgba(0,0,0,0.30), 0 15px 12px rgba(0,0,0,0.22);
    }
    #out-table{
        margin: 50px auto;
        padding: 10px; 
    }
    #out_table tr, td{
        padding: 25px;
        margin: 25px;
    }
    #out_table td{
      text-align: center;
    }
    #out_table button{
        align-items: center;
    }
    #out_window{
        width: 355px;
        height: 180px;
        border: 1px solid black;
        background-color: white;
        border-radius: 15px;
        position: absolute;
        top: 39%;
        left: 46%;
        transform: translate(-50%,-50%);
        display: none;
    }
    #out_window #yes, #no{
        
        border-radius: 10px;
        width: 80px;
        height: 40px;
        line-height: 40px;
        margin: 20px 10px;
    }
    #outbtn{
    	width: 90px; height: 35px; 
    	line-height: 30px; background-color: deepskyblue; 
    	border-radius: 5px; border: none; color: white;
    }
    #outbtn:hover{ 
    	cursor:pointer;
    	border:1px solid deepskyblue;
    	background-color:ghostwhite;
    	color:deepskyblue;
    }
    #yes{
        background-color: rgb(52, 73, 94);
        color: white;
    }
    #no{
        background-color: white;
        border: 2px solid black;
    }
    #pass1, #pass2 {
    	height:25px;
    	line-height:25px;
    	
    }
</style>
<script>
$(document).ready(function(){
	$(function() {
		$("#outbtn").click(function(){
			var pass1 = $("#pass1").val();
			var pass2 = $("#pass2").val();
		
			if ($("#out_check").prop("checked") && (pass1 === pass2) && pass1!=="" && pass2!=="") {
			    var password = $("#pass1").val();
				$.ajax({ //비밀번호확인
					url: "${pageContext.servletContext.contextPath}/mypage/checkpass",
					type: "POST",
					data : { password : password},
					success : function(data){
						if(data.result ==="success"){
							$("#out_window").css('display', 'block');
						}else{
							alert("비밀번호가 일치하지 않습니다.");
						}
					},error : function(e){
						console.log(e.responseText);
					}
				});
			} else if (pass1 === "" || pass2 === "") {
			    alert("비밀번호를 입력하세요.");
			    return false;
			} else if (pass1 !== pass2) {
			    alert("비밀번호가 다릅니다.");
			    return false;
			} else {
			    alert("탈퇴하려면 체크박스를 체크해주세요.");
			    return false;
			}
			
		});
  });	
	$(function(){
		$("#no").click(function(){
			$("#out_window").css('display','none');
		});
	});
	$("#yes").click(function(){
		
		$.ajax({
          url: "${pageContext.servletContext.contextPath}/mypage/withdraw",
          type: "POST",
          data : {},
          success: function(data) {
        	  console.log(data.result);
              alert("회원 탈퇴가 완료되었습니다.");
              $("#out_window").css('display','none');
              //메인페이지로 이동
              //response.sendRedirect("/main");
          },
          error: function(error) {
              alert("회원 탈퇴 중 오류가 발생했습니다.");
              console.log(error);
          }
      });
	});
});
  
</script>
	 <main>
        <div id="list">
            <h4 style="text-align: center; margin: 20px auto">마이페이지</h4>
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
            <h2 style="margin: 90px auto 40px auto; text-align: center;">회원탈퇴</h2>
            <div style="display: flex; justify-content: center;">
                <table id="out_table">
                    <tr><td>비밀번호 : </td><td><input type="password" id="pass1"/></td></tr>
                    <tr><td>비밀번호 확인 : </td><td><input type="password" id="pass2"/></td></tr>
                    <tr><td colspan="2" ><input type="checkbox" id="out_check"/> 탈퇴하려면 체크해주세요.</td></tr>
                </table>
            </div>
            <div style="display: flex; justify-content: center;"><input type="button" value="탈퇴하기" id="outbtn"/></div>        
        </div>
        <div id="out_window">   <!--탈퇴 확인 창-->
            <div style="margin: 15px auto; padding: 5px;"><h3 style="text-align: center;">탈퇴하시겠습니까?</h3></div>
            <div style="float: left; width: 100%; display: flex; justify-content: center;">
                <input type="button" value="확인" id="yes"/><input type="button" value="취소" id="no"/>
            </div>
        </div>
    </main>
