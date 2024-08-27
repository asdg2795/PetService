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

      .menu-tab {
          display: flex;
          gap: 10px;
      }

      .menu-item {
          padding: 10px;
          cursor: pointer;
          transition: background-color 0.3s;
          border: 1px solid #ced4da;
          border-radius: 5px;
      }

      .menu-item:hover {
          background-color: #e9ecef;
      }



      .dropbtn {
          font-weight: 500;
      }

      .dropdown {
          position: relative;
          display: inline-block;
          padding: 5px;
          border : 1px solid rgb(37, 37, 37);
      }

      .dropdown-content {
          display: none;
          position: absolute;
          background-color: #fff;
          border : 1px solid rgb(37, 37, 37);
          box-shadow: 0 8px 16px rgba(0, 0, 0, 0.1);
          z-index: 1;
          border-radius: 5px;
      }

      .dropdown-content a {
          color: #333;
          padding: 5px;
          display: block;
          text-decoration: none;
          cursor: pointer;
      }

      .dropdown-content a:hover {
          background-color: #e9ecef;
      }

      .dropdown:hover .dropdown-content {
          display: block;
      }

      .dropdown:hover .dropbtn {
          background-color: #e9ecef;
      }

      .transaction-complete-button {
          padding: 10px 20px;
          background-color: #28a745; /* Green background */
          color: white;
          border: none;
          border-radius: 5px;
          cursor: pointer;
          font-size: 14px;
          box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
      }

      .transaction-complete-button:hover {
          background-color: #218838; /* Slightly darker green on hover */
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
        <div class="menu-tab">
            <div class="menu-item" onclick="editItem()">수정</div>
            <div class="menu-item" onclick="deleteItem(${trade.no})">삭제</div>
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

      <button id="completeTransaction" class="transaction-complete-button" onclick="completeTransaction()">거래완료</button>
</div>
</main>

<hr>





<script>

    // 수정 함수
    function editItem() {
        // 수정 기능을 추가하세요
        window.location.href = `/trade/${trade.no}/edit`;
    }

    // 삭제 함수
    function deleteItem(itemNo) {
        if (confirm("정말로 삭제하시겠습니까?")) {
            fetch(`/trade/${trade.no}`, {
                method: 'DELETE',
            })
                .then(response => {
                    if (response.ok) {
                        alert('글이 삭제되었습니다.');
                        window.location.href = '/trade';
                    } else {
                        alert('삭제에 실패했습니다.');
                    }
                })
                .catch(error => {
                    console.error('삭제 중 오류 발생:', error);
                    alert('삭제 중 오류가 발생했습니다.');
                });
        }
    }

    function completeTransaction() {
        if (confirm("정말로 거래완료하시겠습니까?")) {
            fetch(`/trade/${trade.no}/updateStatus`, {
                method: 'POST',
            })
                .then(response => {
                    if (response.ok) {
                        alert('거래가 완료됐습니다..');
                        window.location.href = '/trade';
                    } else {
                        alert('거래 완료에 실패했습니다.');
                    }
                })
                .catch(error => {
                    console.error('거래 완료 중 오류 발생:', error);
                    alert('거래완료 중 오류가 발생했습니다.');
                });
        }
    }

</script>

  <!-- 푸터 영역 끝 -->
  <script src="../../../js/setting.js"></script>
  <script src="../../../js/plugin.js"></script>
  <script src="../../../js/palette.js"></script>
  <script src="../../../js/common.js"></script>
  <script src="../../../js/script.js"></script>
</body>