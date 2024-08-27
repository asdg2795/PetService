<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

  <main class="layout-main ">
    <!-- 메인 소개1 시작 (슬라이드 사진 부분)-->
    <div class="introduction" data-bid="SxLonY8yYK">
      <div class="contents-container">
        <div class="contents-swiper">
          <div class="swiper-wrapper">
            <div class="swiper-slide">
              <img class="contents-backimg img-pc" src="/images/img_main_01.png" alt="PC 메인 이미지">
              <img class="contents-backimg img-mobile" src="/images/img_main_mobile_01.png" alt="모바일 메인 이미지">
              <div class="contents-slide-group container-md">
                <div class="textset textset-visual">
                  <h2 class="textset-tit">산책을 더욱 즐겁게</h2>
                  <p class="textset-desc">반려동물과의 산책을 즐겁게 만들어 드립니다.<br>더 풍요로운 산책을 경험하세요! </p>
                </div>
                <a class="btnset btnset-round btnset-line" href="/walking/WalkingParty">자세히 보기</a>
              </div>
            </div>
            <div class="swiper-slide">
              <img class="contents-backimg img-pc" src="/images/img_main_02.png" alt="PC 메인 이미지">
              <img class="contents-backimg img-mobile" src="/images/img_main_mobile_02.png" alt="모바일 메인 이미지">
              <div class="contents-slide-group container-md">
                <div class="textset textset-visual">
                  <h2 class="textset-tit">친구를 만들어주세요</h2>
                  <p class="textset-desc">이웃 친구 덕분에 외롭지않아요<br>산책 모임, 친구 찾기를 통해 지금 구해보세요! </p>
                </div>
                <a class="btnset btnset-round btnset-line" href="/findfriend/list">자세히 보기</a>
              </div>
            </div>
            <div class="swiper-slide">
              <img class="contents-backimg img-pc" src="/images/img_main_03.png" alt="PC 메인 이미지">
              <img class="contents-backimg img-mobile" src="/images/img_main_mobile_03.png" alt="모바일 메인 이미지">
              <div class="contents-slide-group container-md">
                <div class="textset textset-visual">
                  <h2 class="textset-tit">믿을 수 있는 병원</h2>
                  <p class="textset-desc">동네 동물병원 후기를 볼 수 있습니다<br>좋은 병원에 걱정 없이 반려동물을 맡기세요 </p>
                </div>
                <a class="btnset btnset-round btnset-line" href="/hospital/view">자세히 보기</a>
              </div>
            </div>
          </div>
          <div class="swiper-button-next"></div>
          <div class="swiper-button-prev"></div>
          <div class="contents-control">
            <div class="swiper-pagination"></div>
            <div class="swiper-button-pause">
              <img src="/icons/ico_pause_white.svg" alt="스와이퍼 멈춤버튼">
            </div>
            <div class="swiper-button-play">
              <img src="/icons/ico_play_white.svg" alt="스와이퍼 재생버튼">
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- 메인 소개1 끝 (슬라이드 사진 부분)-->
    

    <!-- 메인 소개2 시작 (산책 소개 부분)-->
    <div class="introduction2" data-bid="WTLoNy8yZg" id="targetDiv">
      <div class="contents-inner">
        <div class="contents-container container-md">
          <div class="cardset-wrap">
            <div class="cardset cardset-xl cardset-deco cardset-hor row-rever">
              <figure class="cardset-figure">
                <img class="cardset-img" src="/images/img_main_05.png" alt="카드이미지" data-aos="fade-up" data-aos-delay="200" data-aos-duration="500">
              </figure>
              <div class="cardset-body" data-aos="fade-left" data-aos-delay="500" data-aos-duration="500">
                <h2 class="cardset-tit"> 산책 모임 <br> 마음껏 모아보세요. </h2>
                <p class="cardset-desc"> 산책 모임 찾기 기능을 이용해보세요 <br> 산책 메이트와 함께 산책을 즐겨보세요 </p>
                <a href="/walking/WalkingParty" class="btnset btnset-round btnset-line btnset-black">산책 모임</a>
              </div>
            </div>
            <div class="cardset cardset-xl cardset-deco cardset-hor">
              <figure class="cardset-figure">
                <img class="cardset-img" src="/images/img_main_04.png" alt="카드이미지" data-aos-delay="200" data-aos="fade-up" data-aos-duration="500">
              </figure>
              <div class="cardset-body" data-aos-delay="500" data-aos="fade-right">
                <h2 class="cardset-tit"> 친구 찾기 <br> 반려 친구와 함께. </h2>
                <p class="cardset-desc"> 새로운 친구들을 사귀고, 더욱 즐거운 경험을 만들어보세요. <br> 반려동물이 외로워하지는 않나요? </p>
                <a href="/findfriend/list" class="btnset btnset-round btnset-line btnset-black">친구 찾기</a>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- 메인 소개2 끝 (산책 소개 부분)-->


    <!-- 메인 소개3 시작 (동네 장터 소개 부분)-->
    <div class="introduction3" data-bid="aRloNy8Z06" id="">
      <div class="contents-inner">
        <div class="contents-container">
          <div class="imageset">
            <img class="imageset-img img-pc" src="/images/img_main_06.png" alt="PC 이미지" data-aos-delay="200" data-aos="fade-up">
            <img class="imageset-img img-mobile" src="/images/img_main_06.png" alt="모바일 이미지">
          </div>
          <div class="cardset cardset-xl cardset-deco" data-aos="fade-up" data-aos-delay="200">
            <h2 class="cardset-tit"> 반려동물 용품 중고 장터 <br> 나눔, 판매, 구매 </h2>
            <p class="cardset-desc"> 우리 동네 중고 장터 <br> 좋은 거래와 새로운 반려동물 용품이 기다리고 있습니다. </p>
            <a href="/trade" class="btnset btnset-round btnset-line btnset-white">바로가기</a>
          </div>
        </div>
      </div>
    </div>
    <!-- 메인 소개3 끝 (동네 장터 소개 부분) -->



    <!-- 메인 소개4 시작 (커뮤니티 소개 부분) -->
    <div class="introduction4" data-bid="xVLONy8z0t">
      <div class="contents-inner">
        <div class="contents-container container-md">
          <div class="textset">
            <h2 class="textset-tit">우리 동네 커뮤니티</h2>
            <p class="textset-desc">동네 소식을 전하고 만나보세요.</p>
          </div>
          <div class="contents-swiper">
            <div class="swiper-wrapper">
              <div class="swiper-slide">
                <div class="contents-slide-group container-md">
                  <a href="/board/boardList" class="cardset">
                    <figure class="cardset-figure">
                      <img class="cardset-img" src="/images/img_main_07.png" alt="이미지">
                    </figure>
                    <div class="cardset-body">
                      <h2 class="cardset-tit">우리 멍멍이 보고 가세요</h2>
                      <p class="cardset-desc"> 새로운 개인기 연습중입니다 <br> 너무 귀엽죠? </p>
                    </div>
                  </a>
                </div>
              </div>
              <div class="swiper-slide">
                <div class="contents-slide-group container-md">
                  <a href="#" class="cardset">
                    <figure class="cardset-figure">
                      <img class="cardset-img" src="/images/img_main_08.png" alt="이미지">
                    </figure>
                    <div class="cardset-body">
                      <h2 class="cardset-tit">고양이 사료 추천해주세요</h2>
                      <p class="cardset-desc"> 사료가 안 맞는지 먹질 않네요 <br> 다들 어떤 사료 쓰시나요? </p>
                    </div>
                  </a>
                </div>
              </div>
              <div class="swiper-slide">
                <div class="contents-slide-group container-md">
                  <a href="#" class="cardset">
                    <figure class="cardset-figure">
                      <img class="cardset-img" src="/images/img_main_09.png" alt="이미지">
                    </figure>
                    <div class="cardset-body">
                      <h2 class="cardset-tit">강아지를 잃어버렸습니다.</h2>
                      <p class="cardset-desc"> 발견 시 꼭 연락주시면 감사하겠습니다 <br> 사례 충분히 드립니다.</p>
                    </div>
                  </a>
                </div>
              </div>
              <div class="swiper-slide">
                <div class="contents-slide-group container-md">
                  <a href="#" class="cardset">
                    <figure class="cardset-figure">
                      <img class="cardset-img" src="/images/img_main_10.png" alt="이미지">
                    </figure>
                    <div class="cardset-body">
                      <h2 class="cardset-tit">여유로운 글램핑</h2>
                      <p class="cardset-desc"> 초코와 함께 글램핑 왔어요! <br> 불멍 너무 좋아요. </p>
                    </div>
                  </a>
                </div>
              </div>
            </div>
            <div class="swiper-button-next"></div>
            <div class="swiper-button-prev"></div>
          </div>
          <div class="contents-control">
            <div class="swiper-pagination"></div>
            <a href="/board/boardList" class="btnset btnset-text btnset-icon">자세히보기 <div class="btnset-img">
                <img src="/icons/ico_more_black.svg" alt="자세히보기 아이콘">
              </div>
            </a>
          </div>
        </div>
      </div>
    </div>
    <!-- 메인 소개4 끝 (커뮤니티 소개 부분) -->


    <!-- 메인 소개5 시작 (아래 비디오 부분) -->
    <div class="introduction5" data-bid="MOlonY8z1J">
      <div class="contents-inner">
        <div class="contents-container">
          <div class="videoset">
            <video class="videoset-video" autoplay loop muted>
              <source src="/videos/video1.mp4">
            </video>
            <div class="videoset-body container-md">
              <p class="videoset-subtit">TEOTS</p>
              <h2 class="videoset-tit"> 기분좋은 반려인 생활 <br> 이웃과 함께 </h2>
            </div>
          </div>
        </div>
      </div>
    </div>
 <!-- 메인 소개5 끝 (아래 비디오 부분) -->



    <!-- 메인 소개6 시작 (동물 병원 추천 부분) -->
    <div class="introduction6" data-bid="ZhLony8Z27">
      <div class="contents-inner">
        <div class="contents-container container-md">
          <div class="textset">
            <h2 class="textset-tit">동물 병원 추천</h2>
            <p class="textset-desc">솔직하고 생생한 리뷰를 만나보세요.</p>
          </div>
          <div class="contents-control">
            <div class="swiper-button-prev"></div>
            <div class="swiper-button-next"></div>
          </div>
        </div>
        <div class="contents-container">
          <div class="contents-swiper">
            <div class="swiper-wrapper">
              <div class="swiper-slide">
                <div class="contents-slide-group">
                  <div class="cardset cardset-user">
                    <figure class="cardset-figure">
                      <img class="cardset-img" src="/images/img_profile_1.png" alt="이미지">
                    </figure>
                    <div class="cardset-profile">
                      <p class="cardset-text"> 병원이 쾌적하고 친절한 진료 해주십니다. 재방문의사 있어요 너무 편리하고 좋아요 </p>
                      <p class="cardset-info">서울동물병원</p>
                    </div>
                  </div>
                </div>
              </div>
              <div class="swiper-slide">
                <div class="contents-slide-group">
                  <div class="cardset cardset-user">
                    <figure class="cardset-figure">
                      <img class="cardset-img" src="/images/img_profile_2.png" alt="이미지">
                    </figure>
                    <div class="cardset-profile">
                      <p class="cardset-text"> 병원 너무 깔끔하고 원장님께서 친절하게 주의사항 말씀해 주셨습니다. 병원도 깔끔하고 넓어서 반려동물들이 신나서 뛰어다녀요.👍👍 </p>
                      <p class="cardset-info">서울동물병원</p>
                    </div>
                  </div>
                </div>
              </div>
              <div class="swiper-slide">
                <div class="contents-slide-group">
                  <div class="cardset cardset-user">
                    <figure class="cardset-figure">
                      <img class="cardset-img" src="/images/img_profile_3.png" alt="이미지">
                    </figure>
                    <div class="cardset-profile">
                      <p class="cardset-text"> 슬개골 탈구 수술을 했어요 ㅜㅜ 원장님 믿고 바로 수술해서 잘 회복하고 있습니다! 안 아프게 해주셔서 너무너무너무 감사드리고 돌봐주셔서 간호사님들도 감사드립니다🙏🏽🙏🏽 </p>
                      <p class="cardset-info">강남동물병원</p>
                    </div>
                  </div>
                </div>
              </div>
              <div class="swiper-slide">
                <div class="contents-slide-group">
                  <div class="cardset cardset-user">
                    <figure class="cardset-figure">
                      <img class="cardset-img" src="/images/img_profile_4.png" alt="이미지">
                    </figure>
                    <div class="cardset-profile">
                      <p class="cardset-text"> 저희 아기가 내원할 때마다 원장님께서 늘 친절하게 대해주세요! 과잉진료 전혀 없으시고요! 금방 낫게 해주셔서 늘 감사합니다 ~^^</p>
                      <p class="cardset-info">신촌동물병원</p>
                    </div>
                  </div>
                </div>
              </div>
              <div class="swiper-slide">
                <div class="contents-slide-group">
                  <div class="cardset cardset-user">
                    <figure class="cardset-figure">
                      <img class="cardset-img" src="/images/img_profile_5.png" alt="이미지">
                    </figure>
                    <div class="cardset-profile">
                      <p class="cardset-text"> 강아지 피부염 때문에 병원에 다녀왔어요 빨리 나아 예전처럼 건강한 모습을 보여줬으면 좋겠네요~ </p>
                      <p class="cardset-info">홍대동물병원</p>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
   <!-- 메인 소개6 시작 (동물 병원 추천 부분) -->
  </main>
