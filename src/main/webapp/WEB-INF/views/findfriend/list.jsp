<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<link rel="stylesheet" href="/css/friend.css">

<main class = "main">
    <div class = "main-container">
      <div id = "bd">
        <div id = "mainheader">
          <p><h1>이달의 인기쟁이</h1><h3><a href="#"></a></h3><h3><a href="#"></a></h3><h3><a href="#"></a></h3><h3>&nbsp;</h3><h3>&nbsp;</h3><h3>&nbsp;</h3><h3>&nbsp;</h3><h3>&nbsp;</h3><h3>&nbsp;</h3></p>
        </div>
        <div class = "top">
         
           <c:forEach var="ffvo" items="${list }">
           
	          <div id = "top_1">
	            <img src = "/images/${ffvo.petimg}">
	            <p><a href="/findfriend/pet?no=${ffvo.no }">${ffvo.petname}</a></p>
	            <h2>소개글</h2>
	            <span style="text-aling:center;">${ffvo.introducing}</span>
	          </div>
	       
          </c:forEach>

        </div>
      
      <div class = "add" style="clear:left">
      <c:if test="${logStatus != ' ' && logStatus == 'Y' }">
         <form method="get" action="/findfriend/register">
          	<button type = "submit"  style="width:80px;height:30px;margin-left:120px;margin-top:50px;">등록하기</button>
         </form>
      </c:if>
      </div>
     </div>
    </div>
  </main>