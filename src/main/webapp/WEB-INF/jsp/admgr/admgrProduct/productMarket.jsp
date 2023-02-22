<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<c:import url="/Api/admgrIncludeTop.do"/>
<c:import url="/Api/admgrIncludeLeftMenu.do"/>

		<!-- 콘텐츠 영역 { -->
		<div id="content">
			<h1 class="bigTit">이롬스토어</h1>
			<div class="pageComment">
				<div class="comment_ico"><i class="fad fa-comment-alt-smile"></i></div>
				<p>
					이롬스토어 상품을 등록, 관리하는 페이지입니다.<br />
					상태 : 판매중, 노출중지
				</p>
			</div>
			
				<c:import url="./productCommonList.jsp"/>

				<div class="btnarea alignRight mgt30px">
					<a href="/admgr/admgrProduct/productForm.do?store_category=<c:out value="${store_category }"/>" class="btns redbtn"><i class="fal fa-pencil-alt"></i> 상품 등록</a>
				</div>
			</section>
			<!-- } 상품관리 > 서천장터 > 리스트 > 상품관리 -->
		</div>
		<!-- } 콘텐츠 영역 -->


<c:import url="/Api/admgrIncludeBottom.do"/>