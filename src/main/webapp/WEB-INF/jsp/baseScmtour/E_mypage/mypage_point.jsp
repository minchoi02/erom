<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<c:import url="/Api/IncludeTop.do"/>	

	<script src="https://shop-websrepublic.co.kr/theme/renewal/js/sticky-kit.js"></script>
	<script src="https://shop-websrepublic.co.kr/theme/renewal/js/sticky-kit.min.js"></script>
    <div id="mypage" class="buyList">
    	<div class="inner detailTop">
            <div class="left detail2">
                <div class="titleArea">
                    <h1>마이페이지</h1>
                    <span>MY PAGE</span>
                </div>
                <div class="menuArea">
                    <ul>
                       <li ><span><a href="/mypage.do">구매내역</a></span></li>
                        <li><span><a href="/mypage_cancel.do">취소반품교환</a></span></li>
                        <li><span><a href="/mypage_coupon.do">할인쿠폰</a></span></li>
                        <li class="on"><span><a href="/mypage_point.do">포인트</a></span></li>
                        <li ><span><a href="/mypage_qna.do">상품문의</a></span></li>
                        <li ><span><a href="/mypage_review.do">구매후기</a></span></li>
                        <li><span><a href="/mypage_modify.do">회원정보수정</a></span></li>
                    </ul>
                </div>
            </div>
            
            <div class="right">
                <div class="topArea">
                    <div class="member">
                        <h1><strong>홍길동</strong>님 반갑습니다.</h1>
                        <p>(일반회원)</p>
                    </div>
                    <div class="infoArea">
                        <div class="deli">
                            <h2><img src="/resource/img/mp-deli.svg" /></h2>
                            <span>배송중인 상품</span>
                            <p>3개</p>
                        </div>
                        <div class="coupon">
                            <h2><img src="/resource/img/mp-coupon.svg" /></h2>
                            <span>할인쿠폰</span>
                            <p>12장</p>
                        </div>
                        <div class="point">
                            <h2><img src="/resource/img/mp-point.svg" /></h2>
                            <span>포인트</span>
                            <p>125,000원</p>
                        </div>
                    </div>
                </div>
                
                <div class="buyList-detail">
                	<h1>포인트</h1>
                    <div class="schDate">
                    	<h2>조회기간</h2>
                        <div class="setDate">
                        	<div class="dateTab">
                            	<span class="on"><a href="">1주일</a></span>
                                <span><a href="">15일</a></span>
                                <span><a href="">1개월</a></span>
                                <span><a href="">3개월</a></span>
                            </div>
                            <div class="dateSlt">
                            	<div class="select">
                                    <select class="form-control" name="selec1">
                                        <option value="">2021</option>
                                    </select>
                                </div>
                                <div class="select">
                                    <select class="form-control" name="selec1">
                                        <option value="">12</option>
                                    </select>
                                </div>
                                <div class="select">
                                    <select class="form-control" name="selec1">
                                        <option value="">01</option>
                                    </select>
                                </div>
                                <span class="wave">~</span>
                                <div class="select">
                                    <select class="form-control" name="selec1">
                                        <option value="">2022</option>
                                    </select>
                                </div>
                                <div class="select">
                                    <select class="form-control" name="selec1">
                                        <option value="">03</option>
                                    </select>
                                </div>
                                <div class="select">
                                    <select class="form-control" name="selec1">
                                        <option value="">21</option>
                                    </select>
                                </div>
                                <button class="btn">조회하기</button>
                            </div>
                        </div>
                    </div>
                    <div class="buyList-detail-list">
                    	<div class="txtArea">주문시 포인트 사용 후 구매자 책임(단순변심 등)으로 취소/반품 시, 유효기간이 만료된 포인트는 소멸됩니다</div>
                    	<!-- 리스트 -->
                        <div class="pointArea">
                            <div class="titleArea">
                            	<div class="date">날짜</div>
                                <div class="cate">유형</div>
                                <div class="subject">내용</div>
                                <div class="extinction">소멸예정일</div>
                                <div class="remain">남은기간</div>
                                <div class="point">포인트</div>
                            </div>
                            <div class="point-list">
                                <div class="date"><span class="mobile-style">날짜 : </span>2022-08-01</div>
                                <div class="cate"><span class="mobile-style">유형 : </span>기본</div>
                                <div class="subject"><span class="mobile-style">내용 : </span>로그인 기념</div>
                                <div class="extinction"><span class="mobile-style">소멸예정일 : </span>2022-08-21</div>
                                <div class="remain"><span class="mobile-style">남은기간 : </span>20일</div>
                                <div class="point"><span class="mobile-style">포인트 : </span>20,000P</div>
                            </div>
                            <div class="point-list">
                                <div class="date"><span class="mobile-style">날짜 : </span>2022-08-01</div>
                                <div class="cate"><span class="mobile-style">유형 : </span>기본</div>
                                <div class="subject"><span class="mobile-style">내용 : </span>로그인 기념</div>
                                <div class="extinction"><span class="mobile-style">소멸예정일 : </span>2022-08-21</div>
                                <div class="remain"><span class="mobile-style">남은기간 : </span>20일</div>
                                <div class="point"><span class="mobile-style">포인트 : </span>20,000P</div>
                            </div>
                            <div class="point-list">
                                <div class="date"><span class="mobile-style">날짜 : </span>2022-08-01</div>
                                <div class="cate"><span class="mobile-style">유형 : </span>기본</div>
                                <div class="subject"><span class="mobile-style">내용 : </span>로그인 기념</div>
                                <div class="extinction"><span class="mobile-style">소멸예정일 : </span>2022-08-21</div>
                                <div class="remain"><span class="mobile-style">남은기간 : </span>20일</div>
                                <div class="point"><span class="mobile-style">포인트 : </span>20,000P</div>
                            </div>
                        </div>
                        <!--// 리스트 -->
                        
                        <div class="pagination">
                            <ul>
                                <li><a href="#;" class="page-action front"><i class="xi-angle-left-min"></i></a></li>
                                <li><a href="#;" class="page-link current">1</a></li>
                                <li><a href="#;" class="page-link">2</a></li>
                                <li><a href="#;" class="page-link">3</a></li>
                                <li><a href="#;" class="page-action last"><i class="xi-angle-right-min"></i></a></li>
                            </ul>
                        </div>
					</div>
				</div>
            </div>
        </div>
    </div>
	<script type="text/javascript">
	$(function() {
		$(window).load(function() {
			var winWidth = $(window).width();
			if (winWidth > 1024) {
				$(".detail2").stick_in_parent({
					parent: ".detailTop",
					offset_top: 50,
					inner_scrolling: true,
					sticky_class: "absolute"
				
				});
			}
		});
	});
	</script>

<c:import url="/Api/IncludeBottom.do"/>

