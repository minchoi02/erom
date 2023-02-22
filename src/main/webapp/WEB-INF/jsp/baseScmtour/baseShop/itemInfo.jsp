<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="doURI" value="${requestScope['javax.servlet.forward.servlet_path']}" /> 
<c:set var="qsURI" value="${pageContext.request.queryString}" /> 
<c:set var="URI" value="${doURI }"/>
<c:if test="${not empty qsURI}">
	<c:set var="URI" value="${doURI }?${qsURI }"/>
</c:if>

<c:choose>
	<c:when test="${not empty user_id }">
		<c:set var="func_pick" value="prod_pick('${prod_id }')" />
	</c:when>
	<c:otherwise>
		<c:set var="func_pick" value="getLogin('${URI }')"/>
	</c:otherwise>
</c:choose>


<c:import url="/Api/IncludeTop.do"/>


<%-- 여행 --%>
<c:if test="${store_category eq 'CD002001' }">
	<!-- 관광/체험 뷰페이지 { -->
	<section id="travelView" class="productview">
		
		<c:import url="commonItemInfomation.jsp"/>

		<!-- 기본정보 { -->
		<article id="viewBasicInfo">
			<div class="subject_price">
				<h2 class="viewh2"><c:out value="${prodInfo.prod_nm }"/></h2>
				<c:choose>
				<c:when test="${prodInfo.prod_market_price > 0 }">
				<div class="pricebox"><strong class="colorOrange"><fmt:formatNumber value="${prodInfo.prod_market_price}" type="number"/></strong> <small>원 부터</small></div>
				</c:when>
				<c:otherwise>
				<div class="pricebox"><strong class="colorOrange">무료</div>
				</c:otherwise>
				</c:choose>				
				<div class="jjimbox"><a href="#;" class="jjimbtn  <c:if test="${isProdFav eq 'Y' }">active</c:if>" onclick="<c:out value="${func_pick}"/>" ><span><i class="fal fa-plus"></i></span> 찜하기</a></div>
			</div>
		</article>
		<!-- } 기본정보 -->

		<!-- 관광지정보 { -->
		<article id="viewInfo" class="nopadding">
			<div class="marketlist bgs">
				<h2 class="mainTit nomargin"><em>업체 판매 상품</em></h2>
				<ul class="nopm floats">
					<c:forEach var="prod_store_list" items="${prod_store_list}" varStatus="status">
					<li>
						<a href="/shop/itemView.do?store_category=<c:out value="${prod_store_list.store_category}"/>&prod_category=<c:out value="${prod_store_list.prod_category}"/>&prod_id=<c:out value="${prod_store_list.prod_id}"/>" class="pic">
						<img src="/cmm/fms/getImage.do?atchFileId=<c:out value="${prod_store_list.prod_img_1}"/>&fileSn=0" style="width: 100%;" onerror="this.src='/images/baseScmtour/_noImage.png';"/>
						</a>
						<a href="/shop/itemView.do?store_category=<c:out value="${prod_store_list.store_category}"/>&prod_category=<c:out value="${prod_store_list.prod_category}"/>&prod_id=<c:out value="${prod_store_list.prod_id}"/>" class="txt">
							<span class="store">[<c:out value="${prod_store_list.store_nm}"/>]</span>
							<em class="subject"><c:out value="${prod_store_list.prod_nm}"/></em>
							<span class="price"><fmt:formatNumber value="${prod_store_list.prod_market_price}" type="number"/> <small>원 부터</small></span>
						</a>
					</li>
					</c:forEach>
				</ul>
				<%--
				<div class="btnarea mgt10px">
					<a href="#;" class="btns graybtn w100">더보기 <i class="fal fa-plus"></i></a>
				</div>
				 --%>
			</div>
		
			<dl class="nopm">
				<dt>판매자 정보</dt>
				<c:if test="${not empty storeInfo.store_nm }">
				<dl class="nopm">
					<dt>상호명</dt>
					<dd><c:out value="${storeInfo.store_nm }"/></dd>
				</dl>
				</c:if>
				
				<c:if test="${not empty storeInfo.store_email }">
				<dl class="nopm">
					<dt>이메일</dt>
					<dd><c:out value="${storeInfo.store_email }"/></dd>
				</dl>
				</c:if>
				
				<c:if test="${not empty storeInfo.store_number }">
				<dl class="nopm">
					<dt>사업자번호</dt>
					<dd><c:out value="${storeInfo.store_number}"/></dd>
				</dl>
				</c:if>
				
				<c:if test="${not empty storeInfo.store_auth_number }">
				<dl class="nopm">
					<dt>통신판매번호</dt>
					<dd><c:out value="${storeInfo.store_auth_number}"/></dd>
				</dl>
				</c:if>
				
				<c:if test="${not empty storeInfo.store_ceo_nm }">
				<dl class="nopm">
					<dt>대표자명</dt>
					<dd><c:out value="${storeInfo.store_ceo_nm}"/></dd>
				</dl>
				</c:if>
				
				<c:if test="${not empty storeInfo.store_tel }">
				<dl class="nopm">
					<dt>대표전화</dt>
					<dd><c:out value="${storeInfo.store_tel}"/> <a href="tel:<c:out value="${storeInfo.store_tel}"/>" class="btns h24px"><span class="colorRed"><i class="fas fa-phone-square"></i></span> 전화걸기</a></dd>
				</dl>
				</c:if>
				
				<c:if test="${not empty storeInfo.store_addr_1 }">
				<dl class="nopm">
					<dt>영업소재지</dt>
					<dd><c:out value="${storeInfo.store_addr_1}"/> <c:out value="${storeInfo.store_addr_2}"/> <a href="#;" class="btns h24px fullmapbtn"><span class="colorRed"><i class="fas fa-map-marker-alt"></i></span> 지도보기</a></dd>
				</dl>
				</c:if>
			</dl>
			
			<dl class="nopm">
				<dt>전자상거래 등에서 상품제공 고시</dt>
				<dd>
					<dl class="nopm">
						<dt>발행자</dt>
						<dd><c:out value="${prodInfo.prod_info_1}"/></dd>
					</dl>
					<dl class="nopm">
						<dt>이용 가능 매장</dt>
						<dd><c:out value="${prodInfo.prod_info_2}"/></dd>
					</dl>
					<dl class="nopm">
						<dt>유효기간, 이용조건</dt>
						<dd><c:out value="${prodInfo.prod_info_3}"/></dd>
					</dl>
					<dl class="nopm">
						<dt>환불조건 및 방법</dt>
						<dd><c:out value="${prodInfo.prod_info_4}"/></dd>
					</dl>
					<dl class="nopm">
						<dt>이용 가능 매장</dt>
						<dd><c:out value="${prodInfo.prod_info_5}"/></dd>
					</dl>
				</dd>
			</dl>
			<c:import url="commonItemInfomationTrade.jsp"/>
		</article>
		<!-- } 관광지정보 -->
	</section>
	<!-- } 관광/체험 뷰페이지 -->

</c:if>

<%-- 숙박 --%>
<c:if test="${store_category eq 'CD002002' }">
	<!-- 숙박 뷰페이지 { -->
	<section id="roomView" class="productview">
	
		<c:import url="commonItemInfomation.jsp"/>
	
		<!-- 기본정보 { -->
		<article id="viewBasicInfo">
			<div class="subject_price">
				<h2 class="viewh2"><c:out value="${prodInfo.prod_nm }"/></h2>
				<div class="addr"><c:out value="${storeInfo.store_addr_1}"/> <c:out value="${storeInfo.store_addr_2}"/></div>
				<div class="jjimbox"><a href="#;" class="jjimbtn  <c:if test="${isProdFav eq 'Y' }">active</c:if>" onclick="<c:out value="${func_pick}"/>" ><span><i class="fal fa-plus"></i></span> 찜하기</a></div>
			</div>
		</article>
		<!-- } 기본정보 -->

		<!-- 관광지정보 { -->
		<article id="viewInfo" class="nopadding">
			<div class="marketlist bgs">
				<h2 class="mainTit nomargin"><em>업체 판매 상품</em></h2>
				<ul class="nopm floats">
					<c:forEach var="prod_store_list" items="${prod_store_list}" varStatus="status">
					<li>
						<a href="/shop/itemView.do?store_category=<c:out value="${prod_store_list.store_category}"/>&prod_category=<c:out value="${prod_store_list.prod_category}"/>&prod_id=<c:out value="${prod_store_list.prod_id}"/>" class="pic">
						<img src="/cmm/fms/getImage.do?atchFileId=<c:out value="${prod_store_list.prod_img_1}"/>&fileSn=0" style="width: 100%;" onerror="this.src='/images/baseScmtour/_noImage.png';"/>
						</a>
						<a href="/shop/itemView.do?store_category=<c:out value="${prod_store_list.store_category}"/>&prod_category=<c:out value="${prod_store_list.prod_category}"/>&prod_id=<c:out value="${prod_store_list.prod_id}"/>" class="txt">
							<span class="store">[<c:out value="${prod_store_list.store_nm}"/>]</span>
							<em class="subject"><c:out value="${prod_store_list.prod_nm}"/></em>
							<%-- <span class="price"><fmt:formatNumber value="${prod_store_list.prod_market_price}" type="number"/> <small>원 부터</small></span> --%>
						</a>
					</li>
					</c:forEach>
				</ul>
				<%--
				<div class="btnarea mgt10px">
					<a href="#;" class="btns graybtn w100">더보기 <i class="fal fa-plus"></i></a>
				</div>
				 --%>
			</div>
			
			<dl class="nopm">
				<dt>판매자 정보</dt>
				<c:if test="${not empty storeInfo.store_nm }">
				<dl class="nopm">
					<dt>상호명</dt>
					<dd><c:out value="${storeInfo.store_nm }"/></dd>
				</dl>
				</c:if>
				
				<c:if test="${not empty storeInfo.store_email }">
				<dl class="nopm">
					<dt>이메일</dt>
					<dd><c:out value="${storeInfo.store_email }"/></dd>
				</dl>
				</c:if>
				
				<c:if test="${not empty storeInfo.store_number }">
				<dl class="nopm">
					<dt>사업자번호</dt>
					<dd><c:out value="${storeInfo.store_number}"/></dd>
				</dl>
				</c:if>
				
				<c:if test="${not empty storeInfo.store_auth_number }">
				<dl class="nopm">
					<dt>통신판매번호</dt>
					<dd><c:out value="${storeInfo.store_auth_number}"/></dd>
				</dl>
				</c:if>
				
				<c:if test="${not empty storeInfo.store_ceo_nm }">
				<dl class="nopm">
					<dt>대표자명</dt>
					<dd><c:out value="${storeInfo.store_ceo_nm}"/></dd>
				</dl>
				</c:if>
				
				<c:if test="${not empty storeInfo.store_tel }">
				<dl class="nopm">
					<dt>대표전화</dt>
					<dd><c:out value="${storeInfo.store_tel}"/> <a href="tel:<c:out value="${storeInfo.store_tel}"/>" class="btns h24px"><span class="colorRed"><i class="fas fa-phone-square"></i></span> 전화걸기</a></dd>
				</dl>
				</c:if>
				
				<c:if test="${not empty storeInfo.store_addr_1 }">
				<dl class="nopm">
					<dt>영업소재지</dt>
					<dd><c:out value="${storeInfo.store_addr_1}"/> <c:out value="${storeInfo.store_addr_2}"/> <a href="#;" class="btns h24px fullmapbtn"><span class="colorRed"><i class="fas fa-map-marker-alt"></i></span> 지도보기</a></dd>
				</dl>
				</c:if>
			</dl>
		
			<dl class="nopm">
				<dt>전자상거래 등에서 상품제공 고시</dt>
				<dd>
					<dl class="nopm">
						<dt>국가 또는 지역명</dt>
						<dd><c:out value="${prodInfo.prod_info_1}"/></dd>
					</dl>
					<dl class="nopm">
						<dt>숙소 형태</dt>
						<dd><c:out value="${prodInfo.prod_info_2}"/></dd>
					</dl>
					<dl class="nopm">
						<dt>등급, 객실타입</dt>
						<dd><c:out value="${prodInfo.prod_info_3}"/></dd>
					</dl>
					<dl class="nopm">
						<dt>사용가능 인원, 인원 추가 시 비용</dt>
						<dd><c:out value="${prodInfo.prod_info_4}"/></dd>
					</dl>
					<dl class="nopm">
						<dt>부대시설, 제공 서비스</dt>
						<dd><c:out value="${prodInfo.prod_info_5}"/></dd>
					</dl>
					<dl class="nopm">
						<dt>취소 규정</dt>
						<dd><c:out value="${prodInfo.prod_info_6}"/></dd>
					</dl>
					<dl class="nopm">
						<dt>예약 담당 연락처</dt>
						<dd><c:out value="${prodInfo.prod_info_7}"/></dd>
					</dl>
				</dd>
			</dl>
			<c:import url="commonItemInfomationTrade.jsp"/>
		</article>
		<!-- } 관광지정보 -->
	</section>
	<!-- } 숙박 뷰페이지 -->

</c:if>

<%-- 맛집 --%>
<c:if test="${store_category eq 'CD002003' }">
	<!-- 맛집 뷰페이지 { -->
	<section id="foodView" class="productview">
		
		<c:import url="commonItemInfomation.jsp"/>

		<!-- 기본정보 { -->
		<article id="viewBasicInfo">
			<div class="subject_price">
				<h2 class="viewh2"><c:out value="${prodInfo.prod_nm }"/></h2>
				<div class="addr"><c:out value="${storeInfo.store_addr_1}"/> <c:out value="${storeInfo.store_addr_2}"/></div>
				<div class="jjimbox"><a href="#;" class="jjimbtn  <c:if test="${isProdFav eq 'Y' }">active</c:if>" onclick="<c:out value="${func_pick}"/>" ><span><i class="fal fa-plus"></i></span> 찜하기</a></div>
			</div>
		</article>
		<!-- } 기본정보 -->

		<!-- 관광지정보 { -->
		<article id="viewInfo" class="nopadding">
			<div class="marketlist bgs">
				<h2 class="mainTit nomargin"><em>업체 판매 상품</em></h2>
				<ul class="nopm floats">
					<c:forEach var="prod_store_list" items="${prod_store_list}" varStatus="status">
					<li>
						<a href="/shop/itemView.do?store_category=<c:out value="${prod_store_list.store_category}"/>&prod_category=<c:out value="${prod_store_list.prod_category}"/>&prod_id=<c:out value="${prod_store_list.prod_id}"/>" class="pic">
						<img src="/cmm/fms/getImage.do?atchFileId=<c:out value="${prod_store_list.prod_img_1}"/>&fileSn=0" style="width: 100%;" onerror="this.src='/images/baseScmtour/_noImage.png';"/>
						</a>
						<a href="/shop/itemView.do?store_category=<c:out value="${prod_store_list.store_category}"/>&prod_category=<c:out value="${prod_store_list.prod_category}"/>&prod_id=<c:out value="${prod_store_list.prod_id}"/>" class="txt">
							<span class="store">[<c:out value="${prod_store_list.store_nm}"/>]</span>
							<em class="subject"><c:out value="${prod_store_list.prod_nm}"/></em>
							<%-- <span class="price"><fmt:formatNumber value="${prod_store_list.prod_market_price}" type="number"/> <small>원 부터</small></span> --%>
						</a>
					</li>
					</c:forEach>
				</ul>
				<%--
				<div class="btnarea mgt10px">
					<a href="#;" class="btns graybtn w100">더보기 <i class="fal fa-plus"></i></a>
				</div>
				 --%>
			</div>
			
			<dl class="nopm">
				<dt>판매자 정보</dt>
				<c:if test="${not empty storeInfo.store_nm }">
				<dl class="nopm">
					<dt>상호명</dt>
					<dd><c:out value="${storeInfo.store_nm }"/></dd>
				</dl>
				</c:if>
				
				<c:if test="${not empty storeInfo.store_email }">
				<dl class="nopm">
					<dt>이메일</dt>
					<dd><c:out value="${storeInfo.store_email }"/></dd>
				</dl>
				</c:if>
				
				<c:if test="${not empty storeInfo.store_number }">
				<dl class="nopm">
					<dt>사업자번호</dt>
					<dd><c:out value="${storeInfo.store_number}"/></dd>
				</dl>
				</c:if>
				
				<c:if test="${not empty storeInfo.store_auth_number }">
				<dl class="nopm">
					<dt>통신판매번호</dt>
					<dd><c:out value="${storeInfo.store_auth_number}"/></dd>
				</dl>
				</c:if>
				
				<c:if test="${not empty storeInfo.store_ceo_nm }">
				<dl class="nopm">
					<dt>대표자명</dt>
					<dd><c:out value="${storeInfo.store_ceo_nm}"/></dd>
				</dl>
				</c:if>
				
				<c:if test="${not empty storeInfo.store_tel }">
				<dl class="nopm">
					<dt>대표전화</dt>
					<dd><c:out value="${storeInfo.store_tel}"/> <a href="tel:<c:out value="${storeInfo.store_tel}"/>" class="btns h24px"><span class="colorRed"><i class="fas fa-phone-square"></i></span> 전화걸기</a></dd>
				</dl>
				</c:if>
				
				<c:if test="${not empty storeInfo.store_addr_1 }">
				<dl class="nopm">
					<dt>영업소재지</dt>
					<dd><c:out value="${storeInfo.store_addr_1}"/> <c:out value="${storeInfo.store_addr_2}"/> <a href="#;" class="btns h24px fullmapbtn"><span class="colorRed"><i class="fas fa-map-marker-alt"></i></span> 지도보기</a></dd>
				</dl>
				</c:if>
			</dl>
		
			<dl class="nopm">
				<dt>전자상거래 등에서 상품제공 고시</dt>
				<dd>
					<dl class="nopm">
						<dt>식품의 유형</dt>
						<dd><c:out value="${prodInfo.prod_info_1}"/></dd>
					</dl>
					<dl class="nopm">
						<dt>생산자, 수입품의 경우 수입자를 함께 표기</dt>
						<dd><c:out value="${prodInfo.prod_info_2}"/></dd>
					</dl>
					<dl class="nopm">
						<dt>제조연월일, 유통기한 또는 품질유지기한</dt>
						<dd><c:out value="${prodInfo.prod_info_3}"/></dd>
					</dl>
					<dl class="nopm">
						<dt>포장단위별 용량(중량), 수량 </dt>
						<dd><c:out value="${prodInfo.prod_info_4}"/></dd>
					</dl>
					<dl class="nopm">
						<dt>원재료명 및 함량</dt>
						<dd><c:out value="${prodInfo.prod_info_5}"/></dd>
					</dl>
					<dl class="nopm">
						<dt>영양성분</dt>
						<dd><c:out value="${prodInfo.prod_info_6}"/></dd>
					</dl>
					<dl class="nopm">
						<dt>유전자재조합식품에 해당하는 경우의 표시</dt>
						<dd><c:out value="${prodInfo.prod_info_7}"/></dd>
					</dl>
					<dl class="nopm">
						<dt>영유아식 또는 체중조절식품 등에 해당하는 경우 표시광고 사전심의필</dt>
						<dd><c:out value="${prodInfo.prod_info_8}"/></dd>
					</dl>
					<dl class="nopm">
						<dt>수입식품에 해당하는 경우 식품위생법에 따른 수입신고를 필함의 문구</dt>
						<dd><c:out value="${prodInfo.prod_info_9}"/></dd>
					</dl>
					<dl class="nopm">
						<dt>소비자상담 관련 전화번호</dt>
						<dd><c:out value="${prodInfo.prod_info_10}"/></dd>
					</dl>
				</dd>
			</dl>
			<c:import url="commonItemInfomationTrade.jsp"/>
		</article>
		<!-- } 관광지정보 -->
	</section>
	<!-- } 맛집 뷰페이지 -->

</c:if>

<%-- 장터 --%>
<c:if test="${store_category eq 'CD002004' }">
	<!-- 서천장터 뷰페이지 { -->
	<section id="marketView" class="productview">
		<!-- 상단 슬라이드 이미지 { -->
		<c:import url="commonItemInfomation.jsp"/>

		<!-- 기본정보 { -->
		<article id="viewBasicInfo">
			<div class="subject_price">
				<h2 class="viewh2"><c:out value="${prodInfo.prod_nm }"/></h2>
				<div class="pricebox"><strong class="colorOrange"><fmt:formatNumber value="${prodInfo.prod_price}" type="number"/></strong> <small>원</small></div>
				<div class="delivery">
					배송비 : <fmt:formatNumber value="${storeInfo.store_market_default_delivery_price}" type="number"/>원 
					(<c:if test="${storeInfo.store_market_jeju_delivery_price > 0}">
					제주: <fmt:formatNumber value="${storeInfo.store_market_jeju_delivery_price}" type="number"/>원
					</c:if>)
					<br>무료배송: <fmt:formatNumber value="${storeInfo.store_market_free_delivery_price}" type="number"/>원 이상
				</div>
				<div class="jjimbox"><a href="#;" class="jjimbtn  <c:if test="${isProdFav eq 'Y' }">active</c:if>" onclick="<c:out value="${func_pick}"/>" ><span><i class="fal fa-plus"></i></span> 찜하기</a></div>
			</div>
		</article>
		<!-- } 기본정보 -->

		<!-- 관광지정보 { -->
		<article id="viewInfo" class="nopadding">
			<div class="marketlist bgs">
				<h2 class="mainTit nomargin"><em>업체 판매 상품</em></h2>
				<ul class="nopm floats">
					<c:forEach var="prod_store_list" items="${prod_store_list}" varStatus="status">
					<li>
						<a href="/shop/itemView.do?store_category=<c:out value="${prod_store_list.store_category}"/>&prod_category=<c:out value="${prod_store_list.prod_category}"/>&prod_id=<c:out value="${prod_store_list.prod_id}"/>" class="pic">
						<img src="/cmm/fms/getImage.do?atchFileId=<c:out value="${prod_store_list.prod_img_1}"/>&fileSn=0" style="width: 100%;" onerror="this.src='/images/baseScmtour/_noImage.png';"/>
						</a>
						<a href="/shop/itemView.do?store_category=<c:out value="${prod_store_list.store_category}"/>&prod_category=<c:out value="${prod_store_list.prod_category}"/>&prod_id=<c:out value="${prod_store_list.prod_id}"/>" class="txt">
							<span class="store">[<c:out value="${prod_store_list.store_nm}"/>]</span>
							<em class="subject"><c:out value="${prod_store_list.prod_nm}"/></em>
							<span class="price"><fmt:formatNumber value="${prod_store_list.prod_price}" type="number"/> <small>원</small></span>
						</a>
					</li>
					</c:forEach>
				</ul>
				<%--
				<div class="btnarea mgt10px">
					<a href="#;" class="btns graybtn w100">더보기 <i class="fal fa-plus"></i></a>
				</div>
				 --%>
			</div>
			
			<dl class="nopm">
				<dt>판매자 정보</dt>
				<c:if test="${not empty storeInfo.store_nm }">
				<dl class="nopm">
					<dt>상호명</dt>
					<dd><c:out value="${storeInfo.store_nm }"/></dd>
				</dl>
				</c:if>
				
				<c:if test="${not empty storeInfo.store_email }">
				<dl class="nopm">
					<dt>이메일</dt>
					<dd><c:out value="${storeInfo.store_email }"/></dd>
				</dl>
				</c:if>
				
				<c:if test="${not empty storeInfo.store_number }">
				<dl class="nopm">
					<dt>사업자번호</dt>
					<dd><c:out value="${storeInfo.store_number}"/></dd>
				</dl>
				</c:if>
				
				<c:if test="${not empty storeInfo.store_auth_number }">
				<dl class="nopm">
					<dt>통신판매번호</dt>
					<dd><c:out value="${storeInfo.store_auth_number}"/></dd>
				</dl>
				</c:if>
				
				<c:if test="${not empty storeInfo.store_ceo_nm }">
				<dl class="nopm">
					<dt>대표자명</dt>
					<dd><c:out value="${storeInfo.store_ceo_nm}"/></dd>
				</dl>
				</c:if>
				
				<c:if test="${not empty storeInfo.store_tel }">
				<dl class="nopm">
					<dt>대표전화</dt>
					<dd><c:out value="${storeInfo.store_tel}"/> <a href="tel:<c:out value="${storeInfo.store_tel}"/>" class="btns h24px"><span class="colorRed"><i class="fas fa-phone-square"></i></span> 전화걸기</a></dd>
				</dl>
				</c:if>
				
				<c:if test="${not empty storeInfo.store_addr_1 }">
				<dl class="nopm">
					<dt>영업소재지</dt>
					<dd><c:out value="${storeInfo.store_addr_1}"/> <c:out value="${storeInfo.store_addr_2}"/> <a href="#;" class="btns h24px fullmapbtn"><span class="colorRed"><i class="fas fa-map-marker-alt"></i></span> 지도보기</a></dd>
				</dl>
				</c:if>
			</dl>
			
			
		</article>
		<!-- } 관광지정보 -->
	</section>
	<!-- } 서천장터 뷰페이지 -->

</c:if>

<%-- 추천여행 --%>
<c:if test="${store_category eq 'CD002005' }">
</c:if>
		
<c:if test="${store_category eq 'CD002004' }">
<input type="hidden" id="store_category" name="store_category" value="<c:out value="${store_category }"/>" />
<input type="hidden" id="prod_category" name="prod_category" value="<c:out value="${prod_category }"/>" />
<input type="hidden" id="prod_id" name="prod_id" value="<c:out value="${prod_id }"/>" />
<input type="hidden" id="prod_price" name="prod_price" value="0" />
<input type="hidden" id="def_delivery_price" name="opt_cnt" value="<c:out value="${storeInfo.store_market_default_delivery_price }"/>" />
<input type="hidden" id="free_delivery_price" name="opt_cnt" value="<c:out value="${storeInfo.store_market_free_delivery_price }"/>" />
<input type="hidden" id="jeju_delivery_price" name="opt_cnt" value="<c:out value="${storeInfo.store_market_jeju_delivery_price }"/>" />

<input type="hidden" id="opt_seq" name="opt_seq" value="" />
<input type="hidden" id="opt_nm" name="opt_nm" value="" />
<input type="hidden" id="opt_price" name="opt_price" value="" />
<input type="hidden" id="opt_cnt" name="opt_cnt" value="" />
<input type="hidden" id="opt_total_sum_price" name="opt_total_sum_price" value="0" />	
<c:import url="commonNav.jsp"/>
</c:if>
<c:import url="commonItemModal.jsp"/>		
<c:import url="/Api/IncludeBottom.do?lat=${storeInfo.store_lat}&lng=${storeInfo.store_lng }&store_nm=${storeInfo.store_nm }"/>

<!-- 상세페이지 지도보기 { -->
<div id="festFullMap">
	<h1 class="bgOrangeGra">
		<em><c:out value="${storeInfo.store_nm}"/> 주변</em>
		<a href="#;" class="fullmapbtn"><i class="fal fa-times"></i></a>
	</h1>
	<div class="maparea" id="maparea" >
	</div>
</div>
<!-- } 상세페이지 지도보기 -->
<script>
$(document).ready(function() {
	$("a.fullmapbtn").click(function() {
		if ($('#festFullMap').css('display') == "none") {
			$("#festFullMap").addClass('open');
			createkakaomap("<c:out value="${storeInfo.store_lat}"/>","<c:out value="${storeInfo.store_lng}"/>")
		} else {
			$("#festFullMap").removeClass('open');
		}
	});
});
</script>

