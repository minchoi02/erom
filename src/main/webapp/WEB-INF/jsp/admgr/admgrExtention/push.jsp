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
			<h1 class="bigTit">푸시관리 - 작업대기</h1>
			<div class="pageComment">
				<div class="comment_ico"><i class="fad fa-comment-alt-smile"></i></div>
				<p>
					휴대폰 푸시를 관리합니다.
				</p>
			</div>
			
			<!-- 부가기능 > 푸시관리 { -->
			<section id="pushState" class="page_content floats">
				<div class="lcon lconbox">
					<!-- 푸시 입력 { -->
					<h2 class="h2Tit"><i class="fal fa-window-minimize"></i> 푸시 입력</h2>
					<table class="admin_tbl admin_write_tbl">
						<caption>푸시 입력</caption>
						<colgroup>
							<col />
						</colgroup>
						<tbody>
							<tr>
								<td>
									<p class="comment">내용</p>
									<textarea type="text" autocomplete="no" id="" name="" class="admin_textarea w100" value="" /></textarea>
								</td>
							</tr>
							<tr>
								<td>
									<p class="comment">링크</p>
									<input type="text" id="" name="" class="admin_input w100" />
								</td>
							</tr>
							<tr>
								<td>
									<p class="comment">푸시일시</p>
									<input type="text" id="" name="" class="admin_input datepicker" size="15" placeholder="날짜" />
									<input type="text" id="" name="" class="admin_input" size="13" placeholder="예) 00:00:00" />
								</td>
							</tr>
						</tbody>
					</table>
					<!-- } 푸시 입력 -->

					<div class="btnarea alignRight mgt20px">
						<a href="javascript:alert('등록되었습니다.');" class="btns redbtn"><i class="far fa-save"></i> 등록</a>
					</div>
				</div>
				<div class="rcon">
					<!-- 리스트 검색 { -->
					<div class="list_search_box">
						<ul class="nopm floats">
							<li><input type="text" class="search_input w300px" placeholder="검색어를 입력하세요." /></li>
							<li><button type="submit" class="search_submit"><i class="fal fa-search"></i> 검색</button></li>
							<li class="fr">전체 : <b>2,489</b>건</li>
						</ul>
					</div>
					<!-- } 리스트 검색 -->
					
					<!-- 푸시 리스트 { -->
					<table class="admin_tbl admin_list_tbl mgt10px">
						<caption>푸시 리스트</caption>
						<colgroup>
							<col width="100" />
							<col />
							<col />
							<col width="100" />
							<col width="130" />
						</colgroup>
						<thead>
							<tr>
								<th>등록일시</th>
								<th>내용</th>
								<th>링크</th>
								<th>푸시일시</th>
								<th>관리</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td class="alignCenter fsize13">2020-05-05<br />18:24:37</td>
								<td>당신을 위한 단 하나의 이벤트!</td>
								<td><a href="#;" class="colorBlue">http://plancard.net/site/scmtour/admin/premium_mainslide_list.php</a></td>
								<td class="alignCenter fsize13">2020-05-05<br />18:24:37</td>
								<td class="alignCenter">
									<a href="#;" class="btns bluebtn h24px">수정</a>
									<a href="javascript:alert('한번 삭제한 자료는 복구할 방법이 없습니다.\n\n정말 삭제하시겠습니까?');" class="btns lightbluebtn h24px">삭제</a>
								</td>
							</tr>
						</tbody>
					</table>
					<!-- } 푸시 리스트 -->

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
				</div>
			</section>
			<!-- } 부가기능 > 푸시관리 -->
		</div>
		<!-- } 콘텐츠 영역 -->


<c:import url="/Api/admgrIncludeBottom.do"/>