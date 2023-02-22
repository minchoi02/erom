
/*********************************************************************************************************

	## Common Script ##

	* 본 스크립트의 저작권은 (주)웹스리퍼블릭에 있습니다.
	* 본 스크립트를 무단으로 이용(또는 도용)하거나 복제 또는 수정 사용시 저작권법에 의거 처벌받을 수 있습니다.
	* 구매 후에도 제 2차 사이트 등 라이선스가 적용되지 않는 사이트에 대하여 사용은 금지되어 있습니다.
	* 위 사항에 대하여 위반시 절대 합의는 없습니다 !

	* date : 2022-11-01
	* author : Joo Pil Gue(websre@naver.com)

*********************************************************************************************************/

// PC 해상도 여부 체크 함수
function isPC() {
	var $winWidth = $(window).width();

	if($winWidth > 1024) {
		return true;
	} else {
		return false;
	}
}

// 파라메터 값 가져오기
var getUrlParameter = function getUrlParameter(sParam) {
	var sPageURL = decodeURIComponent(window.location.search.substring(1)),
	sURLVariables = sPageURL.split('&'),
	sParameterName,
	i;
	for (i = 0; i < sURLVariables.length; i++) {
		sParameterName = sURLVariables[i].split('=');
		if (sParameterName[0] === sParam) {
			return sParameterName[1] === undefined ? true : sParameterName[1];
		}
	}
};

/* ----------------- 메뉴 및 탭 활성화 스크립트 ----------------- */
$(document).ready(function() {
 var depth1 = getUrlParameter('top') - 1;
 var depth2 = getUrlParameter('sub') - 1;
 $("#gnb > li").eq(depth1).addClass('on123');
 $("#gnb > li").eq(depth1).find('ul').children().eq(depth2).addClass('on');
 
});

// 상단메뉴 마우스 이벤트
$(function() {
	var wSize;
	if(isPC() === true) {
		
		
		
	}
});

// 헤더 및 GNB 관련 공통 스크립트
$(function() {
	var $gnb = $("#gnb_wrap");
	var $gnbTrigger = $("#gnbTrigger");
	//var $logo = $("#logo");
	
	if(isPC() === true) {
		// GNB 활성화
		$("#gnb > li").each(function() {
			var $currIndex = getUrlParameter('top') - 1;
			
			if($(this).index() == $currIndex) $(this).addClass('open');
			
		});
	}
	// GNB 비활성화
	function gnbdeActive() {
		$("#gnb > li").removeClass('open');
		$("#gnb > li > ul").removeAttr('style');
		$gnbTrigger.removeClass('open');
		$("body").removeClass('lock');
	}
	
	$("#gnb").mouseenter(function() {
		wSize = $(window).width();

		if(wSize > 1024) {
			if($(this).find('.submnu').length > 0) {
				//$(this).find('.submnu').css({top:'52px'});
				$("#gnb_wrap").stop(true,false).animate({height:'350px', opacity:'1'}, 400);
				$(this).addClass('on');
				//$(this).parent().find('.submnu').css('display','block');
				//$(this).parent().find('.submnu').stop(true,false).animate({top:'52px', opacity:'1'}, 400);
				$(this).next('li').addClass('on');
			}
		}
	})
	// 2022-11-01 주석처리
	/*$("#gnb_wrap").mouseleave(function() {
		wSize = $(window).width();


		if(wSize > 1024) {
			//$(this).find('.submnu').stop(true,false).animate({opacity:'0'}, 400);
			$("#gnb_wrap").stop(true,false).animate({height:'66px', opacity:'1'}, 400);
			//$(this).find('.submnu').css('display','none');
			$("#gnb").removeClass('on');
		}
	});*/
	// GNB 마우스오버
	/*$("#gnb > li").mouseenter(function() {
		var $option = {
				'display':'block',
				'top':'80px',
				'opacity':'0'
			}

		if(isPC() === true) {
			if(!$(this).hasClass('on')) {
				$(this).addClass('on');

				if($(this).find('ul').length > 0) {
					$(this).find('ul').css($option);
					TweenMax.to($(this).find('ul'), 0.25, {'opacity':1, 'top':'67px'});
				}
			}
		}
	});*/

	// GNB 마우스아웃
	/*$("#gnb > li").mouseleave(function() {
		var $idx = $(this).index();
		var $option = {
				'display':'',
				'top':'',
				'opacity':''
			}

		if(isPC() === true) {
			$(this).removeClass('on');
			if($(this).find('ul').length > 0) {
				TweenMax.to($(this).find('ul'), 0.25, {'opacity':0, 'top':'80px', onComplete:function() {
					$("#gnb > li").eq($idx).find('ul').css($option);
				}});
			}
		}
	});*/
	
	// GNB 클릭
	$("#gnb > li > a").click(function(e) {
		if(isPC() === false) {
			if(!$(this).parent().hasClass('open')) {
				if($(this).next('ul').length > 0) {
					e.preventDefault();
					$("#gnb > li > ul").stop().slideUp(350);
					$("#gnb > li").removeClass('open');
					
					$(this).parent().addClass('open');
					$(this).next('ul').stop().slideDown(450, 'easeInOutExpo');
				}
			} else {
				if($(this).next('ul').length > 0) {
					e.preventDefault();
					$(this).parent().removeClass('open');
					
					$(this).next('ul').stop().slideUp(350);
				}
			}
		}
	});

	// 모바일메뉴 토글버튼 클릭
	$gnbTrigger.click(function() {
		if(!TweenMax.isTweening($gnb)) {
			if(!$(this).hasClass('open')) {
				$(this).addClass('open');
				$("body").addClass('lock');
				TweenMax.to($gnb, 0.5, {left:0, ease:Expo.easeInOut, onComplete:function() {
					//$logo.stop().fadeIn(200);
				}});
				
			} else {
				$(this).removeClass('open');
				$("body").removeClass('lock');
				TweenMax.to($gnb, 0.5, {left:'-100%', ease:Expo.easeInOut});
				//$logo.stop().fadeOut(100);
				
			}
		}
	});
	
	// 윈도우 리사이징 처리
	$(window).bind('resize', function() {
		var $winWidth = $(this).width();

		if($winWidth > 1024) {
			//$logo.removeAttr('style');
			$gnb.removeAttr('style');
			gnbdeActive();
		} else {
			if(!$gnbTrigger.hasClass('open')) {
				//$logo.removeAttr('style');
				
			}
		}
	});
});

// 윈도우 이벤트
$(window).load(function() {
	var elem = $(".scrollreveal");
	var sty = {
		'opacity':'0',
		'transition':'none'
		}

	elem.css(sty);

	/*$("html, body").animate({scrollTop:'10'}, 10, function() {
		$("html, body").animate({scrollTop:'0'}, 0);
	});*/

	// 스크롤시 애니메이션 처리
	$(window).bind('scroll', function() {
		var winWidth = $(this).width();
		var winTop = $(this).scrollTop();
		var winHeight = $(this).height();
		var docHeight = $(document).height();
		var hdHeight = $("#header").height();
		var elemHeight;
		var showDelay = 0;
	
		if(winWidth > 1024) {	
			if(winTop >= hdHeight) {
				if(!$("#header").hasClass('fixed')) {
					$("#header").addClass('fixed');
					//$("#main_visual").addClass('fixed');
					$("#scrollTop").stop(true,false).fadeIn(300);
				}
			} else {
				$("#header").removeClass('fixed');
				//$("#main_visual").removeClass('fixed');
				$("#scrollTop").stop(true,false).fadeOut(300);
			}
		}

		elem.each(function() {
			var etop = $(this).offset().top;
			var eh = $(this).height();
			var delay = $(this).data('delay');

			if(delay == null) { delay = 100; }

			if(winTop >=  etop - winHeight) {
				if(!$(this).hasClass('animated')) {
					var aniOptions;
					var styR = {
							'position':'relative',
							'top':'30px'
						}
					var sty = {
							'top':'30px'
						}

					if($(this).css('position') == 'static') {
						aniOptions = {
							'opacity':'1',
							'top':'0'
						}

						$(this).css(styR);
					} else if($(this).css('position') == 'absolute') {
						aniOptions = {
							'opacity':'1',
						}
					} else {
						aniOptions = {
							'opacity':'1',
							'top':'0'
						}
						$(this).css(sty);
					}

					showDelay += delay;
					$(this).stop().delay(showDelay).animate(aniOptions, 500, function() {
						var sty = {
								'position':'',
								'top':'',
								'opacity':'',
								'transition':''
							}
						$(this).css(sty);
					});
					$(this).addClass('animated');
				}
			}
		});
	});
});

// 페이지 로딩
$(window).load(function() {
	$("#page-loader").fadeOut(600, function() {
		$("#page-loader").delay(100).remove();
	});
});

$(function() {
	// 스크롤 버튼 이벤트
	$("#scrollTop").bind('mouseenter mouseleave click', function(e) {
		if(e.type === 'mouseenter') {
			if(!$(this).hasClass('on')) {
				$(this).addClass('on');
			}
		} else if(e.type === 'click') {
			$("html, body").stop().animate({scrollTop:'0'}, 500, 'easeInOutExpo');
		} else {
			$(this).removeClass('on');
		}
	})
});


// 게시판 카테고리 탭 (2019-04-23 추가)
$(function() {
    
    // 카테고리 링크 클릭시
    $(document).on('click', '.sub_tab > a', function() {
        
            if(!$(this).hasClass('open')) {
                $(this).addClass('open');
                $(this).next('ul#tab_menu').css('display','block');
            } else {
                $(this).removeClass('open');
                $(this).next('ul#tab_menu').css('display','none');
            }
        
    });
 
 // 카테고리 링크 클릭시
    $(document).on('click', '#bo_list .board_tab_spec > a', function() {
        
            if(!$(this).hasClass('open')) {
                $(this).addClass('open');
                $(this).next('ul.tab').css('display','block');
            } else {
                $(this).removeClass('open');
                $(this).next('ul.tab').css('display','none');
            }
        
    });
    
});

/* ----------------- 스크롤 헤더 고정 ----------------- */
$(window).scroll(function() {
 if(isPC() === true) {
  var scroll_h = $(this).scrollTop();
  var hd_h = $("#topBanner").outerHeight();
 
 
  if(scroll_h > hd_h) {
   if(!$("body").hasClass('scroll')) $("body").addClass('scrollfix');
  } else {
   $("body").removeClass('scrollfix')
  }
 }
});
/* ----------------- 메뉴 및 탭 활성화 스크립트 ----------------- */
$(document).ready(function() {
 var depth1 = getUrlParameter('top') - 1;
 var depth2 = getUrlParameter('sub') - 1;
 $("#nav > li").eq(depth1).addClass('on123');
 $(".menu-item").eq(depth1).find('ul').children().eq(depth2).addClass('on');
 $("#tab_menu[data-role=menu]").children().eq(depth2).addClass('active');
});
/* ----------------- 메인페이지 전용 스크립트 ----------------- */


// my shopping slide
$(function () {
var swiper = new Swiper('.cartArea-slide', {
  slidesPerView: 4,
  centeredSlides: false,
  speed: 500,
  grabCursor: true,
  loop: true,
  spaceBetween: 40,
  navigation: {
	nextEl: '.foot-arrow-next',
	prevEl: '.foot-arrow-prev',
  },
  breakpoints: {
	  640: {
		slidesPerView: 3,
		spaceBetween: 20,
	  },
	  768: {
		slidesPerView: 3,
		spaceBetween: 20,
	  },
	  1024: {
		slidesPerView: 3,
		spaceBetween: 30,
	  },
	},
  
});
})

// my shopping slide
$(function () {
var swiper = new Swiper('.best-slide', {
  slidesPerView: 5,
  centeredSlides: false,
  speed: 500,
  grabCursor: true,
  loop: true,
  spaceBetween: 19,
  navigation: {
	nextEl: '.best-arrow-next',
	prevEl: '.best-arrow-prev',
  },
  breakpoints: {
	  640: {
		slidesPerView: 2,
		spaceBetween: 20,
	  },
	  768: {
		slidesPerView: 2,
		spaceBetween: 20,
	  },
	  1024: {
		slidesPerView: 3,
		spaceBetween: 30,
	  },
	},
  
});
})

$(function () {
tab('#tab',0);
});

function tab(e, num){
    var num = num || 0;
    var menu = $(e).children();
    var con = $(e+'_con').children();
    var select = $(menu).eq(num);
    var i = num;

    select.addClass('on');
    con.eq(num).show();

    menu.click(function(){
        if(select!==null){
            select.removeClass("on");
            con.eq(i).css('display','none');
        }

        select = $(this);
        i = $(this).index();

        select.addClass('on');
        con.eq(i).css('display','block');
    });
}

/* ----------------- 서브페이지 전용 스크립트 ----------------- */
// 퀵메뉴 관련 스크립트
$(document).ready(function() {
    var easeEffect = "easeInOutExpo";
    var btn_pos = parseInt($("#quickmenu").css('right'));
    var layer_pos = $("#quickmenu .quick-layer").outerWidth();
    $("#quickmenu .iconlist > li").click(function() {
        var match = $(this).data('match');
        $("#quickmenu .iconlist > li").removeClass('on');
        $(this).addClass('on');
        if (!$("#quickmenu").hasClass('open')) {
            $("#quickmenu").addClass('open');
            $("#quickmenu .quick-layer[data-icon=" + match + "]").css('display', 'block');
            $("#quickmenu .quick-layer[data-icon=" + match + "]").stop().animate({
                right: 0
            }, 600, easeEffect);
            $("#quickmenu").stop().animate({
                right: layer_pos + 'px'
            }, 600, easeEffect);
        } else {
            $("#quickmenu .quick-layer").css('display', 'none');
            $("#quickmenu .quick-layer[data-icon=" + match + "]").css({
                'display': 'block',
                'right': 0
            });
        }
    });
    $("#quickmenu .quick-layer .btn-close").click(function() {
        $("#quickmenu").removeClass('open');
        $("#quickmenu .iconlist > li").removeClass('on');
        $("#quickmenu .quick-layer").stop().animate({
            right: -layer_pos
        }, 600, easeEffect);
        $("#quickmenu").stop().animate({
            'right': btn_pos
        }, 600, easeEffect);
    });
});

//faq
$(function() {
 $(".faq-list > li > .question").click(function() {
  if(!$(this).parent().hasClass('open')) {
   $(".faq-list > li").removeClass('open');
   $(".faq-list > li > .answer").stop().slideUp(300);
   $(this).parent().addClass('open');
   $(this).siblings('.answer').stop().slideDown(300);
  } else {
   $(this).parent().removeClass('open');
   $(this).siblings('.answer').stop().slideUp(300);
  }
 });
});
//agree
$(function() {
 $(".agree-list > li > .question > .iconArea").click(function() {
  if(!$(this).parent().hasClass('open')) {
   $(".agree-list > li").removeClass('open');
   $(".agree-list > li > .answer").stop().slideUp(300);
   $(this).parent().addClass('open');
   $(this).siblings('.answer').stop().slideDown(300);
  } else {
   $(this).parent().removeClass('open');
   $(this).siblings('.answer').stop().slideUp(300);
  }
 });
});


function gnbController(mainClass, subClass, thirdClass){
 var mainChk = $("#nav>li>a"); // 1st for 문에서 length 를 체크할 항목 기준.
 var mainChk2 = $("#tab_menu>li>a");
 var mainChk3 = $("#tab_menu_se>li>a");
  for(var i = 0; i < mainChk.length ; i++){
  var subChk = $("#nav>li").eq(i); //변수 i 에 따라 대분류 li가 달라진다
   if(subChk.find("a").eq(0).text() == mainClass) { //체크할 항목 "투자정보" 에 도달하면 조건을 건다
   //subChk.eq(0).addClass("selected");
   subChk.find("a").eq(0).addClass("selected");
   subChk.find(".menu-item").eq(0).show();
   $("#header_wrap_bg").stop().animate({left:"120px"},'fast',"easeOutQuart");
    for (var z = 0; z < subChk.find("li>a").length; z++){ // 대분류i의 위치에 따른 소분류 length
     if(subChk.find("li>a").eq(z).text() == subClass){
      subChk.find("li>a").eq(z).addClass("selected");
     } else {
      subChk.find("li>a").eq(z).removeClass("selected");
     }
    }; 
   } else {
    subChk.find("a").eq(0).removeClass("selected");
   }
  };
 
  for(var i = 0; i < mainChk2.length ; i++){
  var subChk2 = $("#tab_menu>li").eq(i); //변수 i 에 따라 대분류 li가 달라진다
   if(subChk2.find("a").eq(0).text() == subClass) { //체크할 항목 "투자정보" 에 도달하면 조건을 건다
   //subChk.eq(0).addClass("selected");
   subChk2.find("a").eq(0).addClass("selected");
   subChk2.find(".menu-item").eq(0).show();
   
    for (var z = 0; z < subChk2.find("li>a").length; z++){ // 대분류i의 위치에 따른 소분류 length
     if(subChk2.find("li>a").eq(z).text() == subClass){
      subChk2.find("li>a").eq(z).addClass("selected");
     } else {
      subChk2.find("li>a").eq(z).removeClass("selected");
     }
    }; 
   } else {
    subChk2.find("a").eq(0).removeClass("selected");
   }
  };
  
  for(var i = 0; i < mainChk3.length ; i++){
  var subChk3 = $("#tab_menu_se>li").eq(i); //변수 i 에 따라 대분류 li가 달라진다
   if(subChk3.find("a").eq(0).text() == thirdClass) { //체크할 항목 "투자정보" 에 도달하면 조건을 건다
   subChk3.find("a").eq(0).addClass("selected");
   subChk3.find(".menu-item").eq(0).show();
   
    for (var z = 0; z < subChk3.find("li>a").length; z++){ // 대분류i의 위치에 따른 소분류 length
     if(subChk3.find("li>a").eq(z).text() == subClass){
      subChk3.find("li>a").eq(z).addClass("selected");
     } else {
      subChk3.find("li>a").eq(z).removeClass("selected");
     }
    }; 
   } else {
    subChk3.find("a").eq(0).removeClass("selected");
   }
  };
 };
 $(function() {
 var winW = $(window).width();
});

/* ----------------- 메인비주얼 ----------------- */ 

$(document).ready(function() { 


	
	var swiper = new Swiper('.websre_main', {
		autoplay: {
			delay: 5500,
			disableOnInteraction: false,
		},
		speed:700,
		spaceBetween: 0,
		effect: 'slide',
		loop: true,
		/*pagination: {
			el: '.swiper-pagination',
			clickable: true,
		},*/
		navigation: {
			nextEl: '.swiper-button-next',
			prevEl: '.swiper-button-prev',
		},
		on: {
			init: function () {
				jQuery('.swiper-container.websre_main').css('opacity','1');
				var swiper_text = jQuery('.swiper-container.websre_main .swiper-slide-active .swiper_text').text(); 
				var swiper_text = swiper_text.split("■");
				var background_color = swiper_text[1];
				//var imgUrl = swiper_text[0];
				//jQuery(".swiper-container.websre_main .swiper-slide-active .swiper_text_add").attr("src","imgUrl");
				jQuery('#mainVisual').css("background-image", "url("+background_color+")");
			},
			slideChangeTransitionStart: function () {
				var swiper_text = jQuery('.swiper-container.websre_main .swiper-slide-active .swiper_text').text(); 
				var swiper_text = swiper_text.split("■");
				var background_color = swiper_text[1];
				//var imgUrl = swiper_text[0];
				//jQuery(".swiper-container.websre_main .swiper-slide-active .swiper_text_add").attr("src","imgUrl");
				jQuery('#mainVisual').css("background-image", "url("+background_color+")");
				//console.log(background_color)
			},
		},
	});
	
	var swiper = new Swiper('.websre_event', {
		autoplay: {
			delay: 55500,
			disableOnInteraction: false,
		},
		spaceBetween: 0,
		effect: 'slide',
		loop: true,
		pagination: {
			el: '.swiper-pagination',
			clickable: true,
		},
		on: {
			init: function () {
				jQuery('.swiper-container.websre_event').css('opacity','1');
				var swiper_text = jQuery('.swiper-container.websre_event .swiper-slide-active .swiper_text').text(); 
				var swiper_text = swiper_text.split("■");
				var background_color = swiper_text[1];
				jQuery('.left').css("background-image", "url("+background_color+")");
			},
			slideChangeTransitionStart: function () {
				var swiper_text = jQuery('.swiper-container.websre_event .swiper-slide-active .swiper_text').text(); 
				var swiper_text = swiper_text.split("■");
				var background_color = swiper_text[1];
				jQuery('.left').css("background-image", "url("+background_color+")");
			},
		},
	});
	
	/* 프로그램 */
	var swiper5 = new Swiper('.swiper5', {
		slidesPerView: 'auto',
		loop: true,
		//loop: true,
		initialSlide: 3,
		centeredSlides: true,
		spaceBetween: 0,
		scrollbar: {
			el: '.swiper-scrollbar5',
			hide: false,
		},
        autoplay: {
			delay: 7000,
			disableOnInteraction: false,
		}, 
		speed:700,
	});
	
	var swiper = new Swiper('.process', {
		slidesPerView: 'auto',
		loop: true,
		//loop: true,
		initialSlide: 5,
		//centeredSlides: true,
		spaceBetween: 0,
		
        autoplay: {
			delay: 7000,
			disableOnInteraction: false,
		}, 
		speed:700,
		navigation: {
			nextEl: '.swiper-button-next-',
			prevEl: '.swiper-button-prev-',
		},
	});
	
	var swiper = new Swiper(".imgWrap", {
		loop: true,
		spaceBetween: 0,
		slidesPerView: 1,
		//centeredSlides: true,
		//freeMode: true,
		watchSlidesVisibility: true,
		watchSlidesProgress: true,
		autoplay: {
			delay: 7000,
			disableOnInteraction: false,
		},
		
	  });
	  var swiper2 = new Swiper(".txt_inner", {
		loop: true,
		spaceBetween: 0,
		slidesPerView: 1,
		effect: 'slide',
		navigation: {
		  nextEl: ".swiper-button-next",
		  prevEl: ".swiper-button-prev",
		},
		thumbs: {
		  swiper: swiper,
		},
		autoplay: {
			delay: 7000,
			disableOnInteraction: false,
		},
	});
		
});

$(function() {
	var $elem = $(".fixed_inquiry");
	var $height = $elem.find('.inner').height();

	// 열고닫기 버튼 클릭시
	$("#fixedToggle").click(function() {
		var isClosed = $elem.hasClass('closed');

		if(isClosed === false) {
			$elem.stop(true,true).animate({bottom:0}, 300);
			//$elem.stop(true,true).animate({right:-($width + 33) + 'px'}, 300);
			$elem.addClass('closed');
		} else {
			
			$elem.stop(true,true).animate({bottom:-($height) + 'px'}, 300);
			$elem.removeClass('closed');
		}
	});

	// 최근 본 상품 배분정렬 처리
	// if($(".recentList").length > 0) {
	// 	$(".recentList").append('<li class="clear_list"></li>');
	// }
});

/* ----------------- 메뉴 관련 스크립트 ----------------- */
$(document).ready(function() {
  var allMenu2 = $("#all-menu");
  var mnuEasing = "easeInOutExpo";
 // 메인메뉴 마우스 올렸을 시 서브메뉴 표출

 // 전체메뉴 열기
 function allMenuOpen2() {
  if(!allMenu2.hasClass('open')) {
   allMenu2.addClass('open');
   allMenu2.find('.menu-layer').removeAttr('style');
   allMenu2.find('.menu-layer').css({opacity:'0'});
   allMenu2.fadeIn(400);
   allMenu2.find('.menu-layer').stop().animate({opacity:'1'}, 800, mnuEasing);
   $("body").addClass('fixed');
  }
 }
 // 전체메뉴 닫기
 function allMenuClose2() {
  allMenu2.removeClass('open');
  allMenu2.find('.menu-layer').stop().animate({top:'-100%', opacity:'0'}, 600, mnuEasing);
  allMenu2.fadeOut(1000);
  $("body").removeClass('fixed');
 }
 // 전체메뉴 열기 버튼 클릭
 $(".total_menu1").click(function() {
  allMenuOpen2();
 });
 // 전체메뉴 닫기 버튼 클릭
 $(".btnClose").click(function() {
  allMenuClose2();
 });
 // 마스크영역 클릭시 전체메뉴 닫기
 $("#all-menu .mask_all").click(function() {
  allMenuClose2();
 });
 
});

/* ----------------- 전체제품 ----------------- */
$(function() {
	$(".total_menu > a").click(function() {
		if(!$(this).parent().hasClass('open')) {
			$(this).parent().addClass('open');
			$(this).siblings('.all-menu').stop().fadeIn(300);
		} else {
			$(this).parent().removeClass('open');
			$(this).siblings('.all-menu').stop().fadeOut(300);
		}
	});
	$(".navi .weather .weather_board #sch_submit").click(function() {
		$(".navi .weather > span").removeClass('open');															 
		$(".weather_board").stop().slideUp(300);
	});
});

/* ----------------- 장바구니 ----------------- */
$(function() {
	$(".cartBtn > a").click(function() {
		if(!$(this).parent().hasClass('open')) {
			$(this).parent().addClass('open');
			//$(this).siblings('.cartArea-info').stop().fadeIn(300);
			$(".cartArea").css('bottom','0px');
			$(".shopping-mask").stop().fadeIn(300);
		} else {
			$(this).parent().removeClass('open');
			$(".cartArea").css('bottom','-300px');
			$(".shopping-mask").stop().fadeOut(300);
		}
	});
	$(".shopping-mask").click(function() {
		$(".cartBtn").removeClass('open');															 
		$(".cartArea").css('bottom','-300px');
		$(".shopping-mask").stop().fadeOut(300);
	});
});

/* ----------------- 문의하기/후기작성 ----------------- */
$(function() {
	$(".reply-btn").click(function() {
		if(!$(this).parent().hasClass('open')) {
			$(this).parent().addClass('open');
			//$(this).siblings('.cartArea-info').stop().fadeIn(300);
			$(".writeArea").stop().fadeIn(300);
		} else {
			$(this).parent().removeClass('open');
			$(".writeArea").stop().fadeOut(300);
		}
	});
	$(".detail-mask").click(function() {
		$(".reply-btn").parent().removeClass('open');
		$(".writeArea").stop().fadeOut(300);
	});
	$(".btnClose").click(function() {
		$(".reply-btn").parent().removeClass('open');
		$(".writeArea").stop().fadeOut(300);
	});
});
$(function() {
	$(".inquiry-btn").click(function() {
		if(!$(this).parent().hasClass('open')) {
			$(this).parent().addClass('open');
			//$(this).siblings('.cartArea-info').stop().fadeIn(300);
			$(".writeArea").stop().fadeIn(300);
		} else {
			$(this).parent().removeClass('open');
			$(".writeArea").stop().fadeOut(300);
		}
	});
	$(".detail-mask").click(function() {
		$(".inquiry-btn").parent().removeClass('open');
		$(".writeArea").stop().fadeOut(300);
	});
	$(".btnClose").click(function() {
		$(".inquiry-btn").parent().removeClass('open');
		$(".writeArea").stop().fadeOut(300);
	});
});
/* ----------------- 문의하기/후기작성 ----------------- */
/* ----------------- 주소지변경 ----------------- */
$(function() {
	$(".address-btn > button").click(function() {
		if(!$(this).parent().hasClass('open')) {
			$(this).parent().addClass('open');
			//$(this).siblings('.cartArea-info').stop().fadeIn(300);
			$(".writeArea").stop().fadeIn(300);
		} else {
			$(this).parent().removeClass('open');
			$(".writeArea").stop().fadeOut(300);
		}
	});
	$(".detail-mask").click(function() {
		$(".address-btn > button").parent().removeClass('open');
		$(".writeArea").stop().fadeOut(300);
		$(".deliAdd").parent().removeClass('open');
		$(".writeArea_deli").stop().fadeOut(300);
	});
	$(".btnClose").click(function() {
		$(".address-btn > button").parent().removeClass('open');
		$(".writeArea").stop().fadeOut(300);
		$(".deliAdd").parent().removeClass('open');
		$(".writeArea_deli").stop().fadeOut(300);
	});
});

$(function() {
	$(".deliAdd").click(function() {
		if(!$(this).parent().hasClass('open')) {
			$(this).parent().addClass('open');
			//$(this).siblings('.cartArea-info').stop().fadeIn(300);
			$(".writeArea_deli").stop().fadeIn(300);
		} else {
			$(this).parent().removeClass('open');
			$(".writeArea_deli").stop().fadeOut(300);
		}
	});
	
	$(".btnClose_deli").click(function() {
		$(".deliAdd").parent().removeClass('open');
		$(".writeArea_deli").stop().fadeOut(300);
	});
});
/* ----------------- 주소지변경 ----------------- */
/* ----------------- 쿠폰사용하기 ----------------- */
$(function() {
	$(".coupon-btn").click(function() {
		if(!$(this).parent().hasClass('open')) {
			$(this).parent().addClass('open');
			//$(this).siblings('.cartArea-info').stop().fadeIn(300);
			$(".writeArea_coupon").stop().fadeIn(300);
		} else {
			$(this).parent().removeClass('open');
			$(".writeArea_coupon").stop().fadeOut(300);
		}
	});
	$(".detail-mask").click(function() {
		$(".coupon-btn").parent().removeClass('open');
		$(".writeArea_coupon").stop().fadeOut(300);
	});
	$(".btnClose_coupon").click(function() {
		$(".coupon-btn").parent().removeClass('open');
		$(".writeArea_coupon").stop().fadeOut(300);
	});
});
/* ----------------- 쿠폰사용하기 ----------------- */















$(function(){
  //btn_top
 $(".go_scroll").click(function(e) {
  $('html, body').stop().animate({scrollTop:0}, 500, "easeInOutQuart");
  return false;
 });
});

$(function() {
 $(".mobile_inquiry_btn").click(function(e) {
  if(!$(".fixed_inquiry").hasClass('open')) {
   $(".fixed_inquiry").addClass('open');
  } else {
   $(".fixed_inquiry").removeClass('open');
  }
 });
});

$(function(){
  //btn_top
 $(".btnClose4").click(function(e) {
  $(".fixed_inquiry").removeClass('open');
  return false;
 });
});

$(function() {
	if(isPC() === false) {
		$(".dep-menu a").click(function() {
			if(!$(this).siblings('.dropdown').is(':hidden')) {
				$(this).siblings('.dropdown').stop(true,false).slideUp(500);
				$(this).removeClass('open');
			} else {
				$(this).siblings('.dropdown').stop(true,false).slideDown(500);
				$(this).addClass('open');
			}
		});
	}
});

$(function() {
	$(".dep-menu2 a").click(function() {
		if(!$(this).siblings('.dropdown').is(':hidden')) {
			$(this).siblings('.dropdown').stop(true,false).slideUp(500);
			$(this).removeClass('open');
		} else {
			$(this).siblings('.dropdown').stop(true,false).slideDown(500);
			$(this).addClass('open');
		}
	});
});

$(function() {
	$(".dep-menu3 a").click(function() {
		if(!$(this).siblings('.dropdown').is(':hidden')) {
			$(this).siblings('.dropdown').stop(true,false).slideUp(500);
			$(this).removeClass('open');
		} else {
			$(this).siblings('.dropdown').stop(true,false).slideDown(500);
			$(this).addClass('open');
		}
	});
});