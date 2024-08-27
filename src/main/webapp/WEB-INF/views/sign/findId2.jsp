<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 <main class="th-layout-main ">
 <!-- 미니 헤더 -->
 <div class="signup" data-bid="AYlOX3956t">
  <div class="contents-inner">
    <div class="contents-container container-md">
      <div class="textset">
        <h2 class="textset-tit">아이디 찾기</h2>
        <p class="textset-desc">이메일 인증을 통해 아이디를 찾을 수 있습니다.</p>
      </div>
      <ul class="contents-list">
        <li class="contents-item item-check">
          <span>1</span>
        </li>
        <li class="contents-item item-active">
          <span>2</span>
      </ul>
    </div>
  </div>
</div>
<!-- 미니 헤더 -->



    <!-- 정보 입력 -->
    <div class="signup2" data-bid="cFLOX395dD">
      <div class="contents-inner">
        <div class="contents-container container-md">
          <div class="contents-top">
            <h2 class="contents-tit">아이디는</h2>
            <div class="show-id">
              <h1><b style="color: red;">${svo.userid}</b></h1>
            </div>
            <h2 class="contents-tit">입니다.</h2>
          </div>
          <div class="contents-group">


          </div>

          <div class="contents-btn-group">
            <a href="/sign/login" class="btnset btnset-round">로그인</a>
            <a href="/sign/findPwd" class="btnset btnset-round">비밀번호 찾기</a>
          </div>
        </div>
      </div>
    </div>
    <!-- 정보 입력 끝 -->
  </main>