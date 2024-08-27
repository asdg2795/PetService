<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

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
        text-decoration:none;
    }
    #myPage{ /*내 정보 창*/
        width: 1200px;
        height: 700px;
        margin: 40px 20px;
        background-color:ghostwhite;
        box-shadow: 0 19px 38px rgba(0,0,0,0.30), 0 15px 12px rgba(0,0,0,0.22);
    }
    #pagemain{
      margin: 50px 40px;
      height:100%;
    }
    #delbtn:hover{
    	cursor:pointer;
    	background-color:red;
    	color:white;
    }
    #writebox{
    	width: 802px; height:280px; margin:20px;
    	resize:none;
    }
    #titlebox{
    	width: 800px; height:40px; 
    	line-height: 40px; margin:20px;
    }
    #delbtn{ 
	    border-radius:5px; 
	    border:1px solid red; 
	    background-color:ghostwhite;
	    color:red;
	    width:80px; height:35px;
	    font-weight:bold;
	    line-height:35px;
    }
</style>
<script>
	$(document).ready(function(){
		$("#delbtn").click(function(event){
			event.preventDefault();
			var isconfirm = confirm("글을 삭제하시겠습니까?");
			if(isconfirm){
				// 삭제 버튼과 관련된 특정 요소를 찾아서 subject 값을 가져옴
				var subject = $(this).closest("#pagemain").find("#titlebox").val();
				// 여기에서 subject 변수 활용
				console.log("삭제할 subject: " + subject);
				
				$.ajax({
					url:"${pageContext.servletContext.contextPath}/mypage/writeDel",
					data : {subject : subject},
					type : "GET",
					success : function(){
						alert("글이 삭제되었습니다.");
						location.href="/mypage/mywrite"
					},error : function(e){
						alert("오류발생");
						console.log(e.responseText);
					}
				});
			}
			
		});
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
          <div id="pagemain">
            <div style="display: flex; justify-content: space-between; width: 95%; height: 50px; margin:5px;"><h2>내 글</h2><h4 style="margin-right: 120px;">작성날짜 : <%= request.getParameter("writedate") %></h4></div>
            <div style="margin: 15px 80px; display: flex; height: 40px; align-items:center;"><h5 style="line-height: 40px;">제목 : </h5><input type="text" id="titlebox" value="<%= request.getParameter("subject") %>"/></div>
            <div style="margin: 15px 80px; display: flex; align-items:center;"><h5 style="line-height: 40px; ">내용 : </h5><textarea id="writebox" ><%= request.getParameter("content") %></textarea></div>
            <div style="display: flex; justify-content: center; margin-top: 30px; "><input type="button" value="삭제하기" id="delbtn"/></div>
          </div>
        </div>     
    </main>
