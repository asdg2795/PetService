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
    #course_table{/*테이블 css*/
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
    .del{
      width: 70px;
      height: 30px;
      border: 1px solid #ddd;
      border-radius: 10px;
      background-color: black;
      color: white;
      float:right;
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
      cursor: pointer;
      list-style:none; 
      margin:0 10px;
    }
    #paging > li > a{
       text-decoration:none;
    }
    .searchbtn{
        width: 80px; background-color: #ddd; 
        border-radius: 10px;
    }
    .searchbtn:hover{
       cursor:pointer;
    }
</style>
<script>
   $(document).on('click', '.del', function() {
       var isconfirm = confirm("코스를 삭제하시겠습니까?");
       if(isconfirm){
          // 클릭된 삭제 버튼이 속한 행을 찾습니다.
           var row = $(this).closest('tr');    
           // 행에서 course_no의 값을 가져옵니다.
           var courseno = row.find('td:first').text();    
           // 가져온 값 출력 또는 다른 동작 수행
           console.log("삭제 버튼이 눌린 행의 courseno: " + courseno);
          
          $.ajax({
             url:"${pageContext.servletContext.contextPath}/mypage/courseDel",
             data : {
                courseno : courseno
             },
             type:"GET",
             success : function(){
                alert("코스가 삭제되었습니다.");
                location.reload();
             },error : function(e){
                console.log(e.responseText);
             }
          });
       } 
   });
   function searchCheck(){
      if($("#searchWord").val()==""){
         alert("검색어를 입력하세요.");
         return false;
      }
   }

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
           <form method="get" action="/mypage/mycourse" onsubmit="return searchCheck()">
               <div style="justify-content: space-between; display: flex;">
                   <h2 style="margin:20px 40px;">나만의 코스</h2>
                   <div style="margin: 20px 130px;">
                      <input type="text" placeholder=" 이름으로 검색" name="searchWord" id="searchWord" style="border-radius: 10px;"/>
                      <input type="submit" value="검색" class="searchbtn"/>
                   </div>
               </div>
            </form>
            <table id="course_table">
                <thead>
                    <tr>
                       <th>번호</th>
                        <th>코스이름</th>
                        <th>코스시작지점</th>
                        <th>코스끝지점</th>
                    </tr>
                </thead>
                <tbody>
                <c:forEach var="cVO" items="${list}">
                    <tr>
                        <td>${cVO.courseno}</td>
                        <td>${cVO.coursename}</td>
                        <td>${cVO.startarea}</td>
                        <td>${cVO.endarea}<input type="button" value="삭제" class="del"/></td>
                    </tr>
                </c:forEach>
                
                <!-- 빈 행을 채우기 위한 추가 코드 -->
                <c:forEach var="index" begin="${fn:length(list) + 1}" end="5">
                    <tr>
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
               <c:if test="${PVO.nowPage==1}">
               <li><i class="fa-solid fa-angle-left"></i></li>
            </c:if>
            <c:if test="${PVO.nowPage>1}">
               <li><a href="/mypage/mycourse?nowPage=${PVO.nowPage-1}"><i class="fa-solid fa-angle-left"></i></a></li>
            </c:if>
            <!-- startPage에서 한번에 출력할 페이지 수만큼 페이지 번호를 출력한다  nowPage -->
            <c:forEach var="p" begin="${PVO.startPage }" end="${PVO.startPage + PVO.onePageCount - 1 }">
               <c:if test="${p<=PVO.totalPage }"> <!-- 출력할 페이지번호가 총페이지수보다 작거나 같을 때 페이지 번호 출력 -->
                  <c:if test="${p==PVO.nowPage }"><!-- 현재페이지일때 -->
                     <li style="background-color:#ddd;">
                  </c:if>
               <c:if test="${p!=PVO.nowPage }"><!-- 현재페이지가 아닐때 -->
                  <li>
               </c:if>
                  <a href="/mypage/mycourse?nowPage=${p}">${p}</a>
                  </li>
               </c:if>
            </c:forEach>
            <!--next page  -->
            <c:if test="${PVO.nowPage<PVO.totalPage }">
               <li><a href="/mypage/mycourse?nowPage=${PVO.nowPage+1}"><i class="fa-solid fa-angle-right"></i></a></li>
            </c:if>
            <c:if test="${PVO.nowPage>=PVO.totalPage }">
               <li><i class="fa-solid fa-angle-right"></i></li>
            </c:if>
          </div>
        </div>
    </main>