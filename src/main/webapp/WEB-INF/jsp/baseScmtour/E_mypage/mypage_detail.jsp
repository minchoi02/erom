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
                       <li class="on"><span><a href="/mypage.do">구매내역</a></span></li>
                        <li><span><a href="/mypage_cancel.do">취소반품교환</a></span></li>
                        <li><span><a href="/mypage_coupon.do">할인쿠폰</a></span></li>
                        <li ><span><a href="/mypage_point.do">포인트</a></span></li>
                        <li ><span><a href="/mypage_qna.do">상품문의</a></span></li>
                        <li ><span><a href="/mypage_review.do">구매후기</a></span></li>
                        <li ><span><a href="/mypage_modify.do">회원정보수정</a></span></li>
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
                	
                	<div class="buyList-detail-list detail-view">
                    	<div class="orderNum">결제번호 : 441543054 | 주문일 : 2022-06-01</div>
                    	<!-- 리스트 -->
                        <div class="listArea">
                        	<div class="bundle">
                            	<div>
                                    <div class="imgArea"><a href=""><img src="/resource/img/po_product_img4.jpg" /></a></div>
                                    <div class="subject">
                                        <h1>이벤트 상품 )) 면역비책 발효홍삼</h1>
                                        <span>15g x 10포 / 3개입</span>
                                        <p>옵션 : 3박스 세트</p>
                                    </div>
                                    <div class="quantity">
                                        <strong>1</strong>
                                    </div>
                                    <div class="cost">
                                        <strong>125,000원</strong>
                                    </div>
                                    <span class="deli green">배송중<br class="pc-style"><button class="btn">구매후기</button></span>
                                </div>
                                <div>
                                    <div class="imgArea"><a href=""><img src="/resource/img/po_product_img4.jpg" /></a></div>
                                    <div class="subject">
                                        <h1>이벤트 상품 )) 면역비책 발효홍삼</h1>
                                        <span>15g x 10포 / 3개입</span>
                                        <p>옵션 : 3박스 세트</p>
                                    </div>
                                    <div class="quantity">
                                        <strong>1</strong>
                                    </div>
                                    <div class="cost">
                                        <strong>125,000원</strong>
                                    </div>
                                    <span class="deli">상품출고</span>
                                </div>
                                <div>
                                    <div class="imgArea"><a href=""><img src="/resource/img/po_product_img4.jpg" /></a></div>
                                    <div class="subject">
                                        <h1>이벤트 상품 )) 면역비책 발효홍삼</h1>
                                        <span>15g x 10포 / 3개입</span>
                                        <p>옵션 : 3박스 세트</p>
                                    </div>
                                    <div class="quantity">
                                        <strong>1</strong>
                                    </div>
                                    <div class="cost">
                                        <strong>125,000원</strong>
                                    </div>
                                    <span class="deli">상품출고</span>
                                </div>
                                <div>
                                    <div class="imgArea"><a href=""><img src="/resource/img/po_product_img4.jpg" /></a></div>
                                    <div class="subject">
                                        <h1>이벤트 상품 )) 면역비책 발효홍삼</h1>
                                        <span>15g x 10포 / 3개입</span>
                                        <p>옵션 : 3박스 세트</p>
                                    </div>
                                    <div class="quantity">
                                        <strong>1</strong>
                                    </div>
                                    <div class="cost">
                                        <strong>125,000원</strong>
                                    </div>
                                    <span class="deli">상품출고</span>
                                </div>
                            </div>
                            
                            
                        </div>
                        <!--// 리스트 -->
                        
                        <div class="prdBuy">
                            <h1>구매자정보</h1>
                            <div class="prdBuy-list">
                                <div>
                                    <span>주문자</span>
                                    <div>홍길동</div>
                                </div>
                                <div>
                                    <span>휴대폰번호</span>
                                    <div>010-4123-5678</div>
                                </div>
                                <div>
                                    <span>주소</span>
                                    <div>(12345) 서울특별시 영등포구 여의도동 사서함1-</div>
                                </div>
                                <div>
                                    <span>배송메세지</span>
                                    <div>부재시 휴대폰으로 연락바랍니다</div>
                                </div>
                            </div>
                        </div>
                        
                        <div class="prdBuy">
                            <h1>결제 정보</h1>
                            <div class="prdBuy-list">
                                <div>
                                    <span>주문금액</span>
                                    <div>상품금액 940,000원 + 배송비 3,000원</div>
                                </div>
                                <div>
                                    <span>결제금액</span>
                                    <div>923,000원 |카드결제</div>
                                </div>
                                
                            </div>
                        </div>
                        <div class="totalBtn"><a href="/mypage.do"><button class="btn">목록보기</button></a></div>
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
