
/*********************************************************************************************************

	## Common Script ##

	* 본 스크립트의 저작권은 (주)웹스리퍼블릭에 있습니다.
	* 본 스크립트를 무단으로 이용(또는 도용)하거나 복제 또는 수정 사용시 저작권법에 의거 처벌받을 수 있습니다.
	* 구매 후에도 제 2차 사이트 등 라이선스가 적용되지 않는 사이트에 대하여 사용은 금지되어 있습니다.
	* 위 사항에 대하여 위반시 절대 합의는 없습니다 !

	* date : 2022-08-18
	* author : Joo Pil Gue(websre@naver.com)

*********************************************************************************************************/

// 메인비주얼
/*** Layout **/
$(function () {
	//visual
	
		var mainSwiper = new Swiper("#main_visual", {
		  slidesPerView: 1, 
		  observer: true,
		  observeParents: true,
		  speed: 2000, //01.25 khj 		           
		  spaceBetween: 0, //01.25 khj
			 loop: false, //01.25 khj
			 autoplay:{ 
				delay: 4500,
				disableOnInteraction: false
			}, 
			pagination: {
				el:".main_visual .swiper-pagination",
				clickable:true, 
				renderBullet: function (index, className) {
				  return '<span class="' + className + '">0' + (index + 1) + '</span>';
				}
			},
			breakpoints: {
			// when window width is >= 990px
			990: {
				slidesPerView: 'auto',
				spaceBetween: 15
			}
		}
		});
		$(" .main_visual .visual_content .swiper-pagination .swiper-pagination-bullet").eq(0).addClass("autoPlay");

		var dummyLen = 2;
		var mainLastPage = mainSwiper.slides.length - dummyLen;

	   mainSwiper.on("slideChangeTransitionStart",function(){
			var activeIdx = mainSwiper.activeIndex - 1;
			var curIdx = activeIdx % mainLastPage;
			var $Elm = $(".main_visual .ico_movie .ico.play");
			var $bulletElm = $(".main_visual .visual_content .swiper-pagination .swiper-pagination-bullet");
			var $bulletActiveElm = $(" .main_visual .visual_content .swiper-pagination .swiper-pagination-bullet-active");

			$bulletElm.removeClass("autoPlay");
			if(!$Elm.hasClass("pause")){
				$bulletActiveElm.removeClass("autoPlay");
			}else{
				$bulletActiveElm.addClass("autoPlay");
			}

		});

		//slide play, pause
		$(document).on("click",".main_visual .ico_movie",function(){
			var $iconElm = $(this).find("i");
			if(!$iconElm.hasClass("pause")){
				mainSwiper.autoplay.start();
				$iconElm.addClass("pause");
				$(" .main_visual .swiper-pagination-bullet-active").addClass("autoPlay");
			}else{
				mainSwiper.autoplay.stop();
				$iconElm.removeClass("pause");
				$(" .main_visual .swiper-pagination-bullet-active").removeClass("autoPlay");
			}
		});

}) //ready



// 메인 섹션 베스트셀러
$(function () {
var swiper = new Swiper('.best-seller', {
  slidesPerView: 3,
  centeredSlides: false,
  speed: 500,
  grabCursor: true,
  loop: true,
  spaceBetween: 40,
  navigation: {
	nextEl: '.md-pick-next',
	prevEl: '.md-pick-prev',
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
		slidesPerView: 2,
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



$(function () {
 tab2('#tab2',0);
 });

 function tab2(e, num){
	 var num3 = num || 0;
	 var menu3 = $(e).children();
	 var con3 = $(e+'_con2').children();
	 var select = $(menu3).eq(num3);
	 var i3 = num3;

	 select.addClass('on');
	 con3.eq(num3).show();

	 menu3.click(function(){
			//alert(i3);
			//alert(select.text());
			console.log(con3);
			 if(select!==null){
					 select.removeClass("on");
					 con3.eq(i3).css('display','none');
			 }

			 select = $(this);
			 console.log(select)
			 i3 = $(this).index();

			 select.addClass('on');
			 con3.eq(i3).css('display','block');
	 });
}








