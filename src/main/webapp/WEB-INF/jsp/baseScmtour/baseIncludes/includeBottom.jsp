<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<% 
response.setHeader("pragma", "no-cache");              
response.setHeader("Cache-control", "no-cache, no-store, must-revalidate");             
response.setHeader("Expires", "0"); 

// url을 읽어와서 파일을 추출한다.
String Protocol = request.getScheme();
String fullUrl = request.getServletPath();
String checkUrl = fullUrl.replace("/WEB-INF/jsp/baseScmtour/","");
String[] url_arr = checkUrl.split("/");
String this_uri = url_arr[0].replace(".jsp","");
String left_uri = "";
if(url_arr.length > 1) { //서브디렉토리일때..  왼쪽 메뉴를 잡는다.
	left_uri = url_arr[1].replace(".jsp","");
}
%>

<!-- 스크롤 상단 -->
    <!--<a href="javascript:;" id="scrollTop">
        <i class="fa fa-arrow-up"></i>
        <span>TOP</span>
	</a>-->
    <!-- 스크롤 상단 -->

    <!-- 푸터 -->
    <div id="footer">
        <div class="footer-top">
            <div class="inner">
                <div class="left">
                    <span><a href="">이롬헬스케어 소개</a></span>
                    <span><a href="">이용안내</a></span>
                    <span><a href="">이용약관</a></span>
                    <span><a href="">개인정보처리방침</a></span>
                    <span><a href="">고객센터</a></span>
                    <span><a href="/board/list.do?bd_id=FAQ&pageIndex=1">자주묻는질문</a></span>
                    <span><a href="/board/list.do?bd_id=MTM&pageIndex=1">1:1문의</a></span>
                    <span><a href="/board/list.do?bd_id=NOTICE&pageIndex=1">공지사항</a></span>
                </div>
                <div class="right">
                    <span><a href=""><i class="xi-facebook"></i></a></span>
                    <span><a href=""><i class="xi-instagram"></i></a></span>
                    <span><a href=""><i class="xi-kakaotalk"></i></a></span>
                    <span><a href=""><i class="xi-naver"></i></a></span>
                </div>
            </div>
        </div>
        <div class="inner">
          
            <!-- 그리드 감싸기 -->
            <div class="foot_wrap">
                <div class="foot_logo"><a href=""><img src="/resource/img/logo.png" /></a></div>
                <div class="foot_info">
                  	<div class="address">
                        <span>${SiteBaseConfig.site_company_nm}  &nbsp; | &nbsp;   대표이사 : ${SiteBaseConfig.site_ceo_nm}  &nbsp; | &nbsp;   대표전화 ${SiteBaseConfig.site_tel }  &nbsp; | &nbsp;   팩스 : ${SiteBaseConfig.site_fax } </span>
                        <span>E-mail : ${SiteBaseConfig.site_info_adm_email}  &nbsp; | &nbsp;   주소 : (<c:out value="${SiteBaseConfig.site_zip}"/>) <c:out value="${SiteBaseConfig.site_addr_1}"/> <c:out value="${SiteBaseConfig.site_addr_2}"/></span>
                        <span>사업자등록번호 : <c:out value="${SiteBaseConfig.site_company_number}"/>  &nbsp; | &nbsp;   건강기능식품일반판매업 : 제2018-0286832  &nbsp; | &nbsp;   통신판매신고 : ${SiteBaseConfig.site_sail_auth_number}</span>
                        <span class="copy">Copyright by Erom Healthcare. All rights reserved.</span>
                    </div>
                </div>
                <div class="foot_family">
                    <a href="javascript:;">Family Site</a>
                    <ul class="dropdown">
                        <li><a href="https://www.erom.co.kr/" target="_blank">이롬</a></li>
                        <li><a href="https://www.eromplus.com" target="_blank">이롬플러스</a></li>
                        <li><a href="https://www.eromhealthcare.co.kr" target="_blank">이롬헬스케어</a></li>
                        <li><a href="http://www.cafeloge.com" target="_blank">카페로쥬</a></li>
                        <li><a href="https://www.eromglobal.com" target="_blank">이롬글로벌</a></li>
                        <li><a href="#;" target="_blank">이롬네이처온</a></li>
                        <li><a href="http://www.lcc.co.kr" target="_blank">사랑의병원</a></li>
                        <li><a href="http://www.hugenebio.co.kr" target="_blank">휴젠바이오</a></li>
                        <li><a href="https://www.erom.co.kr/biology_research/" target="_blank">생명과학연구원</a></li>
                        <li><a href="http://www.eromplus.com/myoffice/pub.do?prgId=osHome.osMake.osInnovation" target="_blank">EQG센타</a></li>
                        <li><a href="https://gvchurch.modoo.at" target="_blank">꿈이있는 교회</a></li>
                        <li><a href="http://www.lci.or.kr" target="_blank">국제사랑봉사단</a></li>
                        <li><a href="https://www.bibletime.org" target="_blank">바이블타임</a></li>
                        <li><a href="https://www.youtube.com/channel/UCTNRWtirVs4VcB4W5xyzITA" target="_blank">황성주TV</a></li>
                        <li><a href="http://www.dream-power.co.kr" target="_blank">꿈의 발전소</a></li>
                        <li><a href="http://www.dreamschool.or.kr" target="_blank">꿈의학교</a></li>
                        <li><a href="http://www.bookndream.kr" target="_blank">책N꿈</a></li>
                        <li><a href="http://rd.dreamschool.or.kr" target="_blank">책N꿈 월드리더스쿨</a></li>
                        <li><a href="https://www.youtube.com/watch?v=D_BUElTwT4o" target="_blank">책N꿈 어린이집</a></li>
                        <li><a href="https://kor.kumiuniversity.ac.ug" target="_blank">쿠미대학교</a></li>
                    </ul>
                </div>
            </div>
            <!-- // 그리드 감싸기 -->
        </div>
    </div>
    <!-- // 푸터 -->
    
		<script>
      $(function() {
        $(".foot_family > a").click(function() {
          if(!$(this).siblings('.dropdown').is(':visible')) {
            $(this).siblings('.dropdown').stop(true,false).slideDown(500);
          } else {
            $(this).siblings('.dropdown').stop(true,false).slideUp(500);
          }
        });
      });
    </script>
    <!-- my shopping -->
    <div class="shopping-mask"></div>
    <div class="cartArea animated slideInDown">
    		<div class="cartBtn"><a href="#;"><i class="xi-angle-up-min"></i> MY SHOPPING</a></div>
    		<div class="cartArea-info">
        		<div class="inner">
                <div class="pop-mypage">
                    <h1><strong><c:out value="${user_nm}" /></strong>님의<br class="pc-style"  />정보입니다.</h1>
                    <div class="coupon">
                        <div class="pc-style"><img src="/resource/img/cartArea-icon1.svg" alt="이미지"></div>
                        <span>보유쿠폰</span>
                        <p>3건</p>
                    </div>
                    <div class="point">
                        <div class="pc-style"><img src="/resource/img/cartArea-icon2.svg" alt="이미지"></div>
                        <span>포인트</span>
                        <p>345,000</p>
                    </div>
                </div>
                <div class="pop-latest">
                    <!-- 최근본상품 -->
                    <div class="left">
                        <span>최근본상품</span>
                        <p>6개</p>
                        <div class="slide-cover"></div>
                    </div>
                    <div class="right">
                        <!-- Swiper -->
                        <div class="swiper cartArea-slide">
                          <!-- Initialize Swiper -->
                            <div class="swiper-wrapper">
                            		<div class="swiper-slide">
                                  <a href="">
                                  <div class="image_area"><img src="/resource/img/po_product_img1.jpg" alt="이미지"></div>
                                  <div class="txtArea">
                                      <h1>이롬플러스 포로틴</h1>
                                      <p>125,000원</p>
                                  </div>
                                  </a>
                                </div>
                                <div class="swiper-slide">
                                  <a href="">
                                  <div class="image_area"><img src="/resource/img/po_product_img2.jpg" alt="이미지"></div>
                                  <div class="txtArea">
                                      <h1>이롬플러스 키즈10</h1>
                                      <p>65,000원</p>
                                  </div>
                                  </a>
                                </div>
                                <div class="swiper-slide">
                                  <a href="">
                                  <div class="image_area"><img src="/resource/img/po_product_img3.jpg" alt="이미지"></div>
                                  <div class="txtArea">
                                      <h1>이뮨푸드엑스</h1>
                                      <p>88,000원</p>
                                  </div>
                                  </a>
                                </div>
                                <div class="swiper-slide">
                                  <a href="">
                                  <div class="image_area"><img src="/resource/img/po_product_img4.jpg" alt="이미지"></div>
                                  <div class="txtArea">
                                      <h1>면역비책 발효홍삼</h1>
                                      <p>125,000원</p>
                                  </div>
                                  </a>
                                </div>
                                <div class="swiper-slide">
                                  <a href="">
                                  <div class="image_area"><img src="/resource/img/po_product_img5.jpg" alt="이미지"></div>
                                  <div class="txtArea">
                                      <h1>황성주 박사의 국산 콩두유</h1>
                                      <p>165,000원</p>
                                  </div>
                                  </a>
                                </div>
                                <div class="swiper-slide">
                                  <a href="">
                                  <div class="image_area"><img src="/resource/img/po_product_img6.jpg" alt="이미지"></div>
                                  <div class="txtArea">
                                      <h1>황성주 박사의 고단백두유</h1>
                                      <p>35,000원</p>
                                  </div>
                                  </a>
                                </div>
                                <div class="swiper-slide">
                                  <a href="">
                                  <div class="image_area"><img src="/resource/img/po_product_img7.jpg" alt="이미지"></div>
                                  <div class="txtArea">
                                      <h1>이롬플러스 효모비오틴</h1>
                                      <p>85,000원</p>
                                  </div>
                                  </a>
                                </div>
                                <div class="swiper-slide">
                                  <a href="">
                                  <div class="image_area"><img src="/resource/img/po_product_img8.jpg" alt="이미지"></div>
                                  <div class="txtArea">
                                      <h1>이롬플러스 활력비책관절엔인지</h1>
                                      <p>110,000원</p>
                                  </div>
                                  </a>
                                </div>
                            </div>
                            <!-- Add Pagination 
                            <div class="swiper-pagination"></div>-->
                            
                        </div>
                        <!-- Add Arrows -->
                        <div class="swiper-button-next foot-arrow-next"><i class="xi-angle-right-min"></i></div>
                        <div class="swiper-button-prev foot-arrow-prev"><i class="xi-angle-left-min"></i></div>
                    </div>
                    <!-- 메인섹션 스크립트 -->
                </div>
            </div>
        </div>
    </div>
    <!--// my shopping -->
    
    	

    <script>
		Splitting({
		  /* target: String selector, Element, Array of Elements, or NodeList */
		  target: "[data-splitting]",
		  /* by: String of the plugin name */
		  by: "chars",
		  /* key: Optional String to prefix the CSS variables */
		  key: null
		});
	</script> 
</div>
<!-- 전체 감싸기 끝-->

</body>
</html>
    
    