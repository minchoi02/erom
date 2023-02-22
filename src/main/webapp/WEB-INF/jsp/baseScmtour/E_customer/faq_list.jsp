<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<c:import url="/Api/IncludeTop.do"/>	
	
	
	<!-- 서브비주얼 영역 -->
  <div id="sub_visual" class="sub_visual3">
  		<div class="inner">
          <div class="navigation">홈 <span>고객센터</span> <span class="last">FAQ</span></div>
          <div class="sub-title">FAQ</div>
      </div>
	</div>
	<!-- // 서브비주얼 영역 -->
    
	<!-- 컨테이너 -->
    <div id="container">
        <!-- 상품리스트 -->
        <div class="product-list board-list">
            <div class="inner clearfix">
            	<ul id="tab2">
                    <li><a href="/notice_list.do;">공지사항</a></li>
                    <li class="on"><a href="/faq_list.do;">FAQ</a></li>
                </ul>
                <div id="faq-tab" class="pc-style">
                	<ul>
                        <li class="on"><a href="#;">전체</a></li>
                        <li><a href="#;">주문결제</a></li>
                        <li><a href="#;">배송</a></li>
                        <li><a href="#;">취소/교환/환불</a></li>
                    </ul>
                </div>
                <div class="dep-menu mobile-style">
                    <a href="javascript:;" class="on">전체</a>
                    <ul class="dropdown">
                        <li class="on"><a href="#;">전체</a></li>
                        <li><a href="#;">주문결제</a></li>
                        <li><a href="#;">배송</a></li>
                        <li><a href="#;">취소/교환/환불</a></li>
                    </ul>
                </div>
				<div class="prd-sort absol noti-sort">
                    <div class="search-bar">
                    <input name="" type="text" class="search-input" placeholder="검색어를 입력하세요">
                    <a href="#;"><i class="xi-search"></i></a>
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
                <div class="bo_list_noti list-area">
                    <!-- 리스트 -->
                    <div class="list-qna-area">
                        <ul class="list-qna">
                            <li>
                                <div class="question">
                                    <div class="qt-list">
                                        <span class="balloon-q">Q</span>
                                        <div class="cate">주문결제</div>
                                        <div class="cont">이미 주문을 했는데 결제수단을 변경할 수 있나요?미 주문을 했는데 결제수단을 변경할 수 있나요?</div>
                                        <i class="xi-angle-down-thin"></i>
                                    </div>
                                </div>
                                <div class="answer">
                                    <div class="aw-list">
                                        <span class="balloon-a">A</span>
                                        <div class="cont">
                                        결제완료 이후에는 결제수단 변경은 																																																																								가능하지 않습니다. <br />주문 취소 후 원하시는 결제수단으로 다시 한 번 구매하여 주시기 바랍니다
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
                                    <div class="qt-list">
                                        <span class="balloon-q">Q</span>
                                        <div class="cate">취소/교환/환불</div>
                                        <div class="cont">이미 주문을 했는데 결제수단을 변경할 수 있나요?</div>
                                        <i class="xi-angle-down-thin"></i>
                                    </div>
                                </div>
                                <div class="answer">
                                    <div class="aw-list">
                                        <span class="balloon-a">A</span>
                                        <div class="cont">
                                        결제완료 이후에는 결제수단 변경은 가능하지 않습니다. <br />주문 취소 후 원하시는 결제수단으로 다시 한 번 구매하여 주시기 바랍니다
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
                                    <div class="qt-list">
                                        <span class="balloon-q">Q</span>
                                        <div class="cate">배송</div>
                                        <div class="cont">이미 주문을 했는데 결제수단을 변경할 수 있나요?</div>
                                        <i class="xi-angle-down-thin"></i>
                                    </div>
                                </div>
                                <div class="answer">
                                    <div class="aw-list">
                                        <span class="balloon-a">A</span>
                                        <div class="cont">
                                        결제완료 이후에는 결제수단 변경은 가능하지 않습니다. <br />주문 취소 후 원하시는 결제수단으로 다시 한 번 구매하여 주시기 바랍니다
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
                </div>
                <!--// 상품문의 -->
			</div>
        </div>
    </div>
    <!-- // 컨테이너 -->

<c:import url="/Api/IncludeBottom.do"/>
