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
                        <li ><span><a href="/mypage_point.do">포인트</a></span></li>
                        <li ><span><a href="/mypage_qna.do">상품문의</a></span></li>
                        <li ><span><a href="/mypage_review.do">구매후기</a></span></li>
                        <li class="on"><span><a href="/mypage_modify.do">회원정보수정</a></span></li>
                    </ul>
                </div>
            </div>
            
            <div class="right">
                <div class="modify">
                	<h1>개인정보수정</h1>
                    <div class="infoArea">
                    	<div class="prdBuy">
                            <div class="prdBuy-list">
                                <div>
                                    <span>주문자</span>
                                    <div>${memberInfo.user_nm }</div>
                                </div>
                                <div class="emailModify">
                                    <span>이메일</span>
                                    <div>
                                        ${memberInfo.user_email }
                                        <button class="btn email-btn">이메일변경</button>
                                        <div class="form-check posiabsol">
                                            <input class="form-check-input" type="checkbox" id="checkTrigger3">
                                            <label class="form-check-label" for="checkTrigger3">할인쿠폰/이벤트 이메일 수신동의 (동의여부변경 시, 24시간 이후부터 적용됩니다.)</label>
                                        </div>
                                    </div>
                                </div>
                                <div>
                                    <span class="middle">현재 비밀번호</span>
                                    <div><input type="password" class="form-control-into" placeholder=""></div>
                                </div>
                                <div>
                                    <span class="middle">신규 비밀번호</span>
                                    <div><input type="password" class="form-control-into" placeholder=""></div>
                                </div>
                                <div>
                                    <span class="middle">비밀번호 확인</span>
                                    <div><input type="password" class="form-control-into" placeholder=""></div>
                                </div>
                                <div class="emailModify">
                                    <span>휴대폰번호</span>
                                    <div>
                                        ${memberInfo.user_hp }
                                        <button class="btn email-btn">번호변경</button>
                                        <div class="form-check posiabsol">
                                            <input class="form-check-input" type="checkbox" id="checkTrigger4">
                                            <label class="form-check-label" for="checkTrigger4">할인쿠폰/이벤트 이메일 수신동의 (동의여부변경 시, 24시간 이후부터 적용됩니다.)</label>
                                        </div>
                                    </div>
                                </div>
                                <div class="emailModify">
                                    <span>주소</span>
                                    <div>
                                        ${addrList[0].addr_1} ${addrList[0].addr_2}<br>
                                        <button class="btn deli-btn">배송지관리</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                        <div class="prdReci">
                            <div class="txtArea">
                                <h1>결제 수단</h1>
                                <p>등록카드 2개</p>
                                <div class="address-btn">
                                    <button class="btn adr-btn-action">카드추가</button>
                                </div>
                            </div>
                            <div class="prdPayway-list">
                                <div class="normal">
                                	<div class="list">
                                        <span>기본결제수단</span>
                                        <div>삼성카드 v3 (123445****************061)</div>
                                        <div class="pay-btn">
                                            <div class="form-check posiabsol">
                                                <input class="form-check-input" type="checkbox" id="checkTrigger5">
                                                <label class="form-check-label" for="checkTrigger5">기본 결제수단 등록</label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="list">
                                        <span>기본결제수단</span>
                                        <div>삼성카드 v3 (123445****************061)</div>
                                        <div class="pay-btn">
                                            <div class="form-check posiabsol">
                                                <input class="form-check-input" type="checkbox" id="checkTrigger6">
                                                <label class="form-check-label" for="checkTrigger6">기본 결제수단 등록</label>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                        <div class="prdReci">
                            <div class="txtArea">
                                <h1>카드 정보 입력</h1>
                                <p>(최초 1회만)</p>
                            </div>
                            <div class="prdReci-list">
                                <div class="post"><input type="text" class="form-control" placeholder="카드번호"><button class="btn">등록하기</button></div>
                                <p>홍길동님의신용/체크카드만이용가능합니다</p>
                            </div>
                        </div>
                        
                        
                        
                        <div class="prdPayway">
                            <h1>결제 수단</h1>
                            <div class="prdPayway-list">
                                <div class="card">
                                    <div class="listInfo">
                                        <span>생년월일</span>
                                        <div class="select">
                                            <select class="form-control" name="selec1">
                                                <option value="">1982</option>
                                            </select>
                                        </div>
                                        <div class="select">
                                            <select class="form-control" name="selec1">
                                                <option value="">8</option>
                                            </select>
                                        </div>
                                        <div class="select">
                                            <select class="form-control" name="selec1">
                                                <option value="">12</option>
                                            </select>
                                        </div>
                                        <div class="form-check posiabsol">
                                            <input class="form-check-input" type="checkbox" id="checkTrigger7">
                                            <label class="form-check-label" for="checkTrigger7">마케팅 활용 동의</label>
                                        </div>
                                    </div>
                                    <div class="listInfo">
                                        <span>성별</span>
                                        <div class="radio">
                                            <div class="custom-control custom-radio">
                                                <input type="radio" id="customRadio3" name="customRadio2" class="custom-control-input" checked="checked">
                                                <label class="custom-control-label" for="customRadio3">남자</label>
                                            </div>
                                            
                                            <div class="custom-control custom-radio">
                                                <input type="radio" id="customRadio4" name="customRadio2" class="custom-control-input">
                                                <label class="custom-control-label" for="customRadio4">여자</label>
                                            </div>
                                            
                                            <div class="form-check posiabsol">
                                                <input class="form-check-input" type="checkbox" id="checkTrigger8">
                                                <label class="form-check-label" for="checkTrigger8">마케팅 활용 동의</label>
                                            </div>
                                            
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>	
                    </div>
                    <div class="totalBtn"><button class="btn">취소</button><button class="btn modify-btn">회원정보수정</button></div>
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

