<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://kit.fontawesome.com/d2a2c0a416.js" crossorigin="anonymous"></script>
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
    #list li:active{
       background-color:#ddd;
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
    #friend_table{/*테이블 css*/
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
    #profile_view{
      width: 400px;
      height: 400px;
      position: absolute;
      top: 40%;
      left: 30%;
      transform: translate(-50%,-50%);
      border: 2px solid black;
      border-radius: 30px 30px 40px 40px;
      background-color: white;
      display: none;
    }
    #profile_title{
      background-color: black; border-radius: 27px 27px 0 0; 
      width: 400px; height: 40px; line-height: 40px; 
      border-bottom: 1px solid black;
      color: white;
      display: flex;
      justify-content: space-between;
    }
    #profile_list {
      width: 170px;
      height: 150px;
    }
    #profile_list li{
      padding: 5px;
      font-size: 1.1em;
      border-bottom: 1px solid black;
      list-style:none;
    }
    .nick:hover{
      cursor: pointer;
    }
    .del{
      border-radius: 10px; 
      border: 1px solid #ddd;
      width: 70px;
      background-color: black;
      height: 30px;
      line-height: 30px;
      color: white;
    }
    .del:hover{
       cursor:pointer;
       background-color:ghostwhite;
       color:black;
       border:1px solid black;
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
    #paging > li > a{
       text-decoration : none;
    }
    #chat_window{
      width: 350px;
      height: 360px;
      border-radius: 20px;
      border: 2px solid rgb(241, 196, 15);
      position: absolute;
      top: 40%;
      left: 50%;
      transform: translate(-50%,-50%);
      background-color: white;
      display: none;
    }
    #chat_out{
       width: 20px; height: 20px; 
       line-height: 20px; margin: 0 20px; 
       vertical-align: middle;
    }
    #chat_out:hover, #chat_sub:hover,
    #profile_out:hover, #chat:hover{
       cursor:pointer;
    }
    #chat_title{
      display: flex;
      justify-content: space-between;
      margin: 10px 0;
    }
    #chat_view{
      width:100%;
      height: 230px;  
    }
    #petinfo{
       width: 363px; height: 130px;
       border-radius: 0 0 20px 20px;
       border: dashed 2px black; 
       resize: none; 
       background-color: white;
    }
</style>
<script>
$(document).ready(function(){
 
   $(".nick").click(function(){
       $("#profile_view").css('display','block');
   });
   $("#profile_out").click(function(){
     $("#profile_view").css('display','none');
   });
   
   $("#chat").click(function(){
       $("#chat_window").css('display','block');
   });
   $("#chat_out").click(function(){
     $("#chat_window").css('display','none');
   });
     
   $(".del").click(function(){
      var isconfirm = confirm("친구를 삭제하시겠습니까?");
      var row = $(this).closest('tr');
      var friendname = row.find(':eq(1)').text(); //수정필요
      console.log(friendname);
      
      if(isconfirm){
         $.ajax({
            type:"GET",
            data : {friendname : friendname},
            url : "${pageContext.servletContext.contextPath}/mypage/friendDel",
            success : function(){
               alert("친구삭제가 완료되었습니다.");
               location.reload();
            },error : function(e){
               console.log(e.responseText);
            }
         });
      }
      
   })
   
   $(".nick").click(function(){
		var row = $(this).closest('tr');
		var friendID = row.find('td:first').text();
		var friendname = row.find(':eq(1)').text();
        console.log(friendID);
        console.log(friendname);

        $.ajax({
            type: "GET",
            data: { friendID: friendID },
            url: "/mypage/getFriendInfo",
            success: function(data) {
                $("#chat_window #chat_title h3").text(friendname + "님과의 실시간 채팅");
                $("#profile_view #profile_title h2").text(friendname);
                //$("#profile_view #porfile").attr("src", data.profileImage);
            
               $("#profile_list li:nth-child(1)").text("이름 : " + data.petname);
               $("#profile_list li:nth-child(2)").text("나이 : " + data.petage);
               $("#profile_list li:nth-child(3)").text("성격 : " + data.petwant);
               $("#profile_list li:nth-child(4)").text("취미 : " + data.pethobby);
               $("#petinfo").val(data.introducing);

                $("#profile_view").css('display', 'block');
            },
            error: function(e) {
                console.log(e.responseText);
            }
        });
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
            <h2 style="margin:20px 40px;">내 친구</h2>
            <table id="friend_table">
                <thead>
                    <tr>
                       <th>ID</th>
                        <th width="25%">이름</th>
                        <th width="35%">만남시기</th>
                    </tr>
                </thead>
                <tbody>
                   <c:forEach var="fVO" items="${list }">
                       <tr>
                          <td><p class="nick" data-friend-id="${fVO.friendid}">${fVO.friendid }</p></td>
                           <td>${fVO.friendname }</td>
                           <td>${fVO.createdate }<input type="button" value="삭제" class="del" style="float:right;"/></td>
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
            <c:if test="${FPVO.nowPage==1}">
         <li><i class="fa-solid fa-angle-left"></i></li>
         </c:if>
         <c:if test="${FPVO.nowPage>1}">
            <li><a href="/mypage/myfriend?nowPage=${FPVO.nowPage-1}"><i class="fa-solid fa-angle-left"></i></a></li>
         </c:if>
         <!-- startPage에서 한번에 출력할 페이지 수만큼 페이지 번호를 출력한다  nowPage -->
         <c:forEach var="p" begin="${FPVO.startPage }" end="${FPVO.startPage + FPVO.onePageCount - 1 }">
            <c:if test="${p<=FPVO.totalPage }"> <!-- 출력할 페이지번호가 총페이지수보다 작거나 같을 때 페이지 번호 출력 -->
               <c:if test="${p==FPVO.nowPage }"><!-- 현재페이지일때 -->
                  <li style="background-color:#ddd;">
               </c:if>
            <c:if test="${p!=FPVO.nowPage }"><!-- 현재페이지가 아닐때 -->
               <li>
            </c:if>
               <a href="/mypage/myfriend?nowPage=${p}">${p}</a>
               </li>
            </c:if>
         </c:forEach>
         <!--next page  -->
         <c:if test="${FPVO.nowPage<FPVO.totalPage }">
            <li><a href="/mypage/myfriend?nowPage=${FPVO.nowPage+1}"><i class="fa-solid fa-angle-right"></i></a></li>
         </c:if>
         <c:if test="${FPVO.nowPage>=FPVO.totalPage }">
            <li><i class="fa-solid fa-angle-right"></i></li>
         </c:if>
        </div>
        </div>

        <div id="profile_view"> <!-- 프로필 창-->
          <div id="profile_title">
            <div><h2 style="margin: 0 20px;"></h2></div>
            <div><input type="button" value="X" style="width: 25px; height: 25px; line-height: 25px; margin: 0 20px; vertical-align: middle;" id="profile_out"/></div>
          </div>
          <div style="display: flex; align-items: center; margin: 0 15px;">
            <img id="porfile" src="/img/images.jpg" style="width: 150px; height: 150px; margin: 10px; border-radius: 70%;">
            <ul id="profile_list">
              <li></li>
              <li></li>
              <li></li>
              <li></li>
            </ul>
          </div>
          <div style="display: flex; justify-content: right; margin: 0 15px;"><input type="button" value="채팅" id="chat" style="width: 50px; border: 1px solid #ddd; background-color: lightcyan;"/></div>
          <div style="display: flex; justify-content: center; margin: 2px 15px;">
            <textarea id="petinfo" disabled title="소개글"></textarea>
          </div>  
        </div>
        <div id="chat_window"><!-- 채팅 창-->
          <div id="chat_title">
            <div><h3 style="margin: 0 20px;"></h3></div>
            <div><input type="button" value="X" id="chat_out"/></div>
          </div>
          <hr/>
          <div id="chat_view">

          </div>
          <hr/>
          <div style="vertical-align: middle;"><input type="text" placeholder="내용을 입력하세요." style="height: 35px; width: 250px; margin: 0 5px 0 10px;"/>
            <input type="button" value="전송" id=chat_sub style="width: 70px; height: 35px; background-color:rgb(94, 94, 94); border-radius: 5px; border: none;"/></div>
        </div>
    </main>
