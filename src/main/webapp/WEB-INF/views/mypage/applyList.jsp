<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<script src="https://kit.fontawesome.com/d2a2c0a416.js" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
</head>
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
    #list ul{
      margin:0; padding: 0;
    }
    #list li:active{
       background-color:#ddd;
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
    #myPage tr td{ /*테이블 간격조절*/
        padding: 5px;
    }
    #list_table{/*테이블 css*/
        width: 900px;
        height: 500px;
        border-top: 1px solid #444444;
        border-collapse: collapse;
        margin: 0 auto;
    }
    th, td {
        border-bottom: 1px solid #444444;
        padding: 10px;
    }
    th{
        background-color: slategrey;
        color:snow;
        font-size: 1.1em;
        text-align:center;
    }
    td{
        background-color:white;
        text-align:center;
        white-space: nowrap; 
      overflow: hidden;   
      text-overflow: ellipsis; 
    }
    tbody > tr{ height:91px;}
    .ok_btn, .no_btn{
      border: 1px solid #ddd;
      width: 50px;
      height: 30px;
      line-height: 30px;
    }
    .ok_btn:hover{
       cursor:pointer;
       border:1px solid dodgerblue;
       color:dodgerblue;
       background-color:ghostwhite;
    }
    .no_btn:hover{
       cursor:pointer;
       border:1px solid darkred;
       color : darkred;
       background-color:ghostwhite;
    }
    .ok_btn{
      background-color: dodgerblue;
      color: white;
      border-radius: 10px 0 0 10px;
    }
    .no_btn{
      background-color: darkred;
      color: white;
      border-radius: 0 10px 10px 0;
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
    #paging > li > a {
       text-decoration:none;
    }
</style>
<script>

$(document).ready(function(){
   $(".ok_btn").click(function(event){
      event.preventDefault();
      
      var row = $(this).closest('tr');
      var applyname = row.find(':eq(3)').text();
      var applyid = row.find(':eq(2)').text();
      var applycategory = row.find(':eq(1)').text();
      
      console.log(applyname);
      console.log(applycategory);
      console.log(applyid);

      function applyDel(applyid){
         try{
            $.ajax({
               url:"${pageContext.servletContext.contextPath}/mypage/applyDel",
               data : {
                  applyid : applyid
               },
               type : "GET",
               success : function(){
                  location.reload();
               },error : function(e){
                  console.log(e.responseText);
               }
            });
         }catch(error){
            console.log(error);
         }
      }
      var isconfirm = confirm("요청을 수락하시겠습니까?");
      if(isconfirm){
         if(applycategory == "친구신청"){
            $.ajax({
               url:"${pageContext.servletContext.contextPath}/mypage/addfriend",
               type : "GET",
               data : {
                  applyname : applyname,
                  applyid : applyid      
               },
               success : function(){
                  alert("친구신청을 수락하였습니다.");
                  applyDel(applyid);
               },error : function(e){
                  console.log(e.responseText);
               }
            });
         }else{
            $.ajax({
               url:"${pageContext.servletContext.contextPath}/mypage/addgroup",
               type : "GET",
               data : {
                  applyname : applyname,
                  applyid : applyid,
                  groupname : applycategory
               },
               success : function(){
                  alert("모임신청을 수락하였습니다.");
                  applyDel(applyid);
               },error : function(e){
                  console.log(e.responseText);
               }
            });
         }
      }
   });
   $(".no_btn").click(function(event){
      event.preventDefault();
      var row = $(this).closest('tr');
      var applyid = row.find(':eq(2)').text();
      var isconfirm = confirm("신청을 거절하시겠습니까?");
      //신청목록에서 제거
      if(isconfirm){
         var row = $(this).closest('tr');
         function applyDel(applyid){
            $.ajax({
               url:"${pageContext.servletContext.contextPath}/mypage/applyDel",
               data : {
                  applyid : applyid
               },
               type : "GET",
               success : function(){
                  location.reload();
               },error : function(e){
                  console.log(e.responseText);
               }
            });
         }
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
            <h2 style="margin:20px 40px;">모임/친구 관리</h2>
            <table id="list_table">
                <thead>
                   <tr>
                       <th>날짜</th>
                       <th>카테고리</th>
                       <th>ID</th>
                       <th width="35%">이름</th>
                       <th>&nbsp;</th>
                   </tr>
                </thead>
                <tbody>
                <c:forEach var="aVO" items="${list }">
                	
                      <tr>
                          <td>${aVO.applydate }</td>
                          <td>${aVO.category }</td>
                          <td>${aVO.applyid }</td>
                          <td>${aVO.applyname }</td>
                          <td><input type="button" value="수락" class="ok_btn"/><input type="button" value="거절" class="no_btn"/></td>
                      </tr>
                     
                  </c:forEach>
                  
                   <!-- 빈 행을 채우기 위한 추가 코드 -->
                <c:forEach var="index" begin="${fn:length(list) + 1}" end="5">
                   <tr style="height: auto;">
                       <td>&nbsp;</td>
                       <td>&nbsp;</td>
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
            <c:if test="${APVO.nowPage==1}">
            <li><i class="fa-solid fa-angle-left"></i></li>
         </c:if>
         <c:if test="${APVO.nowPage>1}">
            <li><a href="/mypage/applyList?nowPage=${APVO.nowPage-1}"><i class="fa-solid fa-angle-left"></i></a></li>
         </c:if>
         <!-- startPage에서 한번에 출력할 페이지 수만큼 페이지 번호를 출력한다  nowPage -->
         <c:forEach var="p" begin="${APVO.startPage }" end="${APVO.startPage + APVO.onePageCount - 1 }">
            <c:if test="${p<=APVO.totalPage }"> <!-- 출력할 페이지번호가 총페이지수보다 작거나 같을 때 페이지 번호 출력 -->
               <c:if test="${p==APVO.nowPage }"><!-- 현재페이지일때 -->
                  <li style="background-color:#ddd">
               </c:if>
            <c:if test="${p!=APVO.nowPage }"><!-- 현재페이지가 아닐때 -->
               <li>
            </c:if>
               <a href="/mypage/applyList?nowPage=${p}">${p}</a>
               </li>
            </c:if>
         </c:forEach>
         <!--next page  -->
         <c:if test="${APVO.nowPage<APVO.totalPage }">
            <li><a href="/mypage/applyList?nowPage=${APVO.nowPage+1}"><i class="fa-solid fa-angle-right"></i></a></li>
         </c:if>
         <c:if test="${APVO.nowPage>=APVO.totalPage }">
            <li><i class="fa-solid fa-angle-right"></i></li>
         </c:if>
          </div>
        </div>
    </main>