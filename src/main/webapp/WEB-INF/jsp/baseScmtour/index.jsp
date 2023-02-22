<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<c:import url="/Api/IncludeTop.do"/>	
	
	<script src="/resource/js/main.js"></script>	
	<!-- 메인슬라이드 영역 -->
  <div id="main_visual" class="main_visual">
      <!-- swiper-wrapper -->
      <div class="swiper-wrapper">
		<c:forEach var="mainSlideList" items="${mainSlideList}" varStatus="status">				
          <div class="swiper-slide">
              <div class="slide_backImg pc-style1">
              <a href="<c:out value="${mainSlideList.slide_link}"/>" target="<c:out value="${mainSlideList.slide_target}"/>">
              <img src="/cmm/fms/getImage.do?atchFileId=<c:out value="${mainSlideList.slide_img}"/>&fileSn=0"  onerror="this.src='/images/baseScmtour/_noImage.png';" class="pc-style"/>
			  <img src="/cmm/fms/getImage.do?atchFileId=<c:out value="${mainSlideList.slide_img}"/>&fileSn=0"  onerror="this.src='/images/baseScmtour/_noImage.png';" class="mobile-style"/>              
              </a>
              </div>
          </div>
		</c:forEach>           
      </div>

      <!-- visual content -->
      <div class="visual_content" >
          <div class="swiper-pagination"></div>
          <a href="javascript:;" class="ico_movie"><i class="ico play pause"></i></a>
      </div>
      <span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span>
	</div>
    <!-- // 메인슬라이드 영역 -->
    
	<!-- 컨테이너 -->
    <div id="container">
        <!-- 메인섹션1 -->
        <div class="section section1">
            <div class="inner clearfix">
                <div class="left ">
                    <span>MD PICK</span>
                    <h1><b>이롬의<br class="pc-style" />헬스케어 토탈 솔루션</b><br class="pc-style" />상품을 소개합니다.</h1>
                    <p><a href="">전체보기</a></p>
                    <div class="slide-cover"></div>
                </div>
                <div class="right ">
                		<!-- Swiper -->
                    <div class="swiper best-seller ">
                      <!-- Initialize Swiper -->
                        <div class="swiper-wrapper">
                        <c:forEach var="weekList4" items="${weekList4}" varStatus="status">
                            <div class="swiper-slide">
                                <div class="slide_backImg">
                                    <div class="imgArea"><img src="/cmm/fms/getImage.do?atchFileId=<c:out value="${weekList4.prod_img_1}"/>&fileSn=0" alt="이미지"></div>
                                </div>
                            </div>
                        </c:forEach>                            
                        </div>
                        <!-- Add Pagination 
                        <div class="swiper-pagination"></div>-->
                        <!-- Add Arrows -->
                        <div class="swiper-button-next md-pick-next"><i class="xi-arrow-right"></i></div>
                        <div class="swiper-button-prev md-pick-prev"><i class="xi-arrow-left"></i></div>
                    </div>
                </div>
            </div>
        </div>
        <!-- 메인섹션 스크립트 -->
        
        
        <!-- 메인섹션2 -->
        <div class="section section2">
            <div class="inner clearfix">
            <c:forEach var="banner2List_1" items="${banner2List_1}" varStatus="status">
                <div class="member">
                <a href="<c:out value="${banner2List_1.banner_link}"/>" target="<c:out value="${banner2List_1.banner_target}"/>">
                <img src="/cmm/fms/getImage.do?atchFileId=<c:out value="${banner2List_1.banner_img}"/>&fileSn=0" onerror="this.src='/images/baseScmtour/noimg_400.png';" alt="이미지" class="pc-style"/>                
                <img src="/cmm/fms/getImage.do?atchFileId=<c:out value="${banner2List_1.banner_img}"/>&fileSn=0" onerror="this.src='/images/baseScmtour/noimg_400.png';" alt="이미지" class="mobile-style">
                </a>
                </div>
             </c:forEach>
            <c:forEach var="banner2List_2" items="${banner2List_2}" varStatus="status">
                <div class="event">
                <a href="<c:out value="${banner2List_2.banner_link}"/>" target="<c:out value="${banner2List_2.banner_target}"/>">
                <img src="/cmm/fms/getImage.do?atchFileId=<c:out value="${banner2List_2.banner_img}"/>&fileSn=0" onerror="this.src='/images/baseScmtour/noimg_400.png';" alt="이미지" class="pc-style"/>                
                <img src="/cmm/fms/getImage.do?atchFileId=<c:out value="${banner2List_2.banner_img}"/>&fileSn=0" onerror="this.src='/images/baseScmtour/noimg_400.png';" alt="이미지" class="mobile-style">
                </a>
                </div>
             </c:forEach>             
                
            </div>
        </div>
        <!-- // 메인섹션2 -->
        
        <!-- 메인섹션3 -->
        <div class="section section3">
            <div class="inner clearfix">
                <h1>키워드별 BEST5</h1>
                <ul id="tab">
                    <li><a href="#;">#인기상품</a></li>
                    <li><a href="#;">#선물세트</a></li>
                    <li><a href="#;">#면역</a></li>
                    <li><a href="#;">#다이어트·피부</a></li>
                </ul>
                <div class="tab_con" id="tab_con">
                		<div class="content">
                    		<ul class="product-list">
                        		<li>
                                <div class="numnArea"><span>01</span><p>BEST</p></div><div class="image_area"><a href=""><img src="/resource/img/bestp1.png" alt="이미지"></a></div>
                                <div class="best-cover">
                                    <h1><a href="">(세트)황성주박사의 영양식 3Case</a></h1>
                                    <div class="best-icon">
                                        <span><a href=""><i class="xi-heart-o"></i></a></span>
                                        <span><a href=""><i class="xi-cart-o"></i></a></span>
                                        <span><a href=""><i class="xi-credit-card"></i></a></span>
                                    </div>
                                </div>
                            </li>
                            <li>
                            		<div class="numnArea"><span>03</span><p>BEST</p></div><div class="image_area"><a href=""><img src="/resource/img/bestp2.png" alt="이미지"></a></div>
                                <div class="best-cover">
                                    <h1><a href="">(세트)황성주박사의 홍삼두유</a></h1>
                                    <div class="best-icon">
                                        <span><a href=""><i class="xi-heart-o"></i></a></span>
                                        <span><a href=""><i class="xi-cart-o"></i></a></span>
                                        <span><a href=""><i class="xi-credit-card"></i></a></span>
                                    </div>
                                </div>
                            </li>
                            <li class="action-area">
                            		<div class="numnArea"><span>02</span><p>BEST</p></div><div class="image_area"><a href=""><img src="/resource/img/bestp3.png" alt="이미지"></a></div>
                                <div class="best-cover">
                                    <h1><a href="">(세트)황성주박사의 과채습관옐로우</a></h1>
                                    <div class="best-icon">
                                        <span><a href=""><i class="xi-heart-o"></i></a></span>
                                        <span><a href=""><i class="xi-cart-o"></i></a></span>
                                        <span><a href=""><i class="xi-credit-card"></i></a></span>
                                    </div>
                                </div>
                            </li>
                            <li>
                            		<div class="numnArea"><span>04</span><p>BEST</p></div><div class="image_area"><a href=""><img src="/resource/img/bestp4.png" alt="이미지"></a></div>
                                <div class="best-cover">
                                    <h1><a href="">(세트)황성주박사의 통아몬드바나나</a></h1>
                                    <div class="best-icon">
                                        <span><a href=""><i class="xi-heart-o"></i></a></span>
                                        <span><a href=""><i class="xi-cart-o"></i></a></span>
                                        <span><a href=""><i class="xi-credit-card"></i></a></span>
                                    </div>
                                </div>
                            </li>
                            <li class="action-area-sec">
                            		<div class="numnArea"><span>05</span><p>BEST</p></div><div class="image_area"><a href=""><img src="/resource/img/bestp5.png" alt="이미지"></a></div>
                                <div class="best-cover">
                                    <h1><a href="">오크라 마시는 뷰티드링크</a></h1>
                                    <div class="best-icon">
                                        <span><a href=""><i class="xi-heart-o"></i></a></span>
                                        <span><a href=""><i class="xi-cart-o"></i></a></span>
                                        <span><a href=""><i class="xi-credit-card"></i></a></span>
                                    </div>
                                </div>
                            </li>
                        </ul>
                    </div>
                    <div class="content">선물세트</div>
                    <div class="content">면역</div>
                    <div class="content">다이어트·피부</div>
                    <div class="txtAbsolut">
                    		<div class="best">
                        		BEST<br />PRODUCT
                        </div>
                        <div class="popular">이롬헬스케어의<br /><strong>#인기상품</strong></div>
                    </div>
                </div>
            </div>
        </div>
        <!-- // 메인섹션3 -->
        
        <!-- 메인섹션4 -->
        <div class="section section4">
            <div class="inner clearfix">
            <c:forEach var="banner2List_3" items="${banner2List_3}" varStatus="status">
                <div class="pet">
                <a href="<c:out value="${banner2List_3.banner_link}"/>" target="<c:out value="${banner2List_3.banner_target}"/>">
                <img src="/cmm/fms/getImage.do?atchFileId=<c:out value="${banner2List_3.banner_img}"/>&fileSn=0" onerror="this.src='/images/baseScmtour/noimg_400.png';" alt="이미지" class="pc-style"/>                
                <img src="/cmm/fms/getImage.do?atchFileId=<c:out value="${banner2List_3.banner_img}"/>&fileSn=0" onerror="this.src='/images/baseScmtour/noimg_400.png';" alt="이미지" class="mobile-style">
                </a>
                </div>
             </c:forEach>                             
            </div>
        </div>
        <!-- // 메인섹션4 -->
        
        <!-- 메인섹션5 -->
        <div class="section section5">
            <div class="inner clearfix">
                <h1>전체 상품 보기</h1>
                <ul id="tab2">
                    <li><a href="#;">#전체상품</a></li>
                    <li><a href="#;">#기획전</a></li>
                    <li><a href="#;">#건강식품</a></li>
                    <li><a href="#;">#푸드케어</a></li>
                    <li><a href="#;">#헬스&바디케어</a></li>
                    <li><a href="#;">#펫케어</a></li>
                </ul>
                <div class="tab_con2" id="tab2_con2">
                		<div class="content">
                		<%--인덱스 전체상품 기능 --%>
                    		<ul class="total-product-list">
                        		  <%-- <c:forEach var="weekList4" items="${weekList4}" varStatus="status"> --%>
                        		  
									<c:forEach var="ProdList" items="${ProdList}" varStatus="status">                        		  
                        		  <li>
                            <div class="image_area">                            
                            <img src="/cmm/fms/getImage.do?atchFileId=<c:out value="${ProdList.prod_img_1}"/>&fileSn=0" onerror="this.src='/images/baseScmtour/_noImage250.png';" alt="이미지"></a>
                            <div class="total-product-cover">
                              <div class="total-product-icon">
                                  <span><a href="<c:if test="${not empty user_id }">javascript:prod_pick('${ProdList.prod_id }')"</c:if>
                                  <c:if test="${empty user_id }">javascript:getLogin('list.do')"</c:if>
                                  <i class="xi-heart-o"></i></a></span>
                                  <span><a href="/detail_view.do?store_category=CD002004&prod_category=<c:out value="${ProdList.prod_category}"/>&prod_id=<c:out value="${ProdList.prod_id}"/>"><i class="xi-cart-o"></i></a></span>
                                  <span><a href="/detail_view.do?store_category=CD002004&prod_category=<c:out value="${ProdList.prod_category}"/>&prod_id=<c:out value="${ProdList.prod_id}"/>"><i class="xi-credit-card"></i></a></span>
                              </div>
                            </div>                            
                            </div>
                            <div class="txtArea">
                              <!-- <div class="new-best"><span class="new">NEW</span><span class="best">BEST</span></div> -->  
                              <h1><c:out value="${ProdList.prod_nm}"/></h1>
                              <span><c:out value="${ProdList.prod_comment}"/></span>
                              <p><fmt:formatNumber value="${ProdList.prod_price}" type="number"/>원</p>
                            </div>
                            </li>
                            </c:forEach>
                          
                        </ul>
                        <div class="total_link"><a href="/list.do">전체보기</a></div>
                    </div>
                  
                    <div class="content">
                		<%--인덱스 기획전  --%>
                    		<ul class="total-product-list">
                        		  <%-- <c:forEach var="weekList4" items="${weekList4}" varStatus="status"> --%>
                        		  
									<c:forEach var="get_index_prod_list_5" items="${get_index_prod_list_5}" varStatus="status">                        		  
                        		  <li>
                            <div class="image_area">                            
                            <img src="/cmm/fms/getImage.do?atchFileId=<c:out value="${get_index_prod_list_5.prod_img_1}"/>&fileSn=0" onerror="this.src='/images/baseScmtour/_noImage250.png';" alt="이미지"></a>
                            <div class="total-product-cover">
                              <div class="total-product-icon">
                                  <span><a href="<c:if test="${not empty user_id }">javascript:prod_pick('${get_index_prod_list_5.prod_id }')"</c:if>
                                  <c:if test="${empty user_id }">javascript:getLogin('list.do')"</c:if>
                                  <i class="xi-heart-o"></i></a></span>
                                  <span><a href="/detail_view.do?store_category=CD002004&prod_category=<c:out value="${get_index_prod_list_5.prod_category}"/>&prod_id=<c:out value="${get_index_prod_list_5.prod_id}"/>"><i class="xi-cart-o"></i></a></span>
                                  <span><a href="/detail_view.do?store_category=CD002004&prod_category=<c:out value="${get_index_prod_list_5.prod_category}"/>&prod_id=<c:out value="${get_index_prod_list_5.prod_id}"/>"><i class="xi-credit-card"></i></a></span>
                              </div>
                            </div>                            
                            </div>
                            <div class="txtArea">
                              <!-- <div class="new-best"><span class="new">NEW</span><span class="best">BEST</span></div> -->  
                              <h1><c:out value="${get_index_prod_list_5.prod_nm}"/></h1>
                              <span><c:out value="${get_index_prod_list_5.prod_comment}"/></span>
                              <p><fmt:formatNumber value="${get_index_prod_list_5.prod_price}" type="number"/>원</p>
                            </div>
                            </li>
                            </c:forEach>
                          
                        </ul>      
                        <div class="total_link"><a href="/special.do">더보기</a></div>
                        </div>           
                        
                    <div class="content">
                		<%--인덱스 건강식품  --%>
                    		<ul class="total-product-list">
                        		  <%-- <c:forEach var="weekList4" items="${weekList4}" varStatus="status"> --%>
                        		  
									<c:forEach var="get_index_prod_list_1" items="${get_index_prod_list_1}" varStatus="status">                        		  
                        		  <li>
                            <div class="image_area">                            
                            <img src="/cmm/fms/getImage.do?atchFileId=<c:out value="${get_index_prod_list_1.prod_img_1}"/>&fileSn=0" onerror="this.src='/images/baseScmtour/_noImage250.png';" alt="이미지"></a>
                            <div class="total-product-cover">
                              <div class="total-product-icon">
                                  <span><a href="<c:if test="${not empty user_id }">javascript:prod_pick('${get_index_prod_list_1.prod_id }')"</c:if>
                                  <c:if test="${empty user_id }">javascript:getLogin('list.do')"</c:if>
                                  <i class="xi-heart-o"></i></a></span>
                                  <span><a href="/detail_view.do?store_category=CD002004&prod_category=<c:out value="${get_index_prod_list_1.prod_category}"/>&prod_id=<c:out value="${get_index_prod_list_1.prod_id}"/>"><i class="xi-cart-o"></i></a></span>
                                  <span><a href="/detail_view.do?store_category=CD002004&prod_category=<c:out value="${get_index_prod_list_1.prod_category}"/>&prod_id=<c:out value="${get_index_prod_list_1.prod_id}"/>"><i class="xi-credit-card"></i></a></span>
                              </div>
                            </div>                            
                            </div>
                            <div class="txtArea">
                              <!-- <div class="new-best"><span class="new">NEW</span><span class="best">BEST</span></div> -->  
                              <h1><c:out value="${get_index_prod_list_1.prod_nm}"/></h1>
                              <span><c:out value="${get_index_prod_list_1.prod_comment}"/></span>
                              <p><fmt:formatNumber value="${get_index_prod_list_1.prod_price}" type="number"/>원</p>
                            </div>
                            </li>
                            </c:forEach>
                          
                        </ul>      
                        <div class="total_link"><a href="/h_list.do">더보기</a></div>
                        </div>     
                                                   
                    <div class="content">
                		<%--인덱스 푸드케어 --%>
                    		<ul class="total-product-list">
                        		  <%-- <c:forEach var="weekList4" items="${weekList4}" varStatus="status"> --%>
                        		  
									<c:forEach var="get_index_prod_list_2" items="${get_index_prod_list_2}" varStatus="status">                        		  
                        		  <li>
                            <div class="image_area">                            
                            <img src="/cmm/fms/getImage.do?atchFileId=<c:out value="${get_index_prod_list_2.prod_img_1}"/>&fileSn=0" onerror="this.src='/images/baseScmtour/_noImage250.png';" alt="이미지"></a>
                            <div class="total-product-cover">
                              <div class="total-product-icon">
                                  <span><a href="<c:if test="${not empty user_id }">javascript:prod_pick('${get_index_prod_list_2.prod_id }')"</c:if>
                                  <c:if test="${empty user_id }">javascript:getLogin('list.do')"</c:if>
                                  <i class="xi-heart-o"></i></a></span>
                                  <span><a href="/detail_view.do?store_category=CD002004&prod_category=<c:out value="${get_index_prod_list_2.prod_category}"/>&prod_id=<c:out value="${get_index_prod_list_2.prod_id}"/>"><i class="xi-cart-o"></i></a></span>
                                  <span><a href="/detail_view.do?store_category=CD002004&prod_category=<c:out value="${get_index_prod_list_2.prod_category}"/>&prod_id=<c:out value="${get_index_prod_list_2.prod_id}"/>"><i class="xi-credit-card"></i></a></span>
                              </div>
                            </div>                            
                            </div>
                            <div class="txtArea">
                              <!-- <div class="new-best"><span class="new">NEW</span><span class="best">BEST</span></div> -->  
                              <h1><c:out value="${get_index_prod_list_2.prod_nm}"/></h1>
                              <span><c:out value="${get_index_prod_list_2.prod_comment}"/></span>
                              <p><fmt:formatNumber value="${get_index_prod_list_2.prod_price}" type="number"/>원</p>
                            </div>
                            </li>
                            </c:forEach>
                          
                        </ul>     
                        <div class="total_link"><a href="/f_list.do">더보기</a></div>
                        </div>  
                                  
                    <div class="content">
                    
                		<%--인덱스 헬스&바디케어 --%>
                    		<ul class="total-product-list">
                        		  <%-- <c:forEach var="weekList4" items="${weekList4}" varStatus="status"> --%>
                        		  
									<c:forEach var="get_index_prod_list_3" items="${get_index_prod_list_3}" varStatus="status">                        		  
                        		  <li>
                            <div class="image_area">                            
                            <img src="/cmm/fms/getImage.do?atchFileId=<c:out value="${get_index_prod_list_3.prod_img_1}"/>&fileSn=0" onerror="this.src='/images/baseScmtour/_noImage250.png';" alt="이미지"></a>
                            <div class="total-product-cover">
                              <div class="total-product-icon">
                                  <span><a href="<c:if test="${not empty user_id }">javascript:prod_pick('${get_index_prod_list_4.prod_id }')"</c:if>
                                  <c:if test="${empty user_id }">javascript:getLogin('list.do')"</c:if>
                                  <i class="xi-heart-o"></i></a></span>
                                  <span><a href="/detail_view.do?store_category=CD002004&prod_category=<c:out value="${get_index_prod_list_3.prod_category}"/>&prod_id=<c:out value="${get_index_prod_list_3.prod_id}"/>"><i class="xi-cart-o"></i></a></span>
                                  <span><a href="/detail_view.do?store_category=CD002004&prod_category=<c:out value="${get_index_prod_list_3.prod_category}"/>&prod_id=<c:out value="${get_index_prod_list_3.prod_id}"/>"><i class="xi-credit-card"></i></a></span>
                              </div>
                            </div>                            
                            </div>
                            <div class="txtArea">
                              <!-- <div class="new-best"><span class="new">NEW</span><span class="best">BEST</span></div> -->  
                              <h1><c:out value="${get_index_prod_list_3.prod_nm}"/></h1>
                              <span><c:out value="${get_index_prod_list_3.prod_comment}"/></span>
                              <p><fmt:formatNumber value="${get_index_prod_list_3.prod_price}" type="number"/>원</p>
                            </div>
                            </li>
                            </c:forEach>
                          
                        </ul>           
                        <div class="total_link"><a href="/b_list.do">더보기</a></div>
                        </div>  
                        <div class="content">
                        		<%--인덱스 펫케어 --%>
                    		<ul class="total-product-list">
                        		  <%-- <c:forEach var="weekList4" items="${weekList4}" varStatus="status"> --%>
                        		  
									<c:forEach var="get_index_prod_list_4" items="${get_index_prod_list_4}" varStatus="status">                        		  
                        		  <li>
                            <div class="image_area">                            
                            <img src="/cmm/fms/getImage.do?atchFileId=<c:out value="${get_index_prod_list_4.prod_img_1}"/>&fileSn=0" onerror="this.src='/images/baseScmtour/_noImage250.png';" alt="이미지"></a>
                            <div class="total-product-cover">
                              <div class="total-product-icon">
                                  <span><a href="<c:if test="${not empty user_id }">javascript:prod_pick('${get_index_prod_list_4.prod_id }')"</c:if>
                                  <c:if test="${empty user_id }">javascript:getLogin('list.do')"</c:if>
                                  <i class="xi-heart-o"></i></a></span>
                                  <span><a href="/detail_view.do?store_category=CD002004&prod_category=<c:out value="${get_index_prod_list_4.prod_category}"/>&prod_id=<c:out value="${get_index_prod_list_4.prod_id}"/>"><i class="xi-cart-o"></i></a></span>
                                  <span><a href="/detail_view.do?store_category=CD002004&prod_category=<c:out value="${get_index_prod_list_4.prod_category}"/>&prod_id=<c:out value="${get_index_prod_list_4.prod_id}"/>"><i class="xi-credit-card"></i></a></span>
                              </div>
                            </div>                            
                            </div>
                            <div class="txtArea">
                              <!-- <div class="new-best"><span class="new">NEW</span><span class="best">BEST</span></div> -->  
                              <h1><c:out value="${get_index_prod_list_4.prod_nm}"/></h1>
                              <span><c:out value="${get_index_prod_list_4.prod_comment}"/></span>
                              <p><fmt:formatNumber value="${get_index_prod_list_4.prod_price}" type="number"/>원</p>
                            </div>
                            </li>
                            </c:forEach>
                          
                        </ul>  
                         <div class="total_link"><a href="/p_list.do">더보기</a></div>
                        </div>       
                </div>
                
            </div>
        </div>
        <!-- // 메인섹션5 -->
    </div>
    <!-- // 컨테이너 -->
	<script>
	indexAjaxLoad('main_visual');
	indexAjaxLoad('mainWeekscCourse_content');
	indexAjaxLoad('mainPromotion');

	indexAjaxLoad('mainProduct_001');
	indexAjaxLoad('mainProduct_002');
	indexAjaxLoad('mainProduct_003');
	//indexAjaxLoad('mainProduct_004');
	
	indexAjaxLoad('mainTravelProduct');
	indexAjaxLoad('mainRoomProduct');
	indexAjaxLoad('mainFoodProduct');
	indexAjaxLoad('mainMarketProduct');
	
	</script>
<c:import url="/Api/IncludeBottom.do"/>

