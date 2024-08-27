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
    #list li:hover{
      box-shadow: 0 8px 16px rgba(0,0,0,0.2), 0 4px 4px rgba(0,0,0,0.1);
      border-bottom: 1px solid #ddd;
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
    #group_table{/*테이블 css*/
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
    .out_btn{
      border-radius: 10px; 
      border: 1px solid #ddd;
      width: 70px;
      background-color: black;
      color: white;
      height: 30px;
      line-height: 30px;
      float:right;
    }
    .out_btn:hover{
       cursor:pointer;
       background-color:ghostwhite;
       color:black;
       border:1px solid black;
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
    #group_table a{
       text-decoration:none;
       color:inherit;
    }
    #paging > li > a{
       text-decoration:none;
    }
</style>
<script>
$(document).ready(function(){
   $(".out_btn").click(function(event){
      event.preventDefault();
      var isconfirm = confirm("모임을 탈퇴하시겠습니까?");
      if(isconfirm){
         var row = $(this).closest('tr');
         var groupname = row.find('td:first').text();
         console.log(groupname);
         $.ajax({
            type:"GET",
            url:"/mypage/groupDel",
            data : {groupname : groupname},
            success : function(){
               alert("탈퇴가 완료되었습니다.");
               location.reload();
            },error : function(e){
               alert("오류발생");
               console.log(e.responseText);
            }
         });      
      }
   });
   $(".grouptable").click(function(event){   
      var groupname = $(this).data("group-name");
      console.log(groupname);
      // AJAX 요청 보내기
      $.ajax({
         type: "GET",
         url: "/mypage/grouptable",
         data: {
           groupname: groupname
         },
         success: function () {   
         },
         error: function (error) {
           console.log("오류 :", error.responseText);
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
            <h2 style="margin:20px 40px;">내 모임</h2>
            <table id="group_table">
                <thead>
                    <tr>
                        <th>모임이름</th>
                        <th width="10%">회원 수</th>
                        <th>내용</th>
                    </tr>
                </thead>
                <tbody>
                   <c:forEach var="gVO" items="${list }">
                     <tr>
                         <td><a href="/mypage/grouptable?groupname=${gVO.groupname}" class="grouptable" data-group-name="${gVO.groupname}">${gVO.groupname}</a></td>
                         <td>${gVO.groupCount}</td>
                         <td>${gVO.groupinfo}<input type="button" value="탈퇴" class="out_btn"/></td>
                     </tr>
                   </c:forEach>
                   <!-- 빈 행을 채우기 위한 추가 코드 -->
                <c:forEach var="index" begin="${fn:length(list) + 1}" end="5">
                    <tr>
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
               <c:if test="${GPVO.nowPage==1}">
               <li><i class="fa-solid fa-angle-left"></i></li>
            </c:if>
            <c:if test="${GPVO.nowPage>1}">
               <li><a href="/mypage/mygroup?nowPage=${GPVO.nowPage-1}"><i class="fa-solid fa-angle-left"></i></a></li>
            </c:if>
            <!-- startPage에서 한번에 출력할 페이지 수만큼 페이지 번호를 출력한다  nowPage -->
            <c:forEach var="p" begin="${GPVO.startPage }" end="${GPVO.startPage + GPVO.onePageCount - 1 }">
               <c:if test="${p<=GPVO.totalPage }"> <!-- 출력할 페이지번호가 총페이지수보다 작거나 같을 때 페이지 번호 출력 -->
                  <c:if test="${p==GPVO.nowPage }"><!-- 현재페이지일때 -->
                     <li style="background-color:#ddd;">
                  </c:if>
               <c:if test="${p!=GPVO.nowPage }"><!-- 현재페이지가 아닐때 -->
                  <li>
               </c:if>
                  <a href="/mypage/mygroup?nowPage=${p}">${p}</a>
                  </li>
               </c:if>
            </c:forEach>
            <!--next page  -->
            <c:if test="${GPVO.nowPage<GPVO.totalPage }">
               <li><a href="/mypage/mygroup?nowPage=${GPVO.nowPage+1}"><i class="fa-solid fa-angle-right"></i></a></li>
            </c:if>
            <c:if test="${GPVO.nowPage>=GPVO.totalPage }">
               <li><i class="fa-solid fa-angle-right"></i></li>
            </c:if>
          </div>
        </div>
    </main>