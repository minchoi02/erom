<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<c:import url="/Api/IncludeTop.do"/>	
	
	<!-- 서브비주얼 영역 -->
  <div id="sub_visual" class="sub_visual4">
  		<div class="inner">
          <div class="navigation">홈 <span class="last">이벤트</span></div>
          <div class="sub-title">이벤트</div>
      </div>
	</div>
	<!-- // 서브비주얼 영역 -->
    
	<!-- 컨테이너 -->
    <div id="container">
        <!-- 상품리스트 -->
        <div class="product-list">
            <div class="inner clearfix">
            	<ul id="tab2">
                    <li class="on"><a href="#;">진행중인 이벤트</a></li>
                    <li><a href="#;">마감된 이벤트</a></li>
                </ul>
                
                <div class="event-list">
                    <ul>
                        <li>
                            <a href="/event_view.do">
                            <div class="imgArea"><img src="/resourse/img/event-img.png" /></div>
                            <div class="txtArea">
                                <div class="subject">가을맞이 건강식품 할인 이벤트!</div>
                                <div class="date"><strong>이벤트 기간 : </strong>22.10.03 ~ 22.10.25</div>
                            </div>
                            </a>
                        </li>
                        <li class="end">
                            <a href="#;">
                            <div class="imgArea">
                                <img src="/resourse/img/event-img.png" />
                                <div class="end-cover">종료된<br />이벤트입니다</div>
                            </div>
                            <div class="txtArea">
                                <div class="subject">부모님 면역챙기기 프로젝트</div>
                                <div class="date"><strong>이벤트 기간 : </strong>22.10.03 ~ 22.10.25</div>
                            </div>
                            
                            </a>
                        </li>
                        <li>
                            <a href="#;">
                            <div class="imgArea"><img src="/resourse/img/event-img.png" /></div>
                            <div class="txtArea">
                                <div class="subject">가을맞이 건강식품 할인 이벤트!</div>
                                <div class="date"><strong>이벤트 기간 : </strong>22.10.03 ~ 22.10.25</div>
                            </div>
                            </a>
                        </li>
                        
                    </ul>
                    <div class="pagination">
                        <ul>
                            <li><a href="#;" class="page-action front"><i class="xi-angle-left-min"></i></a></li>
                            <li><a href="#;" class="page-link current">1</a></li>
                            <li><a href="#;" class="page-link">2</a></li>
                            <li><a href="#;" class="page-link">3</a></li>
                            <li><a href="#;" class="page-action last"><i class="xi-angle-right-min"></i></a></li>
                        </ul>
                        <!--<div class="write-btn"><button class="btn inquiry-btn">글쓰기</button></div>-->
                    </div>
                </div>
                
            </div>
            <!-- 공지사항리스트 -->
        </div>
    </div>
    <!-- // 컨테이너 -->

<c:import url="/Api/IncludeBottom.do"/>
