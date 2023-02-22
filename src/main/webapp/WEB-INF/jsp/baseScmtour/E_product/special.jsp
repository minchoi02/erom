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
	
	
	<!-- 서브비주얼 영역 -->
  <div id="sub_visual" class="sub_visual2">
  		<div class="inner">
          <div class="navigation">홈 <span class="last">기획전</span></div>
          <div class="sub-title">기획전</div>
      </div>
	</div>
	<!-- // 서브비주얼 영역 -->
    
	<!-- 컨테이너 -->
    <div id="container">
        
        <!-- 상품리스트 -->
        <div class="product-list-special">
            <div class="inner clearfix">
                <ul id="tab2">
                    <li><a href="#;">전체</a></li>
                    <li><a href="#;">기획세트</a></li>
                    <li><a href="#;">H-Solution</a></li>
                </ul>
                <div class="left">
            <c:forEach var="banner2List_4" items="${banner2List_4}" varStatus="status">
                <a href="<c:out value="${banner2List_4.banner_link}"/>" target="<c:out value="${banner2List_4.banner_target}"/>">
                <img src="/cmm/fms/getImage.do?atchFileId=<c:out value="${banner2List_4.banner_img}"/>&fileSn=0" onerror="this.src='/images/baseScmtour/noimg_400.png';" />                                
                </a>
             </c:forEach>                   
                </div>
                <div class="right">
                	<h1>기획세트 BEST</h1>
                    <div class="clearfix">
                        <ul class="total-product-list-special">
                            <li>
                          		<div class="cir-num first">01</div>
                                <div class="image_area">
                                <a href=""><img src="/resource/img/po_product_img1.jpg" alt="이미지"></a>
                                <div class="total-product-cover">
                                  <div class="total-product-icon">
                                      <span><a href=""><i class="xi-heart-o"></i></a></span>
                                      <span><a href=""><i class="xi-cart-o"></i></a></span>
                                      <span><a href=""><i class="xi-credit-card"></i></a></span>
                                  </div>
                                </div>
                                </div>
                                <div class="txtArea">
                                  <h1>이롬플러스 포로틴</h1>
                                  <span>식물에서 찾아 담은 건강 에너지</span>
                                  <p>125,000원</p>
                                </div>
                              
                            </li>
                            <li>
                              <div class="cir-num">02</div>
                              <div class="image_area">
                              	<a href=""><img src="/resource/img/po_product_img2.jpg" alt="이미지"></a>
                              	<div class="total-product-cover">
                                  <div class="total-product-icon">
                                      <span><a href=""><i class="xi-heart-o"></i></a></span>
                                      <span><a href=""><i class="xi-cart-o"></i></a></span>
                                      <span><a href=""><i class="xi-credit-card"></i></a></span>
                                  </div>
                                </div>
                              </div>
                              <div class="txtArea">
                                  <h1>이롬플러스 키즈10</h1>
                                  <span>건강하게 자라는 우리 아이들을 위하여!</span>
                                  <p>65,000원</p>
                              </div>
                              
                            </li>
                            <li>
                              <div class="cir-num">03</div>
                              <div class="image_area">
                                <a href=""><img src="/resource/img/po_product_img3.jpg" alt="이미지"></a>
                                <div class="total-product-cover">
                                    <div class="total-product-icon">
                                        <span><a href=""><i class="xi-heart-o"></i></a></span>
                                        <span><a href=""><i class="xi-cart-o"></i></a></span>
                                        <span><a href=""><i class="xi-credit-card"></i></a></span>
                                    </div>
                                </div>
                              </div>
                              <div class="txtArea">
                                  <h1>이뮨푸드엑스</h1>
                                  <span>3g x 60포</span>
                                  <p>88,000원</p>
                              </div>
                              
                            </li>
                            <li>
                              <div class="cir-num">04</div>
                              <div class="image_area">
                                <a href=""><img src="/resource/img/po_product_img4.jpg" alt="이미지"></a>
                                <div class="total-product-cover">
                                    <div class="total-product-icon">
                                        <span><a href=""><i class="xi-heart-o"></i></a></span>
                                        <span><a href=""><i class="xi-cart-o"></i></a></span>
                                        <span><a href=""><i class="xi-credit-card"></i></a></span>
                                    </div>
                                </div>
                              </div>
                              <div class="txtArea">
                                  <h1>면역비책 발효홍삼</h1>
                                  <span>15g x 10포/3개입</span>
                                  <p>125,000원</p>
                              </div>
                              
                            </li>
                            <li>
                              <div class="cir-num">05</div>
                              <div class="image_area">
                                <a href=""><img src="/resource/img/po_product_img5.jpg" alt="이미지"></a>
                                <div class="total-product-cover">
                                    <div class="total-product-icon">
                                        <span><a href=""><i class="xi-heart-o"></i></a></span>
                                        <span><a href=""><i class="xi-cart-o"></i></a></span>
                                        <span><a href=""><i class="xi-credit-card"></i></a></span>
                                    </div>
                                </div>
                              </div>
                              <div class="txtArea">
                                  <h1>황성주 박사의 국산 콩두유</h1>
                                  <span>16개입 x 4박스</span>
                                  <p>165,000원</p>
                              </div>
                            </li>
                            <li>
                              <div class="cir-num">06</div>
                              <div class="image_area">
                                <a href=""><img src="/resource/img/po_product_img6.jpg" alt="이미지"></a>
                                <div class="total-product-cover">
                                    <div class="total-product-icon">
                                        <span><a href=""><i class="xi-heart-o"></i></a></span>
                                        <span><a href=""><i class="xi-cart-o"></i></a></span>
                                        <span><a href=""><i class="xi-credit-card"></i></a></span>
                                    </div>
                                </div>
                              </div>
                              <div class="txtArea">
                                  <h1>황성주 박사의 고단백두유</h1>
                                  <span>20개입 1박스</span>
                                  <p>35,000원</p>
                              </div>
                              
                            </li>
                            
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <!-- // 기획전 -->
        
        <!-- 상품리스트 -->
        <div class="product-list">
            <div class="inner clearfix">
                <h1>전체 <span><strong><c:out value="${TotalCnt}"/></strong>개</span></h1>
                <div class="prd-sort absol">
                <c:choose>
                <c:when test="${orderby eq 'Recom'}"><a href="javascript:;">추천순</a></c:when>
                <c:when test="${orderby eq 'Review'}"><a href="javascript:;">리뷰순</a></c:when>
                <c:when test="${orderby eq 'Sale'}"><a href="javascript:;">판매순</a></c:when>
                <c:when test="${orderby eq 'Date'}"><a href="javascript:;">최신순</a></c:when>                
                </c:choose>    
                    <ul class="dropdown">
				<li><a href="/special.do?store_category=<c:out value="${store_category}"/>&prod_category=<c:out value="${prod_category}"/>&orderby=Recom" <c:if test="${orderby eq 'Recom'}">class="active"</c:if> >추천순</a></li>
				<li><a href="/special.do?store_category=<c:out value="${store_category}"/>&prod_category=<c:out value="${prod_category}"/>&orderby=Review" <c:if test="${orderby eq 'Review'}">class="active"</c:if> >리뷰순</a></li>
				<li><a href="/special.do?store_category=<c:out value="${store_category}"/>&prod_category=<c:out value="${prod_category}"/>&orderby=Sale" <c:if test="${orderby eq 'Sale'}">class="active"</c:if> >판매순</a></li>
				<li><a href="/special.do?store_category=<c:out value="${store_category}"/>&prod_category=<c:out value="${prod_category}"/>&orderby=Date" <c:if test="${orderby eq 'Date'}">class="active"</c:if> >최신순</a></li>
                    </ul>
                </div>
                <script>
					$(function() {
						$(".prd-sort > a").click(function() {
							if(!$(this).siblings('.dropdown').is(':hidden')) {
								$(this).siblings('.dropdown').stop(true,false).slideUp(500);
								$(this).removeClass('open');
							} else {
								$(this).siblings('.dropdown').stop(true,false).slideDown(500);
								$(this).addClass('open');
							}
						});
					});
				</script>
                <div class="clearfix">
                	<ul class="total-product-list">
                	<c:forEach var="bestProdList_sp" items="${bestProdList_sp}" varStatus="status">
                        <li>
                            <div class="image_area">                            
                            <img src="/cmm/fms/getImage.do?atchFileId=<c:out value="${bestProdList_sp.prod_img_1}"/>&fileSn=0" onerror="this.src='/images/baseScmtour/_noImage250.png';" alt="이미지"></a>
                            <div class="total-product-cover">
                              <div class="total-product-icon">
                                  <span><a href="<c:if test="${not empty user_id }">javascript:prod_pick('${bestProdList_sp.prod_id }')"</c:if>
                                  <c:if test="${empty user_id }">javascript:getLogin('list.do')"</c:if>
                                  <i class="xi-heart-o"></i></a></span>
                                  <span><a href="/detail_view.do?store_category=<c:out value="${bestProdList_sp.store_category}"/>&prod_category=<c:out value="${bestProdList_sp.prod_category}"/>&prod_id=<c:out value="${bestProdList_sp.prod_id}"/>"><i class="xi-cart-o"></i></a></span>
                                  <span><a href="/detail_view.do?store_category=<c:out value="${bestProdList_sp.store_category}"/>&prod_category=<c:out value="${bestProdList_sp.prod_category}"/>&prod_id=<c:out value="${bestProdList_sp.prod_id}"/>"><i class="xi-credit-card"></i></a></span>
                              </div>
                            </div>                            
                            </div>
                            <div class="txtArea">
                              <div class="new-best"><span class="new">NEW</span><span class="best">BEST</span></div>  
                              <h1><c:out value="${bestProdList_sp.prod_nm}"/></h1>
                              <span><c:out value="${bestProdList_sp.prod_comment}"/></span>
                              <p><fmt:formatNumber value="${bestProdList_sp.prod_price}" type="number"/>원</p>
                            </div>
                          
                        </li>
                        </c:forEach>
                       
                    </ul>
                </div>
                <div class="pagination">
                <ul>
					<ui:pagination paginationInfo = "${paginationInfo}" type="image" jsFunction="jsPaging" />
				</ul>
				</div>
				
				 <script type="text/javascript">
				// 페이징함수
				function jsPaging(pageNo) {
					//console.log(pageNo);
					var searchKey = $.trim($('#searchKey').val());
					var searchKeyword = $.trim($('#searchKeyword').val());
					var searchType = $.trim($('#searchType').val());
					var store_category = $.trim($('#store_category').val());
			
					var linkurl = "/special.do?pageIndex="+pageNo;
					
					if(store_category) {
						linkurl += "&store_category="+store_category;
					}
					if(searchKey && searchKeyword) {
						linkurl += "&searchKey="+searchKey+"&searchKeyword="+searchKeyword;
					}
					if(searchType) {
						linkurl += "&searchType="+searchType;
					}


					//console.log(linkurl)
					location.href = linkurl;
				}
				</script>				
            </div>
        </div>
        <!-- // 상품리스트 -->
    </div>
    <!-- // 컨테이너 -->
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