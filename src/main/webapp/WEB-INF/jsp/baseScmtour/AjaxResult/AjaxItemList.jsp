<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:if test="${store_category eq 'CD002001' || store_category eq 'CD002002' || store_category eq 'CD002003'}">
				<ul class="nopm" style="margin-top: 1em;">
					<c:forEach var="siteProdList" items="${siteProdList}" varStatus="status">
					<c:choose>
					<c:when test="${not empty user_id }">
						<c:set var="func_ajax_pick" value="prod_ajax_pick('${siteProdList.prod_id }')" />
					</c:when>
					<c:otherwise>
						<c:set var="func_ajax_pick" value="getLogin('/shop/itemList.do?store_category=${store_category }')"/>
					</c:otherwise>
					</c:choose>
					<li>
						<a href="/shop/itemView.do?store_category=<c:out value="${store_category}"/>&prod_id=<c:out value="${siteProdList.prod_id }"/>" class="productbox">
							<em class="pic"><img src="/cmm/fms/getImage.do?atchFileId=<c:out value="${siteProdList.prod_img_1}"/>&fileSn=0" style="width: 100%;" onerror="this.src='/images/baseScmtour/_noImage.png';"/></em>
							<em class="txt w100">
								<span class="subject"><c:out value="${siteProdList.prod_nm }"/> <small><c:out value="${siteProdList.store_nm}"/></small></span>
								<span class="subcon">
									<c:out value="${siteProdList.prod_comment }"/>
								</span>
							</em>
						</a>
						<a href="#;" id="prod_pick_<c:out value="${siteProdList.prod_id }"/>" class="heartbox <c:if test="${isProdFav eq 'Y' }">active</c:if>" onclick="<c:out value="${func_ajax_pick}"/>"><i class="fas fa-heart"></i></a>
					</li>
					</c:forEach>
				</ul>
				<c:if test="${LastNum < ListCnt }">
				<div class="btnarea mgt10px" id="moreCall">
					<a href="javascript:getItemList(); " class="btns graybtn w100">더보기 <i class="fal fa-plus"></i></a>
				</div>
				</c:if>
</c:if>


<c:if test="${store_category eq 'CD002004' }">
				<ul class="nopm floats" >
					<c:forEach var="siteProdList" items="${siteProdList}" varStatus="status">
					<li>
						<a href="/shop/itemView.do?store_category=<c:out value="${store_category}"/>&prod_category=<c:out value="${siteProdList.prod_category }"/>&prod_id=<c:out value="${siteProdList.prod_id }"/>" class="pic"><img src="/cmm/fms/getImage.do?atchFileId=<c:out value="${siteProdList.prod_img_1}"/>&fileSn=0" style="width: 100%;" onerror="this.src='/images/baseScmtour/_noImage.png';"/></a>
						<a href="/shop/itemView.do?store_category=<c:out value="${store_category}"/>&prod_category=<c:out value="${siteProdList.prod_category }"/>&prod_id=<c:out value="${siteProdList.prod_id }"/>" class="txt">
							<span class="store">[<c:out value="${siteProdList.store_nm }"/>]</span>
							<em class="subject"><c:out value="${siteProdList.prod_nm }"/></em>
							<span class="price"><fmt:formatNumber value="${siteProdList.prod_price}" type="number"/> <small>원</small></span>
						</a>
					</li>
					</c:forEach>
				</ul>
				<c:if test="${LastNum < ListCnt }">
				<div class="btnarea mgt10px" id="moreCall">
					<a href="javascript:getItemList(); " class="btns graybtn w100">더보기 <i class="fal fa-plus"></i></a>
				</div>
				</c:if>
</c:if>

<c:if test="${store_category eq 'CD002005' }">
				<ul class="nopm">
				<c:forEach var="siteProdList" items="${siteProdList}" varStatus="status">
				<script>
				var img_arr = new Array();
				</script>
				<c:set var="cnt" value="1"/>
				<c:set var="recom_start" value=""/>
				<c:set var="recom_end" value=""/>
				<c:set var="recom_start_img" value=""/>
				<c:set var="recom_end_img" value=""/>
				<c:set var="recom_middle_img" value=""/>
				<c:set var="recom_cnt" value="0"/>
				 <c:if test="${siteProdList.recom_1_use_st eq 'Y' }">
				 	<c:set var="recom_start" value="${siteProdList.recom_1_prod_nm }"/>
				 	<c:set var="recom_end" value="${siteProdList.recom_1_prod_nm }"/>
			 	 	<c:set var="recom_start_img" value="${siteProdList.recom_1_img }"/>
				 	<c:set var="recom_end_img" value="${siteProdList.recom_1_img}"/>
				 	<c:set var="recom_cnt" value="${recom_cnt+1}"/>
				 	<script>img_arr.push('<c:out value="${siteProdList.recom_1_img }"/>')</script>
				 </c:if>
				 <c:if test="${siteProdList.recom_2_use_st eq 'Y' }">
				 	 <c:if test="${empty recom_start }">
				 	 	<c:set var="recom_start" value="${siteProdList.recom_2_prod_nm }"/>
				 	 	<c:set var="recom_start_img" value="${siteProdList.recom_2_img }"/>
				 	 </c:if>
				 	<c:set var="recom_end" value="${siteProdList.recom_2_prod_nm }"/>
				 	<c:set var="recom_end_img" value="${siteProdList.recom_2_img}"/>
				 	<c:set var="recom_cnt" value="${recom_cnt+1}"/>
				 	<script>img_arr.push('<c:out value="${siteProdList.recom_2_img }"/>')</script>
				 </c:if>
				 <c:if test="${siteProdList.recom_3_use_st eq 'Y' }">
				 	 <c:if test="${empty recom_start }">
				 	 	<c:set var="recom_start" value="${siteProdList.recom_3_prod_nm }"/>
				 	 	<c:set var="recom_start_img" value="${siteProdList.recom_3_img }"/>
				 	 </c:if>
				 	<c:set var="recom_end" value="${siteProdList.recom_3_prod_nm }"/>
				 	<c:set var="recom_end_img" value="${siteProdList.recom_3_img}"/>
				 	<c:set var="recom_cnt" value="${recom_cnt+1}"/>
				 	<script>img_arr.push('<c:out value="${siteProdList.recom_3_img }"/>')</script>
				 </c:if>
				 <c:if test="${siteProdList.recom_4_use_st eq 'Y' }">
				 	 <c:if test="${empty recom_start }">
				 	 	<c:set var="recom_start" value="${siteProdList.recom_4_prod_nm }"/>
				 	 	<c:set var="recom_start_img" value="${siteProdList.recom_4_img }"/>
				 	 </c:if>
				 	<c:set var="recom_end" value="${siteProdList.recom_4_prod_nm }"/>
				 	<c:set var="recom_cnt" value="${recom_cnt+1}"/>
				 	<script>img_arr.push('<c:out value="${siteProdList.recom_4_img }"/>')</script>
				 </c:if>
				 <c:if test="${siteProdList.recom_5_use_st eq 'Y' }">
				 	 <c:if test="${empty recom_start }">
				 	 	<c:set var="recom_start" value="${siteProdList.recom_5_prod_nm }"/>
				 	 	<c:set var="recom_start_img" value="${siteProdList.recom_5_img }"/>
				 	 </c:if>
				 	<c:set var="recom_end" value="${siteProdList.recom_5_prod_nm }"/>
				 	<c:set var="recom_end_img" value="${siteProdList.recom_5_img}"/>
				 	<c:set var="recom_cnt" value="${recom_cnt+1}"/>
				 	<script>img_arr.push('<c:out value="${siteProdList.recom_5_img }"/>')</script>
				 </c:if>
				 <c:if test="${siteProdList.recom_6_use_st eq 'Y' }">
				 	 <c:if test="${empty recom_start }">
				 	 	<c:set var="recom_start" value="${siteProdList.recom_6_prod_nm }"/>
				 	 	<c:set var="recom_start_img" value="${siteProdList.recom_6_img }"/>
				 	 </c:if>
				 	<c:set var="recom_end" value="${siteProdList.recom_6_prod_nm }"/>
				 	<c:set var="recom_end_img" value="${siteProdList.recom_6_img}"/>
				 	<c:set var="recom_cnt" value="${recom_cnt+1}"/>
				 	<script>img_arr.push('<c:out value="${siteProdList.recom_6_img }"/>')</script>
				 </c:if>
				 <c:if test="${siteProdList.recom_7_use_st eq 'Y' }">
				 	 <c:if test="${empty recom_start }">
				 	 	<c:set var="recom_start" value="${siteProdList.recom_7_prod_nm }"/>
				 	 	<c:set var="recom_start_img" value="${siteProdList.recom_7_img }"/>
				 	 </c:if>
				 	<c:set var="recom_end" value="${siteProdList.recom_7_prod_nm }"/>
				 	<c:set var="recom_end_img" value="${siteProdList.recom_7_img}"/>
				 	<c:set var="recom_cnt" value="${recom_cnt+1}"/>
				 	<script>img_arr.push('<c:out value="${siteProdList.recom_7_img }"/>')</script>
				 </c:if>
				 <c:if test="${siteProdList.recom_8_use_st eq 'Y' }">
				 	 <c:if test="${empty recom_start }">
				 	 	<c:set var="recom_start" value="${siteProdList.recom_8_prod_nm }"/>
				 	 	<c:set var="recom_start_img" value="${siteProdList.recom_8_img }"/>
				 	 </c:if>
				 	<c:set var="recom_end" value="${siteProdList.recom_8_prod_nm }"/>
				 	<c:set var="recom_end_img" value="${siteProdList.recom_8_img}"/>
				 	<c:set var="recom_cnt" value="${recom_cnt+1}"/>
				 	<script>img_arr.push('<c:out value="${siteProdList.recom_8_img }"/>')</script>
				 </c:if>
				 <c:if test="${siteProdList.recom_9_use_st eq 'Y' }">
				 	 <c:if test="${empty recom_start }">
				 	 	<c:set var="recom_start" value="${siteProdList.recom_9_prod_nm }"/>
				 	 	<c:set var="recom_start_img" value="${siteProdList.recom_9_img }"/>
				 	 </c:if>
				 	<c:set var="recom_end" value="${siteProdList.recom_9_prod_nm }"/>
				 	<c:set var="recom_end_img" value="${siteProdList.recom_9_img}"/>
				 	<c:set var="recom_cnt" value="${recom_cnt+1}"/>
				 	<script>img_arr.push('<c:out value="${siteProdList.recom_9_img }"/>')</script>
				 </c:if>
				 <c:if test="${siteProdList.recom_10_use_st eq 'Y' }">
				 	 <c:if test="${empty recom_start }">
				 	 	<c:set var="recom_start" value="${siteProdList.recom_10_prod_nm }"/>
				 	 	<c:set var="recom_start_img" value="${siteProdList.recom_10_img }"/>
				 	 </c:if>
				 	<c:set var="recom_end" value="${siteProdList.recom_10_prod_nm }"/>
				 	<c:set var="recom_end_img" value="${siteProdList.recom_10_img}"/>
				 	<c:set var="recom_cnt" value="${recom_cnt+1}"/>
				 	<script>img_arr.push('<c:out value="${siteProdList.recom_10_img }"/>')</script>
				 </c:if>
				<li class="swiper-slide">
					<a href="/shop/itemView.do?store_category=CD002005&prod_id=<c:out value="${siteProdList.prod_id }"/>">
						<strong class="tit"><c:out value="${siteProdList.prod_nm }"/></strong>
						<span class="subtxt"><c:out value="${siteProdList.prod_comment}"/></span>
						<em class="tourgraph">
							<span class="won wonleft"><c:out value="${recom_start }"/></span>
							<span class="toursize">경유 <c:out value="${recom_cnt-2}"/>+</span>
							<span class="won wonright"><c:out value="${recom_end}"/></span>
						</em>
					</a>
					<ul class="nopm floats rpic rpic3">
						<li><a href="/shop/itemView.do?store_category=CD002005&prod_id=<c:out value="${siteProdList.prod_id }"/>"><img src="/cmm/fms/getImage.do?atchFileId=<c:out value="${recom_start_img}"/>&fileSn=0" style="width: 100%;" onerror="this.src='/images/baseScmtour/_noImage.png';"/></a></li>
						<li><a href="/shop/itemView.do?store_category=CD002005&prod_id=<c:out value="${siteProdList.prod_id }"/>" id="middle_img_<c:out value="${siteProdList.prod_id }"/>_<c:out value="${cnt}"/>"></a></li>
						<li><a href="/shop/itemView.do?store_category=CD002005&prod_id=<c:out value="${siteProdList.prod_id }"/>"><img src="/cmm/fms/getImage.do?atchFileId=<c:out value="${recom_end_img}"/>&fileSn=0" style="width: 100%;" onerror="this.src='/images/baseScmtour/_noImage.png';"/></a></a></li>
					</ul>
					<script>
					var rand_start_num = 1;
					var rand_end_num = img_arr.length-2;
					var rand_num = Math.floor(Math.random()*rand_end_num) + rand_start_num;
					//console.log(rand_num);
					//console.log(img_arr[rand_num]);
					//console.log(img_arr[2]);
					var middle_img_tag = "<img src=\"/cmm/fms/getImage.do?atchFileId="+img_arr[rand_num]+"&fileSn=0\" onerror=\"this.src='/images/baseScmtour/_noImage.png';\"/>";
					$("#middle_img_<c:out value="${siteProdList.prod_id }"/>_<c:out value="${cnt}"/>").html(middle_img_tag);
					</script>
				</li>
				<c:set var="cnt" value="${cnt +1 }"/>
			</c:forEach>
			</ul>
			<c:if test="${LastNum < ListCnt }">
			<div class="btnarea mgt10px" id="moreCall">
				<a href="javascript:getItemList(); " class="btns graybtn w100">더보기 <i class="fal fa-plus"></i></a>
			</div>
			</c:if>
</c:if>			