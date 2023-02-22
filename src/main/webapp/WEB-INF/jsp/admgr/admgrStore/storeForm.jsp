<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<c:import url="/Api/admgrIncludeTop.do"/>
<c:import url="/Api/admgrIncludeLeftMenu.do"/>

<!-- 상점아이디 -->
<c:choose>
	<c:when test="${empty store_seq}">
		<c:set var="btn_title" value="등록"/>
		<c:set var="stord_id" value="${StoreId }"/>
		<c:set var="store_travel_calc_percent" value="0"/>
		<c:set var="store_house_calc_percent" value="0"/>
		<c:set var="store_food_calc_percent" value="0"/>
		<c:set var="store_market_calc_percent" value="0"/>
		<c:set var="store_travel_return_day_7" value="0"/>
		<c:set var="store_travel_return_day_5" value="0"/>
		<c:set var="store_travel_return_day_3" value="0"/>
		<c:set var="store_travel_return_day_2" value="0"/>
		<c:set var="store_travel_return_day_1" value="0"/>
		<c:set var="store_travel_return_day_0" value="0"/>
		<c:set var="store_house_return_day_7" value="0"/>
		<c:set var="store_house_return_day_5" value="0"/>
		<c:set var="store_house_return_day_3" value="0"/>
		<c:set var="store_house_return_day_2" value="0"/>
		<c:set var="store_house_return_day_1" value="0"/>
		<c:set var="store_house_return_day_0" value="0"/>
		<c:set var="store_food_return_day_7" value="0"/>
		<c:set var="store_food_return_day_5" value="0"/>
		<c:set var="store_food_return_day_3" value="0"/>
		<c:set var="store_food_return_day_2" value="0"/>
		<c:set var="store_food_return_day_1" value="0"/>
		<c:set var="store_food_return_day_0" value="0"/>
		<c:set var="store_market_default_delivery_price" value="0"/>
		<c:set var="store_market_free_delivery_price" value="0"/>
		<c:set var="store_market_jeju_delivery_price" value="0"/>
		<c:set var="store_info_1" value="${BaseConfig.info_1}"/>
		<c:set var="store_info_2" value="${BaseConfig.info_2}"/>
		<c:set var="store_info_3" value="${BaseConfig.info_3}"/>
		<c:set var="store_info_4" value="${BaseConfig.info_4}"/>
		<c:set var="store_info_5" value="${BaseConfig.info_5}"/>

		<c:set var="store_info1_1" value="${storeInfo.store_nm }"/>
		<c:set var="store_info1_2" value="상품상세설명 참조"/>
		<c:set var="store_info1_3" value="상품상세설명 참조"/>
		<c:set var="store_info1_4" value="상품상세설명 참조"/>
		<c:set var="store_info1_5" value="${storeInfo.store_nm } ${storeInfo.store_tel}"/>
		
		<c:set var="store_info2_1" value="충남 서천"/>
		<c:set var="store_info2_2" value=""/>
		<c:set var="store_info2_3" value="상품상세설명 참조"/>
		<c:set var="store_info2_4" value="상품상세설명 참조"/>
		<c:set var="store_info2_5" value="상품상세설명 참조"/>
		<c:set var="store_info2_6" value="상품상세설명 참조"/>
		<c:set var="store_info2_7" value="${storeInfo.store_nm } ${storeInfo.store_tel}"/>
		
		<c:set var="store_info3_1" value="충남 서천"/>
		<c:set var="store_info3_2" value="${storeInfo.store_nm } / ${storeInfo.store_addr_1 } ${storeInfo.store_addr_2}"/>
		<c:set var="store_info3_3" value="주문 후 제조"/>
		<c:set var="store_info3_4" value="상품상세설명 참조"/>
		<c:set var="store_info3_5" value="상품상세설명 참조"/>
		<c:set var="store_info3_6" value="상품상세설명 참조"/>
		<c:set var="store_info3_7" value="해당없음"/>
		<c:set var="store_info3_8" value="해당없음"/>
		<c:set var="store_info3_9" value="해당없음"/>
		<c:set var="store_info3_10" value="${storeInfo.store_nm } ${storeInfo.store_tel}"/>
		
		<c:set var="store_info4_1" value="상품상세설명 참조"/>
		<c:set var="store_info4_2" value="상품상세설명 참조"/>
		<c:set var="store_info4_3" value="상품상세설명 참조"/>
		<c:set var="store_info4_4" value="제품에 별도 표기"/>
		<c:set var="store_info4_5" value="해당없음"/>
		<c:set var="store_info4_6" value="해당없음"/>
		<c:set var="store_info4_7" value="해당없음"/>
		<c:set var="store_info4_8" value="해당없음"/>
		<c:set var="store_info4_9" value="상품상세설명 참조"/>
		<c:set var="store_info4_10" value=""/>
		<c:set var="store_info4_11" value="${storeInfo.store_nm } ${storeInfo.store_tel}"/>
		
		<c:set var="store_info5_1" value=""/>
		<c:set var="store_info5_2" value="상품상세설명 참조"/>
		<c:set var="store_info5_3" value="상품상세설명 참조"/>
		<c:set var="store_info5_4" value="상품상세설명 참조"/>
		<c:set var="store_info5_5" value="상품상세설명 참조"/>
		<c:set var="store_info5_6" value="상품상세설명 참조"/>
		<c:set var="store_info5_7" value="해당없음"/>
		<c:set var="store_info5_8" value="해당없음"/>
		<c:set var="store_info5_9" value="해당없음"/>
		<c:set var="store_info5_10" value="${storeInfo.store_nm } ${storeInfo.store_tel}"/>
		
		<c:set var="store_info6_1" value="건강기능식품"/>
		<c:set var="store_info6_2" value="상품상세설명 참조"/>
		<c:set var="store_info6_3" value="제품에 별도 표기"/>
		<c:set var="store_info6_4" value="상품상세설명 참조"/>
		<c:set var="store_info6_5" value="상품상세설명 참조"/>
		<c:set var="store_info6_6" value="상품상세설명 참조"/>
		<c:set var="store_info6_7" value="상품상세설명 참조"/>
		<c:set var="store_info6_8" value="상품상세설명 참조"/>
		<c:set var="store_info6_9" value="본 제품은 건강기능식품으로 질병의 예방 및 치료를 위한 의약품이 아닙니다."/>
		<c:set var="store_info6_10" value="해당없음"/>
		<c:set var="store_info6_11" value="본 제품은 건강기능식품 표시광고 사전심의필을 받았습니다."/>
		<c:set var="store_info6_12" value="해당없음"/>
		<c:set var="store_info6_13" value="${storeInfo.store_nm } ${storeInfo.store_tel}"/>
		
		<c:set var="store_info7_1" value="상품상세설명 참조"/>
		<c:set var="store_info7_2" value="상품상세설명 참조"/>
		<c:set var="store_info7_3" value="제품에 별도 표기"/>
		<c:set var="store_info7_4" value="제품에 별도 표기"/>
		<c:set var="store_info7_5" value="상품상세설명 참조"/>
		<c:set var="store_info7_6" value="대한민국"/>
		<c:set var="store_info7_7" value="제품에 별도 표기"/>
		<c:set var="store_info7_8" value="해당없음"/>
		<c:set var="store_info7_9" value="제품에 별도 표기"/>
		<c:set var="store_info7_10" value="본 상품은 공정거래위원회 고시 소비자 분쟁해결기준에 의거 보상해 드립니다."/>
		<c:set var="store_info7_11" value="${storeInfo.store_nm } ${storeInfo.store_tel}"/>
		
		<c:set var="store_info8_1" value="상품상세설명 참조"/>
		<c:set var="store_info8_2" value="상품상세설명 참조"/>
		<c:set var="store_info8_3" value="대한민국 / 강원도 춘천"/>
		<c:set var="store_info8_4" value="해당없음"/>
		<c:set var="store_info8_5" value="${storeInfo.store_nm } ${storeInfo.store_tel}"/>
		
	</c:when>
	<c:otherwise>
		<c:set var="btn_title" value="수정"/>
		<c:set var="stord_id" value="${storeInfo.store_id }"/>
		<c:set var="store_travel_calc_percent" value="${storeInfo.store_travel_calc_percent }"/>
		<c:set var="store_house_calc_percent" value="${storeInfo.store_house_calc_percent }"/>
		<c:set var="store_food_calc_percent" value="${storeInfo.store_food_calc_percent }"/>
		<c:set var="store_market_calc_percent" value="${storeInfo.store_market_calc_percent }"/>
		<c:set var="store_travel_return_day_7" value="${storeInfo.store_travel_return_day_7 }"/>
		<c:set var="store_travel_return_day_5" value="${storeInfo.store_travel_return_day_5 }"/>
		<c:set var="store_travel_return_day_3" value="${storeInfo.store_travel_return_day_3 }"/>
		<c:set var="store_travel_return_day_2" value="${storeInfo.store_travel_return_day_2 }"/>
		<c:set var="store_travel_return_day_1" value="${storeInfo.store_travel_return_day_1 }"/>
		<c:set var="store_travel_return_day_0" value="${storeInfo.store_travel_return_day_0 }"/>
		<c:set var="store_house_return_day_7" value="${storeInfo.store_house_return_day_7 }"/>
		<c:set var="store_house_return_day_5" value="${storeInfo.store_house_return_day_5 }"/>
		<c:set var="store_house_return_day_3" value="${storeInfo.store_house_return_day_3 }"/>
		<c:set var="store_house_return_day_2" value="${storeInfo.store_house_return_day_2 }"/>
		<c:set var="store_house_return_day_1" value="${storeInfo.store_house_return_day_1 }"/>
		<c:set var="store_house_return_day_0" value="${storeInfo.store_house_return_day_0 }"/>
		<c:set var="store_food_return_day_7" value="${storeInfo.store_food_return_day_7 }"/>
		<c:set var="store_food_return_day_5" value="${storeInfo.store_food_return_day_5 }"/>
		<c:set var="store_food_return_day_3" value="${storeInfo.store_food_return_day_3 }"/>
		<c:set var="store_food_return_day_2" value="${storeInfo.store_food_return_day_2 }"/>
		<c:set var="store_food_return_day_1" value="${storeInfo.store_food_return_day_1 }"/>
		<c:set var="store_food_return_day_0" value="${storeInfo.store_food_return_day_0 }"/>
		<c:set var="store_market_default_delivery_price" value="${storeInfo.store_market_default_delivery_price }"/>
		<c:set var="store_market_free_delivery_price" value="${storeInfo.store_market_free_delivery_price }"/>
		<c:set var="store_market_jeju_delivery_price" value="${storeInfo.store_market_jeju_delivery_price }"/>	
		<c:set var="store_info_1" value="${storeInfo.store_info_1}"/>
		<c:set var="store_info_2" value="${storeInfo.store_info_2}"/>
		<c:set var="store_info_3" value="${storeInfo.store_info_3}"/>
		<c:set var="store_info_4" value="${storeInfo.store_info_4}"/>
		<c:set var="store_info_5" value="${storeInfo.store_info_5}"/>	

		<c:set var="store_info1_1" value="${storeInfo.store_info1_1 }"/>
		<c:set var="store_info1_2" value="${storeInfo.store_info1_2 }"/>
		<c:set var="store_info1_3" value="${storeInfo.store_info1_3 }"/>
		<c:set var="store_info1_4" value="${storeInfo.store_info1_4 }"/>
		<c:set var="store_info1_5" value="${storeInfo.store_info1_5 }"/>
		
		<c:set var="store_info2_1" value="${storeInfo.store_info2_1 }"/>
		<c:set var="store_info2_2" value="${storeInfo.store_info2_2 }"/>
		<c:set var="store_info2_3" value="${storeInfo.store_info2_3 }"/>
		<c:set var="store_info2_4" value="${storeInfo.store_info2_4 }"/>
		<c:set var="store_info2_5" value="${storeInfo.store_info2_5 }"/>
		<c:set var="store_info2_6" value="${storeInfo.store_info2_6 }"/>
		<c:set var="store_info2_7" value="${storeInfo.store_info2_7 }"/>
		
		<c:set var="store_info3_1" value="${storeInfo.store_info3_1 }"/>
		<c:set var="store_info3_2" value="${storeInfo.store_info3_2 }"/>
		<c:set var="store_info3_3" value="${storeInfo.store_info3_3 }"/>
		<c:set var="store_info3_4" value="${storeInfo.store_info3_4 }"/>
		<c:set var="store_info3_5" value="${storeInfo.store_info3_5 }"/>
		<c:set var="store_info3_6" value="${storeInfo.store_info3_6 }"/>
		<c:set var="store_info3_7" value="${storeInfo.store_info3_7 }"/>
		<c:set var="store_info3_8" value="${storeInfo.store_info3_8 }"/>
		<c:set var="store_info3_9" value="${storeInfo.store_info3_9 }"/>
		<c:set var="store_info3_10" value="${storeInfo.store_info3_10 }"/>
		
		<c:set var="store_info4_1" value="${storeInfo.store_info4_1 }"/>
		<c:set var="store_info4_2" value="${storeInfo.store_info4_2 }"/>
		<c:set var="store_info4_3" value="${storeInfo.store_info4_3 }"/>
		<c:set var="store_info4_4" value="${storeInfo.store_info4_4 }"/>
		<c:set var="store_info4_5" value="${storeInfo.store_info4_5 }"/>
		<c:set var="store_info4_6" value="${storeInfo.store_info4_6 }"/>
		<c:set var="store_info4_7" value="${storeInfo.store_info4_7 }"/>
		<c:set var="store_info4_8" value="${storeInfo.store_info4_8 }"/>
		<c:set var="store_info4_9" value="${storeInfo.store_info4_9 }"/>
		<c:set var="store_info4_10" value="${storeInfo.store_info4_10 }"/>
		<c:set var="store_info4_11" value="${storeInfo.store_info4_11 }"/>
		
		<c:set var="store_info5_1" value="${storeInfo.store_info5_1 }"/>
		<c:set var="store_info5_2" value="${storeInfo.store_info5_2 }"/>
		<c:set var="store_info5_3" value="${storeInfo.store_info5_3 }"/>
		<c:set var="store_info5_4" value="${storeInfo.store_info5_4 }"/>
		<c:set var="store_info5_5" value="${storeInfo.store_info5_5 }"/>
		<c:set var="store_info5_6" value="${storeInfo.store_info5_6 }"/>
		<c:set var="store_info5_7" value="${storeInfo.store_info5_7 }"/>
		<c:set var="store_info5_8" value="${storeInfo.store_info5_8 }"/>
		<c:set var="store_info5_9" value="${storeInfo.store_info5_9 }"/>
		<c:set var="store_info5_10" value="${storeInfo.store_info5_10 }"/>
		
		<c:set var="store_info6_1" value="${storeInfo.store_info6_1 }"/>
		<c:set var="store_info6_2" value="${storeInfo.store_info6_2 }"/>
		<c:set var="store_info6_3" value="${storeInfo.store_info6_3 }"/>
		<c:set var="store_info6_4" value="${storeInfo.store_info6_4 }"/>
		<c:set var="store_info6_5" value="${storeInfo.store_info6_5 }"/>
		<c:set var="store_info6_6" value="${storeInfo.store_info6_6 }"/>
		<c:set var="store_info6_7" value="${storeInfo.store_info6_7 }"/>
		<c:set var="store_info6_8" value="${storeInfo.store_info6_8 }"/>
		<c:set var="store_info6_9" value="${storeInfo.store_info6_9 }"/>
		<c:set var="store_info6_10" value="${storeInfo.store_info6_10 }"/>
		<c:set var="store_info6_11" value="${storeInfo.store_info6_11 }"/>
		<c:set var="store_info6_12" value="${storeInfo.store_info6_12 }"/>
		<c:set var="store_info6_13" value="${storeInfo.store_info6_13 }"/>
		
		<c:set var="store_info7_1" value="${storeInfo.store_info7_1 }"/>
		<c:set var="store_info7_2" value="${storeInfo.store_info7_2 }"/>
		<c:set var="store_info7_3" value="${storeInfo.store_info7_3 }"/>
		<c:set var="store_info7_4" value="${storeInfo.store_info7_4 }"/>
		<c:set var="store_info7_5" value="${storeInfo.store_info7_5 }"/>
		<c:set var="store_info7_6" value="${storeInfo.store_info7_6 }"/>
		<c:set var="store_info7_7" value="${storeInfo.store_info7_7 }"/>
		<c:set var="store_info7_8" value="${storeInfo.store_info7_8 }"/>
		<c:set var="store_info7_9" value="${storeInfo.store_info7_9 }"/>
		<c:set var="store_info7_10" value="${storeInfo.store_info7_10 }"/>
		<c:set var="store_info7_11" value="${storeInfo.store_info7_11 }"/>
		
		<c:set var="store_info8_1" value="${storeInfo.store_info8_1 }"/>
		<c:set var="store_info8_2" value="${storeInfo.store_info8_2 }"/>
		<c:set var="store_info8_3" value="${storeInfo.store_info8_3 }"/>
		<c:set var="store_info8_4" value="${storeInfo.store_info8_4 }"/>
		<c:set var="store_info8_5" value="${storeInfo.store_info8_5 }"/>		
	</c:otherwise>
</c:choose>


<textarea id="info_1"  style="display: none;"><c:out value="${BaseConfig.info_1}"/></textarea>
<textarea id="info_2"  style="display: none;"><c:out value="${BaseConfig.info_2}"/></textarea>
<textarea id="info_3"  style="display: none;"><c:out value="${BaseConfig.info_3}"/></textarea>
<textarea id="info_4"  style="display: none;"><c:out value="${BaseConfig.info_4}"/></textarea>
<textarea id="info_5"  style="display: none;"><c:out value="${BaseConfig.info_5}"/></textarea>

<input type="hidden" id="def_store_info1_2" value="상품상세설명 참조"  />
<input type="hidden" id="def_store_info1_3" value="상품상세설명 참조"  />
<input type="hidden" id="def_store_info1_4" value="상품상세설명 참조"  />

<input type="hidden" id="def_store_info2_1" value="충남 서천"  />
<input type="hidden" id="def_store_info2_3" value="상품상세설명 참조"  />
<input type="hidden" id="def_store_info2_4" value="상품상세설명 참조"  />
<input type="hidden" id="def_store_info2_5" value="상품상세설명 참조"  />
<input type="hidden" id="def_store_info2_6" value="상품상세설명 참조"  />

<input type="hidden" id="def_store_info3_1" value="충남 서천"  />
<input type="hidden" id="def_store_info3_3" value="주문 후 제조"  />
<input type="hidden" id="def_store_info3_4" value="상품상세설명 참조"  />
<input type="hidden" id="def_store_info3_5" value="상품상세설명 참조"  />
<input type="hidden" id="def_store_info3_6" value="상품상세설명 참조"  />
<input type="hidden" id="def_store_info3_7" value="해당없음"  />
<input type="hidden" id="def_store_info3_8" value="해당없음"  />
<input type="hidden" id="def_store_info3_9" value="해당없음"  />

<input type="hidden" id="def_store_info4_1" value="상품상세설명 참조"  />
<input type="hidden" id="def_store_info4_2" value="상품상세설명 참조"  />
<input type="hidden" id="def_store_info4_3" value="상품상세설명 참조"  />
<input type="hidden" id="def_store_info4_4" value="제품에 별도 표기"  />
<input type="hidden" id="def_store_info4_5" value="해당없음"  />
<input type="hidden" id="def_store_info4_6" value="해당없음"  />
<input type="hidden" id="def_store_info4_7" value="해당없음"  />
<input type="hidden" id="def_store_info4_8" value="해당없음"  />
<input type="hidden" id="def_store_info4_9" value="상품상세설명 참조"  />
<input type="hidden" id="def_store_info4_10" value="상품상세설명 참조"  />

<input type="hidden" id="def_store_info5_2" value="상품상세설명 참조"  />
<input type="hidden" id="def_store_info5_3" value="상품상세설명 참조"  />
<input type="hidden" id="def_store_info5_4" value="상품상세설명 참조"  />
<input type="hidden" id="def_store_info5_5" value="상품상세설명 참조"  />
<input type="hidden" id="def_store_info5_6" value="상품상세설명 참조"  />
<input type="hidden" id="def_store_info5_7" value="해당없음"  />
<input type="hidden" id="def_store_info5_8" value="해당없음"  />
<input type="hidden" id="def_store_info5_9" value="해당없음"  />

<input type="hidden" id="def_store_info6_1" value="건강기능식품"  />
<input type="hidden" id="def_store_info6_2" value="상품상세설명 참조"  />
<input type="hidden" id="def_store_info6_3" value="제품에 별도 표기"  />
<input type="hidden" id="def_store_info6_4" value="상품상세설명 참조"  />
<input type="hidden" id="def_store_info6_5" value="상품상세설명 참조"  />
<input type="hidden" id="def_store_info6_6" value="상품상세설명 참조"  />
<input type="hidden" id="def_store_info6_7" value="상품상세설명 참조"  />
<input type="hidden" id="def_store_info6_8" value="상품상세설명 참조"  />
<input type="hidden" id="def_store_info6_9" value="본 제품은 건강기능식품으로 질병의 예방 및 치료를 위한 의약품이 아닙니다."  />
<input type="hidden" id="def_store_info6_10" value="해당없음"  />
<input type="hidden" id="def_store_info6_11" value="본 제품은 건강기능식품 표시광고 사전심의필을 받았습니다."  />
<input type="hidden" id="def_store_info6_12" value="해당없음"  />

<input type="hidden" id="def_store_info7_1" value="상품상세설명 참조"  />
<input type="hidden" id="def_store_info7_2" value="상품상세설명 참조"  />
<input type="hidden" id="def_store_info7_3" value="제품에 별도 표기"  />
<input type="hidden" id="def_store_info7_4" value="제품에 별도 표기"  />
<input type="hidden" id="def_store_info7_5" value="상품상세설명 참조"  />
<input type="hidden" id="def_store_info7_6" value="대한민국"  />
<input type="hidden" id="def_store_info7_7" value="제품에 별도 표기"  />
<input type="hidden" id="def_store_info7_8" value="해당없음"  />
<input type="hidden" id="def_store_info7_9" value="제품에 별도 표기"  />
<input type="hidden" id="def_store_info7_10" value="본 상품은 공정거래위원회 고시 소비자 분쟁해결기준에 의거 보상해 드립니다."  />

<input type="hidden" id="def_store_info8_1" value="상품상세설명 참조"  />
<input type="hidden" id="def_store_info8_2" value="상품상세설명 참조"  />
<input type="hidden" id="def_store_info8_3" value="대한민국 / 충남 서천"  />
<input type="hidden" id="def_store_info8_4" value="해당없음"  />

<!-- 은영자정보 showhide -->
<c:set var="owner_info" value="none"/> 
<c:set var="mpa_info" value="none"/> 
<c:if test="${not empty store_seq && not empty storeInfo.store_lat}">
	<c:set var="owner_info" value="block"/>
	<c:set var="map_info" value="block"/>
</c:if>

		<!-- 콘텐츠 영역 { -->
		<div id="content">
			<h1 class="bigTit">상점<c:out value="${btn_title }"/></h1>

			<!-- 상점관리 > 상점관리 > 글쓰기 { -->
			<section id="storeWrite" class="page_content">
				<!-- 상점정보 { -->
				<form method="post" action="/admgr/admgrStore/storeAction.do" onsubmit="return storeSaveCheck();" >
				<input type="hidden" id="store_seq" name="store_seq" value="<c:out value="${storeInfo.store_seq }"/>" />
				<input type="hidden" id="return_url" name="return_url" value="" />
				
				<a name="store_CD002000"></a>
				<nav id="tab-gnb" class="mgt40px">
					<ul class="nopm floats">
						<p class="comment">● 표시는 운영을 설정한 파트입니다.</p>
						<li class="active"><a href="javascript:viewCategory('CD002000')">기본 설정</a></li>
						<li><a href="javascript:viewCategory('CD002004')">이롬스토어 운영설정 <c:if test="${storeInfo.store_use_market eq 'Y' }">●</c:if></a></li>
					</ul>
				</nav>
				
				<article class="page_sortation">
					<h2 class="h2Tit"><i class="fal fa-window-minimize"></i> 상점정보</h2>
					<table class="admin_tbl admin_write_tbl">
						<caption>상점정보</caption>
						<colgroup>
							<col width="200" />
							<col />
							<col width="200" />
							<col />
						</colgroup>
						<tbody>
							<tr>
								<th>상점아이디 </th>
								<td colspan="3">
									<c:if test="${empty store_seq }">
									<p class="comment">* 자동으로 셍성 및 관리됩니다.</p>
									</c:if>
									<input type="text" autocomplete="no" id="store_id" name="store_id" class="admin_input readonly" size="40" placeholder="상점아이디"  readonly  value="<c:out value="${stord_id}"/>" />
								</td>
							</tr>
							<tr>
								<th>상점명</th>
								<td colspan="3">
									<p class="comment">* 하단 정보고시에 자동으로 반영됩니다.</p>
									<input type="text" autocomplete="no" id="store_nm" name="store_nm" class="admin_input " size="40" placeholder="상점명"   value="<c:out value="${storeInfo.store_nm}"/>" />
								</td>
							</tr>
							
							<c:if test="${adminLevel > 5 }">
							<tr>
								<th>운영자 <span class="colorRed">*</span></th>
								<td colspan="3">
									<p class="comment">* 운영자아이디 미 입력시, 운영여부 설정과 무관하게 노출되지 않습니다</p>
									<input type="hidden" id="set_user_id" name="user_id"  value="<c:out value="${storeInfo.user_id}"/>" /> 
									<input type="text" autocomplete="no" id="set_user_nm" name="user_nm" class="admin_input readonly" size="40" placeholder="아이디"  readonly value="<c:out value="${memberInfo.user_nm}"/>" /> 
									<a href="#;" class="btns graybtn" onclick="getStoreMemberSsarchModalOpen(); return false;" >조회</a><br/>
									<div id="store_owner_info" style="display: <c:out value="${owner_info}"/>;">
									이름(아이디) : <span class="colorBlue"><b><c:out value="${memberInfo.user_nm}"/>(<c:out value="${storeInfo.user_id}"/>)</b></span><br />
									연락처 : <c:out value="${memberInfo.user_hp}"/><br />
									이메일 : <c:out value="${memberInfo.user_email}"/>
									</div>
								</td>
							</tr>
							</c:if>
							
							<tr>
								<th>운영여부</th>
								<td colspan="3">
									<input type="checkbox" id="store_use_st" name="store_use_st" value="Y" <c:if test="${storeInfo.store_use_st eq 'Y' }">checked</c:if> class="admin_check" /><label for="store_use_st">운영</label>
								</td>
							</tr>
							<tr>
								<th>업체명 <span class="colorRed">*</span></th>
								<td><input type="text" autocomplete="no" id="store_company_nm" name="store_company_nm" class="admin_input w100"  value="<c:out value="${storeInfo.store_company_nm}"/>" /></td>
								<th>대표자명 <span class="colorRed">*</span></th>
								<td><input type="text" autocomplete="no" id="store_ceo_nm" name="store_ceo_nm" class="admin_input" size="30" value="<c:out value="${storeInfo.store_ceo_nm}"/>" /></td>
							</tr>
							<tr>
								<th>업체주소 <span class="colorRed">*</span></th>
								<td colspan="3">
									<p class="comment">* 하단 정보고시에 자동으로 반영됩니다.</p>
									<input type="text" autocomplete="no" id="store_zip" name="store_zip" readonly class="admin_input readonly" readonly size="15" placeholder="우편번호" value="<c:out value="${storeInfo.store_zip}"/>"  /> 
									<button type="button" class="btns graybtn" onclick="form_execDaumPostcode('store_zip', 'store_addr_1', 'store_addr_2', 'store_lat','store_lng')"><i class="far fa-search"></i> 우편번호 </button><br />
									<input type="text" autocomplete="no" id="store_addr_1" name="store_addr_1" readonly class="admin_input readonly mgt5px" readonly size="100" placeholder="기본주소"  value="<c:out value="${storeInfo.store_addr_1}"/>" /><br />
									<input type="text" autocomplete="no" id="store_addr_2" name="store_addr_2" class="admin_input mgt5px" size="100" placeholder="상세주소"  value="<c:out value="${storeInfo.store_addr_2}"/>" />
									<br>
									<input type="text" autocomplete="no" id="store_lat" name="store_lat" class="admin_input mgt5px readonly " size="20" placeholder="Lat 좌표값"  readonly value="<c:out value="${storeInfo.store_lat}"/>" />
									&nbsp;-&nbsp;
									<input type="text" autocomplete="no" id="store_lng" name="store_lng" class="admin_input mgt5px readonly" size="20" placeholder="Lng 좌표값"  readonly value="<c:out value="${storeInfo.store_lng}"/>"  />
									<%--
									&nbsp;&nbsp;<button type="button" id="getgps_btn" class="btns redbtn mgt5px" onclick="getgps('store_addr_1','store_addr_2','store_lat','store_lng');" >GPS 죄표생성</button>
									 --%>
									<br>
									<div id="map" style="width: 500px; height: 300px; border: solid 1px #aaa; margin-top: 10px; display: <c:out value="${owner_info}"/>;"></div>
								</td>
							</tr>
							<tr>
								<th>사업자등록번호 <span class="colorRed">*</span></th>
								<td><input type="text" autocomplete="no" id="store_number" name="store_number" class="admin_input" size="30" placeholder="예) 300-80-12345"  value="<c:out value="${storeInfo.store_number}"/>" /></td>
								<th>통신판매번호</th>
								<td><input type="text" autocomplete="no" id="store_auth_number" name="store_auth_number" class="admin_input" size="30" placeholder="예) 제2018-충남-0001호"  value="<c:out value="${storeInfo.store_auth_number}"/>" /></td>
							</tr>
							<tr>
								<th>대표번호<span class="colorRed">*</span></th>
								<td>
									<p class="comment">* 하단 정보고시에 자동으로 반영됩니다.</p>
									<input type="text" autocomplete="no" id="store_tel" name="store_tel" class="admin_input phoneNumber" size="30"  value="<c:out value="${storeInfo.store_tel}"/>"   />
								</td>
								<th>대표메일</th>
								<td><input type="text" autocomplete="no" id="store_email" name="store_email" class="admin_input" size="30" value="<c:out value="${storeInfo.store_email}"/>"  /></td>
							</tr>
							<tr>
								<th>팩스번호</th>
								<td><input type="text" autocomplete="no" id="store_fax" name="store_fax" class="admin_input phoneNumber" size="30" value="<c:out value="${storeInfo.store_fax}"/>" /></td>
								<th>홈페이지</th>
								<td><input type="text" autocomplete="no" id="store_url" name="store_url" class="admin_input" size="50" value="<c:out value="${storeInfo.store_url}"/>" /></td>
							</tr>
								<th>핸드폰번호 1 <span class="colorRed">*</span></th>
								<td>
									<p class="comment">* SMS,PUSH 가능한 연락처를 기재하세요.</p>
									<input type="text" autocomplete="no" id="store_hp_1" name="store_hp_1" class="admin_input phoneNumber" size="30" value="<c:out value="${storeInfo.store_hp_1}"/>" />
								</td>
								<th>핸드폰번호 2</th>
								<td>
									<p class="comment">* SMS,PUSH 가능한 연락처를 기재하세요.</p>
									<input type="text" autocomplete="no" id="store_hp_2" name="store_hp_2" class="admin_input phoneNumber" size="30" value="<c:out value="${storeInfo.store_hp_2}"/>" />
								</td>
							</tr>
							<tr>
								<th><img src="/images/baseScmtour/ico_blog.png" width="24" alt="네이버 블로그" /> 네이버 블로그 주소</th>
								<td colspan="3"><input type="text" autocomplete="no" id="store_url_naver_blog" name="store_url_naver_blog" class="admin_input" size="80"  value="<c:out value="${storeInfo.store_url_naver_blog}"/>" /></td>
							</tr>
							<tr>
								<th><img src="/images/baseScmtour/ico_facebook.png" width="24" alt="페이스북" /> 페이스북 주소</th>
								<td colspan="3"><input type="text" autocomplete="no" id="store_url_facebook" name="store_url_facebook" class="admin_input" size="80"  value="<c:out value="${storeInfo.store_url_facebook}"/>" /></td>
							</tr>
							<tr>
								<th><img src="/images/baseScmtour/ico_twitter.png" width="24" alt="트위터" /> 트위터 주소</th>
								<td colspan="3"><input type="text" autocomplete="no" id="store_url_twitter" name="store_url_twitter" class="admin_input" size="80"  value="<c:out value="${storeInfo.store_url_twitter}"/>" /></td>
							</tr>
							<tr>
								<th><img src="/images/baseScmtour/ico_youtube.png" width="24" alt="유튜브" /> 유튜브 주소</th>
								<td colspan="3"><input type="text" autocomplete="no" id="store_url_youtube" name="store_url_youtube" class="admin_input" size="80"  value="<c:out value="${storeInfo.store_url_youtube}"/>" /></td>
							</tr>
							<tr>
								<th><img src="/images/baseScmtour/ico_instagram.png" width="24" alt="인스타그램" /> 인스타그램 주소</th>
								<td colspan="3"><input type="text" autocomplete="no" id="store_url_instagram" name="store_url_instagram" class="admin_input" size="80"  value="<c:out value="${storeInfo.store_url_instagram}"/>" /></td>
							</tr>
							<tr>
								<th>업체소개</th>
								<td colspan="3"><textarea id="store_introduction" name="store_introduction" class="admin_textarea w100" rows="7" placeholder="※ 업체소개."><c:out value="${storeInfo.store_introduction}"/></textarea></td>
							</tr>
							<tr>
								<th>정산용 은행계좌</th>
								<td colspan="3">
									<select class="basic_select admin_select" id=store_bank_nm_cd name="store_bank_nm_cd">
										<option value="">은행명</option>
										<c:forEach var="BankList" items="${BankList}" varStatus="status">
										<option value="<c:out value="${BankList.base_cd }"/>" <c:if test="${BankList.base_cd eq storeInfo.store_bank_nm_cd }">selected</c:if>><c:out value="${BankList.base_cd_nm }"/>
										</c:forEach>
									</select>
									<input type="text" autocomplete="no" id="store_bank_number" name="store_bank_number" class="admin_input" size="40" placeholder="계좌번호" value="<c:out value="${storeInfo.store_bank_number}"/>"/>
									<input type="text" autocomplete="no" id="store_bank_user_nm" name="store_bank_user_nm" class="admin_input" size="30" placeholder="예금주" value="<c:out value="${storeInfo.store_bank_user_nm}"/>"/>
								</td>
							</tr>							
							<c:if test="${not empty store_seq }">
							<tr>
								<th>등록일</th>
								<td><c:out value="${storeInfo.reg_dt}"/></td>
								<th>최근수정일</th>
								<td><c:out value="${storeInfo.mod_dt}"/></td>
							</tr>
							</c:if>
							<c:if test="${adminLevel > 5 }">
							<tr>
								<th>관리자 메모</th>
								<td colspan="3">
									<p class="comment">* 해당 상점에 대해 관리자만 볼 수 있는 메모를 입력합니다.</p>
									<textarea id="store_admin_memo" name="store_admin_memo" class="admin_textarea w100" rows="7"><c:out value="${storeInfo.store_admin_memo}"/></textarea>
								</td>
							</tr>
							</c:if>
						</tbody>
					</table>
				</article>
				
				<!-- 거래조건에 대한 정보 { -->
				<article class="page_sortation">
					<h2 class="h2Tit"><i class="fal fa-window-minimize"></i> 거래조건에 대한 정보</h2>
					<table class="admin_tbl admin_write_tbl">
						<caption>거래조건에 대한 정보</caption>
						<colgroup>
							<col width="400" />
							<col />
						</colgroup>
						<tbody>
							<tr>
								<th>재화 등의 공급방법 및 공급시기<br><br><button type="button" onclick="def_info(1);" class="btns lightgraybtn h24px"> 기본값 입력</button></th>
								<td>
									<textarea id="store_info_1" name="store_info_1" class="admin_textarea w100" rows="5"><c:out value="${store_info_1}"/></textarea>
								</td>
							</tr>
							<tr>
								<th>청약철회 등에 관한 사항<br><br><button type="button" onclick="def_info(2);" class="btns lightgraybtn h24px"> 기본값 입력</button></th>
								<td>
									<textarea id="store_info_2" name="store_info_2" class="admin_textarea w100" rows="5"><c:out value="${store_info_2}"/></textarea>
								</td>
							</tr>
							<tr>
								<th>재화 등의 교환∙반품∙보증과 그 대금 환불 및 환불의 지연에 따른 배상금 지급의 조건∙절차<br><br><button type="button" onclick="def_info(3);" class="btns lightgraybtn h24px"> 기본값 입력</button></th>
								<td>
									<textarea id="store_info_3" name="store_info_3" class="admin_textarea w100" rows="5"><c:out value="${store_info_3}"/></textarea>
								</td>
							</tr>
							<tr>
								<th>소비자피해보상의 처리, 재화 등에 대한 불만 처리 및 소비자와 사업자 사이의 분쟁처리에 관한 사항<br><br><button type="button" onclick="def_info(4);" class="btns lightgraybtn h24px"> 기본값 입력</button></th>
								<td>
									<textarea id="store_info_4" name="store_info_4" class="admin_textarea w100" rows="5"><c:out value="${store_info_4 }"/></textarea>
								</td>
							</tr>
							<tr>
								<th>거래에 관한 약관의 내용 또는 확인할 수 있는 방법<br><br><button type="button" onclick="def_info(5);" class="btns lightgraybtn h24px"> 기본값 입력</button></th>
								<td>
									<textarea id="store_info_5" name="store_info_5" class="admin_textarea w100" rows="5"><c:out value="${store_info_5}"/></textarea>
								</td>
							</tr>
						</tbody>
					</table>
				</article>
				<!-- } 거래조건에 대한 정보 -->
				
				<!-- } 상점정보 -->
				<div class="btnarea alignRight mgt50px">
					<ul class="nopm floats">
						<li><a href="/admgr/admgrStore/storeList.do?store_category=<c:out value="${store_category }"/>" class="btns "><i class="fal fa-list"></i> 목록으로</a></li>
						<li class="fr"><button type="submit" class="btns redbtn"><i class="far fa-save"></i> 저장</button></li>
					</ul>
				</div>		
					<a name="store_CD002004"></a>
					<nav id="tab-gnb" class="mgt40px">
						<ul class="nopm floats">
							<p class="comment">● 표시는 운영을 설정한 파트입니다.</p>						
							<li class="active"><a href="javascript:viewCategory('CD002004')">이롬스토어 운영설정 <c:if test="${storeInfo.store_use_market eq 'Y' }">●</c:if></a></li>
						</ul>
					</nav>
				
					<!--이롬스토어 운영정보 { -->
					<article class="page_sortation">
						<h2 class="h2Tit"><i class="fal fa-window-minimize"></i>이롬스토어 운영설정</h2>
						<table class="admin_tbl admin_write_tbl">
							<caption>운영설정</caption>
							<colgroup>
								<col width="200" />
								<col />
								<col width="200" />
								<col />
							</colgroup>
							<tbody>
								<tr>
									<th>사용여부</th>
									<td colspan="3">
										<input type="checkbox" id="store_use_market" name="store_use_market" value="Y" <c:if test="${storeInfo.store_use_market eq 'Y' }">checked</c:if> class="admin_check" /><label for="store_use_market">운영</label>
									</td>
								</tr>
								<tr>
									<th>정산수수료</th>
									<c:choose>
									<c:when test="${adminLevel > 5 }">
									<td colspan="3">
										<p class="comment">* 수수료가 0%면, 정산시 정산수수료가 산정되지 않습니다.(신용결제시 신용결제 수수료는 자동정산됩니다.)</p>
										<p class="comment">* (숫자)가 등록된 상품수이며, 정산은 구매시 구매정보에 저장된 수수료율로 정산됩니다.</p>
										<span class="btns lightgraybtn h24px">이롬스토어 (<fmt:formatNumber value="${storeInfo.market_prod_cnt }" type="number"/>)</span> <input type="text" autocomplete="no" id="store_market_calc_percent" name="store_market_calc_percent" class="admin_input alignRight" size="5"  value="<c:out value="${store_market_calc_percent }"/>" /> %
									</td>
									</c:when>
									<c:otherwise>
									<td colspan="3">
										<p class="comment">* (숫자)가 등록된 상품수입니다.<br>* 신용카드 수수료 + 정산수수료가 합산되어 공제된 후 정산됩니다.<br>* 상점관리자는 수정이 불가하며,  최고관리자가 협의 후 조정이 가능합니다.</p>
										<span class="btns lightgraybtn h24px">이롬스토어 (<fmt:formatNumber value="${storeInfo.market_prod_cnt }" type="number"/>)</span> <input type="text" autocomplete="no" id="store_market_calc_percent" name="store_market_calc_percent" class="admin_input alignRight readonly" size="5" readonly value="<c:out value="${store_market_calc_percent }"/>" /> %
									</td>
									</c:otherwise>
									</c:choose>
								</tr>
								<tr>
									<th>장터 배송비설정</th>
									<td colspan="3">
										<p class="comment">* 최대 3개까지 배송사설정이 가능하며, 배송사 1 이 기본배송사로 자동설정 됩니다.</p>
										배송사 1 : <select id="store_market_delivery_company_cd_1" name="store_market_delivery_company_cd_1" class="basic_select w200px">
											<option value="">== 배송사 1 선택 ==
										<c:forEach var="TransCompanyList" items="${TransList}" varStatus="status">
											<option value="<c:out value="${TransCompanyList.base_cd }"/>" <c:if test="${TransCompanyList.base_cd eq storeInfo.store_market_delivery_company_cd_1 }">selected</c:if>><c:out value="${TransCompanyList.base_cd_nm }"/>
										</c:forEach>
										</select>
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										배송사 2 : <select id="store_market_delivery_company_cd_2" name="store_market_delivery_company_cd_2" class="basic_select w200px">
											<option value="">== 배송사 2 선택 ==
										<c:forEach var="TransCompanyList" items="${TransList}" varStatus="status">
											<option value="<c:out value="${TransCompanyList.base_cd }"/>" <c:if test="${TransCompanyList.base_cd eq storeInfo.store_market_delivery_company_cd_2 }">selected</c:if>><c:out value="${TransCompanyList.base_cd_nm }"/>
										</c:forEach>
										</select>
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										배송사 3 : <select id="store_market_delivery_company_cd_3" name="store_market_delivery_company_cd_3" class="basic_select w200px">
											<option value="">== 배송사 3 선택 ==
										<c:forEach var="TransCompanyList" items="${TransList}" varStatus="status">
											<option value="<c:out value="${TransCompanyList.base_cd }"/>" <c:if test="${TransCompanyList.base_cd eq storeInfo.store_market_delivery_company_cd_3 }">selected</c:if>><c:out value="${TransCompanyList.base_cd_nm }"/>
										</c:forEach>
										</select>
										<br>
										<br>
										기본배송비 : <input type="text" autocomplete="no" id="store_market_default_delivery_price" name="store_market_default_delivery_price" class="admin_input" size="10"  value="<c:out value="${store_market_default_delivery_price }"/>"  /> 원,
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										무료배송금액 : <input type="text" autocomplete="no" id="store_market_free_delivery_price" name="store_market_free_delivery_price" class="admin_input" size="10"  value="<c:out value="${store_market_free_delivery_price }"/>" /> 원 이상,
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										제주도배송비 : <input type="text" autocomplete="no" id="store_market_jeju_delivery_price" name="store_market_jeju_delivery_price" class="admin_input" size="10"  value="<c:out value="${store_market_jeju_delivery_price }"/>" /> 원
									</td>
								</tr>
								<tr>
									<th>기본배송 안내</th>
									<td colspan="3">
										<p class="comment">* 상품등록시 사용되는 기본값으로 각 상품등록시 수정등록이 가능하며, 이 정보를 수정하더라도 이미 등록된 상품의 정보는 수정되지 않습니다.</p>
										<textarea id="store_market_delivery" name="store_market_delivery" class="admin_textarea w100" rows="7" placeholder="※ 기본배송 안내"></textarea>
									</td>
								</tr>
								<tr>
									<th>교환/반품 안내</th>
									<td colspan="3">
										<p class="comment">* 상품등록시 사용되는 기본값으로 각 상품등록시 수정등록이 가능하며, 이 정보를 수정하더라도 이미 등록된 상품의 정보는 수정되지 않습니다.</p>
										<textarea id="store_market_returnchange" name="store_market_returnchange" class="admin_textarea w100" rows="7" placeholder="※ 교환/반품 안내"></textarea>
									</td>
								</tr>
								<!-- } 업체 유형에서 이롬스토어 선택시 나타납니다. -->
								<tr>
									<th>주문시 유의사항</th>
									<td colspan="3">
										<p class="comment">* 상품등록시 사용되는 기본값으로 각 상품등록시 수정등록이 가능하며, 이 정보를 수정하더라도 이미 등록된 상품의 정보는 수정되지 않습니다.</p>
										<textarea id="store_market_order_note" name="store_market_order_note" class="admin_textarea w100" rows="7" placeholder="※ 주문시 유의사항"></textarea>
									</td>
								</tr>
							</tbody>
						</table>
					</article>
					
					<div class="btnarea alignRight mgt50px">
						<ul class="nopm floats">
							<li><a href="/admgr/admgrStore/storeList.do?store_category=<c:out value="${store_category }"/>" class="btns "><i class="fal fa-list"></i> 목록으로</a></li>
							<li class="fr"><button type="submit" class="btns redbtn"><i class="far fa-save"></i> 저장</button></li>
						</ul>
					</div>	
										
					<article class="page_sortation">
						<h2 class="h2Tit"><i class="fal fa-window-minimize"></i> 이롬스토어 - 전자상거래 등에서 상품제공 고시 - 농/축/수산물</h2>
						<table class="admin_tbl admin_write_tbl">
							<caption>전자상거래 등에서 상품제공 고시 - 농/축/수산물</caption>
							<colgroup>
								<col width="400" />
								<col />
							</colgroup>
							<tbody>
								<!-- 농/축/수산물 { -->
								<tr>
									<th>포장단위별 용량(중량), 수량, 크기 &nbsp;&nbsp; <button type="button" onclick="base_info_value('4_1');" class="btns lightgraybtn h24px"> 기본값 입력</button></th>
									<td><input type="text" id="store_info4_1" name="store_info4_1" class="admin_input w100" placeholder="상품상세설명 참조" value="<c:out value="${store_info4_1}"/>" /></td>
								</tr>
								<tr>
									<th>생산자 &nbsp;&nbsp; <button type="button" onclick="base_info_value('4_2');" class="btns lightgraybtn h24px"> 기본값 입력</button></th>
									<td><input type="text" id="store_info4_2" name="store_info4_2" class="admin_input w100" placeholder="상품상세설명 참조" value="<c:out value="${store_info4_2}"/>" /></td>
								</tr>
								<tr>
									<th>원산지 &nbsp;&nbsp; <button type="button" onclick="base_info_value('4_3');" class="btns lightgraybtn h24px"> 기본값 입력</button></th>
									<td><input type="text" id="store_info4_3" name="store_info4_3" class="admin_input w100" placeholder="상품상세설명 참조" value="<c:out value="${store_info4_3}"/>" /></td>
								</tr>
								<tr>
									<th>제조연월일(조장일 또는 생산연도), 유통기한 또는 품질유지기한 &nbsp;&nbsp; <button type="button" onclick="base_info_value('4_4');" class="btns lightgraybtn h24px"> 기본값 입력</button></th>
									<td><input type="text" id="store_info4_4" name="store_info4_4" class="admin_input w100" placeholder="제품에 별도 표기" value="<c:out value="${store_info4_4}"/>" /></td>
								</tr>
								<tr>
									<th>농산물-농산물품질관리 법사 유전자 변형 농산물 표시, 지리적 표시 &nbsp;&nbsp; <button type="button" onclick="base_info_value('4_5');" class="btns lightgraybtn h24px"> 기본값 입력</button></th>
									<td><input type="text" id="store_info4_5" name="store_info4_5" class="admin_input w100" placeholder="해당없음" value="<c:out value="${store_info4_5}"/>" /></td>
								</tr>
								<tr>
									<th>축산물-축산법에 따른 등급표시, 쇠고기의 경우 이력관리에 따른 표시 유무 &nbsp;&nbsp; <button type="button" onclick="base_info_value('4_6');" class="btns lightgraybtn h24px"> 기본값 입력</button></th>
									<td><input type="text" id="store_info4_6" name="store_info4_6" class="admin_input w100" placeholder="해당없음" value="<c:out value="${store_info4_6}"/>" /></td>
								</tr>
								<tr>
									<th>수산물-수산물품질관리법상 유전자변형수산물 표시, 지리적 표시 &nbsp;&nbsp; <button type="button" onclick="base_info_value('4_7');" class="btns lightgraybtn h24px"> 기본값 입력</button></th>
									<td><input type="text" id="store_info4_7" name="store_info4_7" class="admin_input w100" placeholder="해당없음" value="<c:out value="${store_info4_7}"/>" /></td>
								</tr>
								<tr>
									<th>수입식품에 해당하는 경우 식품위생법에 따른 수입신고를 필함의 문구 &nbsp;&nbsp; <button type="button" onclick="base_info_value('4_8');" class="btns lightgraybtn h24px"> 기본값 입력</button></th>
									<td><input type="text" id="store_info4_8" name="store_info4_8" class="admin_input w100" placeholder="해당없음" value="<c:out value="${store_info4_8}"/>" /></td>
								</tr>
								<tr>
									<th>상품구성 &nbsp;&nbsp; <button type="button" onclick="base_info_value('4_9');" class="btns lightgraybtn h24px"> 기본값 입력</button></th>
									<td><input type="text" id="store_info4_9" name="store_info4_9" class="admin_input w100" placeholder="상품상세설명 참조" value="<c:out value="${store_info4_9}"/>" /></td>
								</tr>
								<tr>
									<th>보관방법 또는 취급방법 &nbsp;&nbsp; <button type="button" onclick="base_info_value('4_10');" class="btns lightgraybtn h24px"> 기본값 입력</button></th>
									<td><input type="text" id="store_info4_10" name="store_info4_10" class="admin_input w100" placeholder="상품상세설명 참조" value="<c:out value="${store_info4_10}"/>"  /></td>
								</tr>
								<tr>
									<th>소비자상담 관련 전화번호 &nbsp;&nbsp; <button type="button" onclick="store_info_value_set();" class="btns lightgraybtn h24px"> 기본값 입력</button></th>
									<td><input type="text" id="store_info4_11" name="store_info4_11" class="admin_input w100" placeholder="상호명 대표전화" value="<c:out value="${store_info4_11}"/>" /></td>
								</tr>
								<!-- } 농/축/수산물 -->
							</tbody>
						</table>
					</article>
					
					<div class="btnarea alignRight mgt50px">
						<ul class="nopm floats">
							<li><a href="/admgr/admgrStore/storeList.do?store_category=<c:out value="${store_category }"/>" class="btns "><i class="fal fa-list"></i> 목록으로</a></li>
							<li class="fr"><button type="submit" class="btns redbtn"><i class="far fa-save"></i> 저장</button></li>
						</ul>
					</div>	
										
					<article class="page_sortation">
						<h2 class="h2Tit"><i class="fal fa-window-minimize"></i>이롬스토어 -  전자상거래 등에서 상품제공 고시 - 주류/가공품/신선식품</h2>
						<table class="admin_tbl admin_write_tbl">
							<caption>전자상거래 등에서 상품제공 고시 - 주류/가공품/신선식품</caption>
							<colgroup>
								<col width="400" />
								<col />
							</colgroup>
							<tbody>
								<!-- 주류/가공품/신선식품 { -->
								<tr>
									<th>식품의 유형</th>
									<td><input type="text" id="store_info5_1" name="store_info5_1" class="admin_input w100" placeholder="주류/가공품/신선식품" value="<c:out value="${store_info5_1}"/>" /></td>
								</tr>
								<tr>
									<th>생산자, 수입품의 경우 수입자를 함께 표기 &nbsp;&nbsp; <button type="button" onclick="base_info_value('5_2');" class="btns lightgraybtn h24px"> 기본값 입력</button></th>
									<td><input type="text" id="store_info5_2" name="store_info5_2" class="admin_input w100" placeholder="상품상세설명 참조" value="<c:out value="${store_info5_2}"/>" /></td>
								</tr>
								<tr>
									<th>제조연월일, 유통기한 또는 품질유지기한 &nbsp;&nbsp; <button type="button" onclick="base_info_value('5_3');" class="btns lightgraybtn h24px"> 기본값 입력</button></th>
									<td><input type="text" id="store_info5_3" name="store_info5_3" class="admin_input w100" placeholder="제품에 별도 표기"  value="<c:out value="${store_info5_3}"/>" /></td>
								</tr>
								<tr>
									<th>포장단위별 용량(중량), 수량 &nbsp;&nbsp; <button type="button" onclick="base_info_value('5_4');" class="btns lightgraybtn h24px"> 기본값 입력</button></th>
									<td><input type="text" id="store_info5_4" name="store_info5_4" class="admin_input w100" placeholder="상품상세설명 참조" value="<c:out value="${store_info5_4}"/>" /></td>
								</tr>
								<tr>
									<th>원재료명 및 함량 &nbsp;&nbsp; <button type="button" onclick="base_info_value('5_5');" class="btns lightgraybtn h24px"> 기본값 입력</button></th>
									<td><input type="text" id="store_info5_5" name="store_info5_5" class="admin_input w100" placeholder="상품상세설명 참조" value="<c:out value="${store_info5_5}"/>" /></td>
								</tr>
								<tr>
									<th>영양성분 &nbsp;&nbsp; <button type="button" onclick="base_info_value('5_6');" class="btns lightgraybtn h24px"> 기본값 입력</button></th>
									<td><input type="text" id="store_info5_6" name="store_info5_6" class="admin_input w100" placeholder="상품상세설명 참조" value="<c:out value="${store_info5_6}"/>" /></td>
								</tr>
								<tr>
									<th>유전자재조합식품에 해당하는 경우의 표시 &nbsp;&nbsp; <button type="button" onclick="base_info_value('5_7');" class="btns lightgraybtn h24px"> 기본값 입력</button></th>
									<td><input type="text" id="store_info5_7" name="store_info5_7" class="admin_input w100" placeholder="해당없음" value="<c:out value="${store_info5_7}"/>" /></td>
								</tr>
								<tr>
									<th>영유아식 또는 체중조절식품 등에 해당하는 경우 표시광고 사전심의필 &nbsp;&nbsp; <button type="button" onclick="base_info_value('5_8');" class="btns lightgraybtn h24px"> 기본값 입력</button></th>
									<td><input type="text" id="store_info5_8" name="store_info5_8" class="admin_input w100" placeholder="해당없음" value="<c:out value="${store_info5_8}"/>" /></td>
								</tr>
								<tr>
									<th>수입식품에 해당하는 경우 식품위생법에 따른 수입신고를 필함의 문구 &nbsp;&nbsp; <button type="button" onclick="base_info_value('5_9');" class="btns lightgraybtn h24px"> 기본값 입력</button></th>
									<td><input type="text" id="store_info5_9" name="store_info5_9" class="admin_input w100" placeholder="해당없음" value="<c:out value="${store_info5_9}"/>" /></td>
								</tr>
								<tr>
									<th>소비자상담 관련 전화번호 &nbsp;&nbsp; <button type="button" onclick="store_info_value_set();" class="btns lightgraybtn h24px"> 기본값 입력</button></th>
									<td><input type="text" id="store_info5_10" name="store_info5_10" class="admin_input w100" placeholder="상호명 대표전화" value="<c:out value="${store_info5_10}"/>" /></td>
								</tr>
								<!-- } 주류/가공품/신선식품 -->
							</tbody>
						</table>
					</article>
					
					<div class="btnarea alignRight mgt50px">
						<ul class="nopm floats">
							<li><a href="/admgr/admgrStore/storeList.do?store_category=<c:out value="${store_category }"/>" class="btns "><i class="fal fa-list"></i> 목록으로</a></li>
							<li class="fr"><button type="submit" class="btns redbtn"><i class="far fa-save"></i> 저장</button></li>
						</ul>
					</div>	
										
					<article class="page_sortation">
						<h2 class="h2Tit"><i class="fal fa-window-minimize"></i> 이롬스토어 - 전자상거래 등에서 상품제공 고시 - 건강기능식품</h2>
						<table class="admin_tbl admin_write_tbl">
							<caption>전자상거래 등에서 상품제공 고시 - 건강기능식품</caption>
							<colgroup>
								<col width="400" />
								<col />
							</colgroup>
							<tbody>
								<!-- 건강기능식품 { -->
								<tr>
									<th>식품의 유형 &nbsp;&nbsp; <button type="button" onclick="base_info_value('6_1');" class="btns lightgraybtn h24px"> 기본값 입력</button></th>
									<td><input type="text" id="store_info6_1" name="store_info6_1" class="admin_input w100" placeholder="건강기능식품" value="<c:out value="${store_info6_1}"/>" /></td>
								</tr>
								<tr>
									<th>제조업소의 명칭과 소재지(수입품의 경우 수입업소명, 제조업소명 및 수출국명) &nbsp;&nbsp; <button type="button" onclick="base_info_value('6_2');" class="btns lightgraybtn h24px"> 기본값 입력</button></th>
									<td><input type="text" id="store_info6_2" name="store_info6_2" class="admin_input w100" placeholder="상품상세설명 참조" value="<c:out value="${store_info6_2}"/>" /></td>
								</tr>
								<tr>
									<th>제조연월일, 유통기한 또는 품질유지기한 &nbsp;&nbsp; <button type="button" onclick="base_info_value('6_3');" class="btns lightgraybtn h24px"> 기본값 입력</button></th>
									<td><input type="text" id="store_info6_3" name="store_info6_3" class="admin_input w100" placeholder="제품에 별도 표기" value="<c:out value="${store_info6_3}"/>" /></td>
								</tr>
								<tr>
									<th>포장단위별 용량(중량), 수량 &nbsp;&nbsp; <button type="button" onclick="base_info_value('6_4');" class="btns lightgraybtn h24px"> 기본값 입력</button></th>
									<td><input type="text" id="store_info6_4" name="store_info6_4" class="admin_input w100" placeholder="상품상세설명 참조" value="<c:out value="${store_info6_4}"/>" /></td>
								</tr>
								<tr>
									<th>원재료명 및 함량(농수산물의 원산지 표시에 관한 법률에 따른 원산지 표시 포함) &nbsp;&nbsp; <button type="button" onclick="base_info_value('6_5');" class="btns lightgraybtn h24px"> 기본값 입력</button></th>
									<td><input type="text" id="store_info6_5" name="store_info6_5" class="admin_input w100" placeholder="상품상세설명 참조" value="<c:out value="${store_info6_5}"/>" /></td>
								</tr>
								<tr>
									<th>영양정보 &nbsp;&nbsp; <button type="button" onclick="base_info_value('6_6');" class="btns lightgraybtn h24px"> 기본값 입력</button></th>
									<td><input type="text" id="store_info6_6" name="store_info6_6" class="admin_input w100" placeholder="상품상세설명 참조" value="<c:out value="${store_info6_6}"/>" /></td>
								</tr>
								<tr>
									<th>기능정보 &nbsp;&nbsp; <button type="button" onclick="base_info_value('6_7');" class="btns lightgraybtn h24px"> 기본값 입력</button></th>
									<td><input type="text" id="store_info6_7" name="store_info6_7" class="admin_input w100" placeholder="상품상세설명 참조" value="<c:out value="${store_info6_7}"/>"  /></td>
								</tr>
								<tr>
									<th>섭취량, 섭취방법 및 섭취 시 주의사항 및 부작용 가능성 &nbsp;&nbsp; <button type="button" onclick="base_info_value('6_8');" class="btns lightgraybtn h24px"> 기본값 입력</button></th>
									<td><input type="text" id="store_info6_8" name="store_info6_8" class="admin_input w100" placeholder="상품상세설명 참조" value="<c:out value="${store_info6_8}"/>" /></td>
								</tr>
								<tr>
									<th>질병의 예방 및 치료를 위한 의약품이 아니라는 내용의 표현 &nbsp;&nbsp; <button type="button" onclick="base_info_value('6_9');" class="btns lightgraybtn h24px"> 기본값 입력</button></th>
									<td><input type="text" id="store_info6_9" name="store_info6_9" class="admin_input w100" placeholder="본 제품은 건강기능식품으로 질병의 예방 및 치료를 위한 의약품이 아닙니다." value="<c:out value="${store_info6_9}"/>" /></td>
								</tr>
								<tr>
									<th>유전자재조합식품에 해당하는 경우의 표시 &nbsp;&nbsp; <button type="button" onclick="base_info_value('6_10');" class="btns lightgraybtn h24px"> 기본값 입력</button></th>
									<td><input type="text" id="store_info6_10" name="store_info6_10" class="admin_input w100" placeholder="해당없음" value="<c:out value="${store_info6_10}"/>" /></td>
								</tr>
								<tr>
									<th>표시광고 사전심의필 &nbsp;&nbsp; <button type="button" onclick="base_info_value('6_11');" class="btns lightgraybtn h24px"> 기본값 입력</button></th>
									<td><input type="text" id="store_info6_11" name="store_info6_11" class="admin_input w100" placeholder="본 제품은 건강기능식품 표시광고 사전심의필을 받았습니다." value="<c:out value="${store_info6_11}"/>" /></td>
								</tr>
								<tr>
									<th>수입식품에 해당하는 경우 “건강기능식품에 관한 법률에 따른 수입신고를 필함”의 문구 &nbsp;&nbsp; <button type="button" onclick="base_info_value('6_12');" class="btns lightgraybtn h24px"> 기본값 입력</button></th>
									<td><input type="text" id="store_info6_12" name="store_info6_12" class="admin_input w100" placeholder="해당없음" value="<c:out value="${store_info6_12}"/>" /></td>
								</tr>
								<tr>
									<th>소비자상담 관련 전화번호 &nbsp;&nbsp; <button type="button" onclick="store_info_value_set();" class="btns lightgraybtn h24px"> 기본값 입력</button></th>
									<td><input type="text" id="store_info6_13" name="store_info6_13" class="admin_input w100" placeholder="상호명 대표전화" value="<c:out value="${store_info6_13}"/>" /></td>
								</tr>
								<!-- } 건강기능식품 -->
							</tbody>
						</table>
					</article>
					
					<div class="btnarea alignRight mgt50px">
						<ul class="nopm floats">
							<li><a href="/admgr/admgrStore/storeList.do?store_category=<c:out value="${store_category }"/>" class="btns "><i class="fal fa-list"></i> 목록으로</a></li>
							<li class="fr"><button type="submit" class="btns redbtn"><i class="far fa-save"></i> 저장</button></li>
						</ul>
					</div>	
										
					<article class="page_sortation">
						<h2 class="h2Tit"><i class="fal fa-window-minimize"></i> 이롬스토어 - 전자상거래 등에서 상품제공 고시 - 화장품</h2>
						<table class="admin_tbl admin_write_tbl">
							<caption>전자상거래 등에서 상품제공 고시 - 화장품</caption>
							<colgroup>
								<col width="400" />
								<col />
							</colgroup>
							<tbody>
								<!-- 화장품 { -->
								<tr>
									<th>용량 또는 중량 &nbsp;&nbsp; <button type="button" onclick="base_info_value('7_1');" class="btns lightgraybtn h24px"> 기본값 입력</button></th>
									<td><input type="text" id="store_info7_1" name="store_info7_1" class="admin_input w100" placeholder="상품상세설명 참조" value="<c:out value="${store_info7_1}"/>" /></td>
								</tr>
								<tr>
									<th>제품 주요 사양 &nbsp;&nbsp; <button type="button" onclick="base_info_value('7_2');" class="btns lightgraybtn h24px"> 기본값 입력</button></th>
									<td><input type="text" id="store_info7_2" name="store_info7_2" class="admin_input w100" placeholder="상품상세설명 참조" value="<c:out value="${store_info7_2}"/>" /></td>
								</tr>
								<tr>
									<th>사용기한 또는 개봉 후 사용기간 &nbsp;&nbsp; <button type="button" onclick="base_info_value('7_3');" class="btns lightgraybtn h24px"> 기본값 입력</button></th>
									<td><input type="text" id="store_info7_3" name="store_info7_3" class="admin_input w100" placeholder="제품에 별도 표기" value="<c:out value="${store_info7_3}"/>" /></td>
								</tr>
								<tr>
									<th>사용방법 &nbsp;&nbsp; <button type="button" onclick="base_info_value('7_4');" class="btns lightgraybtn h24px"> 기본값 입력</button></th>
									<td><input type="text" id="store_info7_4" name="store_info7_4" class="admin_input w100" placeholder="제품에 별도 표기" value="<c:out value="${store_info7_4}"/>" /></td>
								</tr>
								<tr>
									<th>제조업자 및 제조판매업자 &nbsp;&nbsp; <button type="button" onclick="base_info_value('7_5');" class="btns lightgraybtn h24px"> 기본값 입력</button></th>
									<td><input type="text" id="store_info7_5" name="store_info7_5" class="admin_input w100" placeholder="상품상세설명 참조" value="<c:out value="${store_info7_5}"/>" /></td>
								</tr>
								<tr>
									<th>제조국 &nbsp;&nbsp; <button type="button" onclick="base_info_value('7_6');" class="btns lightgraybtn h24px"> 기본값 입력</button></th>
									<td><input type="text" id="store_info7_6" name="store_info7_6" class="admin_input w100" placeholder="대한민국" value="<c:out value="${store_info7_6}"/>" /></td>
								</tr>
								<tr>
									<th>화장품법에 따라 기재/표시하여야 하는 모든 성분 &nbsp;&nbsp; <button type="button" onclick="base_info_value('7_7');" class="btns lightgraybtn h24px"> 기본값 입력</button></th>
									<td><input type="text" id="store_info7_7" name="store_info7_7" class="admin_input w100" placeholder="제품에 별도 표기" value="<c:out value="${store_info7_7}"/>" /></td>
								</tr>
								<tr>
									<th>기능성 화장품 심사 필 유무 &nbsp;&nbsp; <button type="button" onclick="base_info_value('7_8');" class="btns lightgraybtn h24px"> 기본값 입력</button></th>
									<td><input type="text" id="store_info7_8" name="store_info7_8" class="admin_input w100" placeholder="해당없음" value="<c:out value="${store_info7_8}"/>" /></td>
								</tr>
								<tr>
									<th>사용할 때 주의사항 &nbsp;&nbsp; <button type="button" onclick="base_info_value('7_9');" class="btns lightgraybtn h24px"> 기본값 입력</button></th>
									<td><input type="text" id="store_info7_9" name="store_info7_9" class="admin_input w100" placeholder="제품에 별도 표기" value="<c:out value="${store_info7_9}"/>" /></td>
								</tr>
								<tr>
									<th>품질보증기준 &nbsp;&nbsp; <button type="button" onclick="base_info_value('7_10');" class="btns lightgraybtn h24px"> 기본값 입력</button></th>
									<td><input type="text" id="store_info7_10" name="store_info7_10" class="admin_input w100" placeholder="본 상품은 공정거래위원회 고시 소비자 분쟁해결기준에 의거 보상해 드립니다." value="<c:out value="${store_info7_10}"/>" /></td>
								</tr>
								<tr>
									<th>소비자상담 관련 전화번호 &nbsp;&nbsp; <button type="button" onclick="store_info_value_set();" class="btns lightgraybtn h24px"> 기본값 입력</button></th>
									<td><input type="text" id="store_info7_11" name="store_info7_11" class="admin_input w100" placeholder="상호명 대표전화" value="<c:out value="${store_info7_11}"/>" /></td>
								</tr>
								<!-- } 화장품 -->
							</tbody>
						</table>
					</article>
					
					<div class="btnarea alignRight mgt50px">
						<ul class="nopm floats">
							<li><a href="/admgr/admgrStore/storeList.do?store_category=<c:out value="${store_category }"/>" class="btns "><i class="fal fa-list"></i> 목록으로</a></li>
							<li class="fr"><button type="submit" class="btns redbtn"><i class="far fa-save"></i> 저장</button></li>
						</ul>
					</div>	
										
					<article class="page_sortation">
						<h2 class="h2Tit"><i class="fal fa-window-minimize"></i> 이롬스토어 - 전자상거래 등에서 상품제공 고시 - 기타</h2>
						<table class="admin_tbl admin_write_tbl">
							<caption>전자상거래 등에서 상품제공 고시 - 기타</caption>
							<colgroup>
								<col width="400" />
								<col />
							</colgroup>
							<tbody>
								<!-- 기타 { -->
								<tr>
									<th>품명 및 모델명 &nbsp;&nbsp; <button type="button" onclick="base_info_value('8_1');" class="btns lightgraybtn h24px"> 기본값 입력</button></th>
									<td><input type="text" id="store_info8_1" name="store_info8_1" class="admin_input w100" placeholder="상품상세설명 참조" value="<c:out value="${store_info8_1}"/>" /></td>
								</tr>
								<tr>
									<th>제조자 또는 수입자(수입품의 경우 수입자를 함께 표기) &nbsp;&nbsp; <button type="button" onclick="base_info_value('8_2');" class="btns lightgraybtn h24px"> 기본값 입력</button></th>
									<td><input type="text" id="store_info8_2" name="store_info8_2" class="admin_input w100" placeholder="상품상세설명 참조" value="<c:out value="${store_info8_2}"/>" /></td>
								</tr>
								<tr>
									<th>제조국 또는 원산지 &nbsp;&nbsp; <button type="button" onclick="base_info_value('8_3');" class="btns lightgraybtn h24px"> 기본값 입력</button></th>
									<td><input type="text" id="store_info8_3" name="store_info8_3" class="admin_input w100" placeholder="대한민국 / 강원 춘천시" value="<c:out value="${store_info8_3}"/>" /></td>
								</tr>
								<tr>
									<th>법에 의한 인증ㆍ허가 등을 받았음을 확인할 수 있는 경우 그에 대한 사항 &nbsp;&nbsp; <button type="button" onclick="base_info_value('8_4');" class="btns lightgraybtn h24px"> 기본값 입력</button></th>
									<td><input type="text" id="store_info8_4" name="store_info8_4" class="admin_input w100" placeholder="해당없음" value="<c:out value="${store_info8_4}"/>" /></td>
								</tr>
								<tr>
									<th>A/S 책임자와 전화번호 또는 소비자상담 관련 전화번호 &nbsp;&nbsp; <button type="button" onclick="store_info_value_set();" class="btns lightgraybtn h24px"> 기본값 입력</button></th>
									<td><input type="text" id="store_info8_5" name="store_info8_5" class="admin_input w100" placeholder="상호명 대표전화" value="<c:out value="${store_info8_5}"/>" /></td>
								</tr>
								<!-- } 기타 -->
							</tbody>
						</table>
					</article>
					<!-- } 운영정보 -->
				
					<div class="btnarea alignRight mgt30px">
						<ul class="nopm floats">
						<c:choose>
						<c:when test="${adminLevel > 5 }">
							<li><a href="/admgr/admgrStore/storeList.do?pageIndex=<c:out value="${pageIndex}"/>&store_category=<c:out value="${store_category }"/>&store_category=<c:out value="${store_category }"/>&searchKey=<c:out value="${searchKey }"/>&searchKeyword=<c:out value="${searchKeyword }"/>" class="btns "><i class="fal fa-list"></i> 목록으로</a></li>
						</c:when>
						<c:otherwise>
							<li><a href="/admgr/admgrStore/storeList.do?pageIndex=<c:out value="${pageIndex}"/>" class="btns "><i class="fal fa-list"></i> 목록으로</a></li>
						</c:otherwise>
						</c:choose>
							<li class="fr"><button type="submit" class="btns redbtn"><i class="far fa-save"></i> 저장</button></li>
						</ul>
					</div>				
					
				</form>
			</section>
			<!-- } 상점관리 > 상점관리 > 글쓰기 -->
		</div>
		<!-- } 콘텐츠 영역 -->

		<c:if test="${not empty store_seq && not empty storeInfo.store_lat && not empty storeInfo.store_lng}">
		<script>createmap($("#store_lat").val(), $("#store_lng").val());</script>
		</c:if>
		
		<script>
			getEditor('store_introduction');
			getEditor('store_travel_reserve_note');
			getEditor('store_house_reserve_note');
			getEditor('store_food_reserve_note');
			getEditor('store_market_delivery');
			getEditor('store_market_returnchange');
			getEditor('store_market_order_note');
		</script>

		
<c:import url="/Api/admgrIncludeBottom.do"/>