<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
  <!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>

<!-- jQuery UI -->
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
<script>
$(function(){
    //header태그와 footer태그의 내용을 지우기
    $("header").html("");
    $("header").css("display","none");
    $("footer").css("display","none");
    
    $("form").submit(function(){
        if($("#userid").val()==""){
           alert("아이디를 입력 후 중복검사 하세요");
           return false;
        }  
     	   return true;
    });
    
    $("input[value=사용하기]").click(function(){
	     opener.document.getElementById("userid").value='${userid}';
	     opener.$("#chk").val("Y");
	     self.close();
	})
    
 });

</script>
<div>
	<div>
		<c:if test="${result==0}">
			<b>${userid }</b>는 사용가능한 아이디입니다.
			<input type="button" value="사용하기"/>
		</c:if>
		<c:if test="${result==1}">
			<b>${userid }</b>는 사용불가능합니다.
		</c:if>
	</div>
	<hr/>
	<div>
		<form method="get" action="/sign/idCheck" onsubmit="return check()">
			아이디 : <input type="text" name="userid" id="userid"/>
			<input type="submit" value="아이디중복검사"/>
		</form>
	</div>
</div>