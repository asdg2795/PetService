<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html lang="ko">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta http-equiv="imagetoolbar" content="no">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="format-detection" content="telephone=no">
  <title>TETOS</title>
  <link rel="stylesheet" href="../resources/css/setting.css">
  <link rel="stylesheet" href="../resources/css/plugin.css">
  <link rel="stylesheet" href="../resources/css/palette.css">
  <link rel="stylesheet" href="../resources/css/common.css">
  <link rel="stylesheet" href="../resources/css/style.css">

  <link rel="stylesheet" href="../resources/css/market.css">
  <style>
    body {
        font-family: 'Noto Sans KR', sans-serif;
        margin: 0;
        padding: 0;
        background-color: #f8f9fa;
    }

    .sell-container {
        width: 600px;
        margin: 20px auto;
        padding: 20px;
        background-color: #fff;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }

    .sell-title {
        font-size: 24px;
        font-weight: bold;
        margin-bottom: 20px;
    }

    .form-group {
        margin-bottom: 20px;
    }

    .form-group label {
        display: block;
        font-weight: bold;
        margin-bottom: 8px;
    }

    .form-group input,
    .form-group textarea {
        width: 100%;
        padding: 10px;
        border: 1px solid #ced4da;
        border-radius: 5px;
        box-sizing: border-box;
    }

    .form-group textarea {
        height: 100px;
    }

    .upload-container {
        background-color: #e9ecef;
        width: 100%;
        height: 200px;
        display: flex;
        align-items: center;
        justify-content: center;
        border: 1px dashed #ced4da;
        border-radius: 5px;
        cursor: pointer;
    }

    .upload-container img {
        max-width: 100%;
        max-height: 100%;
        object-fit: cover;
        border-radius: 5px;
    }

    .upload-text {
        text-align: center;
        color: #6c757d;
    }

    .location-select {
        width: 100%;
        padding: 10px;
        border: 1px solid #ced4da;
        border-radius: 5px;
        box-sizing: border-box;
    }

    .submit-button {
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
<form method="post" enctype="multipart/form-data">
    <div class="sell-container">
      <h1 class="sell-title">내 물건 팔기</h1>

      <div class="form-group">
          <label for="title">제목</label>
          <input type="text" id="title" name="title" placeholder="물건의 제목을 입력하세요">
      </div>

      <div class="form-group">
          <label for="price">가격</label>
          <input type="text" id="price" name="price" placeholder="판매 희망 가격을 입력하세요">
      </div>

      <div class="form-group">
          <label for="content">자세한 내용</label>
          <textarea id="content" name="content" placeholder="물건에 대한 자세한 설명을 입력하세요"></textarea>
      </div>

      <div class="form-group">
          <label for="files">사진 첨부</label>
          <div class="upload-container" onclick="openFileInput()">
              <input type="file" id="files"  name="files" multiple onchange="displayFileNames()">
          </div>
      </div>

        <div class="form-group">
            <label for="contact">연락처</label>
            <input type="text" id="contact" name="contact" placeholder="판매자와 연락할 수 있는 방법을 적어주세요 (카카오톡 id, 전화번호 등)">
        </div>

      <div class="form-group">
          <label for="address">거래 희망 장소</label>
          <input type="text" id="address" name="address" placeholder="거래를 희망하는 장소를 입력하세요" class="location-select">
      </div>

      <button class="submit-button">작성 완료</button>
    </div>
</form>
</main>


<hr>



    <script>

    </script>


<!-- 푸터 영역 끝 -->
  <script src="../resources/js/setting.js"></script>
  <script src="../resources/js/plugin.js"></script>
  <script src="../resources/js/palette.js"></script>
  <script src="../resources/js/common.js"></script>
  <script src="../resources/js/script.js"></script>
</body>