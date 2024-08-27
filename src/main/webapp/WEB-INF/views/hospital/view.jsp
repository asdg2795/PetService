<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="/css/hospital.css">
<script>
document.addEventListener('DOMContentLoaded', function() { //페이지 로딩이 완료되면
    // '업로드' 버튼에 클릭 이벤트 추가
    document.querySelector("#sendButton").addEventListener('click', function() {
    // 파일 입력 필드에서 파일 가져오기
    let selectFile = document.querySelector("#hospitalImg").files[0];
      // 파일이 선택되었는지 확인
      if (selectFile) {
        // 선택한 파일을 이미지로 표시
        const file = URL.createObjectURL(selectFile);
        document.querySelector("#profile").src = file;
      }else {
        alert('파일을 선택하세요.');
      }
    });
  });
</script>
<main class = "main">
	<div class="main-container">
			<div id="map" style="width:100%;height:300px;"></div>
			<div class="content">
			<c:forEach var = "hvo" items="${list}">
				<div id="hospital">
					<img src="/images/${hvo.hosImg }" style="width:200px;height:200px;margin-right:20px;float:left;">
					<div id="hos-info">
					<input type="hidden" value="${hvo.no }">
						<h2>
							${hvo.areaname}
						</h2>
						<h3>
							tel : ${hvo.tel }<br>
							${hvo.addr }<br>
							리뷰	<a href="/hospital/review?no=${hVO.no }&nowPage = ${pVO.nowPage}<c:if test="${pVO.searchWord!=null}">&searchKey=${pVO.searchKey }&searchWord=${pVO.searchWord }</c:if>">${pVO.totalRecord }</a></li> &nbsp; <button id="reviewWrite" style="width:80px;height:30px;">리뷰작성</button><br>
							★ ${hvo.star}
						</h3>	
				
						<script>
							$(document).ready(function(){
								$("#reviewWrite").click(function(){
									$("#review_view").css('display','block');
								}); 
								$("#review_out").click(function(){
									$("#review_view").css('display','none');
								});
							});
						</script>				
					</div>
				</div>
		</c:forEach>
				<form method="post" action="/hospital/reviewWriteOk" id="review" onsubmit="return reviewCheck()">
					<div id="review_view">
						<div id="review_title">
						<input type="hidden" value="${hvo.no}">
							<h1>${hhvo.areaname }</h1>
							<input type="hidden" name="areaname" value="${hvo.areaname}">
						</div>
						
						<div style="margin-top:20px;margin-bottom:20px;">
						<input type="hidden" value="${logId}" name="userid">	
							<h1>					
								${logId }
							</h1>
							<div class="star-container">
								<img src="/icons/favorite.png" id="star1" onclick="setRating(1)" onmouseover="changeStar(1)" onmouseout="resetStars()" style="width:50px;height:50px;">
								<img src="/icons/favorite.png" id="star2" onclick="setRating(2)" onmouseover="changeStar(2)" onmouseout="resetStars()" style="width:50px;height:50px;">
								<img src="/icons/favorite.png" id="star3" onclick="setRating(3)" onmouseover="changeStar(3)" onmouseout="resetStars()" style="width:50px;height:50px;">
								<img src="/icons/favorite.png" id="star4" onclick="setRating(4)" onmouseover="changeStar(4)" onmouseout="resetStars()" style="width:50px;height:50px;">
								<img src="/icons/favorite.png" id="star5" onclick="setRating(5)" onmouseover="changeStar(5)" onmouseout="resetStars()" style="width:50px;height:50px;">
							</div>
						</div>
						<div>
							<input type="text" id="reviewWriting" name="content" style="width:500px; height:300px;">
						</div>
						<div style="margin-top:20px;">
							<label for="inputimg" style="cursor: pointer;">
								<img id="profile" src="/icons/photo.png" name="hospitalImg"style="width:150px; height:100px;">
							</label>
							<input type="file" id="hospitalImg" name="hospitalImg" accept="image/*" style="display: none;">
							<input type="button" value="사진추가" id="sendButton" style="width:250px;height:80px;">
						</div>
						<input type="button" value="뒤로가기" id="review_out" style="float:right;margin-right:20px;"/>
						<input type="submit" value="제출하기" id="review_submit" style="float:right;margin-right:20px;">
              			
					</div>
				</form>
				
				<script>
					var selectedRating = 0;
					
					function changeStar(rating) {
					    for (var i = 1; i <= 5; i++) {
					        var starImage = document.getElementById('star' + i);
					        if (i <= rating) {
					            starImage.src = '/icons/favorite-black.png'; // 선택한 별까지를 채워진 별 이미지로 변경
					        } else {
					            starImage.src = '/icons/favorite.png'; // 선택하지 않은 별은 빈 별 이미지로 유지
					        }
					    }
					}
					
					function resetStars() {
					    changeStar(selectedRating); // 마우스가 벗어났을 때 모든 별을 빈 별로 초기화
					}
					
					function setRating(rating) {
						if (rating === selectedRating) {
					        // 이미 선택한 별을 클릭한 경우, 빈 별로 초기화
					        selectedRating = 0;
					        changeStar(0);
					    } else {
					        // 새로운 별을 클릭한 경우, 선택한 별로 설정
					        selectedRating = rating;
					        changeStar(rating);
					    }
					    // 여기에서 선택한 별점(rating)을 서버에 전송하거나 다른 작업을 수행할 수 있습니다.
					    console.log('Selected Rating: ' + rating);
					}
				
			       var reviewCheck = function(){
			         if(document.getElementById("reviewWriting".value=="")){
			         	alert("리뷰내용을 입력하세요");
			            return false;
			         }
			            console.log(document.getElementById("reviewWriting").value);
			            return true;
			         }
       		 </script>
			</div>
	</div>
</main>
<script type="text/javascript" src="https://oapi.map.naver.com/openapi/v3/maps.js?ncpClientId=a4cvrt8b74"></script>
<script>
//지도를 삽입할 HTML 요소 또는 HTML 요소의 id를 지정합니다.
var mapDiv = document.getElementById('map'); // 'map'으로 선언해도 동일



var map = new naver.maps.Map('map', {
    scaleControl: false,
    logoControl: false,
    mapDataControl: false,
    zoomControl: true,
    minZoom: 6
});

var mapOptions = {
        mapTypeControl: true,
        mapTypeControlOptions: {
            style: naver.maps.MapTypeControlStyle.BUTTON,
            position: naver.maps.Position.TOP_RIGHT
        },
        zoomControl: true,
        zoomControlOptions: {
            style: naver.maps.ZoomControlStyle.SMALL,
            position: naver.maps.Position.TOP_RIGHT
        },
        scaleControl: true,
        scaleControlOptions: {
            position: naver.maps.Position.RIGHT_CENTER
        },
        logoControl: true,
        logoControlOptions: {
            position: naver.maps.Position.TOP_LEFT
        },
        mapDataControl: true,
        mapDataControlOptions: {
            position: naver.maps.Position.BOTTOM_LEFT
        }
    };
    var map = new naver.maps.Map(document.getElementById('map'), mapOptions);


var marker = new naver.maps.Marker({
    position: new naver.maps.LatLng(37.3595704, 127.105399),
    map: map
});
var HOME_PATH = window.HOME_PATH || '.';
var map = new naver.maps.Map('map', {
    center: new naver.maps.LatLng(37.498456, 127.029936),
    zoom: 15
});


makeMarker(map, new naver.maps.LatLng(37.507793, 127.0344379), 0);//강남동물병원
makeMarker(map, new naver.maps.LatLng(37.4955496, 127.0498119), 1);//OK동물병원
makeMarker(map, new naver.maps.LatLng(37.4923809, 127.0400194), 2);//예은동물병원
makeMarker(map, new naver.maps.LatLng(37.5137302, 127.0619008), 3);//아크리스동물병원
makeMarker(map, new naver.maps.LatLng(37.4970642, 127.0421964), 4);//드림동물병원
makeMarker(map, new naver.maps.LatLng(37.5144888, 127.0528557), 5);//청담우리동물병원
makeMarker(map, new naver.maps.LatLng(37.5206602, 127.0299781), 6);//스마트동물병원
makeMarker(map, new naver.maps.LatLng(37.519607, 127.029003), 7);//신사동물병원(구 24시동물병원)
makeMarker(map, new naver.maps.LatLng(37.5016802, 127.0505632), 8);//주주동물종합병원
makeMarker(map, new naver.maps.LatLng(37.5160698, 127.0386317), 9);//강남25시동물병원
makeMarker(map, new naver.maps.LatLng(37.522319, 127.0351874), 10);//치료멍멍동물의료센터
makeMarker(map, new naver.maps.LatLng(37.5105703, 127.0242166), 11);//그레이스
makeMarker(map, new naver.maps.LatLng(37.4928093, 127.0577256), 12);//레이동물의료센터
makeMarker(map, new naver.maps.LatLng(37.4973787, 127.0388185), 13);//24시 SNC동물메디컬센터
makeMarker(map, new naver.maps.LatLng(37.4999946, 127.0393429), 14);//고양이병원 백산동물병원
makeMarker(map, new naver.maps.LatLng(37.5012744, 127.0536039), 15);//서울동물의료센터
makeMarker(map, new naver.maps.LatLng(37.5120452, 127.0434392), 16);//닥터펫 동물의료센터
makeMarker(map, new naver.maps.LatLng(37.495879, 127.046228), 17);//도곡 종합 동물병원
makeMarker(map, new naver.maps.LatLng(37.5151461, 127.032368), 18);//최영민동물의료센터
makeMarker(map, new naver.maps.LatLng(37.506653, 127.040849), 19);//서울동물심장병원
makeMarker(map, new naver.maps.LatLng(37.5074761, 127.0267894), 20);//논현동물병원
makeMarker(map, new naver.maps.LatLng(37.4930979, 127.0354083), 21);//츄츄동물병원
makeMarker(map, new naver.maps.LatLng(37.5196064, 127.0491924), 22);//청담아이월24시동물병원
makeMarker(map, new naver.maps.LatLng(37.5025541, 127.0358248), 23);//닥터박동물병원
makeMarker(map, new naver.maps.LatLng(37.5238585, 127.039623), 24);//이안동물의학센터
makeMarker(map, new naver.maps.LatLng(37.5251323, 127.0525512), 25);//청담 눈초롱 안과동물병원
makeMarker(map, new naver.maps.LatLng(37.5209513, 127.0363694), 26);//청담동물병원
makeMarker(map, new naver.maps.LatLng(37.479103, 127.049117), 27);//나은동물병원
makeMarker(map, new naver.maps.LatLng(37.4942669, 127.0346883), 28);//하나카 동물병원
makeMarker(map, new naver.maps.LatLng(37.5283251, 127.0378508), 29);//메이트 동물병원

function makeMarker(map, position, index) {

    var ICON_GAP = 31;
    var ICON_SPRITE_IMAGE_URL = HOME_PATH +'/img/example/sp_pin_hd.png';
    var iconSpritePositionX = (index * ICON_GAP) + 1;
    var iconSpritePositionY = 1;

    var marker = new naver.maps.Marker({
        map: map,
        position: position,
        icon: {
          url: ICON_SPRITE_IMAGE_URL,
          size: new naver.maps.Size(26, 36), // 이미지 크기
          origin: new naver.maps.Point(iconSpritePositionX, iconSpritePositionY), // 스프라이트 이미지에서 클리핑 위치
          anchor: new naver.maps.Point(13, 36), // 지도상 위치에서 이미지 위치의 offset
          scaledSize: new naver.maps.Size(395, 79)
        }
    });

    return marker;
}
</script>