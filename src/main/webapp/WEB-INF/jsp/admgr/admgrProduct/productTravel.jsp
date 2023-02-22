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
			<h1 class="bigTit">관광/체험</h1>
			<div class="pageComment">
				<div class="comment_ico"><i class="fad fa-comment-alt-smile"></i></div>
				<p>
					관광/체험 상품을 등록, 관리하는 페이지입니다.<br />
					추천여행상품에 포함된 상품은 삭제가 되지 않습니다.<br />
					상태 : 판매중, 노출중지, 판매종료
				</p>
			</div>
			
			<c:import url="./productCommonList.jsp"/>
			<%--
			<!-- 상품관리 > 관광/체험 > 리스트 > 상품관리 { -->
			<section id="productTravelList" class="page_content">
				<!-- 리스트 검색 { -->
				<div class="list_search_box">
					<ul class="nopm floats">
						<li>
							<select class="basic_select search_select">
								<option>상품명</option>
								<option>업체명</option>
							</select>
						</li>
						<li><input type="text" class="search_input w300px" placeholder="검색어를 입력하세요." /></li>
						<li><button type="submit" class="search_submit"><i class="fal fa-search"></i> 검색</button></li>
						<li class="fr">전체 : <b><fmt:formatNumber value="${paginationInfo.totalRecordCount }" type="number"/></b>건</li>
					</ul>
				</div>
				<!-- } 리스트 검색 -->

				<!-- 탭 버튼 { -->
				<nav id="tab-gnb" class="mgt20px">
					<ul class="nopm floats">
						<li class="active"><a href="./product_travel_list.php">상품관리</a></li>
						<li><a href="./product_travel_dp.php">진열관리</a></li>
						<li class="fr"><a href="#;"><span class="colorRed">판매종료</span></a></li>
					</ul>
				</nav>
				<!-- } 탭 버튼 -->

				<!-- 축제/체험 상품리스트 { -->
				<table class="admin_tbl admin_list_tbl mgt10px">
					<caption>상점 리스트</caption>
					<colgroup>
						<col width="80" />
						<col width="120" />
						<col />
						<col width="150" />
						<col width="120" />
						<col width="120" />
						<col width="80" />
						<col width="100" />
						<col width="130" />
					</colgroup>
					<thead>
						<tr>
							<th>번호</th>
							<th colspan="2">상품명</th>
							<th>판매업체</th>
							<th>판매 시작일시</th>
							<th>판매 종료일시</th>
							<th>조회</th>
							<th>상태</th>
							<th>관리</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td class="alignCenter">2,750</td>
							<td class="alignCenter"><img src="/images/baseScmtour/sample_productimg1.jpg" width="100" /></td>
							<td>알록달록 오색팔찌 만들기 체험</td>
							<td class="alignCenter">실이랑 바늘이랑</td>
							<td class="alignCenter">2020-01-01<br />00:00:00</td>
							<td class="alignCenter">-</td>
							<td class="alignCenter">34,582</td>
							<td class="alignCenter"><span class="btns greenbtn h24px">판매중</span></td>
							<td class="alignCenter">
								<a href="/admgr/admgrProduct/productTravelForm.do" class="btns bluebtn h24px">수정</a>
								<a href="javascript:alert('한번 삭제한 자료는 복구할 방법이 없습니다.\n\n정말 삭제하시겠습니까?');" class="btns lightbluebtn h24px">삭제</a>
							</td>
						</tr>
						<tr>
							<td class="alignCenter">2,749</td>
							<td class="alignCenter"><img src="/images/baseScmtour/sample_productimg2.jpg" width="100" /></td>
							<td><span class="btns aquabtn h24px">추천여행상품</span><br />Mosi 반지만들기(악세서리, 1개)</td>
							<td class="alignCenter">쪽빛아낙네</td>
							<td class="alignCenter">2020-01-01<br />00:00:00</td>
							<td class="alignCenter">-</td>
							<td class="alignCenter">34,582</td>
							<td class="alignCenter"><span class="btns greenbtn h24px">판매중</span></td>
							<td class="alignCenter">
								<a href="/admgr/admgrProduct/productTravelForm.do" class="btns bluebtn h24px">수정</a>
								<a href="javascript:alert('추천여행상품에서 해당상품을 제거 후 삭제해주세요');" class="btns lightbluebtn h24px">삭제</a>
							</td>
						</tr>
						<tr>
							<td class="alignCenter">2,748</td>
							<td class="alignCenter"><img src="/images/baseScmtour/sample_productimg3.jpg" width="100" /></td>
							<td>장항스카이워크(기벌포해전전망대)</td>
							<td class="alignCenter">고살메 갈꽃 체험마을</td>
							<td class="alignCenter">2020-01-01<br />00:00:00</td>
							<td class="alignCenter"><span class="colorRed">2020-03-31<br />23:59:59</span></td>
							<td class="alignCenter">34,582</td>
							<td class="alignCenter"><span class="btns graybtn h24px">판매종료</span></td>
							<td class="alignCenter">
								<a href="/admgr/admgrProduct/productTravelForm.do" class="btns bluebtn h24px">수정</a>
								<a href="javascript:alert('한번 삭제한 자료는 복구할 방법이 없습니다.\n\n정말 삭제하시겠습니까?');" class="btns lightbluebtn h24px">삭제</a>
							</td>
						</tr>
						<tr>
							<td class="alignCenter">2,747</td>
							<td class="alignCenter"><img src="/images/baseScmtour/sample_productimg3.jpg" width="100" /></td>
							<td>장항스카이워크(기벌포해전전망대)</td>
							<td class="alignCenter">고살메 갈꽃 체험마을</td>
							<td class="alignCenter">2020-01-01<br />00:00:00</td>
							<td class="alignCenter">-</td>
							<td class="alignCenter">34,582</td>
							<td class="alignCenter"><span class="btns orangebtn h24px">노출중지</span></td>
							<td class="alignCenter">
								<a href="/admgr/admgrProduct/productTravelForm.do" class="btns bluebtn h24px">수정</a>
								<a href="javascript:alert('한번 삭제한 자료는 복구할 방법이 없습니다.\n\n정말 삭제하시겠습니까?');" class="btns lightbluebtn h24px">삭제</a>
							</td>
						</tr>
						<tr>
							<td class="alignCenter">2,750</td>
							<td class="alignCenter"><img src="/images/baseScmtour/sample_productimg1.jpg" width="100" /></td>
							<td>알록달록 오색팔찌 만들기 체험</td>
							<td class="alignCenter">실이랑 바늘이랑</td>
							<td class="alignCenter">2020-01-01<br />00:00:00</td>
							<td class="alignCenter">2020-03-31<br />23:59:59</td>
							<td class="alignCenter">34,582</td>
							<td class="alignCenter"><span class="btns greenbtn h24px">판매중</span></td>
							<td class="alignCenter">
								<a href="/admgr/admgrProduct/productTravelForm.do" class="btns bluebtn h24px">수정</a>
								<a href="javascript:alert('한번 삭제한 자료는 복구할 방법이 없습니다.\n\n정말 삭제하시겠습니까?');" class="btns lightbluebtn h24px">삭제</a>
							</td>
						</tr>
						<tr>
							<td class="alignCenter">2,749</td>
							<td class="alignCenter"><img src="/images/baseScmtour/sample_productimg2.jpg" width="100" /></td>
							<td><span class="btns aquabtn h24px">추천여행상품</span><br />Mosi 반지만들기(악세서리, 1개)</td>
							<td class="alignCenter">쪽빛아낙네</td>
							<td class="alignCenter">2020-01-01<br />00:00:00</td>
							<td class="alignCenter">2020-03-31<br />23:59:59</td>
							<td class="alignCenter">34,582</td>
							<td class="alignCenter"><span class="btns greenbtn h24px">판매중</span></td>
							<td class="alignCenter">
								<a href="/admgr/admgrProduct/productTravelForm.do" class="btns bluebtn h24px">수정</a>
								<a href="javascript:alert('추천여행상품에서 해당상품을 제거 후 삭제해주세요');" class="btns lightbluebtn h24px">삭제</a>
							</td>
						</tr>
						<tr>
							<td class="alignCenter">2,748</td>
							<td class="alignCenter"><img src="/images/baseScmtour/sample_productimg3.jpg" width="100" /></td>
							<td>장항스카이워크(기벌포해전전망대)</td>
							<td class="alignCenter">고살메 갈꽃 체험마을</td>
							<td class="alignCenter">2020-01-01<br />00:00:00</td>
							<td class="alignCenter"><span class="colorRed">2020-03-31<br />23:59:59</span></td>
							<td class="alignCenter">34,582</td>
							<td class="alignCenter"><span class="btns graybtn h24px">판매종료</span></td>
							<td class="alignCenter">
								<a href="/admgr/admgrProduct/productTravelForm.do" class="btns bluebtn h24px">수정</a>
								<a href="javascript:alert('한번 삭제한 자료는 복구할 방법이 없습니다.\n\n정말 삭제하시겠습니까?');" class="btns lightbluebtn h24px">삭제</a>
							</td>
						</tr>
						<tr>
							<td class="alignCenter">2,747</td>
							<td class="alignCenter"><img src="/images/baseScmtour/sample_productimg2.jpg" width="100" /></td>
							<td>장항스카이워크(기벌포해전전망대)</td>
							<td class="alignCenter">고살메 갈꽃 체험마을</td>
							<td class="alignCenter">2020-01-01<br />00:00:00</td>
							<td class="alignCenter">2020-03-31<br />23:59:59</td>
							<td class="alignCenter">34,582</td>
							<td class="alignCenter"><span class="btns orangebtn h24px">노출중지</span></td>
							<td class="alignCenter">
								<a href="/admgr/admgrProduct/productTravelForm.do" class="btns bluebtn h24px">수정</a>
								<a href="javascript:alert('한번 삭제한 자료는 복구할 방법이 없습니다.\n\n정말 삭제하시겠습니까?');" class="btns lightbluebtn h24px">삭제</a>
							</td>
						</tr>
						<tr>
							<td class="alignCenter">2,748</td>
							<td class="alignCenter"><img src="/images/baseScmtour/sample_productimg1.jpg" width="100" /></td>
							<td>장항스카이워크(기벌포해전전망대)</td>
							<td class="alignCenter">고살메 갈꽃 체험마을</td>
							<td class="alignCenter">2020-01-01<br />00:00:00</td>
							<td class="alignCenter"><span class="colorRed">2020-03-31<br />23:59:59</span></td>
							<td class="alignCenter">34,582</td>
							<td class="alignCenter"><span class="btns graybtn h24px">판매종료</span></td>
							<td class="alignCenter">
								<a href="/admgr/admgrProduct/productTravelForm.do" class="btns bluebtn h24px">수정</a>
								<a href="javascript:alert('한번 삭제한 자료는 복구할 방법이 없습니다.\n\n정말 삭제하시겠습니까?');" class="btns lightbluebtn h24px">삭제</a>
							</td>
						</tr>
						<tr>
							<td class="alignCenter">2,747</td>
							<td class="alignCenter"><img src="/images/baseScmtour/sample_productimg2.jpg" width="100" /></td>
							<td>장항스카이워크(기벌포해전전망대)</td>
							<td class="alignCenter">고살메 갈꽃 체험마을</td>
							<td class="alignCenter">2020-01-01<br />00:00:00</td>
							<td class="alignCenter">2020-03-31<br />23:59:59</td>
							<td class="alignCenter">34,582</td>
							<td class="alignCenter"><span class="btns orangebtn h24px">노출중지</span></td>
							<td class="alignCenter">
								<a href="/admgr/admgrProduct/productTravelForm.do" class="btns bluebtn h24px">수정</a>
								<a href="javascript:alert('한번 삭제한 자료는 복구할 방법이 없습니다.\n\n정말 삭제하시겠습니까?');" class="btns lightbluebtn h24px">삭제</a>
							</td>
						</tr>
					</tbody>
				</table>
				<!-- } 축제/체험 상품리스트 -->

				<div class="pagenation">
					<a href="#;" class="arrow"><i class="far fa-chevron-double-left"></i></a>
					<a href="#;" class="arrow"><i class="far fa-chevron-left"></i></a>
					<a href="#;">48</a>
					<a href="#;">47</a>
					<a href="#;">46</a>
					<span>45</span>
					<a href="#;">44</a>
					<a href="#;">43</a>
					<a href="#;">42</a>
					<a href="#;">41</a>
					<a href="#;">40</a>
					<a href="#;">39</a>
					<a href="#;" class="arrow"><i class="far fa-chevron-right"></i></a>
					<a href="#;" class="arrow"><i class="far fa-chevron-double-right"></i></a>
				</div>
				--%>
				
				<div class="btnarea alignRight mgt30px">
					<a href="/admgr/admgrProduct/productForm.do?store_category=<c:out value="${store_category }"/>" class="btns redbtn"><i class="fal fa-pencil-alt"></i> 관광/체험 등록</a>
				</div>
			</section>
			<!-- } 상품관리 > 관광/체험 > 리스트 > 상품관리 -->
		</div>
		<!-- } 콘텐츠 영역 -->


<c:import url="/Api/admgrIncludeBottom.do"/>