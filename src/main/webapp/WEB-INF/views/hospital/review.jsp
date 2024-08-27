<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="/css/review.css">
<script>
$(document).on('click', '.Del', function() {
		var isconfirm = confirm("리뷰를 삭제하시겠습니까?");
		if (isconfirm) {
			// 클릭된 삭제 버튼이 속한 행을 찾습니다.
			var row = $(this).closest('tr');
			// 행에서 course_no의 값을 가져옵니다.
			var no = row.find('td:first').text();
			// 가져온 값 출력 또는 다른 동작 수행
			console.log("삭제 버튼이 눌린 행의 courseno: " + courseno);

			$.ajax({
				url : "/hospital/Del",
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
<main class="main">
	<div class="main-container">
		<div id="review">
			<ul id="boardList" style="text-align:center;">
				<li>ID</li>
				<li>Review</li>
				<li>Rating</li>
				<li>Img</li>
				<li>WriteDate</li>
				<li>&nbsp;</li>
				<c:forEach var="hhVO" items="${hhlist}">
					<li>${hhVO.userid}</li>
					<li>${hhVO.content}</li>
					<li>★ ${hhVO.star}</li>
					<li><img src="/images/${hhVO.hospitalImg}" style="width:50px;height:50px;"></li>
					<li>${hhVO.writedate}</li>
					 <li><c:if test="${hhVO.userid == logId}">
					 	<input type="button" value="Delete" class="Del" style="width:100px;">
					 </c:if></li>
				</c:forEach>
			</ul>
		</div>
	</div>
</main>