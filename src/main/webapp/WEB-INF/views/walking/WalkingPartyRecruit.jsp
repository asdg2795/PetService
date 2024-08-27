<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="/css/WalkingPartyRecruit.css">
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
<link href="https://netdna.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet">
<script>
  $(document).ready(function() {
    $("header").html("");
    $("footer").html("");
	    $("header").css("display","none");
	    $("footer").css("display","none");
  });
 function closeWindow(){
	 window.close();
 }
 function WalkingInsert(){
	 if(document.getElementById("walkingname").val==""){
		 alert("산책로 이름을 작성해주세요.");
		 return false;
	 }
	 if(document.getElementById("startPoint").val==""){
		 alert("시작점을 정해주세요.");
		 return false;
	 }
	 if(document.getElementById("endPoint").val==""){
		 alert("도착점을 정해주세요.");
		 return false;
	 }
	 if(document.getElementById("walkingcontent").val==""){
		 alert("소개글을 정해주세요.");
		 return false;
	 }
	 if(document.getElementById("people").val==""){
		 alert("인원을 정해주세요.");
		 return false;
	 }
 }
</script>
   <div class="wkpr_header">  
    <img src="/images/img_logo_black.png" alt="로고">
    <h1 style="margin-top: 20px; margin-left: 50px;">산책로 모임 생성</h1>
    <hr style="margin-top: 17px;">
  </div>
  <div class="main">
    <div id="map" style="width:450px;"></div>
    
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=22a7a6ffef91c85448b0bf07d16c546a"></script>
<script>
var mapContainer = document.getElementById('map'),
mapOption = {
    center: new kakao.maps.LatLng(33.450701, 126.570667),
    level: 3
};

var map = new kakao.maps.Map(mapContainer, mapOption);

// Start point logic
var startSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/red_b.png',
startSize = new kakao.maps.Size(50, 45),
startOption = {
    offset: new kakao.maps.Point(15, 43)
};

var startImage = new kakao.maps.MarkerImage(startSrc, startSize, startOption);

var startDragSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/red_drag.png',
startDragSize = new kakao.maps.Size(50, 64),
startDragOption = {
    offset: new kakao.maps.Point(15, 54)
};

var startDragImage = new kakao.maps.MarkerImage(startDragSrc, startDragSize, startDragOption);

// 출발 지점이 설정되었는지를 추적하는 변수
var startPointSet = false;


// 지도 클릭 이벤트 리스너를 추가하여 출발 지점을 설정합니다
kakao.maps.event.addListener(map, 'click', function(mouseEvent) {
if (!startPointSet) {
    var latlng = mouseEvent.latLng;

    // 출발 마커의 위치를 설정합니다
    startMarker.setPosition(latlng);

    // 출발 마커를 지도에 표시합니다
    startMarker.setMap(map);

    // 출발 지점이 설정되었음을 나타내는 플래그를 설정합니다
    startPointSet = true;

    // 여기에 추가적인 로직을 추가할 수 있습니다.
    

} else {
    // Arrival point logic
    var latlng = mouseEvent.latLng;

    // 도착 마커의 위치를 설정합니다
    arriveMarker.setPosition(latlng);

    // 도착 마커를 지도에 표시합니다
    arriveMarker.setMap(map);

    // 여기에 추가적인 로직을 추가할 수 있습니다.

}
});

var startMarker = new kakao.maps.Marker({
map: map,
position: new kakao.maps.LatLng(33.450701, 126.570667),
draggable: true,
image: startImage
});

kakao.maps.event.addListener(startMarker, 'dragstart', function() {
startMarker.setImage(startDragImage);
});

kakao.maps.event.addListener(startMarker, 'dragend', function() {
startMarker.setImage(startImage);
});

// Arrival point logic
var arriveSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/blue_b.png',
arriveSize = new kakao.maps.Size(50, 45),
arriveOption = {
    offset: new kakao.maps.Point(15, 43)
};

var arriveImage = new kakao.maps.MarkerImage(arriveSrc, arriveSize, arriveOption);

var arriveDragSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/blue_drag.png',
arriveDragSize = new kakao.maps.Size(50, 64),
arriveDragOption = {
    offset: new kakao.maps.Point(15, 54)
};

var arriveDragImage = new kakao.maps.MarkerImage(arriveDragSrc, arriveDragSize, arriveDragOption);

var arrivePosition = new kakao.maps.LatLng(33.450701, 126.572667);

var arriveMarker = new kakao.maps.Marker({
map: map,
position: arrivePosition,
draggable: true,
image: arriveImage
});

kakao.maps.event.addListener(arriveMarker, 'dragstart', function() {
arriveMarker.setImage(arriveDragImage);
});

kakao.maps.event.addListener(arriveMarker, 'dragend', function() {
arriveMarker.setImage(arriveImage);
});
if (navigator.geolocation) {
    
    // GeoLocation을 이용해서 접속 위치를 얻어옵니다
    navigator.geolocation.getCurrentPosition(function(position) {
        
        var lat = position.coords.latitude, // 위도
            lon = position.coords.longitude; // 경도
        
        var locPosition = new kakao.maps.LatLng(lat, lon), // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
            message = '<div style="padding:5px;">여기에 계신가요?!</div>'; // 인포윈도우에 표시될 내용입니다
        
        // 마커와 인포윈도우를 표시합니다
        displayMarker(locPosition, message);
            
      });
    
} else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다
    
    var locPosition = new kakao.maps.LatLng(33.450701, 126.570667),    
        message = 'geolocation을 사용할수 없어요..'
        
    displayMarker(locPosition, message);
}

// 지도에 마커와 인포윈도우를 표시하는 함수입니다
function displayMarker(locPosition, message) {

    // 마커를 생성합니다
    var marker = new kakao.maps.Marker({  
        map: map, 
        position: locPosition
    }); 
    
    var iwContent = message, // 인포윈도우에 표시할 내용
        iwRemoveable = true;

    // 인포윈도우를 생성합니다
    var infowindow = new kakao.maps.InfoWindow({
        content : iwContent,
        removable : iwRemoveable
    });
    
    // 지도 중심좌표를 접속위치로 변경합니다
    map.setCenter(locPosition);      
}    
</script>

    <div class="main_div2">
    <form method="post" action="/walking/WalkingWriteOk" onsubmit="return WalkingInsert()">
    <input type="hidden" value="${logId}" name="userid">
      <h2 class="contents-tit" style="margin-bottom: 10px;">산책로 이름</h2>
      <div class="inputset inputset-round">
        <div class="contents-mail">
          <input type="text" class="inputset-input form-control" id="walkingname" name="coursename" aria-label="내용" >
        </div>
      </div>
      <br>
      <h2 class="contents-tit" style="margin-bottom: 10px;">시작점</h2>
      <div class="inputset inputset-round">
        <div class="contents-mail">
          <input type="text" class="inputset-input form-control" aria-label="내용" id="startPoint" name="startarea">
          <div class="search-icon-container">
            <img src="/images/search.png" alt="Search" class="search-icon">
          </div>
        </div>
      </div>
      <br>
      <h2 class="contents-tit" style="margin-bottom: 10px;">도착점</h2>
      <div class="inputset inputset-round">
        <div class="contents-mail">
          <input type="text" class="inputset-input form-control" aria-label="내용" id="endPoint" name="endarea">
          <div class="search-icon-container">
            <img src="/images/search.png" alt="Search" class="search-icon">
          </div>
        </div>
      </div>
      <br>
      <h2 class="contents-tit" style="margin-bottom: 10px;">소개글</h2>
      <div class="inputset inputset-round">
        <div class="contents-mail">
          <input type="text" class="inputset-input form-control" id="walkingcontent" name="content" aria-label="내용" >
        </div>
      </div>     
     <h2 class="contents-tit" style="margin-bottom: 10px;">인원</h2>
		<div class="walkingparty-search-options">
		    <div class="contents-amount">
		        <button class="contents-btn btn-minus" type="button" onclick="calPeople(-1)">
		            <img src="/icons/ico_minus_black.svg" alt="마이너스 아이콘">
		        </button>
		        <p class="contents-amount-num" style="margin-top: 0px;">
		            <span><input type="text" name="people" id="peopleCount" style="text-align:center;" value="1" readonly>명</span>
		        </p>
		        <button class="contents-btn btn-plus" type="button" onclick="calPeople(1)">
		            <img src="/icons/ico_plus_black.svg" alt="플러스 아이콘">
		        </button>
		    </div>
		</div>
      <br>
      <h2 class="contents-tit" style="margin-bottom: 10px;">HashTag</h2>
      <div class="inputset inputset-round">
        <div class="contents-mail">
          <input type="text" class="inputset-input form-control" id="hashtag" name="hashtag" aria-label="내용" >
        </div>
      </div>

      <br>
      <div class="wkbtn">
        <div class="join-btn2">
          <input type="button" class="btnset btnset-round btnset-line btnset-black" id="bt3" style="margin-right: 10px;" value="닫기" onclick="closeWindow();">
          <input type="submit" class="btnset btnset-round" id="bt4" value="생성">
        </div>
      </div>
      </form>
    </div>
  </div>
  <script>
	/*function decreasePeople(-1) {
	    var peopleCount = document.getElementById('peopleCount');
	    var currentCount = parseInt(peopleCount.textContent);
	    if (currentCount > 1) {
	        peopleCount.textContent = currentCount - 1;
	    }
	}*/
	
	/*function increasePeople(1) {
	    var peopleCount = document.getElementById('peopleCount').innerText;
	    var currentCount = parseInt(peopleCount.textContent);
	    peopleCount.textContent = currentCount + 1;
	}*/
	function calPeople(n) {
        var text = document.getElementById('peopleCount'); // 폼 선택

        text_val = parseInt(text.value); // 폼 값을 숫자열로 변환

        text_val += n; // 계산

        text.value = text_val; // 계산된 값을 바꾼다

        if (text_val <= 0) {
          text.value = 1; // 만약 값이 0 이하면 1로 되돌려준다, 1보다 작은 수는 나타나지 않게하기 위해
        }
      }

</script>