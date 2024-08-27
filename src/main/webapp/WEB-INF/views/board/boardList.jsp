<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>

.main>.main-container{
	
	width:1200px; 
    margin : 100px auto 20px;
    
}
	#boardTop>div {
		float: left;
		width: 50%;
	}
	#boardTop {
		height: 50px;
	}
	#boardTop>div:last-of-type {
		text-align: right;
	}
	#boardList {
		overflow: auto;
	}
	#boardList>li {
		float:left;
		height: 40px;
		line-height: 40px;
		border-bottom: 1px solid #ddd;
		width: 10%;
	}
	#boardList>li:nth-child(5n+2) {
		width: 60%;
		/* 말줄임하기 */
		white-space: nowrap;	/* 줄바꾸기 않음 */
		overflow: hidden;	/* 넘친데이터 숨기기 */
		text-overflow: ellipsis;	/* 넘친 데이터가 있으면 ... 표시하기 */
	}
	.page {
		height: 40px;
	}
	.page li {
		float: left;
		height: 40px;
		line-height: 40px;
		padding: 10px;
	}
	.search {
		text-align: center;
	}
</style>
<script>
	function searchCheck() {
		if(document.getElementById("searchWord").value=="") {
			alert("검색어를 입력 후 검색하세요...");
			return false;
		}	
	}
</script>
<main class = "main">
	 <div class="main-container">
		<h1>게시판 목록</h1>
		
		<c:if test="${logStatus != '' && logStatus == 'Y'}">
			<div><a href="/board/write">글쓰기</a></div>
		</c:if>
		<div id="boardTop">
			<div>총 레코드 수 : ${pVO.totalRecord}개</div>
			<div>현재 페이지 : ${pVO.nowPage}/${pVO.totalPage}</div>
		</div>
		<ul id="boardList">
			<li>번호</li>
			<li>제목</li>
			<li>작성자</li>
			<li>조회수</li>
			<li>등록일</li>
			
			<c:forEach var="bVO" items="${list}">		
				<li>${bVO.no}</li>
				<li><a href="/board/view?no=${bVO.no}&nowPage=${pVO.nowPage}<c:if test='${pVO.searchWord!=null}'>&searchKey=${pVO.searchKey}&searchWord=${pVO.searchWord}</c:if>">${bVO.subject}</a></li>
				<li>${bVO.userid}</li>
				<li>${bVO.hit}</li>
				<li>${bVO.writedate}</li>
			</c:forEach>	
		</ul>
		
		<!-- 페이징 -->
		<div class="page">
			<ul>
				<!-- 현재 보는 페이지(pVO.nowPage)를 기준으로 이전 페이지로 이동 -->
				<c:if test="${pVO.nowPage==1}">
					<li>prev</li>
				</c:if>
				<c:if test="${pVO.nowPage>1}">
					<li><a href="/board/list?nowPage=${pVO.nowPage-1}<c:if test='${pVO.searchWord!=null}'>&searchKey=${pVO.searchKey}&searchWord=${pVO.searchWord}</c:if>">prev</a></li>
				</c:if>
				
				<!-- startPage에서 한번에 출력할 페이지 수 만큼 페이지 번호를 출력한다. nowPage -->
				<!-- 							1						1					5		 -->
				<c:forEach var="p" begin="${pVO.startPage}" end="${pVO.startPage + pVO.onePageCount - 1}">
					<c:if test="${p<=pVO.totalPage}">	<!-- 출력할 페이지 번호가 총 페이지 수 보다 작거나 같을 때 페이지 번호 출력 -->
						<c:if test="${p==pVO.nowPage}">	<!-- 현재 페이지일 때 -->
							<li style="background: #ddd;">
						</c:if>
						<c:if test="${p!=pVO.nowPage}">	<!-- 현재 페이지가 아닐 때 -->
							<li>
						</c:if>
								<a href="/board/list?nowPage=${p}<c:if test='${pVO.searchWord!=null}'>&searchKey=${pVO.searchKey}&searchWord=${pVO.searchWord}</c:if>">${p}</a>
							</li>
					</c:if>
				</c:forEach>
				
				<!-- next page -->
				<c:if test="${pVO.nowPage<pVO.totalPage}">
					<li><a href="/board/list?nowPage=${pVO.nowPage+1}<c:if test='${pVO.searchWord!=null}'>&searchKey=${pVO.searchKey}&searchWord=${pVO.searchWord}</c:if>">next</a></li>
				</c:if>
				<c:if test="${pVO.nowPage>=pVO.totalPage}">
					<li>next</li>
				</c:if>
			</ul>
		</div>
		
		<!-- 검색 -->
		<div class="search">
			<form method="get" action="/board/list" onsubmit="return searchCheck()">
				<select name="searchKey">
					<option value="subject">제목</option>
					<option value="content">글내용</option>
					<option value="userid">글쓴이</option>
				</select>
				<input type="text" name="searchWord" id="searchWord" />
				<input type="submit" value="search" />
			</form>
		</div>
	</div>
</main>