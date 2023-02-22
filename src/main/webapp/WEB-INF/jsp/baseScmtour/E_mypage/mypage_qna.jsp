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
                        <li><span><a href="/mypage_point.do">포인트</a></span></li>
                        <li class="on"><span><a href="/mypage_qna.do">상품문의</a></span></li>
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
                	<h1>상품 Q&A</h1>
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
                    <div class="buyList-detail-list">
                    	<!-- 리스트 -->
                        <div class="list-area">
                        	<!-- 리스트 -->
                        	<div class="list-qna-area">
                            	<ul class="list-qna">
                                    <li>
                                        <div class="question">
                                        	<div class="imgArea"><img src="/resource/img/po_product_img4.jpg" /></div>
                                            <div class="txtArea">
                                            	<span class="completion">답변완료</span>
                                                <div class="write-info">2022-09-16</div>
                                                <h3>[이롬플러스 효모비오틴] 문의드립니다. 질문내용을 입력해주세요. [이롬플러스 효모비오틴] 문의드립니다. 질문내용을 입력...</h3>
                                            </div>
                                        </div>
                                        <div class="answer" style="display: none;">
                                        	<div class="aw-list">
                                            	<span class="balloon-q">Q</span>
                                            	<div class="cont">질문 내용을 입력해주세요:)</div>
                                            </div>
                                            <div class="aw-list">
                                            	<span class="balloon-a">A</span>
                                            	<div class="cont">질문 답변을 입력합니다!</div>
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
                                        	<div class="imgArea"><img src="/resource/img/po_product_img4.jpg" /></div>
                                            <div class="txtArea">
                                            	<span class="completion waiting">답변대기</span>
                                                <div class="write-info">2022-09-16</div>
                                                <h3>[이롬플러스 효모비오틴] 문의드립니다. 질문내용을 입력해주세요. [이롬플러스 효모비오틴] 문의드립니다. 질문내용을 입력...</h3>
                                            </div>
                                        </div>
                                        <div class="answer" style="display: none;">
                                        	<div class="aw-list">
                                            	<span class="balloon-q">Q</span>
                                            	<div class="cont">질문 내용을 입력해주세요:)</div>
                                            </div>
                                            <div class="aw-list">
                                            	<span class="balloon-a">A</span>
                                            	<div class="cont">질문 답변을 입력합니다!</div>
                                            </div>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                            <!-- 리스트 -->
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
