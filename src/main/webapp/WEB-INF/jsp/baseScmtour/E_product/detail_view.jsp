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

<% 
response.setHeader("pragma", "no-cache");              
response.setHeader("Cache-control", "no-cache, no-store, must-revalidate");             
response.setHeader("Expires", "0"); 

// url을 읽어와서 파일을 추출한다.
String fullUrl = request.getServletPath();
String checkUrl = fullUrl.replace("/WEB-INF/jsp/baseScmtour/","");
String[] url_arr = checkUrl.split("/");
String this_uri = url_arr[0].replace(".jsp","");
String left_uri = "";
if(url_arr.length > 1) { //서브디렉토리일때..  왼쪽 메뉴를 잡는다.
	left_uri = url_arr[1].replace(".jsp","");
}
%>
<c:set var="OrgFullUrl" value="<%= request.getRequestURL() %>" />
<c:set var="this_url" value="<%=this_uri%>" />
<c:set var="left_uri" value="<%=left_uri%>" />
<c:set var="prod_category_uri" value=""/>

<c:if test="${not empty prod_category }">
	<c:set var="prod_category_uri" value="&prod_category=${prod_category}" />
</c:if>

<c:set var="infoName" value="판매자상품" />
	
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
	
	
	<!-- 컨테이너 -->
    <div id="container">
        
        <!-- 상품리스트 -->
        <div class="product-view">
            <div class="inner clearfix">
                <div class="prd-info">
                	<div class="prd-info-left">
                <article id="viewSlide" class="swiper-container">
                	<ul class="nopm swiper-wrapper">
                <%-- <c:if test="${not empty prodInfo.prod_img_1 }">
				<li class="swiper-slide"><img src="/cmm/fms/getImage.do?atchFileId=<c:out value="${prodInfo.prod_img_1}"/>&fileSn=0" style="width: 100%;" onerror="this.src='/images/baseScmtour/_noImage.png';"/></li>
				</c:if> --%>
				<c:if test="${not empty prodInfo.prod_img_2 }">
				<li class="swiper-slide"><img src="/cmm/fms/getImage.do?atchFileId=<c:out value="${prodInfo.prod_img_2}"/>&fileSn=0" style="width: 100%;" onerror="this.src='/images/baseScmtour/_noImage.png';"/></li>
				</c:if>
				<c:if test="${not empty prodInfo.prod_img_3 }">
				<li class="swiper-slide"><img src="/cmm/fms/getImage.do?atchFileId=<c:out value="${prodInfo.prod_img_3}"/>&fileSn=0" style="width: 100%;" onerror="this.src='/images/baseScmtour/_noImage.png';"/></li>
				</c:if>
				<c:if test="${not empty prodInfo.prod_img_4 }">
				<li class="swiper-slide"><img src="/cmm/fms/getImage.do?atchFileId=<c:out value="${prodInfo.prod_img_4}"/>&fileSn=0" style="width: 100%;" onerror="this.src='/images/baseScmtour/_noImage.png';"/></li>
				</c:if>
				<c:if test="${not empty prodInfo.prod_img_5 }">
				<li class="swiper-slide"><img src="/cmm/fms/getImage.do?atchFileId=<c:out value="${prodInfo.prod_img_5}"/>&fileSn=0" style="width: 100%;" onerror="this.src='/images/baseScmtour/_noImage.png';"/></li>
				</c:if>
				<c:if test="${not empty prodInfo.prod_img_6 }">
				<li class="swiper-slide"><img src="/cmm/fms/getImage.do?atchFileId=<c:out value="${prodInfo.prod_img_6}"/>&fileSn=0" style="width: 100%;" onerror="this.src='/images/baseScmtour/_noImage.png';"/></li>
				</c:if>
				<c:if test="${not empty prodInfo.prod_img_7 }">
				<li class="swiper-slide"><img src="/cmm/fms/getImage.do?atchFileId=<c:out value="${prodInfo.prod_img_7}"/>&fileSn=0" style="width: 100%;" onerror="this.src='/images/baseScmtour/_noImage.png';"/></li>
				</c:if>
				<c:if test="${not empty prodInfo.prod_img_8 }">
				<li class="swiper-slide"><img src="/cmm/fms/getImage.do?atchFileId=<c:out value="${prodInfo.prod_img_8}"/>&fileSn=0" style="width: 100%;" onerror="this.src='/images/baseScmtour/_noImage.png';"/></li>
				</c:if>
				<c:if test="${not empty prodInfo.prod_img_9 }">
				<li class="swiper-slide"><img src="/cmm/fms/getImage.do?atchFileId=<c:out value="${prodInfo.prod_img_9}"/>&fileSn=0" style="width: 100%;" onerror="this.src='/images/baseScmtour/_noImage.png';"/></li>
				</c:if>
				<c:if test="${not empty prodInfo.prod_img_10 }">
				<li class="swiper-slide"><img src="/cmm/fms/getImage.do?atchFileId=<c:out value="${prodInfo.prod_img_10}"/>&fileSn=0" style="width: 100%;" onerror="this.src='/images/baseScmtour/_noImage.png';"/></li>
				</c:if>
					</ul>
			<div class="swiper-pagination"></div>
			<script>
				// 상단 슬라이드 이미지
				var swiper = new Swiper('#viewSlide', {
					slidesPerView: 'auto',
					centeredSlides: true,
					spaceBetween: 0,
					autoplay: {
						delay: 4000,
					},
					pagination: {
						el: '.swiper-pagination',
						dynamicBullets: true,
					},
				});
			</script>
		</article>
		<!-- } 상단 슬라이드 이미지 -->				                	
                	</div>
                	
                    <div class="prd-info-right">
                    	<div class="codenum">제품번호 : <c:out value="${prod_id }"/></div>
                    	<input type="hidden" id="prod_pick_cnt" value="${prodInfo.prod_pick_cnt}" />
                        <div class="prd-suj">
                        	<h1><c:out value="${prodInfo.prod_nm }"/></h1>
                            <p><c:out value="${prodInfo.prod_comment }"/></p>
                            <div class="price">
                            	<span><fmt:formatNumber value="${prodInfo.prod_price_percent}" type="number"/>%</span>
                                <span><strong><fmt:formatNumber value="${prodInfo.prod_price}" type="number"/></strong>원</span>
                                <span><fmt:formatNumber value="${prodInfo.prod_market_price}" type="number"/>원</span>
                            </div>
                            <ul>
                            	<li><i class="xi-piggy-bank"></i> 적립혜택<span>100점</span></li>
                                <li><i class="xi-box"></i> 배송비
                                <c:if test="${storeInfo.store_market_default_delivery_price > 0 }">
                                <span><fmt:formatNumber value="${storeInfo.store_market_default_delivery_price}" type="number"/>원</span>
                                </c:if>
                                <c:if test="${storeInfo.store_market_default_delivery_price eq 0 }">
                                <span>무료</span>
                                </c:if>            
                               <%--  <br/>                    
                                <span>(제주: <fmt:formatNumber value="${storeInfo.store_market_jeju_delivery_price}" type="number"/>원)</span>
                                <c:if test="${storeInfo.store_market_default_delivery_price > 0 }">
                                <br/>
                                <span>무료배송: <fmt:formatNumber value="${storeInfo.store_market_free_delivery_price}" type="number"/>원 이상</span>
                                </c:if> --%>
                                </li>
                                <li><i class="xi-box"></i>
                                제주배송<span><fmt:formatNumber value="${storeInfo.store_market_jeju_delivery_price}" type="number"/>원</span>
                                </li>
                                <c:if test="${storeInfo.store_market_default_delivery_price > 0 }">
                                <li><i class="xi-box"></i>
                                무료배송<span><fmt:formatNumber value="${storeInfo.store_market_free_delivery_price}" type="number"/>원 이상</span>
                                </li>                                
                                </c:if>
                                <li>
<input type="hidden" id="store_category" name="store_category" value="<c:out value="${store_category }"/>" />
<input type="hidden" id="prod_category" name="prod_category" value="<c:out value="${prod_category }"/>" />
<input type="hidden" id="prod_nm" name="prod_nm" value="<c:out value="${prodInfo.prod_nm}"/>" />
<input type="hidden" id="store_id" name="store_id" value="<c:out value="${prodInfo.store_id}"/>" />
<input type="hidden" id="store_nm" name="store_nm" value="<c:out value="${prodInfo.store_nm}"/>" />
						<c:forEach var="optionList" items="${optionList}" varStatus="status">
							<input type="hidden" id="opt_seq_<c:out value="${optionList.opt_seq }"/>" class="order_seq" value="<c:out value="${optionList.opt_seq }"/>" /> 
							<input type="hidden" id="opt_nm_<c:out value="${optionList.opt_seq }"/>" class="order_nm" value="<c:out value="${optionList.opt_nm }"/>" /> 
							<input type="hidden" id="opt_price_<c:out value="${optionList.opt_seq }"/>" class="order_price" value="<c:out value="${optionList.opt_price}"/>" /> 
							<input type="hidden" id="opt_order_price_<c:out value="${optionList.opt_seq }"/>" class="order_order_price" value="0" /> 
							<input type="hidden" id="opt_order_cnt_<c:out value="${optionList.opt_seq }"/>" class="order_cnt" value="1" /> 
						</c:forEach>

						<select id="item_sel" class="basic_select w100" onchange="sel_opt(this.value); ">
							<option value="">옵션을 선택해주세요.</option>
							<c:forEach var="optionList" items="${optionList}" varStatus="status">
							<option value="<c:out value="${optionList.opt_seq }"/>"><c:out value="${optionList.opt_nm }"/> (<fmt:formatNumber value="${optionList.opt_price}" type="number"/>원)</option>
							</c:forEach>
						</select>                                
                 	         </li>
							
								<div class="optionchoice" id="optList">
							                               
								<!--   
                              	<li>                                
                                   <i class="xi-calculator"></i> 수량
                                    <div class="count"><button><i class="xi-minus"></i></button><strong>1</strong><button><i class="xi-plus"></i></button></div>
                                </li> -->
                            </ul>
                            <div class="total-price">
                            	<span>총상품금액</span>
                                <span><small>총</small> <strong id="total_price">0</strong><small>원</small></span>
                            </div>
                            <div class="payment"><button class="cart-btn btn">장바구니</button><button class="order-btn btn">바로구매</button></div>
                        </div>
                    </div>
                </div>
            </div>
            
            <!-- 베스트상품슬라이드 -->
            <div class="detail-best-slide">
            	<div class="inner">
                    <div class="title">BEST상품</div>
                    <div class="content">
                        <!-- Swiper -->
                        <div class="swiper best-slide">
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
                        <div class="swiper-button-next best-arrow-next"><i class="xi-angle-right-min"></i></div>
                        <div class="swiper-button-prev best-arrow-prev"><i class="xi-angle-left-min"></i></div>
                    </div>
                    <!--// 베스트상품슬라이드 -->
                </div>
            </div>
            
            <script>
			$(function() {
				$(".list-qna > li > .question").click(function() {
					if(!$(this).parent().hasClass('open')) {
						$(".list-qna > li").removeClass('open');
						$(".list-qna > li > .answer").stop().slideUp(300);
						$(this).parent().addClass('open');
						$(this).siblings('.answer').stop().slideDown(300);
					} else {
						$(this).parent().removeClass('open');
						$(this).siblings('.answer').stop().slideUp(300);
					}
				});
			});
			</script>
            <!-- 상품상세정보 탭 -->
            <div class="detail-info">
            	<div class="tab-cover">
                    <ul id="tab">
                        <li><a href="#;">상품상세정보</a></li>
                        <li><a href="#;">상품평<strong>30</strong></a></li>
                        <li><a href="#;">상품문의<strong>30</strong></a></li>
                        <li><a href="#;">배송/교환/<br class="mobile-style" />반품 안내</a></li>
                    </ul>
                </div>
                <div class="tab_con" id="tab_con">
                    <div class="content"></div>
                    <div class="content">
                    	<!-- 상품평 -->
                        <h1>상품평 <span><strong>30</strong>개</span></h1>
                        <div class="list-area">
                        	<div class="list">
                            	<div class="imgArea"><img src="/resource/img/po_product_img7.jpg" alt="이미지"></div>
                                <div class="txtArea">
                                	<h1>[이롬플러스 효모비오틴] 아이랑 같이 먹어요!</h1>
                                    <span class="cont">아이랑 같이 먹고 있는데 너무 좋아요! 믿고 주문합니다. 벌써 두통째 먹었고 금방 떨어져서 새로 주문해요! ....</span>
                                    <span class="writer">joofeel**</span>
                                    <span class="date">2022-10-16</span>
                                </div>
                                <div class="iconArea">
                                	<span class="like"><a href=""><i class="xi-thumbs-up"></i></a></span>
                                    <span class="star">
                                        <i class="xi-star"></i>
                                        <i class="xi-star"></i>
                                        <i class="xi-star"></i>
                                        <i class="xi-star"></i>
                                        <i class="xi-star-o"></i>
                                    </span>
                                </div>
                                <div class="replyArea">
                                아이랑 같이 먹고 있는데 너무 좋아요! 믿고 주문합니다. 벌써 두통째 먹었고 금방 떨어져서 새로 주문해요! 주기적으로 구매해서 온가족들 다같이 먹으려고요! 많이 파세요~ 아이랑 같이 먹고 있는데 너무 좋아요! 믿고 주문합니다. 벌써 두통째 먹었고 금방 떨어져서 새로 주문해요! 주기적으로 구매해서 온가족들 다같이 먹으려고요! 많이 파세요~
                                </div>
                            </div>
                            <div class="list">
                            	<div class="imgArea"><img src="/resource/img/po_product_img7.jpg" alt="이미지"></div>
                                <div class="txtArea">
                                	<h1>[이롬플러스 효모비오틴] 아이랑 같이 먹어요!</h1>
                                    <span class="cont">아이랑 같이 먹고 있는데 너무 좋아요! 믿고 주문합니다. 벌써 두통째 먹었고 금방 떨어져서 새로 주문해요! ....</span>
                                    <span class="writer">joofeel**</span>
                                    <span class="date">2022-10-16</span>
                                </div>
                                <div class="iconArea">
                                	<span class="like"><a href=""><i class="xi-thumbs-up"></i></a></span>
                                    <span class="star">
                                        <i class="xi-star"></i>
                                        <i class="xi-star"></i>
                                        <i class="xi-star"></i>
                                        <i class="xi-star"></i>
                                        <i class="xi-star-o"></i>
                                    </span>
                                </div>
                                
                            </div>
                            <div class="list">
                            	<div class="imgArea"><img src="/resource/img/po_product_img7.jpg" alt="이미지"></div>
                                <div class="txtArea">
                                	<h1>[이롬플러스 효모비오틴] 아이랑 같이 먹어요!</h1>
                                    <span class="cont">아이랑 같이 먹고 있는데 너무 좋아요! 믿고 주문합니다. 벌써 두통째 먹었고 금방 떨어져서 새로 주문해요! ....</span>
                                    <span class="writer">joofeel**</span>
                                    <span class="date">2022-10-16</span>
                                </div>
                                <div class="iconArea">
                                	<span class="like"><a href=""><i class="xi-thumbs-up"></i></a></span>
                                    <span class="star">
                                        <i class="xi-star"></i>
                                        <i class="xi-star"></i>
                                        <i class="xi-star"></i>
                                        <i class="xi-star"></i>
                                        <i class="xi-star-o"></i>
                                    </span>
                                </div>
                                
                            </div>
                        </div>
                        
                        <div class="pagination">
                            <ul>
                                <li><a href="#;" class="page-action front"><i class="xi-angle-left-min"></i></a></li>
                                <li><a href="#;" class="page-link current">1</a></li>
                                <li><a href="#;" class="page-link">2</a></li>
                                <li><a href="#;" class="page-link">3</a></li>
                                <li><a href="#;" class="page-action last"><i class="xi-angle-right-min"></i></a></li>
                            </ul>
                            <div class="write-btn">
                            	<button class="btn reply-btn">후기작성</button>
                                <!-- 레이어 -->
                                <div class="writeArea">
                                    <!-- 메뉴 마스크 : 삭제 금지 -->
                                    <div class="detail-mask"></div>
                                    <!-- // 메뉴 마스크 -->
                                    <!-- 메뉴 레이어 -->
                                    <div class="menu-layer">
                                        <button type="button" class="btnClose">
                                            <span class="line1"></span>
                                            <span class="line2"></span>
                                        </button>
                                        <h1>후기작성</h1>
                                        <div>
                                            <input type="text" class="form-control" placeholder="제목">
                                        </div>
                                        <div class="group-file">
                                            <div class="file-group">
                                                <label for="customFile1" class="customFileLabel">행사 개최 계획 *</label>
                                                <input id="customFile1" class="customFile" type="file">
                                            </div>
                                        </div>
                                        <div>
                                            <textarea class="form-control" placeholder="내용을 입력하세요"></textarea>
                                        </div>
                                        <div class="pop-btn"><button class="btn">작성완료</button></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--// 상품평 -->
                    </div>
                    <div class="content">
                    	<!-- 상품문의 -->
                        <h1>상품문의 <span><strong>30</strong>개</span></h1>
                        <div class="list-area">
                        	<!-- 리스트 -->
                        	<div class="list-qna-area">
                            	<ul class="list-qna">
                                    <li>
                                        <div class="question">
                                            <span class="completion">답변완료</span>
                                            <h3>[이롬플러스 효모비오틴] 문의드립니다.</h3>
                                            <div class="write-info">
                                            	<span>joofeel**</span>
                                                <span>2022-09-16</span>
                                            </div>
                                        </div>
                                        <div class="answer">
                                        	<div class="aw-list">
                                            	<span class="balloon-q">Q</span>
                                            	<div class="cont">질문 내용을 입력해주세요:)</div>
                                                <div class="aw-btn">
                                                	<button class="first">수정</button>
                                                    <button>답변</button>
                                                </div>
                                            </div>
                                            <div class="aw-list">
                                            	<span class="balloon-a">A</span>
                                            	<div class="cont">질문 답변을 입력합니다!</div>
                                                <div class="aw-btn">
                                                	<button>수정</button>
                                                </div>
                                            </div>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                            <!-- 리스트 -->
                            <!-- 리스트 -->
                        	<div class="list-qna-area">
                            	<ul class="list-qna">
                                    <li>
                                        <div class="question">
                                            <span class="completion waiting">답변대기</span>
                                            <h3>[이롬플러스 효모비오틴] 문의드립니다.</h3>
                                            <div class="write-info">
                                            	<span>joofeel**</span>
                                                <span>2022-09-16</span>
                                            </div>
                                        </div>
                                        <div class="answer">
                                        	<div class="aw-list">
                                            	<span class="balloon-q">Q</span>
                                            	<div class="cont">질문 내용을 입력해주세요:)</div>
                                                <div class="aw-btn">
                                                	<button class="first">수정</button>
                                                    <button>답변</button>
                                                </div>
                                            </div>
                                            <div class="aw-list">
                                            	<span class="balloon-a">A</span>
                                            	<div class="cont">질문 답변을 입력합니다!</div>
                                                <div class="aw-btn">
                                                	<button>수정</button>
                                                </div>
                                            </div>
                                        </div>
                                    </li>

                                </ul>
                            </div>
                            <!-- 리스트 -->
                        </div>
                        
                        <div class="pagination">
                            <ul>
                                <li><a href="#;" class="page-action front"><i class="xi-angle-left-min"></i></a></li>
                                <li><a href="#;" class="page-link current">1</a></li>
                                <li><a href="#;" class="page-link">2</a></li>
                                <li><a href="#;" class="page-link">3</a></li>
                                <li><a href="#;" class="page-action last"><i class="xi-angle-right-min"></i></a></li>
                            </ul>
                            <div class="write-btn">
                                <button class="btn inquiry-btn">문의하기</button>
                                <!-- 레이어 -->
                                <div class="writeArea">
                                    <!-- 메뉴 마스크 : 삭제 금지 -->
                                    <div class="detail-mask"></div>
                                    <!-- // 메뉴 마스크 -->
                                    <!-- 메뉴 레이어 -->
                                    <div class="menu-layer">
                                        <button type="button" class="btnClose">
                                            <span class="line1"></span>
                                            <span class="line2"></span>
                                        </button>
                                        <h1>문의하기</h1>
                                        <div>
                                            <input type="text" class="form-control" placeholder="제목">
                                        </div>
                                        <div class="select">
                                            <select class="form-control" name="selec1">
                                                <option value="">문의유형 선택</option>
                                            </select>
                                        </div>
                                        <div>
                                            <textarea class="form-control" placeholder="내용을 입력하세요"></textarea>
                                        </div>
                                        <div class="pop-btn"><button class="btn">문의하기</button></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--// 상품문의 -->
                    </div>
                    <div class="content">
                    	<div class="shipping-list">
                        	<h1>배송기간 및 배송비</h1>
                            <span><strong>배송 안내 :</strong> 결제완료 후 1~2일이내 발송 (토,일,공휴일 제외)도서 산간 지역 또는 재고상황/주문량 에 따라 배송일이 다소 지연될 수 있습니다.</span>
                            <span><strong>배송기간 안내 :</strong> 발송일로부터 1~3일 이내 (토,일,공휴일 제외), 택배사 물량 급증기간(설, 추석 등)은 다소 차이가 있을 수 있습니다</span>
                        </div>
                        <div class="shipping-list">
                        	<h1>반품/취소/교환 안내 내용</h1>
                            <h2>취소/교환/반품 신청방법</h2>
                            <span>- [마이쇼핑>주문내역] 메뉴에서 신청 > 판매자 승인 후 취소/교환/반품이 진행됩니다.</span>
                            <span>- 진행상태는 [마이쇼핑>주문내역] 메뉴에서 확인 가능합니다.</span>
                            <span class="last">- 취소/교환/반품을 신청하시면 고객센터에서 안내 후 입력하신 수거지로 택배 기사님이 방문하여 수거합니다.</span>
                            <h2>환불안내</h2>
                            <span>- 결제 수단에 따라 환불 방식이 달라질 수 있으며, 현금 환불의 경우 등록하신 계좌번호로 환불됩니다.</span>
                            <span> - 환불 처리는 상품 수거 후 영업일 기준 약 5~7일이 소요됩니다.</span>
                        </div>
                        <div class="shipping-list">
                        	<h1>반품/교환 시 배송비 지불 예시</h1>
                            <h2>구매자 부담</h2>
                            <span>- 구매자의 단순 변심</span>
                            <span>- 연락처 기재 오류, 주소지 오류, 부재, 연락두절 등 수취인의 사정으로 인하여 상품이 반송된 경우</span>
                            <span>- 구매자의 귀책 사유에 해당하는 모든 경우</span>
                            <span class="last">- 교환, 반품으로 무료배송 기준에 미달되는 경우, 최초 배송비도 함께 부과됩니다</span>
                            <h2>판매자 부담</h2>
                            <span>- 상품 불량 및 오배송 등 판매자 귀책 사유에 인해 반품/교환이 진행되는 모든 경우</span>
                        </div>
                    </div>
				</div>
            </div>
            
        </div>
        <!-- // 상품리스트 -->
    </div>
    <!-- // 컨테이너 -->
    
    
    





	<script>
    $(function () {
    
      $('.customFile').on('change', function () {
        var files = $(this).val().replace("C:\\fakepath\\", "");
        $(this).prev().text(files)
    
        if (files === "") {
          $(this).prev().html('<small style="color: red">파일이 첨부되지 않았습니다.</small>')
        }
      })
    
    
    })
    </script>

<c:import url="/Api/IncludeBottom.do"/>






