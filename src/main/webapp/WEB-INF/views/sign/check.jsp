<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
 	<style>
        .hidden {
            display: none;
        }
    </style>
	

<script>
$(document).ready(function () {
    $('#submit-btn').on('click', function () {
        // 각 항목의 동의 여부 확인
        var agreeA = $('#radio-a-2').is(':checked');
        var agreeB = $('#radio-b-2').is(':checked');
        var agreeC = $('#radio-c-2').is(':checked');

       
        // 모든 항목이 동의되었는지 확인
        if (agreeA && agreeB && agreeC) {
            // 모두 동의한 경우, 다음 페이지로 이동
            window.location.href = "/sign/signForm";
            // 여기에 다음 페이지로 이동하는 코드를 추가하세요.
        } else{
            alert("약관동의를 동의해주세요.")
        }
    });
});
</script>
<main class="th-layout-main ">
    <!-- 미니 헤더 -->
    <div class="signup" data-bid="fslox3900j">
      <div class="contents-inner">
        <div class="contents-container container-md">
          <div class="textset">
            <h2 class="textset-tit">약관동의</h2>
            <p class="textset-desc">TEOTS에 오신 것을 환영합니다</p>
          </div>
          <ul class="contents-list">
            <li class="contents-item item-active">
              <span>1</span>
            </li>
            <li class="contents-item">
              <span>2</span>
            </li>
            <li class="contents-item">
              <span>3</span>
            </li>
          </ul>
        </div>
      </div>
    </div>
    <!-- 미니 헤더 -->


  
    <!-- 약관동의 시작 -->
    <div class="signup1" data-bid="bflOX39039">
      <div class="contents-inner">
        <div class="contents-container container-md">
          <div class="contents-group">
            <div class="contents-top">
              <h2 class="contents-tit">이용약관 (필수)</h2>
              <div class="checkset-wrap">
                <div class="checkset">
                  <input id="radio-a-2" name="radio-a" class="checkset-input input-round" type="radio" value="">
                  <label class="checkset-label" for="radio-a-2"></label>
                  <span class="checkset-text">동의</span>
                </div>
              </div>
            </div>
            <div class="contents-terms">
              <strong>총칙</strong>
              <span>제1조</span>
              <p> 이용약관에 대한 내용이 노출됩니다 이용약관에 대한 내용이 노출됩니다 이용약관에 대한 내용이 노출됩니다 이용약관에 대한 내용이 노출됩니다 이용약관에 대한 내용이 노출됩니다 이용약관에 대한 내용이 노출됩니다 이용약관에 대한 내용이 노출됩니다 이용약관에 대한 내용이 노출됩니다 이용약관에 대한 내용이 노출됩니다 이용약관에 대한 내용이 노출됩니다이용약관에 대한 내용이 노출됩니다이하 이용 약관에 대한 내용이 노출됩니다 이용약관에 대한 내용이 노출됩니다 이용약관에 대한 내용이 노출됩니다 이용약관에 대한 내용이 노출됩니다이용약관에 대한 내용이 노출됩니다 </p>
            </div>
          </div>
          <div class="contents-group">
            <div class="contents-top">
              <h2 class="contents-tit">개인정보 수집 및 이용동의 (필수)</h2>
              <div class="checkset-wrap">
                <div class="checkset">
                  <input id="radio-b-2" name="radio-b" class="checkset-input input-round" type="radio" value="">
                  <label class="checkset-label" for="radio-b-2"></label>
                  <span class="checkset-text">동의</span>
                </div>
              </div>
            </div>
            <div class="contents-terms">
              <strong>총칙</strong>
              <span>제1조</span>
              <p> 이용약관에 대한 내용이 노출됩니다 이용약관에 대한 내용이 노출됩니다 이용약관에 대한 내용이 노출됩니다 이용약관에 대한 내용이 노출됩니다 이용약관에 대한 내용이 노출됩니다 이용약관에 대한 내용이 노출됩니다 이용약관에 대한 내용이 노출됩니다 이용약관에 대한 내용이 노출됩니다 이용약관에 대한 내용이 노출됩니다 이용약관에 대한 내용이 노출됩니다이용약관에 대한 내용이 노출됩니다이하 이용 약관에 대한 내용이 노출됩니다 이용약관에 대한 내용이 노출됩니다 이용약관에 대한 내용이 노출됩니다 이용약관에 대한 내용이 노출됩니다이용약관에 대한 내용이 노출됩니다 </p>
            </div>
          </div>
          <div class="contents-group">
            <div class="contents-top">
              <h2 class="contents-tit">마케팅 개인정보 수집 및 이용동의</h2>
              <div class="checkset-wrap">
                <div class="checkset">
                  <input id="radio-c-2" name="radio-c" class="checkset-input input-round" type="radio" value="">
                  <label class="checkset-label" for="radio-c-2"></label>
                  <span class="checkset-text">동의</span>
                </div>
              </div>
            </div>
         
            <div class="contents-terms">
              <strong>총칙</strong>
              <span>제1조</span>
              <p> 이용약관에 대한 내용이 노출됩니다 이용약관에 대한 내용이 노출됩니다 이용약관에 대한 내용이 노출됩니다 이용약관에 대한 내용이 노출됩니다 이용약관에 대한 내용이 노출됩니다 이용약관에 대한 내용이 노출됩니다 이용약관에 대한 내용이 노출됩니다 이용약관에 대한 내용이 노출됩니다 이용약관에 대한 내용이 노출됩니다 이용약관에 대한 내용이 노출됩니다이용약관에 대한 내용이 노출됩니다이하 이용 약관에 대한 내용이 노출됩니다 이용약관에 대한 내용이 노출됩니다 이용약관에 대한 내용이 노출됩니다 이용약관에 대한 내용이 노출됩니다이용약관에 대한 내용이 노출됩니다 </p>
            </div>
          </div>
          <div class="contents-btnset">
          	<button id="submit-btn" class="btnset btnset-round">다음단계</button>
          </div>
        </div>
      </div>
    </div>
    <!-- 약관동의 끝 -->
  </main>