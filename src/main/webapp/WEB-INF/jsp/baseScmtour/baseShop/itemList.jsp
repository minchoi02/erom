<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<% 
pageContext.setAttribute("CR", "\r"); 
pageContext.setAttribute("LF", "\n"); 
pageContext.setAttribute("CRLF", "\r\n"); 
pageContext.setAttribute("BR", "<br/>");
%>

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
	<!-- 관광/체험 리스트 { -->
	<section id="travelList">
		<article id="travelListTop" class="product_top_con">
			<div class="ptcheader">
				<div class="backarea"><a href="javascript:history.back();" class="backbtn"><i class="fal fa-arrow-left"></i><span class="sound_only">뒤로가기</span></a></div>
				<h2><em>관광/체험</em></h2>
			</div>
			<div class="main-product bestslide swiper-container">
                <ul class="nopm swiper-wrapper">
                	<c:set var="bestno" value="1"/>
                	<c:forEach var="bestProdList" items="${bestProdList}" varStatus="status">
                    <li class="swiper-slide">
                        <a href="/shop/itemView.do?store_category=<c:out value="${bestProdList.store_category}"/>&prod_id=<c:out value="${bestProdList.prod_id}"/>" class="pic">
                            <img src="/cmm/fms/getImage.do?atchFileId=<c:out value="${bestProdList.prod_img_1}"/>&fileSn=0" style="width: 100%;" onerror="this.src='/images/baseScmtour/noimg_615.png';" />
                            <span class="bgOrangeGra bestico">BEST<strong><c:out value="${bestno}"/></strong></span>
                        </a>
                        <a href="/shop/itemView.do?store_category=<c:out value="${bestProdList.store_category}"/>&prod_id=<c:out value="${bestProdList.prod_id}"/>" class="txt">
                            <em class="subject"><c:out value="${bestProdList.prod_nm }"/></em>
                            <span class="loca"><c:out value="${bestProdList.store_nm }"/></span>
                            <span class="goodnum"><b class="colorOrange"><i class="fas fa-heart"></i></b> <fmt:formatNumber value="${bestProdList.prod_hit_cnt}" type="number"/></span>
                        </a>
                    </li>
                    <c:set var="bestno" value="${bestno+1 }"/>
					</c:forEach>
	            </ul>
				<div class="swiper-pagination"></div>
                <script>
                    // 메인 슬라이드
                    var swiper3 = new Swiper('.bestslide', {
						slidesPerView: 'auto',
						spaceBetween: 10,
						pagination: {
							el: '.swiper-pagination',
						},
                    });
                </script>
            </div>
		</article>
		<article id="travelListCon" class="productlist">
			<div class="filter">
				<a href="/shop/itemList.do?store_category=<c:out value="${store_category}"/>&prod_category=<c:out value="${prod_category}"/>&orderby=Recom" <c:if test="${orderby eq 'Recom'}">class="active"</c:if> >추천순</a>
				<a href="/shop/itemList.do?store_category=<c:out value="${store_category}"/>&prod_category=<c:out value="${prod_category}"/>&orderby=Review" <c:if test="${orderby eq 'Review'}">class="active"</c:if> >리뷰순</a>
				<a href="/shop/itemList.do?store_category=<c:out value="${store_category}"/>&prod_category=<c:out value="${prod_category}"/>&orderby=Sale" <c:if test="${orderby eq 'Sale'}">class="active"</c:if> >판매순</a>
				<a href="/shop/itemList.do?store_category=<c:out value="${store_category}"/>&prod_category=<c:out value="${prod_category}"/>&orderby=Date" <c:if test="${orderby eq 'Date'}">class="active"</c:if> >최신순</a>
			</div>
			<div class="trf_list" id="siteprodList">
				
			</div>
		</article>
	</section>
	<!-- } 관광/체험 리스트 -->
</c:if>


<%-- 숙박 --%>
<c:if test="${store_category eq 'CD002002' }">
	<!-- 숙박 리스트 { -->
	<section id="roomList">
		<article id="roomListTop" class="product_top_con">
			<div class="ptcheader">
				<div class="backarea"><a href="javascript:history.back();" class="backbtn"><i class="fal fa-arrow-left"></i><span class="sound_only">뒤로가기</span></a></div>
				<h2><em>숙박</em></h2>
			</div>
			<div class="main-product bestslide swiper-container">
				 <ul class="nopm swiper-wrapper">
	                <c:set var="bestno" value="1"/>
	               	<c:forEach var="bestProdList" items="${bestProdList}" varStatus="status">
	                   <li class="swiper-slide">
	                       <a href="/shop/itemView.do?store_category=<c:out value="${bestProdList.store_category}"/>&prod_id=<c:out value="${bestProdList.prod_id}"/>" class="pic">
	                           <img src="/cmm/fms/getImage.do?atchFileId=<c:out value="${bestProdList.prod_img_1}"/>&fileSn=0" style="width: 100%;" onerror="this.src='/images/baseScmtour/noimg_615.png';" />
	                           <span class="bgOrangeGra bestico">BEST<strong><c:out value="${bestno}"/></strong></span>
	                       </a>
	                       <a href="/shop/itemView.do?store_category=<c:out value="${bestProdList.store_category}"/>&prod_id=<c:out value="${bestProdList.prod_id}"/>" class="txt">
	                           <em class="subject"><c:out value="${bestProdList.prod_nm }"/></em>
	                           <span class="loca"><c:out value="${bestProdList.store_nm }"/></span>
	                           <span class="goodnum"><b class="colorOrange"><i class="fas fa-heart"></i></b> <fmt:formatNumber value="${bestProdList.prod_hit_cnt}" type="number"/></span>
	                       </a>
	                   </li>
	                   <c:set var="bestno" value="${bestno+1 }"/>
					</c:forEach>
				</ul>
				<div class="swiper-pagination"></div>
                <script>
                    // 메인 슬라이드
                    var swiper3 = new Swiper('.bestslide', {
						slidesPerView: 'auto',
						spaceBetween: 10,
						pagination: {
							el: '.swiper-pagination',
						},
                    });
                </script>
            </div>
		</article>
		<article id="roomListCon" class="productlist">
			<div class="filter">
				<a href="/shop/itemList.do?store_category=<c:out value="${store_category}"/>&prod_category=<c:out value="${prod_category}"/>&orderby=Recom" <c:if test="${orderby eq 'Recom'}">class="active"</c:if> >추천순</a>
				<a href="/shop/itemList.do?store_category=<c:out value="${store_category}"/>&prod_category=<c:out value="${prod_category}"/>&orderby=Review" <c:if test="${orderby eq 'Review'}">class="active"</c:if> >리뷰순</a>
				<a href="/shop/itemList.do?store_category=<c:out value="${store_category}"/>&prod_category=<c:out value="${prod_category}"/>&orderby=Sale" <c:if test="${orderby eq 'Sale'}">class="active"</c:if> >판매순</a>
				<a href="/shop/itemList.do?store_category=<c:out value="${store_category}"/>&prod_category=<c:out value="${prod_category}"/>&orderby=Date" <c:if test="${orderby eq 'Date'}">class="active"</c:if> >최신순</a>
			</div>
			<div class="trf_list" id="siteprodList">
				
			</div>
		</article>
	</section>
	<!-- } 숙박 리스트 -->

</c:if>


<%-- 맛집 --%>
<c:if test="${store_category eq 'CD002003' }">
	<!-- 맛집 리스트 { -->
	<section id="foodList">
		<article id="foodListTop" class="product_top_con">
			<div class="ptcheader">
				<div class="backarea"><a href="javascript:history.back();" class="backbtn"><i class="fal fa-arrow-left"></i><span class="sound_only">뒤로가기</span></a></div>
				<h2><em>맛집</em></h2>
			</div>
			<div class="main-product bestslide swiper-container">
                <ul class="nopm swiper-wrapper">
                	<c:set var="bestno" value="1"/>
                	<c:forEach var="bestProdList" items="${bestProdList}" varStatus="status">
                    <li class="swiper-slide">
                        <a href="/shop/itemView.do?store_category=<c:out value="${bestProdList.store_category}"/>&prod_id=<c:out value="${bestProdList.prod_id}"/>" class="pic">
                            <img src="/cmm/fms/getImage.do?atchFileId=<c:out value="${bestProdList.prod_img_1}"/>&fileSn=0" style="width: 100%;" onerror="this.src='/images/baseScmtour/noimg_615.png';" />
                            <span class="bgOrangeGra bestico">BEST<strong><c:out value="${bestno}"/></strong></span>
                        </a>
                        <a href="/shop/itemView.do?store_category=<c:out value="${bestProdList.store_category}"/>&prod_id=<c:out value="${bestProdList.prod_id}"/>" class="txt">
                            <em class="subject"><c:out value="${bestProdList.prod_nm }"/></em>
                            <span class="loca"><c:out value="${bestProdList.store_nm }"/></span>
                            <span class="goodnum"><b class="colorOrange"><i class="fas fa-heart"></i></b> <fmt:formatNumber value="${bestProdList.prod_hit_cnt}" type="number"/></span>
                        </a>
                    </li>
                    <c:set var="bestno" value="${bestno+1 }"/>
					</c:forEach>
	            </ul>
				<div class="swiper-pagination"></div>
                <script>
                    // 메인 슬라이드
                    var swiper3 = new Swiper('.bestslide', {
						slidesPerView: 'auto',
						spaceBetween: 10,
						pagination: {
							el: '.swiper-pagination',
						},
                    });
                </script>
            </div>
		</article>
		<article id="foodListCon" class="productlist">
			<div class="filter">
				<a href="/shop/itemList.do?store_category=<c:out value="${store_category}"/>&prod_category=<c:out value="${prod_category}"/>&orderby=Recom" <c:if test="${orderby eq 'Recom'}">class="active"</c:if> >추천순</a>
				<a href="/shop/itemList.do?store_category=<c:out value="${store_category}"/>&prod_category=<c:out value="${prod_category}"/>&orderby=Review" <c:if test="${orderby eq 'Review'}">class="active"</c:if> >리뷰순</a>
				<a href="/shop/itemList.do?store_category=<c:out value="${store_category}"/>&prod_category=<c:out value="${prod_category}"/>&orderby=Sale" <c:if test="${orderby eq 'Sale'}">class="active"</c:if> >판매순</a>
				<a href="/shop/itemList.do?store_category=<c:out value="${store_category}"/>&prod_category=<c:out value="${prod_category}"/>&orderby=Date" <c:if test="${orderby eq 'Date'}">class="active"</c:if> >최신순</a>
			</div>
			<div class="trf_list" id="siteprodList">
				
			</div>
		</article>
	</section>
	<!-- } 맛집 리스트 -->

</c:if>

<%-- 장터 --%>
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

	<!-- 서천장터 리스트 { -->
		<article id="marketBest" class="product_top_con">
			<div class="ptcheader">
				<div class="backarea"><a href="javascript:history.back();" class="backbtn"><i class="fal fa-arrow-left"></i><span class="sound_only">뒤로가기</span></a></div>
				<h2><em>서천장터</em></h2>
			</div>
			<div class="marketlist bestslide swiper-container">
				<ul class="nopm swiper-wrapper">
					<c:set var="bestno" value="1"/>
	               	<c:forEach var="bestProdList" items="${bestProdList}" varStatus="status">
	                   <li class="swiper-slide" >
						<a href="/shop/itemView.do?store_category=<c:out value="${bestProdList.store_category}"/>&prod_category=<c:out value="${bestProdList.prod_category}"/>&prod_id=<c:out value="${bestProdList.prod_id}"/>" class="pic">
							<img src="/cmm/fms/getImage.do?atchFileId=<c:out value="${bestProdList.prod_img_1}"/>&fileSn=0" style="width: 100%;" onerror="this.src='/images/baseScmtour/noimg_615.png';" />
							<span class="bgOrangeGra bestico">BEST<strong><c:out value="${bestno}"/></strong></span>
						</a>
						<a href="#;" class="txt">
							<span class="store">[<c:out value="${bestProdList.store_nm}"/>]</span>
							<em class="subject"><c:out value="${bestProdList.prod_nm}"/></em>
							<span class="price"><fmt:formatNumber value="${bestProdList.prod_price}" type="number"/> <small>원</small></span>
						</a>
					</li>
	                   <c:set var="bestno" value="${bestno+1 }"/>
					</c:forEach>
				</ul>
				<div class="swiper-pagination"></div>
				<script>
					// 메인 슬라이드
					var swiper2 = new Swiper('.bestslide', {
						slidesPerView: 'auto',
						spaceBetween: 10,
						pagination: {
							el: '.swiper-pagination',
						},
					});
				</script>
			</div>
		</article>
		<article id="marketListCon" class="productlist">
			<div class="marketmnu">
				<ul class="nopm floats">
					<li><a href="/shop/itemList.do?store_category=<c:out value="${store_category}"/>" <c:if test="${empty prod_category }">class="active"</c:if> ><em><img src="/images/baseScmtour/market_mnu_ico1.png" alt="" /></em><span>전체</span></a></li>
					<li><a href="/shop/itemList.do?store_category=<c:out value="${store_category}"/>&prod_category=CD005001"  <c:if test="${prod_category eq 'CD005001'}">class="active"</c:if> ><em><img src="/images/baseScmtour/market_mnu_ico2.png" alt="" /></em><span><c:out value="${prod_category_1.base_cd_nm }"/></span></a></li>
					<li><a href="/shop/itemList.do?store_category=<c:out value="${store_category}"/>&prod_category=CD005002"  <c:if test="${prod_category eq 'CD005002'}">class="active"</c:if> ><em><img src="/images/baseScmtour/market_mnu_ico3.png" alt="" /></em><span><c:out value="${prod_category_2.base_cd_nm }"/></span></a></li>
					<li><a href="/shop/itemList.do?store_category=<c:out value="${store_category}"/>&prod_category=CD005003"  <c:if test="${prod_category eq 'CD005003'}">class="active"</c:if> ><em><img src="/images/baseScmtour/market_mnu_ico4.png" alt="" /></em><span><c:out value="${prod_category_3.base_cd_nm }"/></span></a></li>
					<li><a href="/shop/itemList.do?store_category=<c:out value="${store_category}"/>&prod_category=CD005004"  <c:if test="${prod_category eq 'CD005004'}">class="active"</c:if> ><em><img src="/images/baseScmtour/market_mnu_ico5.png" alt="" /></em><span><c:out value="${prod_category_4.base_cd_nm }"/></span></a></li>
					<li><a href="/shop/itemList.do?store_category=<c:out value="${store_category}"/>&prod_category=CD005005"  <c:if test="${prod_category eq 'CD005005'}">class="active"</c:if> ><em><img src="/images/baseScmtour/market_mnu_ico6.png" alt="" /></em><span><c:out value="${prod_category_5.base_cd_nm }"/></span></a></li>
				</ul>
			</div>
			<div class="filter">
				<a href="/shop/itemList.do?store_category=<c:out value="${store_category}"/>&prod_category=<c:out value="${prod_category}"/>&orderby=Recom" <c:if test="${orderby eq 'Recom'}">class="active"</c:if> >추천순</a>
				<a href="/shop/itemList.do?store_category=<c:out value="${store_category}"/>&prod_category=<c:out value="${prod_category}"/>&orderby=Review" <c:if test="${orderby eq 'Review'}">class="active"</c:if> >리뷰순</a>
				<a href="/shop/itemList.do?store_category=<c:out value="${store_category}"/>&prod_category=<c:out value="${prod_category}"/>&orderby=Sale" <c:if test="${orderby eq 'Sale'}">class="active"</c:if> >판매순</a>
				<a href="/shop/itemList.do?store_category=<c:out value="${store_category}"/>&prod_category=<c:out value="${prod_category}"/>&orderby=Date" <c:if test="${orderby eq 'Date'}">class="active"</c:if> >최신순</a>
			</div>
			<%--Ajax 리스트 호출 --%>
			<div class="marketlist bgs" id="siteprodList">
				
			</div>
		</article>
	</section>
	<!-- } 서천장터 리스트 -->
</c:if>

<%-- 추천여행 --%>
<c:if test="${store_category eq 'CD002005' }">
<!-- 추천여행상품 리스트 { -->
	<section id="recommendtList">
		<article id="recommendListTop" class="product_top_con">
			<div class="ptcheader">
				<div class="backarea"><a href="javascript:history.back();" class="backbtn"><i class="fal fa-arrow-left"></i><span class="sound_only">뒤로가기</span></a></div>
				<h2><em>추천여행상품</em> <span class="totalnum">(총 <b><fmt:formatNumber value="${TotalCnt}" type="number"/></b>개 코스)</span></h2>
			</div>
			<div class="recommendbest">
				<div class="recommendsort">
					<ul class="nopm floats">
						<li>
							<select id="prod_age" name="prod_age" class="basic_select" onchange="goRecomList('age', this.value)">
								<option value="">연령</option>
								<option value="age10">10대</option>
								<option value="age20">20대</option>
								<option value="age30">30대</option>
								<option value="age40">40대</option>
								<option value="age50">50대</option>
								<option value="age60">60대 이상</option>
							</select>
						</li>
						<li>
							<select id="prod_season" name="prod_season" class="basic_select" onchange="goRecomList('season', this.value)">
								<option value="">계절</option>
								<option value="spring">봄</option>
								<option value="summer">여름</option>
								<option value="fall">가을</option>
								<option value="winter">겨울</option>
							</select>
						</li>
						<li>
							<select id="prod_travel_type" name="prod_travel_type" class="basic_select" onchange="goRecomList('travel_type', this.value)">
								<option value="">여행유형</option>
								<option value="single">혼자</option>
								<option value="lover">연인</option>
								<option value="friend">친구</option>
								<option value="child">아이</option>
								<option value="parent">부모님</option>
							</select>
						</li>
					</ul>
				</div>
				<div class="recommendlist bestslide swiper-container">
					<ul class="nopm swiper-wrapper" id="siteprodList">
						<c:forEach var="bestProdList" items="${bestProdList}" varStatus="status">
							<script>
							var img_arr = new Array();
							</script>
							<c:set var="cnt" value="1"/>
							<c:set var="recom_start" value=""/>
							<c:set var="recom_end" value=""/>
							<c:set var="recom_start_img" value=""/>
							<c:set var="recom_end_img" value=""/>
							<c:set var="recom_middle_img" value=""/>
							<c:set var="recom_cnt" value="0"/>
							 <c:if test="${bestProdList.recom_1_use_st eq 'Y' }">
							 	<c:set var="recom_start" value="${bestProdList.recom_1_prod_nm }"/>
							 	<c:set var="recom_end" value="${bestProdList.recom_1_prod_nm }"/>
						 	 	<c:set var="recom_start_img" value="${bestProdList.recom_1_img }"/>
							 	<c:set var="recom_end_img" value="${bestProdList.recom_1_img}"/>
							 	<c:set var="recom_cnt" value="${recom_cnt+1}"/>
							 	<script>img_arr.push('<c:out value="${bestProdList.recom_1_img }"/>')</script>
							 </c:if>
							 <c:if test="${bestProdList.recom_2_use_st eq 'Y' }">
							 	 <c:if test="${empty recom_start }">
							 	 	<c:set var="recom_start" value="${bestProdList.recom_2_prod_nm }"/>
							 	 	<c:set var="recom_start_img" value="${bestProdList.recom_2_img }"/>
							 	 </c:if>
							 	<c:set var="recom_end" value="${bestProdList.recom_2_prod_nm }"/>
							 	<c:set var="recom_end_img" value="${bestProdList.recom_2_img}"/>
							 	<c:set var="recom_cnt" value="${recom_cnt+1}"/>
							 	<script>img_arr.push('<c:out value="${bestProdList.recom_2_img }"/>')</script>
							 </c:if>
							 <c:if test="${bestProdList.recom_3_use_st eq 'Y' }">
							 	 <c:if test="${empty recom_start }">
							 	 	<c:set var="recom_start" value="${bestProdList.recom_3_prod_nm }"/>
							 	 	<c:set var="recom_start_img" value="${bestProdList.recom_3_img }"/>
							 	 </c:if>
							 	<c:set var="recom_end" value="${bestProdList.recom_3_prod_nm }"/>
							 	<c:set var="recom_end_img" value="${bestProdList.recom_3_img}"/>
							 	<c:set var="recom_cnt" value="${recom_cnt+1}"/>
							 	<script>img_arr.push('<c:out value="${bestProdList.recom_3_img }"/>')</script>
							 </c:if>
							 <c:if test="${bestProdList.recom_4_use_st eq 'Y' }">
							 	 <c:if test="${empty recom_start }">
							 	 	<c:set var="recom_start" value="${bestProdList.recom_4_prod_nm }"/>
							 	 	<c:set var="recom_start_img" value="${bestProdList.recom_4_img }"/>
							 	 </c:if>
							 	<c:set var="recom_end" value="${bestProdList.recom_4_prod_nm }"/>
							 	<c:set var="recom_cnt" value="${recom_cnt+1}"/>
							 	<script>img_arr.push('<c:out value="${bestProdList.recom_4_img }"/>')</script>
							 </c:if>
							 <c:if test="${bestProdList.recom_5_use_st eq 'Y' }">
							 	 <c:if test="${empty recom_start }">
							 	 	<c:set var="recom_start" value="${bestProdList.recom_5_prod_nm }"/>
							 	 	<c:set var="recom_start_img" value="${bestProdList.recom_5_img }"/>
							 	 </c:if>
							 	<c:set var="recom_end" value="${bestProdList.recom_5_prod_nm }"/>
							 	<c:set var="recom_end_img" value="${bestProdList.recom_5_img}"/>
							 	<c:set var="recom_cnt" value="${recom_cnt+1}"/>
							 	<script>img_arr.push('<c:out value="${bestProdList.recom_5_img }"/>')</script>
							 </c:if>
							 <c:if test="${bestProdList.recom_6_use_st eq 'Y' }">
							 	 <c:if test="${empty recom_start }">
							 	 	<c:set var="recom_start" value="${bestProdList.recom_6_prod_nm }"/>
							 	 	<c:set var="recom_start_img" value="${bestProdList.recom_6_img }"/>
							 	 </c:if>
							 	<c:set var="recom_end" value="${bestProdList.recom_6_prod_nm }"/>
							 	<c:set var="recom_end_img" value="${bestProdList.recom_6_img}"/>
							 	<c:set var="recom_cnt" value="${recom_cnt+1}"/>
							 	<script>img_arr.push('<c:out value="${bestProdList.recom_6_img }"/>')</script>
							 </c:if>
							 <c:if test="${bestProdList.recom_7_use_st eq 'Y' }">
							 	 <c:if test="${empty recom_start }">
							 	 	<c:set var="recom_start" value="${bestProdList.recom_7_prod_nm }"/>
							 	 	<c:set var="recom_start_img" value="${bestProdList.recom_7_img }"/>
							 	 </c:if>
							 	<c:set var="recom_end" value="${bestProdList.recom_7_prod_nm }"/>
							 	<c:set var="recom_end_img" value="${bestProdList.recom_7_img}"/>
							 	<c:set var="recom_cnt" value="${recom_cnt+1}"/>
							 	<script>img_arr.push('<c:out value="${bestProdList.recom_7_img }"/>')</script>
							 </c:if>
							 <c:if test="${bestProdList.recom_8_use_st eq 'Y' }">
							 	 <c:if test="${empty recom_start }">
							 	 	<c:set var="recom_start" value="${bestProdList.recom_8_prod_nm }"/>
							 	 	<c:set var="recom_start_img" value="${bestProdList.recom_8_img }"/>
							 	 </c:if>
							 	<c:set var="recom_end" value="${bestProdList.recom_8_prod_nm }"/>
							 	<c:set var="recom_end_img" value="${bestProdList.recom_8_img}"/>
							 	<c:set var="recom_cnt" value="${recom_cnt+1}"/>
							 	<script>img_arr.push('<c:out value="${bestProdList.recom_8_img }"/>')</script>
							 </c:if>
							 <c:if test="${bestProdList.recom_9_use_st eq 'Y' }">
							 	 <c:if test="${empty recom_start }">
							 	 	<c:set var="recom_start" value="${bestProdList.recom_9_prod_nm }"/>
							 	 	<c:set var="recom_start_img" value="${bestProdList.recom_9_img }"/>
							 	 </c:if>
							 	<c:set var="recom_end" value="${bestProdList.recom_9_prod_nm }"/>
							 	<c:set var="recom_end_img" value="${bestProdList.recom_9_img}"/>
							 	<c:set var="recom_cnt" value="${recom_cnt+1}"/>
							 	<script>img_arr.push('<c:out value="${bestProdList.recom_9_img }"/>')</script>
							 </c:if>
							 <c:if test="${bestProdList.recom_10_use_st eq 'Y' }">
							 	 <c:if test="${empty recom_start }">
							 	 	<c:set var="recom_start" value="${bestProdList.recom_10_prod_nm }"/>
							 	 	<c:set var="recom_start_img" value="${bestProdList.recom_10_img }"/>
							 	 </c:if>
							 	<c:set var="recom_end" value="${bestProdList.recom_10_prod_nm }"/>
							 	<c:set var="recom_end_img" value="${bestProdList.recom_10_img}"/>
							 	<c:set var="recom_cnt" value="${recom_cnt+1}"/>
							 	<script>img_arr.push('<c:out value="${bestProdList.recom_10_img }"/>')</script>
							 </c:if>
							<li class="swiper-slide">
								<a href="/shop/itemView.do?store_category=CD002005&prod_id=<c:out value="${bestProdList.prod_id }"/>">
									<strong class="tit"><c:out value="${bestProdList.prod_nm }"/></strong>
									<span class="subtxt"><c:out value="${bestProdList.prod_comment}"/></span>
									<em class="tourgraph">
										<span class="won wonleft"><c:out value="${recom_start }"/></span>
										<span class="toursize">경유 <c:out value="${recom_cnt-2}"/>+</span>
										<span class="won wonright"><c:out value="${recom_end}"/></span>
									</em>
								</a>
								<ul class="nopm floats rpic rpic3">
									<li><a href="/shop/itemView.do?store_category=CD002005&prod_id=<c:out value="${bestProdList.prod_id }"/>"><img src="/cmm/fms/getImage.do?atchFileId=<c:out value="${recom_start_img}"/>&fileSn=0" style="width: 100%;" onerror="this.src='/images/baseScmtour/_noImage.png';"/></a></li>
									<li><a href="/shop/itemView.do?store_category=CD002005&prod_id=<c:out value="${bestProdList.prod_id }"/>" id="middle_best_img_<c:out value="${bestProdList.prod_id }"/>_<c:out value="${cnt}"/>"></a></li>
									<li><a href="/shop/itemView.do?store_category=CD002005&prod_id=<c:out value="${bestProdList.prod_id }"/>"><img src="/cmm/fms/getImage.do?atchFileId=<c:out value="${recom_end_img}"/>&fileSn=0" style="width: 100%;" onerror="this.src='/images/baseScmtour/_noImage.png';"/></a></a></li>
								</ul>
								<script>
								var rand_start_num = 1;
								var rand_end_num = img_arr.length-2;
								var rand_num = Math.floor(Math.random()*rand_end_num) + rand_start_num;
								console.log(rand_num);
								var middle_img_tag = "<img src=\"/cmm/fms/getImage.do?atchFileId="+img_arr[rand_num]+"&fileSn=0\" onerror=\"this.src='/images/baseScmtour/_noImage.png';\"/>";
								$("#middle_best_img_<c:out value="${bestProdList.prod_id }"/>_<c:out value="${cnt}"/>").html(middle_img_tag);
								</script>
							</li>
							<c:set var="cnt" value="${cnt +1 }"/>
						</c:forEach>
					</ul>
					<div class="swiper-pagination"></div>
					<script>
						// 메인 슬라이드
						var swiper = new Swiper('.bestslide', {
							centeredSlides: true,
							slidesPerView: 'auto',
							spaceBetween: 10,
							pagination: {
								el: '.swiper-pagination',
							},
						});
					</script>
				</div>
			</div>
		</article>
		<article id="recommendListCon" class="recommendlist bgs" >
			
		</article>
	</section>
	<!-- } 추천여행상품 리스트 -->
</c:if>

<input type="hidden" id="pageNum" value="0" />
<input type="hidden" id="pagePerCnt" value="10" />
<input type="hidden" id="store_category" value="<c:out value="${store_category }"/>" />
<input type="hidden" id="prod_category" value="<c:out value="${prod_category }"/>" />
<input type="hidden" id="orderby" value="<c:out value="${orderby }"/>" />
<input type="hidden" id="hidden_prod_age" value="" />
<input type="hidden" id="hidden_prod_season" value="" />
<input type="hidden" id="hidden_prod_travel_type" value="" />
<script>
getItemList();
</script>

<c:import url="/Api/IncludeBottom.do"/>