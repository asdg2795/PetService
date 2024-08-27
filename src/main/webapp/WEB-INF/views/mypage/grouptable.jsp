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
    #list ul{
      margin:0; padding: 0;
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
    #list li a{
        color: black;
        font-size: 1.1em;
        text-decoration:none;
    }
    th{ text-align : center;}
    td{ text-align : center;}
    #myPage{ /*내 정보 창*/
        width: 1200px;
        height: 700px;
        margin: 40px 20px;
        background-color:ghostwhite;
        box-shadow: 0 19px 38px rgba(0,0,0,0.30), 0 15px 12px rgba(0,0,0,0.22);
    }
    #groupList_table{/*테이블 css*/
        width: 700px;
        height: 300px;
        border-collapse: collapse;
        margin: 20px 60px;
        border-radius: 15px 15px 0 0 ; 
        box-shadow: 0 0 0 1px #000;
        border-style: hidden;
    }
    #groupList_table tr, th, td{
      border: 1px solid black;
      background-color: white;
      padding:15px;
    }
    #group_info{
        margin: 20px;
        border-radius: 15px 15px 0 0;
        border-style: hidden;
        border-collapse: collapse;
    }
    #main_table{
      display: flex;
      flex-direction: column;
      align-items: center;
    }
    #groupDrop{
       width: 90px; height: 30px; 
       align-items: center; 
       background-color: steelblue; 
       border-radius: 10px; 
       border: none; font-weight: bold;
       color:white;
    }
    #groupDrop:hover{
       border:1px solid steelblue;
       background-color:ghostwhite;
       color:steelblue;
       cursor:pointer;
    }
    #mod_btn{
       width: 90px; height: 30px; 
       align-items: center; 
       background-color: rgb(94, 94, 94); 
       color: white;
       border-radius: 10px; border: none; 
       margin: 17px 0;
    }
    #mod_btn:hover{
       cursor:pointer;
       background-color:ghostwhite;
       border: 1px solid rgb(94,94,94);
       color: rgb(94,94,94);
    }
    .out_member{
       float:right;
       border-radius :5px;
       border : 1px solid rgb(241, 196, 15);
       background-color:white;
       height:25px;
       line-height:25px;
    }
    .out_member:hover{
       background-color: rgb(241, 196, 15);
       cursor:pointer;
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
       text-decoration:none;
    }
</style>
<script>
$(document).ready(function(){
   $(".out_member").click(function(event){
      event.preventDefault();
      
      var isconfirm = confirm("회원을 내보내시겠습니까?");
      
      if(isconfirm){
         var row = $(this).closest('tr');
         var membername = row.find('td:first').text();
         var groupname = $("#groupname").text();
         console.log(membername);
         console.log(groupname);
         $.ajax({
            type: "GET",
            url : "/mypage/memberDel",
            data : {
               membername : membername,
               groupname : groupname   
            },
            success : function(){
               alert("회원을 내보냈습니다.");
               location.reload();
            },error : function(e){
               alert("오류발생");
               console.log(e.responseText);
            }
         });
      }
   });
   
   $("#groupDrop").click(function(){
      var isconfirm =confirm("모임을 삭제하시겠습니까?");
      
      if(isconfirm){
         var groupname = $("#groupname").text();
         $.ajax({
            type: "GET",
            url : "/mypage/groupDrop",
            data : { groupname : groupname},
            success : function(){
               alert("모임을 삭제했습니다.");
               location.href="/mypage/mygroup";
            },error : function(e){
               console.log(e.responseText);
            }
         });
      }
   });
   
   $("#mod_btn").click(function(){
      if($("#groupInfoTextArea").val()==""){
         alert("정보를 입력하세요.");
         return false;
      }
      var isconfirm = confirm("정보를 수정하시겠습니까?");
      
      if(isconfirm){
         var groupinfo = $("#groupInfoTextArea").val();
         var groupname = $("#groupname").text();
         console.log(groupinfo);
         $.ajax({
            type:"POST",
            url : "/mypage/infomod",
            data : { 
               groupinfo : groupinfo,
               groupname : groupname
            },
            success : function(){
               alert("수정이 완료되었습니다.");
            },error : function(e){
               console.log(e.responseText);
            }
         });
      }
   });
});
</script>
<c:set var="groupname" value="${param.groupname}" />
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
        <div id="myPage" >
            <h2 style="margin:20px 40px;">모임 정보</h2>
            <div style="display: flex; margin: 0 40px;">
              <div id="main_table">
                <table id="groupList_table">
                    <thead>
                        <tr>
                            <th colspan="3" id="groupname" style="text-align: center;  background-color: aliceblue; border-radius: 15px 15px 0 0;"><h3>${groupname }</h3></th>
                        </tr>
                        <tr>
                            <th>회원명단</th>
                            <th>가입 날짜</th>
                            <th>펫 정보(이름/나이/취미)</th>
                        </tr>
                        
                    </thead>
                    <tbody>
                    <c:forEach var="gmVO" items="${list }">
                        <tr>
                            <td>${gmVO.membername }<input type="button" value="내보내기" class="out_member"/></td>
                            <td>${gmVO.groupdate }</td>
                            <td>${gmVO.petname }/${gmVO.petage }/${gmVO.pethobby }</td>
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
                <div id="paging">
            <!--  현재보는 페이지(PVO.nowPage)를 기준으로 이전페이지 표시 -->
               <c:if test="${GMPVO.nowPage==1}">
               <li><i class="fa-solid fa-angle-left"></i></li>
            </c:if>
            <c:if test="${GMPVO.nowPage>1}">
               <li><a href="/mypage/grouptable?nowPage=${GMPVO.nowPage-1}"><i class="fa-solid fa-angle-left"></i></a></li>
            </c:if>
            <!-- startPage에서 한번에 출력할 페이지 수만큼 페이지 번호를 출력한다  nowPage -->
            <c:forEach var="p" begin="${GMPVO.startPage }" end="${GMPVO.startPage + GMPVO.onePageCount - 1 }">
               <c:if test="${p<=GMPVO.totalPage }"> <!-- 출력할 페이지번호가 총페이지수보다 작거나 같을 때 페이지 번호 출력 -->
                  <c:if test="${p==GMPVO.nowPage }"><!-- 현재페이지일때 -->
                     <li style="background-color:#ddd;">
                  </c:if>
               <c:if test="${p!=GMPVO.nowPage }"><!-- 현재페이지가 아닐때 -->
                  <li>
               </c:if>
                  <a href="/mypage/grouptable?nowPage=${p}">${p}</a>
                  </li>
               </c:if>
            </c:forEach>
            <!--next page  -->
            <c:if test="${GMPVO.nowPage<GMPVO.totalPage }">
               <li><a href="/mypage/grouptable?nowPage=${GMPVO.nowPage+1}"><i class="fa-solid fa-angle-right"></i></a></li>
            </c:if>
            <c:if test="${GMPVO.nowPage>=GMPVO.totalPage }">
               <li><i class="fa-solid fa-angle-right"></i></li>
            </c:if>
          </div>
                <input type="button" value="모임삭제" id="groupDrop"/>
              </div> 
                <div id="group_info">
                   <table>
                      <tr>
                         <td style="text-align: center; background-color: aliceblue; border-radius: 15px 15px 0 0; border-bottom: 1px solid black;"><h4>모임 안내</h4>
                      </tr>
                      <tr>
                         <td>
                            <textarea cols="26" rows="14" id="groupInfoTextArea" style="border: none; height: 270px; resize: none;"></textarea>
                            <script>
                                var groupInfoTextArea = document.getElementById("groupInfoTextArea");
                                groupInfoTextArea.value = "<c:forEach var='gmVO' items='${list}'>${gmVO.groupinfo}\\n</c:forEach>";
                              </script>
                         </td>
                      </tr>
                   </table>
                
                   <div style="display: flex; justify-content: center;">
                      <input type="button" value="수정하기" id="mod_btn"/>
                     </div>
                  </div>
            </div>
        </div>
    </main>