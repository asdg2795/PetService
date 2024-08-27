<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<script src="https://kit.fontawesome.com/d2a2c0a416.js" crossorigin="anonymous"></script>
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
    #write_table{
        width: 900px;
        height: 500px;
        margin: 0 auto;
        border-top: 1px solid #444444;
        border-collapse: collapse;
    }
    th, td {
        border-bottom: 1px solid #444444;
        padding: 10px;
        text-align:center;
    }
    th{
        background-color: slategrey;
        color:snow;
        font-size: 1.1em;
    }
    td{
    	
        background-color:white;
        text-align:center;
        white-space: nowrap; 
		overflow: hidden;   
		text-overflow: ellipsis;
		max-width:300px; 
    }
    thead{
      background-color:slategrey;
      color: white;
    }
    tbody{
      background-color: white;
    }
    #active{
      color : red;
      font-weight: bold;
      font-size: 1.2em;
    }
    #paging{
      display: flex; 
      justify-content: center;
      margin: 15px;
      font-size: 1.1em;
      padding: 5px;
      align-items: center;
    }
    #paging > i, #paging > li{
      margin : 0 10px;
      cursor: pointer;
      list-style:none;
    }
    #write_table a{
    	text-decoration:none;
    	color:inherit;
    }
    #paging > li >a {
    	text-decoration:none;
    }
</style>
<script>
$(document).ready(function(){
	
	function searchCheck(){
		if($("#searchWord").val()==""){
			alert("검색어를 입력하세요.");
			return false;
		}
	}
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
	        <form method="get" action="/mypage/mywrite" onsubmit="return searchCheck()">
	            <div style="display: flex; justify-content: space-between;">
	                <h2 style="margin:20px 40px;">내 글</h2>
	                 <div style="margin: 20px 70px;"><input type="text" name="searchWord" id="searchWord" placeholder=" 제목으로 검색하기" style="border-radius: 10px;"/>
	                 <input type="button" value="검색" style="width:80px; background-color:#ddd; border-radius: 10px;"/>
	                 </div>
	            </div>
	        </form>    
            <table id="write_table">
                <thead>
                    <tr>
                        <th width="20%">제목</th>
                        <th>내용</th>
                        <th width="20%">날짜</th>
                    </tr>
                </thead>
                <tbody>
	                <c:forEach var="wVO" items="${list }">
	                    <tr>
	                        <td><a href="/mypage/mywrite_page?subject=${wVO.subject}&content=${wVO.content}&writedate=${wVO.writedate}">
			                	${wVO.subject}</a>
			                </td>
	                        <td><a href="/mypage/mywrite_page?subject=${wVO.subject}&content=${wVO.content}&writedate=${wVO.writedate}">
	                        	${wVO.content }</a>
	                        </td>
	                        <td>${wVO.writedate }</td>
	                    </tr>
	                </c:forEach>
	                <!-- 빈 행을 채우기 위한 추가 코드 -->
				    <c:forEach var="index" begin="${fn:length(list) + 1}" end="5">
				        <tr style="height:auto">
				            <td>&nbsp;</td>
				            <td>&nbsp;</td>
				            <td>&nbsp;</td>
				        </tr>
				    </c:forEach>
                </tbody>  
            </table>
            <!-- 페이징 처리-->
          <div id="paging">
            <!--  현재보는 페이지(PVO.nowPage)를 기준으로 이전페이지 표시 -->
            <c:if test="${WPVO.nowPage==1}">
				<li><i class="fa-solid fa-angle-left"></i></li>
			</c:if>
			<c:if test="${WPVO.nowPage>1}">
				<li><a href="/mypage/mywrite?nowPage=${WPVO.nowPage-1}"><i class="fa-solid fa-angle-left"></i></a></li>
			</c:if>
			<!-- startPage에서 한번에 출력할 페이지 수만큼 페이지 번호를 출력한다  nowPage -->
			<c:forEach var="p" begin="${WPVO.startPage }" end="${WPVO.startPage + WPVO.onePageCount - 1 }">
				<c:if test="${p<=WPVO.totalPage }"> <!-- 출력할 페이지번호가 총페이지수보다 작거나 같을 때 페이지 번호 출력 -->
					<c:if test="${p==WPVO.nowPage }"><!-- 현재페이지일때 -->
						<li style="background-color:#ddd;">
					</c:if>
				<c:if test="${p!=WPVO.nowPage }"><!-- 현재페이지가 아닐때 -->
					<li>
				</c:if>
					<a href="/mypage/mywrite?nowPage=${p}">${p}</a>
					</li>
				</c:if>
			</c:forEach>
			<!--next page  -->
			<c:if test="${WPVO.nowPage<WPVO.totalPage }">
				<li><a href="/mypage/mywrite?nowPage=${WPVO.nowPage+1}"><i class="fa-solid fa-angle-right"></i></a></li>
			</c:if>
			<c:if test="${WPVO.nowPage>=WPVO.totalPage }">
				<li><i class="fa-solid fa-angle-right"></i></li>
			</c:if>
          </div>
        </div>            
    </main>
