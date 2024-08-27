<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<link rel="stylesheet" href="/css/managerpage.css">
<script>
   //메뉴상태변경을 누르면 .container상태를 변경하도록 처리
   window.addEventListener("load", function(){
    document.querySelector(".toggle").addEventListener("click",function(){
      document.querySelector(".container").classList.toggle("collapse");
    });
   });
</script>
<script>

	$(document).on('click', '.UserDel', function() {
		var isconfirm = confirm("유저 정보를 삭제하시겠습니까?");
		if (isconfirm) {
			// 클릭된 삭제 버튼이 속한 행을 찾습니다.
			var row = $(this).closest('tr');
			// 행에서 course_no의 값을 가져옵니다.
			var no = row.find('td:first').text();
			// 가져온 값 출력 또는 다른 동작 수행
			console.log("삭제 버튼이 눌린 행의 no: " + no);

			$.ajax({
				url : "/managerPage/UserDel",
				data : {
					no : no
				},
				type : "GET",
				success : function() {
					alert("유저 정보가 삭제되었습니다.");
					location.reload();
				},
				error : function(e) {
					console.log(e.responseText);
				}
			});
		}
	});
	
	$(document).on('click', '.courseDel', function() {
		var isconfirm = confirm("코스를 삭제하시겠습니까?");
		if (isconfirm) {
			// 클릭된 삭제 버튼이 속한 행을 찾습니다.
			var row = $(this).closest('tr');
			// 행에서 course_no의 값을 가져옵니다.
			var courseno = row.find('td:first').text();
			// 가져온 값 출력 또는 다른 동작 수행
			console.log("삭제 버튼이 눌린 행의 courseno: " + courseno);

			$.ajax({
				url : "/managerPage/courseDel",
				data : {
					courseno : courseno
				},
				type : "GET",
				success : function() {
					alert("코스가 삭제되었습니다.");
					location.reload();
				},
				error : function(e) {
					console.log(e.responseText);
				}
			});
		}
	});
</script>

    
<main>
    <div class ="container">

      <!-- 사이드바 영역-->
      <div class= "sidebar">
        <label class="toggle">
          <span></span>
          <span></span>
          <span></span>
        </label>
        <div id="content">
          <ul>
            <br>
            <li id="section1">회원 관리</li><br>
            <li id="section2">펫 프로필 관리</li><br>
            <li id="section3">게시물 관리</li><br>
            <li id="section4">코스 관리</li><br>
            <li id="section5">친구/파티 관리</li><br>
            <li id="section6">리뷰 관리</li><br>
            <li id="section7">신고 내역 관리</li><br>
            
          </ul>
        </div>
      </div>

      <!--컨텐츠 영역-->
      <div class="contents">
        <div id="contentSection1" class="content-section">
          <table>
            <thead>
              <tr>
                <th>NO</th>
                <th>ID</th>
                <th>PWD</th>
                <th>NAME</th>
                <th>TEL</th>
                <th>EMAIL</th>
                <th>ADDR</th>
                <th>CREATEDATE</th>
                <th>Edit/Delete</th>
              </tr>
            </thead>
            <tbody>
              <tr>
	              <c:forEach var="umVO" items="${userlist}"> 
	                <td>${umVO.no}</td>
	                <td>${umVO.userid}</td>
	                <td>${umVO.userpwd}</td>
	                <td>${umVO.username}</td>
	                <td>${umVO.tel }</td>
	                <td>${umVO.email}</td>
	                <td>${umVO.addr}</td>
	                <td>${umVO.createdate}</td>
	                <td>
	                  <input type="button" value="Delete" class="UserDel">
	                  
	                </td> 
              </tr>
                </c:forEach>
            </tbody>
          </table>
        </div> 
        <div id="contentSection2" class="content-section">
          <table>
            <thead>
              <tr>
                <th>NO</th>
                <th>ID</th>
                <th>PetName</th>
                <th>PetAge</th>
                <th>PetGender</th>
                <th>PetHobby</th>
                <th>PetKind</th>
                <th>PetSize</th>
                <th>PetWant</th>
                <th>PetImg</th>
                <th>Edit/Delete</th>
              </tr>
            </thead>
            <tbody>
              <tr>
               <c:forEach var="pmVO" items="${petlist}">
                <td>${pmVO.no}</td>
                <td>${pmVO.userid}</td>
                <td>${pmVO.petname}</td>
                <td>${pmVO.petage}</td>
                <td>${pmVO.petgender}</td>
                <td>${pmVO.pethobby}</td>
                <td>${pmVO.petkind}</td>
                <td>${pmVO.petsize}</td>
                <td>${pmVO.petwant}</td>
                <td><img src = "/images/${pmVO.petimg}" style="width:80px;height:50px;"></td>
                <td>
                  <input type="button" class="PetProfileDel" value="Delete">
                </td>
              </tr>
              </c:forEach>
            </tbody>
          </table>
        </div>
         <script>
         $(document).on('click', '.PetProfileDel', function() {
     		var isconfirm = confirm("펫프로필을 삭제하시겠습니까?");
     		if (isconfirm) {
     			// 클릭된 삭제 버튼이 속한 행을 찾습니다.
     			var row = $(this).closest('tr');
     			// 행에서 course_no의 값을 가져옵니다.
     			var no = row.find('td:first').text();
     			// 가져온 값 출력 또는 다른 동작 수행
     			console.log("삭제 버튼이 눌린 행의 no: " + no);

     			$.ajax({
     				url : "/managerPage/PetProfileDel",
     				data : {
     					no : no
     				},
     				type : "GET",
     				success : function() {
     					alert("펫프로필이 삭제되었습니다.");
     					location.reload();
     				},
     				error : function(e) {
     					console.log(e.responseText);
     				}
     			});
     		}
     	});
        </script>
        <div id="contentSection3" class="content-section">
          <table>
            <thead>
              <tr>
                <th>NO</th>
                <th>ID</th>
                <th>TITLE</th>
                <th>CONTENT</th>
                <th>WRITEDATE</th>
                <th>Edit/Delete</th>
              </tr>
            </thead>
            <tbody>
              <tr>
              <c:forEach var="bdVO" items="${boardlist}">
                <td>${bdVO.no}</td>
                <td>${bdVO.userid }</td>
                <td>${bdVO.subject }</td>
                <td>${bdVO.content } </td>
                <td>${bdVO.writedate }</td>
                <td>
                  <input type="button" class="PostDel" value="Delete">
                </td>
                </tr>
                </c:forEach>
                
                <script>
                $(document).on('click', '.PostDel', function() {
             		var isconfirm = confirm("게시물을 삭제하시겠습니까?");
             		if (isconfirm) {
             			// 클릭된 삭제 버튼이 속한 행을 찾습니다.
             			var row = $(this).closest('tr');
             			// 행에서 course_no의 값을 가져옵니다.
             			var no = row.find('td:first').text();
             			// 가져온 값 출력 또는 다른 동작 수행
             			console.log("삭제 버튼이 눌린 행의 no: " + no);

             			$.ajax({
             				url : "/managerPage/PostDel",
             				data : {
             					no : no
             				},
             				type : "GET",
             				success : function() {
             					alert("게시물이 삭제되었습니다.");
             					location.reload();
             				},
             				error : function(e) {
             					console.log(e.responseText);
             				}
             			});
             		}
             	});
                </script>
              
             
            </tbody>
          </table>
        </div>
        <div id="contentSection4" class="content-section">
          <table>
            <thead>
              <tr>
                <th>NO</th>
                <th>CourseName</th>
                <th>Course Starting Point</th>
                <th>Course Ending Point</th>
                <th>Creation day</th>
                <th>Creator</th>
                <th>Edit/Delete</th>
              </tr>
            </thead>
            <tbody>
              <tr>
              <c:forEach var="wkVO" items="${walkinglist}">
                <td>${wkVO.courseno }</td>
                <td>${wkVO.coursename }</td>
                <td>${wkVO.startarea }</td>
                <td>${wkVO.endarea }</td>
                <td>${wkVO.writedate }</td>
                <td>${wkVO.userid }</td>
                <td>
                  <input type="button" value="Delete" class="courseDel"/>
                </td>
                
              </tr>
              </c:forEach>
            </tbody>
          </table>
        </div>
        <div id="contentSection5" class="content-section">
          <table>
            <thead>
              <tr>
                <th>NO</th>
                <th>Userid</th>
                <th>Applyid</th>
                <th>ApplyName</th>
                <th>Category</th>
                <th>ApplyDate</th>
                <th>Edit/Delete</th>
              </tr>
            </thead>
            <tbody>
              <tr>
               <c:forEach var="rqVO" items="${requestlist}">
                <td>${rqVO.no }</td>
                <td>${rqVO.userid }</td>
                <td>${rqVO.applyid }</td>
                <td>${rqVO.applyname }</td>
                <td>${rqVO.category }</td>
                <td>${rqVO.applydate }</td>
                
                <td>
                  <input type="button" class="PartyDel" value="Delete">
                </td>
                 </tr>
                 </c:forEach>
                <script>
                $(document).on('click', '.PartyDel', function() {
             		var isconfirm = confirm("친구 및 파티를 삭제하시겠습니까?");
             		if (isconfirm) {
             			// 클릭된 삭제 버튼이 속한 행을 찾습니다.
             			var row = $(this).closest('tr');
             			// 행에서 course_no의 값을 가져옵니다.
             			var no = row.find('td:first').text();
             			// 가져온 값 출력 또는 다른 동작 수행
             			console.log("삭제 버튼이 눌린 행의 no: " + no);

             			$.ajax({
             				url : "/managerPage/PartyDel",
             				data : {
             					no : no
             				},
             				type : "GET",
             				success : function() {
             					alert("친구 및 파티가 삭제되었습니다.");
             					location.reload();
             				},
             				error : function(e) {
             					console.log(e.responseText);
             				}
             			});
             		}
             	});
                </script>
             
             
            </tbody>
          </table>
        </div>
        <div id="contentSection6" class="content-section">
          <table>
            <thead>
              <tr>
                <th>NO</th>
                <th>ID</th>
                <th>AreaName</th>
                <th>Review</th>
                <th>Rating</th>
                <th>WRITEDATE</th>
                <th>Edit/Delete</th>
              </tr>
            </thead>
            <tbody>
              <tr>
              <c:forEach var="rvVO" items="${reviewlist}">
                <td>${rvVO.no }</td>
                <td>${rvVO.userid }</td>
                <td>${rvVO.areaname }</td>
                <td>${rvVO.content}</td>
                <td>★ ${rvVO.star}</td>
                <td>${rvVO.writedate}</td>
                <td>
                  <input type="button" class="ReviewDel" value="Delete">
                </td>
               </tr>
			</c:forEach>
                <script>
                $(document).on('click', '.ReviewDel', function() {
             		var isconfirm = confirm("리뷰를 삭제하시겠습니까?");
             		if (isconfirm) {
             			// 클릭된 삭제 버튼이 속한 행을 찾습니다.
             			var row = $(this).closest('tr');
             			// 행에서 course_no의 값을 가져옵니다.
             			var no = row.find('td:first').text();
             			// 가져온 값 출력 또는 다른 동작 수행
             			console.log("삭제 버튼이 눌린 행의 no: " + no);

             			$.ajax({
             				url : "/managerPage/ReviewDel",
             				data : {
             					no : no
             				},
             				type : "GET",
             				success : function() {
             					alert("리뷰가 삭제되었습니다.");
             					location.reload();
             				},
             				error : function(e) {
             					console.log(e.responseText);
             				}
             			});
             		}
             	});
                </script>
            </tbody>
          </table>
        </div>
        <div id="contentSection7" class="content-section">
          <table>
            <thead>
              <tr>
                <th>NO</th>
                <th>Reporting Target ID</th>
                <th>ReporterID</th>
                <th>Type Of Report</th>
                <th>Report Content</th>
                <th>Report Date</th>
                <th>Edit/Delete</th>
              </tr>
            </thead>
            <tbody>
              <tr>
	              <c:forEach var="rpVO" items="${reportlist}">
	                <td>${rpVO.no}</td>
	                <td>${rpVO.userid}</td>
	                <td>${rpVO.reporter}</td>
	                <td>${rpVO.category}</td>
	                <td>${rpVO.comment}</td>
	                <td>${rpVO.reportdate}</td>
	                <td>
	                  <input type="button" class="ReportDel" value="Delete">
	                </td>
	              </tr>
              </c:forEach>
            </tbody>
          </table>
        </div>
         <script>
                  document.addEventListener('DOMContentLoaded', function() {
                  // ReviewDel 클래스를 가진 버튼에 대한 이벤트 리스너 추가
                  var ReportDelButtons = document.querySelectorAll('.ReportDel');
                  
                  ReportDelButtons.forEach(function(button) {
                    button.addEventListener('click', function() {
                      var confirmed = confirm("신고내역을 삭제하시겠습니까?");
                      if (confirmed) {
                        // 여기에서 실제 삭제 동작을 수행하거나 필요한 동작을 추가하면 됨
                        alert("신고내역을 삭제되었습니다.");
                      } 
                    });
                  });
                });
                </script>
      </div>
      <script>
        document.addEventListener('DOMContentLoaded', function() {
          var sidebarItems = document.querySelectorAll('.sidebar li');
          var contentSections = document.querySelectorAll('.content-section');

           
          sidebarItems.forEach(function(item, index) {
            item.addEventListener('click', function() {
            // 모든 섹션과 사이드바 아이템에서 'active' 클래스 제거
              contentSections.forEach(function(section) {
                 section.classList.remove('active');
              });

              sidebarItems.forEach(function(sidebarItem) {
                 sidebarItem.classList.remove('active');
              });

              // 클릭한 섹션과 사이드바 아이템에 'active' 클래스 추가
              contentSections[index].classList.add('active');
              item.classList.add('active');
              });
            });
        });

      </script>
    </div>
  </main>