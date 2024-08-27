<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html lang="ko">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta http-equiv="imagetoolbar" content="no">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="format-detection" content="telephone=no">
  <title>TETOS</title>
  <link rel="stylesheet" href="../../../css/setting.css">
  <link rel="stylesheet" href="../../../css/plugin.css">
  <link rel="stylesheet" href="../../../css/palette.css">
  <link rel="stylesheet" href="../../../css/common.css">
  <link rel="stylesheet" href="../../../css/style.css">

  <link rel="stylesheet" href="../../../css/market.css">
  <style>
    body {
        font-family: 'Noto Sans KR', sans-serif;
        margin: 0;
        padding: 0;
        background-color: #f8f9fa;
    }

    .item-container {
        width: 800px;
        margin: 20px auto;
        padding: 20px;
        background-color: #fff;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }

    .item-image {
        width: 100%;
        max-height: 400px;
        object-fit: fill;
        border-radius: 8px;
        margin-bottom: 20px;
    }

    .profile-container {
        display: flex;
        align-items: center;
        margin-bottom: 20px;
    }

    .profile-image {
        width: 50px;
        height: 50px;
        object-fit: cover;
        border-radius: 50%;
        margin-right: 10px;
    }

    .profile-info {
        flex-grow: 1;
    }

    .profile-nickname {
        font-size: 18px;
        font-weight: bold;
    }

    .profile-address {
        color: #6c757d;
    }

    .item-info {
        margin-bottom: 20px;
    }

    .item-title {
        font-size: 24px;
        font-weight: bold;
    }

    .item-meta {
        color: #6c757d;
    }

    .item-price {
        font-size: 20px;
        color: #f03e3e;
        font-weight: bold;
        margin-bottom: 20px;
    }

    .item-description {
        margin-bottom: 20px;
    }

    .map-container {
        height: 300px;
        border-radius: 8px;
        overflow: hidden;
        margin-bottom: 20px;
    }

    .transaction-info {
        display: flex;
        justify-content: space-between;
        margin-bottom: 20px;
    }

    .transaction-location {
        flex-grow: 1;
        margin-right: 10px;
    }

    .map-example {
        width: 100%;
        height: 100%;
        object-fit: cover;
    }

    .chat-button {
        background-color: #007bff;
        color: #fff;
        padding: 10px 20px;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        font-size: 14px;
    }
</style>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;700&display=swap" rel="stylesheet">
</head>

<body>

<main>
  <div class="item-container">
    <img src="../../../store/${trade.imagePath}" alt="Item Image" class="item-image">
    <div class="profile-container">
        <img src="../../../images/dog-1850465.jpg" alt="Seller Profile" class="profile-image">
        <div class="profile-info">
            <div class="profile-nickname">${trade.username}</div>
            <div class="profile-address">${trade.address}</div>
        </div>
    </div>


    <div class="item-info">
        <div class="item-title">${trade.title}</div>
        <div class="item-meta">게시일: ${trade.writedate}</div>
        <div class="item-price">가격: ${trade.price}</div>
        
    </div>
    <div class="item-description">
        <h2>자세한 내용</h2>
        <p> ${trade.content} </p>
    </div>

      <div class="transaction-info">
          <div class="transaction-location">
              <h2>연락처</h2>
              <p>${trade.contact}</p>
          </div>
      </div>

    <div class="transaction-info">
        <div class="transaction-location">
            <h2>거래 장소</h2>
            <p>${trade.address}</p>
        </div>
      
    </div>

</div>
</main>

<hr>







  <!-- 푸터 영역 끝 -->
  <script src="../../../js/setting.js"></script>
  <script src="../../../js/plugin.js"></script>
  <script src="../../../js/palette.js"></script>
  <script src="../../../js/common.js"></script>
  <script src="../../../js/script.js"></script>
</body>