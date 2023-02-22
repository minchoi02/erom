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
<c:set var="isfooter" value="Y" />
<c:set var="isfooterNavi" value="Normal" />
<c:set var="Protocol" value="${pageContext.request.scheme}" />
<c:set var="Domain" value="${pageContext.request.serverName}" />
<c:set var="Port" value="${pageContext.request.serverPort }" />
<c:set var="this_url" value="<%=this_uri%>" />
<c:set var="left_uri" value="<%=left_uri%>" />
<c:set var="doURI" value="${requestScope['javax.servlet.forward.servlet_path']}" /> 
<c:set var="qsURI" value="${pageContext.request.queryString}" /> 
<c:set var="URI" value="${doURI }"/>
<c:if test="${not empty qsURI}">
	<c:set var="URI" value="${doURI }?${qsURI }"/>
</c:if>
<c:set var="port" value=""/>
<c:if test="${Port ne '80' and Port ne '443'}">
	<c:set var="port" value=":${Port}"/>
</c:if>
<c:set var="OrgFullUrl" value="${Protocol}://${Domain }${port}${URI }" />
<c:if test="${this_url eq 'index'}">
	<c:set var="headerType" value="index" />
</c:if>

<c:if test="${left_uri eq 'joinLogin' || left_uri eq 'join' || left_uri eq 'Login' || left_uri eq 'login' || left_uri eq 'order'}">
	<c:set var="isfooter" value="N" />
</c:if>
<c:if test="${left_uri eq 'itemInfo' || left_uri eq 'itemQna' || left_uri eq 'itemReView' || left_uri eq 'itemView' }">
	<c:choose>
		<c:when test="${store_category eq 'CD002004' }">
			<c:set var="isfooterNavi" value="itemDetailOrder" />
		</c:when>
		<c:otherwise>
			<c:set var="isfooterNavi" value="itemDetail" />
		</c:otherwise>
	</c:choose>
	
</c:if>

	</div>

	<c:if test="${isfooter eq 'Y' }">
	<!-- 하단 푸터 { -->
	<footer id="footer">
		<div class="foot_top">
			<a href="tel:<c:out value="${SiteBaseConfig.site_tel }" />"><span class="customercenter" style="color: #fff;">고객센터 <b><c:out value="${SiteBaseConfig.site_tel }"/></b></span></a>
		</div>
		<div class="foot_info">
			<dl>
				<dt>쇼핑몰 상호</dt>
				<dd><c:out value="${SiteBaseConfig.site_nm}"/></dd>
			</dl>
			<dl>
				<dt>대표자</dt>
				<dd><c:out value="${SiteBaseConfig.site_ceo_nm}"/></dd>
			</dl>
			<dl>
				<dt>주소지</dt>
				<dd>(<c:out value="${SiteBaseConfig.site_zip}"/>) <c:out value="${SiteBaseConfig.site_addr_1}"/> <c:out value="${SiteBaseConfig.site_addr_2}"/></dd>
			</dl>
			<dl>
				<dt>사업자등록번호</dt>
				<dd><c:out value="${SiteBaseConfig.site_company_number}"/> <a href="javascript:site_info('<c:out value="${SiteBaseConfig.site_company_number}"/>'); " >[사업자정보확인]</a></dd>
			</dl>
			<dl>
				<dt>통신판매업신고</dt>
				<dd><c:out value="${SiteBaseConfig.site_sail_auth_number}"/></dd>
			</dl>
			<dl>
				<dt>개인정보책임자</dt>
				<dd><c:out value="${SiteBaseConfig.site_info_adm_nm}"/> (<a href="mailto:<c:out value="${SiteBaseConfig.site_info_adm_email}"/>"><c:out value="${SiteBaseConfig.site_info_adm_email}"/></a>)</dd>
			</dl>
			<p class="copyright"><a href="/info/siteRule.do">[이용약관]</a>&nbsp;&nbsp;&nbsp;<a href="/info/perRule.do">[개인정보 취급방침]</a></p>
			<p class="copyright">Copyright ⓒ 2020 Seocheon-gun. All rights reserved. ${param.lat}</p>
		</div>
	</footer>
	<!-- } 하단 푸터 -->
	</c:if>
</div>

<c:if test="${isfooter eq 'Y' }">
<c:set var="markettoparea" value=""/>
<c:if test="${store_category eq 'CD002004'}">
<c:set var="markettoparea" value="market"/>
</c:if>
<div id="topArea" class="<c:out value="${markettoparea }"/>"><a href="#wrapper" class="pagelink"><i class="fal fa-arrow-to-top"></i><span class="sound_only">맨위로</span></a></div>

	<c:if test="${isfooterNavi eq 'itemDetail' }">
	<!-- 관광/체험, 숙박, 맛집 상세페이지 하단 네비 { -->
	<nav id="m-nav" class="detailpage">
		<ul class="nopm floats">
			<li><a href="/"><em><i class="fal fa-home"></i></em><span class="sound_only">홈으로</span></a></li>
			<li><a href="javascript:history.back();"><em><i class="fal fa-long-arrow-left"></i></em><span class="sound_only">뒤로가기</span></a></li>
			<li><a href="javascript:location.reload();"><em><i class="fal fa-redo"></i></em><span class="sound_only">새로고침</span></a></li>
			<li><a href="#;" class="fullmapbtn"><em><i class="fal fa-compass"></i></em><span class="sound_only">지도보기</span></a></li>
			<li><a href="#;" class="sharebtn"><em><i class="fal fa-share-alt"></i></em><span class="sound_only">공유하기</span></a></li>
			<!--<li><a href="#;"><em><i class="fal fa-heart"></i></em><span class="sound_only">찜하기</span></a></li>-->
			<li class="active"><a href="#;"><em><i class="fas fa-heart"></i></em><span class="sound_only">찜하기</span></a></li>
		</ul>
	</nav>
	<!-- } 관광/체험, 숙박, 맛집 상세페이지 하단 네비 -->
	</c:if>
	
	<c:if test="${isfooterNavi eq 'itemDetailOrder' }">
	<!-- 서천장터 상세페이지 하단 네비 { -->
	<nav id="m-nav" class="detailpage">
		<ul class="nopm floats">
			<li><a href="/"><em><i class="fal fa-home"></i></em><span class="sound_only">홈으로</span></a></li>
			<li><a href="javascript:history.back();"><em><i class="fal fa-long-arrow-left"></i></em><span class="sound_only">뒤로가기</span></a></li>
			<li><a href="javascript:location.reload();"><em><i class="fal fa-redo"></i></em><span class="sound_only">새로고침</span></a></li>
			<li><a href="#;" class="fullmapbtn"><em><i class="fal fa-compass"></i></em><span class="sound_only">지도보기</span></a></li>
			<li><a href="#;" class="sharebtn"><em><i class="fal fa-share-alt"></i></em><span class="sound_only">공유하기</span></a></li>
			<!--<li><a href="#;"><em><i class="fal fa-heart"></i></em><span class="sound_only">찜하기</span></a></li>-->
			<li class="active"><a href="#;"><em><i class="fas fa-heart"></i></em><span class="sound_only">찜하기</span></a></li>
		</ul>
	</nav>
	<!-- } 서천장터 상세페이지 하단 네비 -->
	<!-- 상품쪽에서 직접 호출 -->
	</c:if>

	<!-- 일반 모바일 하단 네비 { -->
	<c:if test="${isfooterNavi eq 'Normal' }">
	<nav id="m-nav">
		<ul class="nopm floats">
			<li <c:if test="${this_url eq 'index' }">class="active"</c:if>><a href="/"><em><img src="/images/baseScmtour/gnb_ico_home<c:if test="${this_url eq 'index' }">_ov</c:if>.png" alt="홈" /></em><span>홈</span></a></li>
			<li <c:if test="${store_category eq 'CD002001' }">class="active"</c:if>><a href="/shop/itemList.do?store_category=CD002001"><em><img src="/images/baseScmtour/gnb_ico_travel<c:if test="${store_category eq 'CD002001' }">_ov</c:if>.png" alt="관광/체험" /></em><span>관광/체험</span></a></li>
			<li <c:if test="${store_category eq 'CD002002' }">class="active"</c:if>><a href="/shop/itemList.do?store_category=CD002002"><em><img src="/images/baseScmtour/gnb_ico_room<c:if test="${store_category eq 'CD002002' }">_ov</c:if>.png" alt="숙박" /></em><span>숙박</span></a></li>
			<li <c:if test="${store_category eq 'CD002003' }">class="active"</c:if>><a href="/shop/itemList.do?store_category=CD002003"><em><img src="/images/baseScmtour/gnb_ico_food<c:if test="${store_category eq 'CD002003' }">_ov</c:if>.png" alt="맛집" /></em><span>맛집</span></a></li>
			<li <c:if test="${store_category eq 'CD002004' }">class="active"</c:if>><a href="/shop/itemList.do?store_category=CD002004"><em><img src="/images/baseScmtour/gnb_ico_market<c:if test="${store_category eq 'CD002004' }">_ov</c:if>.png" alt="서천장터" /></em><span>서천장터</span></a></li>
			<li <c:if test="${this_url eq 'morePage' }">class="active"</c:if>><a href="/shop/more.do"><em><img src="/images/baseScmtour/gnb_ico_mypage<c:if test="${this_url eq 'morepage' }">_ov</c:if>.png" alt="더보기" /></em><span>마이페이지</span></a></li>
		</ul>
	</nav>
	<!-- } 일반 모바일 하단 네비 -->
	</c:if>


</c:if>


<!-- 상세페이지 소셜 링크 { -->
	<div class="shadowbg"></div>
	<div id="socialLinkPop">
		<h2>공유하기</h2>
		<ul class="nopm floats">
			<li><a href="#" onclick="fnSendSns('kakaotalk', '', ''); return false;"><em><img src="/images/baseScmtour/social_ico_kakao.png" alt="카카오톡" /></em><span>카카오톡</span></a></li>
			<li><a href="#" onclick="fnSendSns('line', '', ''); return false;"><em><img src="/images/baseScmtour/social_ico_line.png" alt="라인" /></em><span>라인</span></a></li>
			<li><a href="#" onclick="fnSendSns('facebook', '', ''); return false;"><em><img src="/images/baseScmtour/social_ico_facebook.png" alt="페이스북" /></em><span>페이스북</span></a></li>
			<li><a href="#" onclick="fnSendSns('twitter', '', ''); return false;"><em><img src="/images/baseScmtour/social_ico_twitter.png" alt="트위터" /></em><span>트위터</span></a></li>
			<li><a href="#" onclick="copyToClipboard('text1')" class="copyer"><em><img src="/images/baseScmtour/social_ico_linkcopy.png" alt="링크복사" /></em><span>링크복사</span></a></li>
		</ul>
		<div class="btnArea">
			<a href="#;" class="popCloseBtn">취소</a>
		</div>
		<p id="text1" style="display:none;"><c:out value="${OrgFullUrl }"/></p>
	</div>

	<script type="text/javascript" src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
	<script>
	//<![CDATA[
	Kakao.init('<c:out value="${SiteBaseConfig.sns_daum_rakey }"/>');
	$.getScript("https://static.joins.com/joongang_15re/scripts/lib/clipboard.min.js", function () {
		var clipboard = new Clipboard("#layer_share .url_copy, .share-layer .url_copy", {
			text: function () {
				return $("meta[property='og:url']").attr("content");
			}
		});
	});
	//]]>
</script>
	<script>
		function fnSendSns(sns, url, txt) {
			var o;
			var _url = encodeURIComponent(url || $("meta[property='og:url']").attr("content")); //공유 URL
			var _txt = encodeURIComponent(txt || $("meta[property='og:title']").attr("content"));                            //공유 제목
			var _desc = encodeURIComponent($("meta[property='og:description']").attr("content") || '아무리 어려운 뉴스라도 ‘썰리’가 설명∙정리 해 드립니다.');                            //공유 상세
			var _br = encodeURIComponent('\r\n');
			var _img = encodeURIComponent($("meta[property='og:image']").attr("content"));      //공유 이미지
			switch (sns) {
				case 'facebook':
					o = { type: sns, method: 'popup', url: 'http://www.facebook.com/sharer/sharer.php?u=' + _url, width: 555, height: 608, resize: 'no' };
					break;
				case 'twitter':
					o = { type: sns, method: 'popup', url: 'http://twitter.com/intent/tweet?text=' + _txt + '&url=' + _url, width: 555, height: 500, resize: 'no' };
					break;
				case 'kakaotalk':
					o = {};
					Kakao.Link && Kakao.Link.sendDefault({
						objectType: 'feed',
						content: {
							title: decodeURIComponent(_txt),
							description: decodeURIComponent(_desc),
							imageUrl: decodeURIComponent(_img),
							link: {
								webUrl: decodeURIComponent(_url),
								mobileWebUrl: decodeURIComponent(_url)
							},
							imageWidth: 1200,
							imageHeight: 620
						},
						fail: function () {
							alert('지원하지 않는 플랫폼입니다.');
						}
					});
					break;
				case 'kakaostory':
					o = {};
					Kakao.Story.share({ url: $("meta[property='og:url']").attr("content"), text: $("title").text() });
					break;
				case 'band':
					o = { type: sns, method: 'popup', url: 'http://band.us/plugin/share?body=' + _txt + '&route=' + _url, width: 410, height: 540, resize: 'no' };
					break;
				case 'line':
					o = { type: sns, method: 'popup', url: 'http://line.me/R/msg/text/?' + (_txt + _br + _url), width: 640, height: 440, resize: 'no' };
					break;
				case 'naverblog':
					o = { type: sns, method: 'popup', url: 'http://share.naver.com/web/shareView.nhn?url=' + _url + '&title=' + _txt, width: 557, height: 558, resize: 'no' };
					break;
				case 'googleplus':
					o = { type: sns, method: 'popup', url: 'https://plus.google.com/share?url=' + _url + '&hl=ko', width: 490, height: 490, resize: 'no' };
					break;
				case 'url':
					o = {};
					copyToClipboard();
					break;
				case 'mail':
					o = {};
					location.href = 'mailto:?body=' + _url + '&subject=' + txt;
					break;
				default:
					alert('지원하지 않는 SNS입니다.');
					return false;
			}

			if (o && o.method == "popup")
				window.open(o.url, o.type + "_sns", "width=" + o.width + ",height=" + o.height + ",resizable=" + o.resize);
		}

		function copyToClipboard(elementId) {
			var aux = document.createElement("input");
			aux.setAttribute("value", document.getElementById(elementId).innerHTML);
			document.body.appendChild(aux);
			aux.select();
			document.execCommand("copy");
			document.body.removeChild(aux);
		}

		$('.copyer').click(function() {
			alert("주소가 복사되었습니다. SNS에 홍보해주세요!");
		});
	</script>
<!-- } 상세페이지 소셜 링크 -->



	<script>
		$(document).on("keyup", ".phoneNumber", function() { $(this).val( $(this).val().replace(/[^0-9]/g, "").replace(/(^02|^0505|^1[0-9]{3}|^0[0-9]{2})([0-9]+)?([0-9]{4})/,"$1-$2-$3").replace("--", "-") ); });
	</script>
	<script>
	$(window).bind("pageshow", function(event) {
	    if (event.originalEvent.persisted) {
	        document.location.reload();
	    }
	});
	</script>

	<div class="loading" style="display: none;">
		<div class="loadingico"><i class="fad fa-spinner fa-spin"></i></div>
	</div>	
</body>
</html>
