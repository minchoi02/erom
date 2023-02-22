/***************************************************************
*
* @name : vertical auto rolling banner script
* @version : 1.0
* @author : Park Soo Hyun (shpark7502@naver.com)
* 본 스크립트를 무단으로 도용시 법적 처벌을 받을 수 있습니다.
*
***************************************************************/

// 쿠키 설정에 따른 배너 출력 유무 설정
$(function() {
   if($.cookie('topBanner') == undefined) {
       $("#topBanner").css('display','block');
   } 
    
    $("#bannerClose").click(function() {
       if($("#chk_banner_close").hasClass('checked')) {
           $.cookie('topBanner', '1', {expires: 1, path:'/'});
       }
         $("#topBanner").slideUp(300);
				//$("#header").stop().animate({top:'-90px'}, 300, "easeInOutQuart");
				//$("#main_visual").css('margin-top','196px');
				//$("#main_visual").stop().animate({top:'-90px'}, 300, "easeInOutQuart");
				//TweenMax.to(("#main_visual"), 0.2, {top:'-90px', ease:Expo.easeInOut});
				//$("#header").stop(true,false).animate({top:'-90px'}, 400);
				//$("#wrapper").stop(true,false).animate({top:'-90px'}, 400);
        return false;
    });
});


$(function() {
    var $banner_index = 1;
    var $banner_height;
    var $banner_count = 0;
    var $banner_timer;
    var $banner_delay = 3000;       // 자동 롤링 주기 (단위 : ms)
    var $elem = $("#topBanner .slideWrapper ul");       // 자동롤링 대상 객체
    var $paging;
    var $desc = $("#topBanner .closeArea .check-desc");
    
    // 버티컬 배너 초기설정
    function vBannerInit() {
        var $cloneFirst = $("#topBanner .slideWrapper ul li:first").clone();
        var $cloneLast = $("#topBanner .slideWrapper ul li:last").clone();
            $banner_height = $("#topBanner .slideWrapper ul li").height();
        
        $elem.append($cloneFirst);
        $elem.prepend($cloneLast);
        $("#topBanner .slideWrapper ul").css('top', -$banner_index*$banner_height + 'px');
        $banner_count = $elem.children().length;
    }
    
    // 페이지네이션 생성
    function pagingInit() {
        var $li = "<li></li>";
        
        for(n=0; n<$banner_count - 2; n++) {
            $("#topBanner .pagination").append($li);
        }
        
        $("#topBanner .pagination li:first").addClass('on');
    }
    
    vBannerInit();
    pagingInit();
    setvBannerTimer();
    
    // 배너 롤링
    function vBannerSlide(nIndex) {
        $paging = $("#topBanner .pagination li");
        
        if(nIndex != $banner_index) {
            var nPos = -$banner_height * nIndex;

            $elem.stop().animate({top:nPos + 'px'}, 400, function() {
               if(nIndex < 1) {
                   nIndex = $banner_count - 2;
                   nPos = -$banner_height * nIndex;
                   $elem.css('top',nPos + 'px');
               }

                if(nIndex >= $banner_count - 1) {
                   nIndex = 1;
                   nPos = -$banner_height * nIndex;
                   $elem.css('top',nPos + 'px');
                }
                
                $banner_index = nIndex;
                $paging.removeClass('on');
                $paging.eq($banner_index-1).addClass('on');
            });

        }
    }
    
    // 배너 롤링 타이머 해제
    function clearvBannerTimer() {
        clearInterval($banner_timer);
        setvBannerTimer();
    }
    
    // 자동 배너 롤링 타이머
    function setvBannerTimer() {
        $banner_timer = setInterval(function() {
            var nIndex = $banner_index + 1;
            vBannerSlide(nIndex);
        }, $banner_delay);
    }
    
    // 배너 마우스 올렸을 시 자동롤링 중지
    $("#topBanner").mouseenter(function() {
        clearInterval($banner_timer);
    });
    
    // 배너 마우스 뗄 시 자동롤링 시작
    $("#topBanner").mouseleave(function() {
       clearvBannerTimer(); 
    });
    
    // 이전버튼 클릭
    $("#topBanner .prev").click(function() {
        if(!$elem.is(':animated')) {
            var nIndex = $banner_index - 1;
            clearvBannerTimer();
            
            vBannerSlide(nIndex);
        }
    });
    
    // 다음버튼 클릭
    $("#topBanner .next").click(function() {
        if(!$elem.is(':animated')) {
            var nIndex = $banner_index + 1;
            clearvBannerTimer();
            
            vBannerSlide(nIndex);
        }
    });
    
    // 페이지네이션 클릭
    /*$("#topBanner .pagination li").live('click', function() {
        if(!$elem.is(':animated')) {
            var nIndex = $(this).index() + 1;
            clearvBannerTimer();
            
            vBannerSlide(nIndex);
        }
    });*/
    
    // 배너 닫기 체크
    $("#chk_banner_close").click(function() {
        var isCheck = $(this).hasClass('checked');
            
        if(!isCheck === true) {
            $(this).addClass('checked');
        } else {
            $(this).removeClass('checked');
        }
    });
    
    // 배너 닫기 마우스오버
    $("#chk_banner_close").mouseenter(function() {
        $desc.css('display','block');
        $desc.stop(true,true).animate({width:'160px'}, 300, function() {
            $desc.find('p').stop(true,true).fadeIn(200);
        });
    });
    
    // 배너 닫기 마우스아웃
    $("#chk_banner_close").mouseleave(function() {
        $desc.find('p').stop(true,true).fadeOut(200);
        $desc.stop(true,true).animate({width:'0'}, 300, function() {
            $desc.css('display','none');
        });
    });
});