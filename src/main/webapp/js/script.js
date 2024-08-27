// headerMain [KQLONY8Yw4]
(function() {
  $(function() {
    $(".headerMain").each(function() {
      const $block = $(this);
      // Header Scroll
      $(window).on("load scroll", function() {
        const $thisTop = $(this).scrollTop();
        if ($thisTop > 0) {
          $block.addClass("header-top-active");
        } else {
          $block.removeClass("header-top-active");
        }
      });
      // Gnb
      $block.find(".header-center").on("mouseover", function() {
        if (window.innerWidth > 992) {
          $block.addClass("block-active");
        }
      });
      $block.find(".header-center").on("mouseout", function() {
        if (window.innerWidth > 992) {
          $block.removeClass("block-active");
        }
      });
      // Gnb DecoLine
      $block.find(".header-gnbitem").each(function() {
        const $this = $(this);
        $this.on("mouseover", function() {
          if (window.innerWidth > 992) {
            $this.find(".header-gnblink").addClass("on");
          }
        });
        $this.on("mouseout", function() {
          if (window.innerWidth > 992) {
            $this.find(".header-gnblink").removeClass("on");
          }
        });
      });
      // Mobile Top
      $block.find(".btn-momenu").on("click", function() {
        $block.addClass("mo-active");
      });
      $block.find(".btn-moclose").on("click", function() {
        $block.removeClass("mo-active");
      });
      // Mobile Gnb
      $block.find(".header-gnbitem").each(function() {
        const $this = $(this);
        const $thislink = $this.find(".header-gnblink");
        $thislink.on("click", function() {
          if (!$(this).parent().hasClass("item-active")) {
            $(".header-gnbitem").removeClass("item-active");
          }
          $(this).parents(".header-gnbitem").toggleClass("item-active");
        });
      });
      // Full Gnb
      $block.find(".btn-allmenu").on("click", function() {
        $block.find(".header-fullmenu").addClass("fullmenu-active");
      });
      $block.find(".fullmenu-close").on("click", function() {
        $block.find(".header-fullmenu").removeClass("fullmenu-active");
      });
      // Full Gnb DecoLine
      $block.find(".fullmenu-gnbitem").each(function() {
        const $this = $(this);
        $this.on("mouseover", function() {
          if (window.innerWidth > 992) {
            $this.find(".fullmenu-gnblink").addClass("on");
          }
        });
        $this.on("mouseout", function() {
          if (window.innerWidth > 992) {
            $this.find(".fullmenu-gnblink").removeClass("on");
          }
        });
      });
      // Header Mobile 1Depth Click
      if (window.innerWidth <= 992) {
        $block.find(".header-gnbitem").each(function() {
          const $gnblink = $(this).find(".header-gnblink");
          const $sublist = $(this).find(".header-sublist");
          if ($sublist.length) {
            $gnblink.attr("href", "javascript:void(0);");
          }
        });
      }
    });
  });
})();
// introduction [SxLonY8yYK]
(function() {
  $(function() {
    $(".introduction").each(function() {
      const $block = $(this);
      // Swiper
      const swiper = new Swiper(".introduction .contents-swiper", {
        slidesPerView: 1,
        spaceBetween: 0,
        allowTouchMove: false,
        loop: true,
        autoplay: {
          delay: 5000,
        },
        pagination: {
          el: ".introduction .swiper-pagination",
          clickable: true,
        },
        navigation: {
          nextEl: ".introduction .swiper-button-next",
          prevEl: ".introduction .swiper-button-prev",
        },
      });
      // Swiper Play, Pause Button
      const pauseButton = $block.find('.swiper-button-pause');
      const playButton = $block.find('.swiper-button-play');
      playButton.hide();
      pauseButton.show();
      pauseButton.on('click', function() {
        swiper.autoplay.stop();
        playButton.show();
        pauseButton.hide();
      });
      playButton.on('click', function() {
        swiper.autoplay.start();
        playButton.hide();
        pauseButton.show();
      });
    });
  });
})();
// introduction4 [xVLONy8z0t]
(function() {
  $(function() {
    $(".introduction4").each(function() {
      const $block = $(this);
      // Swiper
      const swiper = new Swiper(".introduction4 .contents-swiper", {
        slidesPerView: 'auto',
        spaceBetween: 0,
        allowTouchMove: false,
        loop: true,
        pagination: {
          el: ".introduction4 .swiper-pagination",
          clickable: true,
        },
        navigation: {
          nextEl: ".introduction4 .swiper-button-next",
          prevEl: ".introduction4 .swiper-button-prev",
        },
      });
    });
  });
})();
// introduction6 [ZhLony8Z27]
(function() {
  $(function() {
    $(".introduction6").each(function() {
      const $block = $(this);
      // Swiper
      const swiper = new Swiper(".introduction6 .contents-swiper", {
        slidesPerView: 'auto',
        spaceBetween: 0,
        allowTouchMove: false,
        loop: true,
        autoplay: {
          delay: 3000,
        },
        navigation: {
          nextEl: ".introduction6 .swiper-button-next",
          prevEl: ".introduction6 .swiper-button-prev",
        },
      });
    });
  });
})();


//FindID페이지 버튼
$(document).ready(function () {
  $(".showTooltipButton").on("click", function () {
    $("#tooltip").toggle();
  });
});



function scrollToDiv() {
  var targetDiv = document.getElementById('targetDiv');
  targetDiv.scrollIntoView({ behavior: 'smooth' }); 
}