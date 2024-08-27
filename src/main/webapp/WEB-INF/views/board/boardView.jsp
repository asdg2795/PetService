<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>
	#replyArea {
		padding: 10px 0px;
	}
	#coment {
		width: 70%;
		height: 80px;
	}
	#replyList>li {
		border-bottom: 1px solid #ddd;
	}
	main{
	
    margin-bottom: 20px;
    margin-top : 100px;
    
}
</style>
<script>
	function boardDel() {
		if(confirm("글을 정말 삭제하시겠습니까?")) {
			location.href = "/board/delete?no=${vo.no}";
		}
	}
	
	// ajax를 이용한 댓글 등록, 수정, 삭제, 목록
	$(function() {
		// 목록
		function replyList() {
			$.ajax({
				url: '/boardReply/list',
				data: {no:${vo.no}},
				type: 'GET',
				success: function(result) {
					console.log(result);
					
					var tag = "";	// 댓글목록 태그(수정, 삭제)
					$(result).each(function(i, rVO) {
						tag += "<li><div><b>"+rVO.userid+"</b>("+rVO.writedate+")";

						// 수정, 삭제 버튼은 로그인 아이디와 댓글을 쓴 이의 아이디가 같을 때
						// 'goguma' == 'goguma'
						if('${logId}' == rVO.userid) {
							tag += "<input type='button' value='Edit' />";
							tag += "<input type='button' value='Del' title='"+rVO.replyno+"' />";
							
							tag += "<p>"+rVO.coment+"</p></div>";	// 댓글 내용
							
							// 수정폼 -> 댓글 글번호, 댓글 내용이 폼에 있어야 한다.
							tag += "<div style='display:none'><form method='post'>";
							tag += "<input type='hidden' name='replyno' value='"+rVO.replyno+"'/>";
							tag += "<textarea name='coment' style='width:400px;height:80px;'>"+rVO.coment+"</textarea>";
							tag += "<input type='submit' value='댓글 수정하기'/>";
							tag += "</form></div>";
							
						} else {
							tag += "<p>"+rVO.coment+"</p></div>";							
						}
						tag += "</li>";
					});
					console.log(tag);
					$("#replyList").html(tag);
					
				}, error: function(e) {
					console.log(e.responseText);
				}
			});	
		}
		
		// 등록
		$("#replyForm").submit(function() {
			// form태그의 action을 중지한다.
			event.preventDefault();
			
			// comment입력확인
			if($("#coment").val()=="") {
				alert("댓글을 입력 후 등록하세요..");
				return false;
			}
			
			// form의 데이터를 query로 만들기		n=39&coment=예쁘네
			var params = $(this).serialize();
			//		   = "no="+$("no").val()+"&coment="+$("#coment").val()
			$.ajax({
				url : "/boardReply/write",
				data : params,
				type : "POST",
				success : function(result) {
					console.log(result)
					$("#coment").val("");
					// 목록 새로 출력
					
					
				}, error: function(e) {
					console.log(e.responseText);
				}
			});
			// return false;
		});
		
		// 수정폼 보여주기
		$(document).on('click', '#replyList input[value=Edit]', function() {
			$(this).parent().css('display', 'none');	// 부모 숨기기 : 댓글 내용
			$(this).parent().next().css('display', 'block');		// 댓글 수정폼
		});
		
 		// 수정(DB)
		$(document).on('submit', '#replyList form', function() {
			event.preventDefault();	// 기본 이벤트 제거
			var params = $(this).serialize();	// replyno=25&coment=dfdfd
			var url = "/boardReply/editOk";
			$.ajax({
				url : url,
				data : params,
				type : "POST",
				success:function(result) {
					console.log('댓글 수정', result);
					if(result=='0') {	// 댓글 수정 안됨
						alert("댓글이 수정 실패 되었습니다.");
					} else {
						replyList();	// 댓글목록 다시 선택
					}
				}, error:function(error) {
					console.log(error.responseText);
				}
			});
		});
		
		// 댓글 삭제
		$(document).on('click', '#replyList input[value=Del]', function() {
			if(confirm("삭제하시겠습니까?")) {
				// 삭제할 레코드 번호
				var replyno = $(this).attr("title");
				
				$.ajax({
					url : "/boardReply/delete",
					data : {
						replyno : replyno
					},
					type : "GET",
					success: function(result) {
						replyList();	// 댓글목록 다시 선택		
					}, error: function(e) {
						console.log(e.responseText);
					}
				});
			}	
		});
		// 목록 출력 함수 호출
		replyList();
	});
</script>
<main>
	<h1>글내용보기</h1>
	<ul>
		<li>번호 : ${vo.no}, 글쓴이 : ${vo.userid}, 조회수 : ${vo.hit}, 등록일 : ${vo.writedate}</li>
		<li>제목 : ${vo.subject}</li>
		<li>${vo.content}</li>
	</ul>
	
	<div>
		<a href="/board/list?nowPage=${pVO.nowPage}<c:if test='${pVO.searchWord!=null}'>&searchKey=${pVO.searchKey}&searchWord=${pVO.searchWord}</c:if>">목록</a>
		<!-- 현재 글쓴이와 로그인 아이디 같을 때만 수정, 삭제 가능 -->
		<c:if test="${vo.userid==logId}">
			<a href="/board/edit?no=${vo.no}">수정</a>
			<a href="javascript:boardDel()">삭제</a>
		</c:if>
	</div>
	
	<!-- 댓글 -->
	<div id="replyArea">
		<!-- 로그인 상태일 때 댓글 쓰기 -->
		<c:if test="${logStatus=='Y'}">
			<form method="post" id="replyForm">
				<!-- 원글 글번호 -->
				<input type="hidden" name="no" value="${vo.no}" />
				<textarea name="coment" id="coment"></textarea>
				<button>댓글 등록</button>
			</form>
		</c:if>	
		<!-- 댓글 목록 -->
		<div style="background:#FFF3FE">댓글 목록</div>
		<ul id="replyList">
		</ul>
	</div>
</main>