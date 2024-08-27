<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

  <link rel="stylesheet" href="../../../css/market.css">

<main class="main">
 <div class="main-container">
  <h1>우리동네 장터</h1>
  <p>지역에서 제공되는 신선한 상품을 찾아보세요.</p>

  <!-- 검색 창 -->
    <form method="get">
      <div class="search-container">
          <input type="text" class="search-box" name="tradeTitle" placeholder="상품을 검색하세요...">
          <button class="search-btn" type="submit">검색</button>
      </div>
    </form>

  <section class="product-list">
      <!-- 상품 목록 -->

      <c:forEach var="trades" items="${trades}">
          <article class="product" onclick="window.location.href='/trade/${trades.no}';">
              <img src="../../../store/${trades.imagePath}" alt="상품 1" class="product__image">
              <div class="product__info">
                  <h2 class="product__title">${trades.title}</h2>
                  <p class="product__address">${trades.address}</p>
                  <p class="product__price">${trades.price}원</p>
              </div>
          </article>
      </c:forEach>
      

      <!-- 다른 상품들도 유사하게 추가 -->

      <!-- 내 물건 올리기 버튼 -->
      <button class="sell-button" onclick="window.location.href='/trade/add';">내 물건 팔기</button>
      <button class="fixed-button" onclick="window.location.href='/tradeForm';">내 물건 팔기</button>


  </section>
  </div>
</main>
