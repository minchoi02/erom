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
                <div class="title-top"><img src="/resource/img/order-icon.png" /><span>주문/결제</span></div>
                <div class="navi">
                    <span>장바구니</span>
                    <span><i class="xi-angle-right-min"></i></span>
                    <span><strong>주문/결제</strong></span>
                    <span><i class="xi-angle-right-min"></i></span>
                    <span>주문완료</span>
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
                
                <div class="prdReci">
                	<div class="txtArea">
                        <h1>받는 사람 정보</h1>
                        <div class="form-check posiabsol">
                            <input class="form-check-input" type="checkbox" id="checkTrigger1">
                            <label class="form-check-label" for="checkTrigger1">구매자 정보와 동일</label>
                        </div>
                        <div class="address-btn">
                            <button class="btn adr-btn-action">주소지 변경</button>
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
                                    <h1>배송지 선택</h1>
                                    <div class="adrArea">
                                        <div class="adr-list">
                                        	<h2>홍길동</h2>
                                            <span>홍길동 | 세종특별자치시 한누리대로 1168(용호동) | 010-12324-5678 부재시 연락바랍니다.</span>
                                            <div class="adr-btn">
                                            	<button class="btn">선택</button>
                                                <button class="btn">수정</button>
                                            </div>
                                        </div>
                                        <div class="adr-list">
                                        	<h2>홍길동</h2>
                                            <span>홍길동 | 세종특별자치시 한누리대로 1168(용호동) | 010-12324-5678 부재시 연락바랍니다.</span>
                                            <div class="adr-btn">
                                            	<button class="btn">선택</button>
                                                <button class="btn">수정</button>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="pop-btn">
                                        <button class="btn deliAdd">배송지 추가</button>
                                        <div class="writeArea_deli">
                                            <!-- 메뉴 마스크 : 삭제 금지 -->
                                            <div class="detail-mask"></div>
                                            <!-- // 메뉴 마스크 -->
                                            <!-- 메뉴 레이어 -->
                                            <div class="menu-layer">
                                                <button type="button" class="btnClose_deli">
                                                    <span class="line1"></span>
                                                    <span class="line2"></span>
                                                </button>
                                                <h1>나의 배송지 관리</h1>
                                                <div>
                                                    <input type="text" class="form-control" placeholder="배송지명칭">
                                                </div>
                                                <div>
                                                    <input type="text" class="form-control" placeholder="이름">
                                                </div>
                                                <div>
                                                    <input type="text" class="form-control" placeholder="휴대폰번호">
                                                </div>
                                                <div class="post"><input type="text" class="form-control" placeholder="우편번호"><button class="btn">우편번호</button></div>
                                                <div>
                                                    <input type="text" class="form-control" placeholder="나머지주소">
                                                </div>
                                                <div class="select">
                                                    <select class="form-control" name="selec1">
                                                        <option value="">부재시 휴대폰으로 연락바랍니다.</option>
                                                    </select>
                                                </div>
                                                <div class="pop-btn">
                                                	<button class="btn del-btn">삭제하기</button>
                                                    <button class="btn">저장하기</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="prdReci-list">
                    	<div><input type="text" class="form-control" placeholder="이름"></div>
                        <div><input type="text" class="form-control" placeholder="휴대폰번호"></div>
                        <div class="post"><input type="text" class="form-control" placeholder="주소"><button class="btn">우편번호</button></div>
                        <div><input type="text" class="form-control" placeholder="나머지주소"></div>
                        <div><input type="text" class="form-control" placeholder="배송메세지 부재시 휴대폰으로 연락바랍니다."></div>
                    </div>
                </div>
                
                <div class="prdPay">
                	<h1>결제 정보</h1>
                    <div class="prdPay-list">
                    	<div class="coupon">
                        	<h2><strong>쿠폰</strong> (사용가능 쿠폰<span>4장</span>)</h2>
                        	<div class="use">
                                <input type="text" class="form-control" placeholder="5,000"> <span>원</span> 
                                <button class="btn coupon-btn">쿠폰사용</button>
                                <!-- 레이어 -->
                                <div class="writeArea_coupon">
                                    <!-- 메뉴 마스크 : 삭제 금지 -->
                                    <div class="detail-mask"></div>
                                    <!-- // 메뉴 마스크 -->
                                    <!-- 메뉴 레이어 -->
                                    <div class="menu-layer">
                                        <button type="button" class="btnClose_coupon">
                                            <span class="line1"></span>
                                            <span class="line2"></span>
                                        </button>
                                        <h1>쿠폰 사용</h1>
                                        <div class="couponArea">
                                        	<div class="txtArea">
                                            	<span>· 고객님의 쿠폰 중에서 <strong>이 주문에서 사용가능한 쿠폰</strong>을 보여드립니다.</span>
                                                <span>· 보유하고 있는 모든 쿠폰을 확인하시려면 <strong>마이페이지 > 할인쿠폰</strong> 에서 확인하세요</span>
                                            </div>
                                            <div class="coupon-list active">
                                                <h2><strong>5,000</strong>won</h2>
                                                <div class="desc">
                                                    <span>묻지도 짜리리도 않고 지급 쿠폰!</span>
                                                    <p>50만원 이상 구매시 10%할인 | 최대할인액 5,000원 2022-06-01 ~ 2022-06-01</p>
                                                </div>
                                            </div>
                                            <div class="coupon-list">
                                                <h2><strong>1,000</strong>won</h2>
                                                <div class="desc">
                                                    <span>회원 첫 가입 축하 쿠폰</span>
                                                    <p>5만원 이상 구매시 1,000원 할인 2022-06-01 ~ 2022-06-01</p>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="pop-btn">
                                            <button class="btn deliAdd">쿠폰 사용하기</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="point">
                        	<h2><strong>적립금</strong> (사용가능 적립금<span>120,000원</span>)</h2>
                        	<div class="use"><input type="text" class="form-control" placeholder="5,000"> <span>원</span></div>
                        </div>
                    </div>
                </div>
                
                <!-- 토탈 -->
                <div class="totalArea">
                    <div class="totalCost">
                        <h1>총 결제금액</h1>
                        <span>125,000원</span>
                    </div>
                    <div class="totalCost2">
                        <h1>총 상품금액</h1>
                        <span>125,000원</span>
                    </div>
                    <div class="totalDeli">
                        <h1>배송비</h1>
                        <span>0원</span>
                    </div>
                    <div class="totalPoint">
                        <h1>추가 할인 금액</h1>
                        <span>10,000원</span>
                    </div>
                </div>
                <!--// 토탈 -->
                
                <div class="prdPayway">
                	<h1>결제 수단</h1>
                    <div class="prdPayway-list">
                    	<div class="normal">
                            <span>기본결제수단</span>
                            <div>삼성카드 v3 (123445****************061)</div>
                            <div class="pay-btn"><button class="btn">결제수단변경</button></div>
                        </div>
                    </div>
                    <div class="prdPayway-list">
                    	<div class="card">
                            <div class="listInfo">
                                <span>결제수단</span>
                                <div class="select">
                                    <select class="form-control" name="selec1">
                                        <option value="">삼성카드</option>
                                    </select>
                                </div>
                                <div class="form-check posiabsol">
                                    <input class="form-check-input" type="checkbox" id="checkTrigger2">
                                    <label class="form-check-label" for="checkTrigger2">기본 결제수단 등록</label>
                                </div>
                            </div>
                            <div class="listInfo">
                                <span>결제방법</span>
                                <div class="radio">
                                    <div class="custom-control custom-radio">
                                        <input type="radio" id="customRadio3" name="customRadio2" class="custom-control-input" checked="checked">
                                        <label class="custom-control-label" for="customRadio3">신용카드</label>
                                    </div>
                                    
                                    <div class="custom-control custom-radio">
                                        <input type="radio" id="customRadio4" name="customRadio2" class="custom-control-input">
                                        <label class="custom-control-label" for="customRadio4">계좌이체</label>
                                    </div>
                                    
                                    <div class="custom-control custom-radio">
                                        <input type="radio" id="customRadio5" name="customRadio2" class="custom-control-input">
                                        <label class="custom-control-label" for="customRadio5">무통장 입금</label>
                                    </div>
                                    
                                    <div class="custom-control custom-radio">
                                        <input type="radio" id="customRadio6" name="customRadio2" class="custom-control-input">
                                        <label class="custom-control-label" for="customRadio6">휴대폰 결제</label>
                                    </div>
                                    
                                </div>
                            </div>
                            <div class="listInfo">
                                <span>카드 종류</span>
                                <div class="select">
                                    <select class="form-control" name="selec1">
                                        <option value="">선택하세요</option>
                                    </select>
                                </div>
                            </div>
                            <div class="listInfo">
                                <span>할부개월</span>
                                <div class="select">
                                    <select class="form-control" name="selec1">
                                        <option value="">선택하세요</option>
                                    </select>
                                </div>
                                <div class="pay-btn"><button class="btn">무이자 할부혜택</button></div>
                            </div>
                        </div>
                    </div>
                </div>
                
                <div class="prdAgree">
                	<h1>주문자동의</h1>
                    <div class="prdAgree-content">
                    	<h2>개인정보 제공에 대한 동의</h2>
                        <span>개인정보를 제공받는 자 : 에이치솔루션</span>
                        <span>개인정보를 제공받는 자의 개인정보 이용 목적 : 주문상품의 배송, 고객상담 및 불만처리</span>
                        <span>제공하는 개인정보의 항목 : 성명, 주소, 연락처</span>
                        <span>개인정보를 제공받는 자의 개인정보 보유 및 이용기간 : 이용목적 달성 시 까지</span>
                        <div class="confirm">
                        	<p>주문하실 상품, 가격, 배송정보, 할인정보 등을 확인하였으며, 구매에 동의하시겠습니까?</p>
                        	<div class="form-check posiabsol">
                                <input class="form-check-input" type="checkbox" id="checkTrigger3">
                                <label class="form-check-label" for="checkTrigger3">동의합니다.(전자상거래법 제8조 2항)</label>
                            </div>
                        </div>
                    </div>
				</div>
                
                <div class="totalBtn"><a href="order_completion.do"><button class="btn">결제하기</button></a></div>
                
            </div>
        </div>
    </div>
	

<c:import url="/Api/IncludeBottom.do"/>
