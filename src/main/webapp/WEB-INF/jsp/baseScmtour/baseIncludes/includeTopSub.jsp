<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<script>
//팝업을 닫는 펑션이다. 체크박스에 체크가 되어 있다면 쿠키를 생성한다. 
function closeWin() { 
   //if ( $("#popup_close_check").is(":checked")){
	 if ( $("#chk_banner_close").hasClass("checked")){ 
      setCookie( "maindiv", "done" , 1 ); //쿠키를 생성함
   } 
   //document.getElementById("popup_layer").style.opacity="0";
   $("#popup_layer").stop().fadeOut(300);
   $("body").css('overflow-y','scroll');
}

function setCookie( name, value, expiredays )
{
    var todayDate = new Date();
    todayDate.setDate( todayDate.getDate() + expiredays );
    document.cookie = name + "=" + escape( value ) + "; path=/; expires=" + todayDate.toGMTString() + ";"
}

function checkCookie()
{
 //쿠키값이 있으면 element를 가려준다
 	
   if(getCookie("maindiv") == "done"){
		$('#topBanner').hide();
		$("body").css('overflow-y','scroll');
   }else{
       	//쿠키값이 없으면 element를 보여준다
	   	$('#popup_layer').fadeIn('slow');
   }
}

function getCookie( name )
{
    var nameOfCookie = name + "=";
    var x = 0;
    while ( x <= document.cookie.length )
    {
        var y = (x+nameOfCookie.length);
        if ( document.cookie.substring( x, y ) == nameOfCookie )
        {
            if ( (endOfCookie=document.cookie.indexOf( ";", y )) == -1 )
                endOfCookie = document.cookie.length;
            return unescape( document.cookie.substring( y, endOfCookie ) );
        }
        x = document.cookie.indexOf( " ", x ) + 1;
        if ( x == 0 )
            break;
    }
    return "";
}
</script>	

		<!-- 상단 세로 롤링배너 -->
    <div id="topBanner">
        <div class="slideWrapper">
            <ul>
				<c:if test="${ not empty banner1List}">   
   				<c:forEach var="banner1List" items="${banner1List}" varStatus="status">
				<c:if test="${not empty banner1List.banner_link}">
				<li><a href="<c:out value="${banner1List.banner_link}"/>" target="<c:out value="${banner1List.banner_target}"/>">
				</c:if>
				<img src="/cmm/fms/getImage.do?atchFileId=<c:out value="${banner1List.banner_img}"/>&fileSn=0" onerror="this.src='/images/baseScmtour/noimg_400.png';"/>
				<c:if test="${not empty banner1List.banner_link}">
				</a></li>
				</c:if>
				</c:forEach>
				</c:if>
            </ul>
        </div>
        
        <!-- 화살표 -->
        <a href="javascript:;" class="control prev"><i class="xi-angle-left"></i></a>
        <a href="javascript:;" class="control next"><i class="xi-angle-right"></i></a>
        <!-- // 화살표 -->

       <!-- 페이지네이션 -->
       <ol class="pagination"></ol>
       <!-- // 페이지네이션 -->
       
       <!-- 배너 닫기 -->
       <div class="closeArea">
            <div id="chk_banner_close" class="checkbox"></div>
            <div id="popup_close_check" class="check-desc"><p>오늘 하루 열지 않음</p></div>
            <a href="javascript:;" id="bannerClose"><img src="/resource/img/banner_close.png" alt="닫기" /></a>
       </div>
       <!-- // 배너 닫기 -->
    </div>
    <!-- // 상단 세로 롤링배너 -->
    
    <!-- 헤더 -->
    <div id="header">
    		<!-- 모바일메뉴 버튼 -->
        <button id="gnbTrigger">
            <span class="bar1"></span>
            <span class="bar2"></span>
            <span class="bar3"></span>
        </button>
        <!-- // 모바일메뉴 버튼 -->
        <div class="header-top">
            <div class="inner">
                <div class="logo"><a href="/index.do"><img src="/resource/img/logo.png" /></a></div>
                <div class="search-bar">
                <input name="" type="text" class="search-input" placeholder="검색어를 입력하세요" />
                <a href="#;"><i class="xi-search"></i></a>
                </div>
                <div class="member-name pc-style"><strong>${not empty user_nm ? user_nm : "게스트"}</strong>님 안녕하세요!</div>
                <ul class="sns_link pc-style">
                    <li><a href="/mypage.do"><img src="/resource/img/mypage.svg" /></a></li>
                    <li class="cart"><a href="/cart.do"><img src="/resource/img/cart.svg" /><c:if test="${not empty user_nm }"><span>${fn:length(cartList4)}</span></c:if></a></li>
                    <c:if test="${ empty user_nm }">
                    <li><a href="/login.do"><img src="/resource/img/join.svg" /></a></li>
                    </c:if>
                    <c:if test="${ not empty user_nm }">
                    <li><a href="/member/logOut.do"><img src="/resource/img/join.svg" /></a></li>
                    </c:if>                    
                    
                </ul>
            </div>
        </div>
        
        		
        <!-- gnb wrap -->
        <div id="gnb_wrap">
            
            <div class="inner">
                <!-- 전체메뉴 -->
                <div class="total_menu">
                    <a href="javascript:" class="btn_menu">
                    <span class="line1"></span>
                    <span class="line2"></span>
                    <span class="line3"></span>
                    <p>전체제품</p>
                    </a>
                    <div class="total_menu_title mobile-style">전체제품</div>
                    <!-- 전체 메뉴 -->
                    <div class="all-menu">
                        <!-- 메뉴 레이어 -->
                        <div class="menu-layer">
                            <div class="menu-item">
                                <h1>기능별</h1>
                                <span><a href="">눈건강</a></span>
                                <span><a href="">장건강/배변활동</a></span>
                                <span><a href="">다이어트</a></span>
                                <span><a href="">비타민</a></span>
                                <span><a href="">피부건강</a></span>
                            </div>
                            <div class="menu-item">
                                <h1>대상별</h1>
                                <span><a href="">여성</a></span>
                                <span><a href="">남성</a></span>
                                <span><a href="">실버</a></span>
                                <span><a href="">임산부</a></span>
                                <span><a href="">키즈</a></span>
                            </div>
                        </div>
                        <!-- // 메뉴 레이어 -->
                    </div>
                    <!-- // 전체 메뉴 -->
                </div>
                <!--// 전체메뉴 -->
                
                <div class="mobile-scroll">
                    <div class="mobile-scroll-y">
                        <ul id="gnb">
                            <!-- 수동관리시 주석 -->
                            <li class="dep1">
                                <a href="/event_list.do" target="_self" >이벤트</a>
                                <!--<ul class="submnu">
                                    <li><a href="/sub01.html?top=1&sub=1" target="_self"><span>이롬그룹 소개</span></a></li>
                                    <li><a href="/sub01-2.html?top=1&sub=2" target="_self"><span>황성주박사 소개</span></a></li>
                                    <li><a href="/sub01-3.html?top=1&sub=3" target="_self"><span>Contact Us</span></a></li>
                                </ul>-->
                            </li>
                            <li class="dep1">
                                <a href="/special.do" target="_self" >기획전</a>
                                
                            </li>
                            <li class="dep1">
                                <a href="/h_list.do" target="_self" >건강식품</a>
                                
                            </li>
                            <li class="dep1">
                                <a href="/f_list.do" target="_self" >푸드케어</a>
                                
                            </li>
                            <li class="dep1">
                                <a href="/b_list.do" target="_self" >헬스&바디케어</a>
                                
                            </li>
                            <li class="dep1">
                                <a href="/p_list.do" target="_self" >펫케어</a>
                                
                            </li>
                            <li class="dep1 mobile-style">
                                <a href="/mypage.do" target="_self" >마이페이지</a>
                                
                            </li>
                        </ul>
                    </div>
                </div>
                <!-- // gnb -->
                <div class="eromcare"><a href=""><strong>이롬헬스케어</strong>란?</a></div>
                <div class="member-name_mobile mobile-style"><strong>${not empty user_nm ? user_nm : "게스트"}</strong>님 안녕하세요!</div>
                <ul class="sns_link_mobile mobile-style">
                    <li><a href="/mypage.do"><img src="/resource/img/mypage.svg" /></a></li>
                    <li class="cart"><a href="/cart.do"><img src="/resource/img/cart.svg" /><span>1</span></a></li>
                    <li><a href="/login.do"><img src="/resource/img/join.svg" /></a></li>
                </ul>
            </div> 
        
        </div>
        <!-- // gnb wrap -->
        
        
    </div>
    <!--// 헤더 -->
    
    
    
    
    
    
    
    