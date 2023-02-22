<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<c:import url="/Api/IncludeTop.do"/>	
	
    <div id="cart" class="order">
    	<div class="sub-top">
        	<div class="inner">
                <div class="title-top"><img src="/resource/img/order-icon.png" /><span>주문완료</span></div>
                <div class="navi">
                    <span>장바구니</span>
                    <span><i class="xi-angle-right-min"></i></span>
                    <span>주문/결제</span>
                    <span><i class="xi-angle-right-min"></i></span>
                    <span><strong>주문완료</strong></span>
                </div>
            </div>
        </div>
    	<div class="inner">
            <div class="orderArea">
                <div class="prdInfo">
                	<h1>주문상품</h1>
                    <div class="prdInfo-list">
                   		<!-- 리스트 -->
                        <div class="listArea">
                            <div class="imgArea"><a href=""><img src="/resource/img/po_product_img4.jpg" /></a></div>
                            <div class="subject">
                                <h1>이벤트 상품 )) 면역비책 발효홍삼</h1>
                                <span>15g x 10포 / 3개입</span>
                                <p>옵션 : 3박스 세트</p>
                            </div>
                            <div class="count">
                                <strong>1</strong><br class="pc-style">수량
                            </div>
                            <div class="cost">
                                <strong>125,000원</strong><br class="pc-style">(10,000원 적립)
                            </div>
                            <div class="deli">
                                <strong>3,000원</strong><br class="pc-style">배송비
                            </div>
                        </div>
                        <!--// 리스트 -->
					</div>
                </div>
                
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
                            <span>이메일</span>
                            <div>ascfcw@naver.com</div>
                        </div>
                    </div>
                </div>
                
                <div class="prdBuy">
                	<h1>받는 사람 정보</h1>
                    <div class="prdBuy-list">
                    	<div>
                            <span>이름</span>
                            <div>홍길동</div>
                        </div>
                        <div>
                            <span>휴대폰번호</span>
                            <div>010-4123-5678</div>
                        </div>
                        <div>
                            <span>주소</span>
                            <div>(12345) 서울특별시 중구 가나다로 123</div>
                        </div>
                        <div>
                            <span>배송메세지</span>
                            <div>부재시 휴대폰으로 연락바랍니다.</div>
                        </div>
                    </div>
                </div>
                
                
                
                <div class="totalBtn"><a href="/index.do"><button class="btn">쇼핑 계속하기</button></a></div>
                
            </div>
        </div>
    </div>
	

<c:import url="/Api/IncludeBottom.do"/>

