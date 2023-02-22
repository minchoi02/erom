<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<c:import url="/Api/IncludeTop.do"/>

<c:if test="${isGps eq 'N' }">
<script>alert("GPS정보 수신에 실패하였습니다.\n\n모바일기기가 아니거나, GPS장치가 비활성일수 있습니다."); history.back();</script>
</c:if>

<c:if test="${isGps eq 'Y' }">
<style>
.myself  { border: solid 1px #ff6600; border-radius: 3px; background: #ff6600; color: #ffff20; font-weight: bold; padding: 4px 8px; margin-top: -60px;}
.store  { border: solid 1px #333; border-radius: 3px; background: #333; color: #ffff20; font-weight: bold; padding: 4px 8px; margin-top: -78px;}
.store_name{ color: #ffff20; }
.store_tel  { color: #fff; font-size: 0.9em; }
</style>

	<!-- 전체검색 리스트 { -->
	<section id="myArea" class="search_page">
		<article class="spheader">
			<div class="backarea"><a href="javascript:history.back();" class="backbtn"><i class="fal fa-arrow-left"></i><span class="sound_only">뒤로가기</span></a></div>
			<h2>
				<em>내 주변</em>
				<%--
				<div class="area_choice">
					<input type="text" id="map_size" name="map_size" value="100" /><!-- 반경 Km기준 -->
					<select class="basic_select w100" name="map_type" id="map_type" onchange="setmaptype(this.value, $('#map_size').val());">
						<option value="">전체보기</option>
						<option value="CD002001">관광/체험</option>
						<option value="CD002002">숙박</option>
						<option value="CD002003">맛집</option>
						<option value="CD002003">서천장터</option>
					</select>
				</div>
				--%>
			</h2>
			<div class="search_userbox">
				<ul class="nopm floats">
					<li><a href="/search/search.do" class="subtn searchbtn"><i class="far fa-search"></i><span class="sound_only">검색 버튼</span></a></li>
					<c:choose>
					<c:when test="${empty user_id }">
					<li><a href="javascript:getLogin('myPlace.do')" class="subtn userbtn"><i class="far fa-lock-alt"></i><span class="sound_only">로그인 버튼</span></a></li>
					</c:when>
					<c:otherwise>
					<li><a href="javascript:alert('이미 로그인상태입니다.');" class="subtn userbtn"><i class="far fa-lock-alt"></i><span class="sound_only">로그인 버튼</span></a></li>
					</c:otherwise>
					</c:choose>
				</ul>
			</div>
		</article>
		<article id="myAreaMap">
		</article>
	</section>
	<!-- } 전체검색 리스트 -->

	<script>
	function setmaptype(map_type, map_size) {
		location.replace("/extention/myPlace.do?map_type="+map_type+"&map_size="+map_size);
	} 


	//맵 만들자
	var imageself = "/images/map/marker_self.png";	// 기본
	var imageSrcF = "/images/map/marker_food.png";	// 푸드
	var imageSrcT = "/images/map/marker_travel.png";	// 관광지
	var imageSrcH = "/images/map/marker_house.png";	// 숙박
	
	var mapContainer = document.getElementById('myAreaMap'), // 지도를 표시할 div 
	mapOption = {
		center: new daum.maps.LatLng(<c:out value="${user_lat}"/>, <c:out value="${user_lng}"/>), // 지도의 중심좌표
		level: 3 // 지도의 확대 레벨
	};
	
	// 지도를 생성합니다    
	var map = new daum.maps.Map(mapContainer, mapOption); 	

	var imageSrc = imageself, // 마커이미지의 주소입니다    
		imageSize = new daum.maps.Size(25, 35), // 마커이미지의 크기입니다
		imageOption = {offset: new daum.maps.Point(15, 42)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
		
	// 결과값으로 받은 위치를 마커로 표시합니다
	var markerImage = new daum.maps.MarkerImage(imageSrc, imageSize, imageOption),
		markerPosition  = new daum.maps.LatLng(<c:out value="${user_lat}"/>, <c:out value="${user_lng}"/>);
	 
	var marker = new daum.maps.Marker({
		position: markerPosition,
		image: markerImage
	});

	function resizeMaps() {
		var mapContainer = document.getElementById('myAreaMap');
		mapContainer.style.width = '100%';
		mapContainer.style.height = '100%'; 
		relayout();
		setCenter(<c:out value="${user_lat}"/>, <c:out value="${user_lng}"/>);
	}
	function resizeMaph() {
		var mapContainer = document.getElementById('myAreaMap');
		mapContainer.style.width = '0px';
		mapContainer.style.height = '0px'; 
		relayout();
	}
	function relayout() {    
		// 지도를 표시하는 div 크기를 변경한 이후 지도가 정상적으로 표출되지 않을 수도 있습니다
		// 크기를 변경한 이후에는 반드시  map.relayout 함수를 호출해야 합니다 
		// window의 resize 이벤트에 의한 크기변경은 map.relayout 함수가 자동으로 호출됩니다
		map.relayout();
	}
	function setCenter(lat, lng) {            
		// 이동할 위도 경도 위치를 생성합니다 
		var moveLatLon = new daum.maps.LatLng(lat, lng);
		// 지도 중심을 이동 시킵니다
		map.setCenter(moveLatLon);
	}
	marker.setMap(map);
	
	var content = "<div class='myself'>내 위치</div>";
	var customOverlay = new daum.maps.CustomOverlay({
		position: markerPosition,  
		content: content   
	});
	customOverlay.setMap(map);

	var mapTypeControl = new daum.maps.MapTypeControl();
	//map.addControl(mapTypeControl, daum.maps.ControlPosition.TOPRIGHT);
	//var zoomControl = new daum.maps.ZoomControl();
	//map.addControl(zoomControl, daum.maps.ControlPosition.RIGHT);



	function setMapType(maptype) { 
		var roadmapControl = document.getElementById('btnRoadmap');
		var skyviewControl = document.getElementById('btnSkyview'); 
		if (maptype === 'roadmap') {
			map.setMapTypeId(daum.maps.MapTypeId.ROADMAP);    
			roadmapControl.className = 'selected_btn';
			skyviewControl.className = 'btn';
		} else {
			map.setMapTypeId(daum.maps.MapTypeId.HYBRID);    
			skyviewControl.className = 'selected_btn';
			roadmapControl.className = 'btn';
		}
	}

	// 지도 확대, 축소 컨트롤에서 확대 버튼을 누르면 호출되어 지도를 확대하는 함수입니다
	function zoomIn() {
		map.setLevel(map.getLevel() - 1);
	}

	// 지도 확대, 축소 컨트롤에서 축소 버튼을 누르면 호출되어 지도를 확대하는 함수입니다
	function zoomOut() {
		map.setLevel(map.getLevel() + 1);
	}
	
	positions = [];
	//positions1 = [];
	//positions2 = [];
	//positions3 = [];
	
	markers = [];	//마커 초기화
	customOverlays = [];	// 초기화
	
	var imageSize = new daum.maps.Size(25, 35); 
	// 마커 이미지를 생성합니다    
	var markerImageF = new daum.maps.MarkerImage(imageSrcF, imageSize);
	
	<c:forEach var="get_store_list" items="${get_store_list}" varStatus="status">
	positions.push( {store_id:"<c:out value="${get_store_list.store_id}"/>", store_nm:"<c:out value="${get_store_list.store_nm}"/>", store_tel:"<c:out value="${get_store_list.store_tel}"/>", latlng:new daum.maps.LatLng("<c:out value="${get_store_list.store_lat}"/>","<c:out value="${get_store_list.store_lng}"/>") });
	</c:forEach>

	for (var i = 0; i < positions.length; i++) { //축제
		var store_id = positions[i].store_id;
		var content_str = "<a href='tel:"+positions[i].store_tel+"'><span class='store_name'>"+positions[i].store_nm + "</span><br><span class='store_tel'>"+positions[i].store_tel+"</span></a>";
		
		// 마커를 생성합니다
		var marker = new daum.maps.Marker({
			map: map, // 마커를 표시할 지도 - setMap을 쓰기 위해 주석
			position: positions[i].latlng, // 마커를 표시할 위치
			//title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
			image : markerImageF // 마커 이미지 
		});
		marker.setMap(map);
		markers.push(marker); //배열에 추가해줌.

		var content = "<div class='store'>"+content_str+"</div>";
		var customOverlay = new daum.maps.CustomOverlay({
			position: positions[i].latlng,  
			content: content   
		});
		customOverlay.setMap(map);
		customOverlays.push(customOverlay); 
	}

	</script>

<c:import url="/Api/IncludeBottom.do"/>
</c:if>
