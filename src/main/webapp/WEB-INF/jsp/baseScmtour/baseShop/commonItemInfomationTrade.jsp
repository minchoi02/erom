<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
			<dl class="nopm">
				<dt>거래조건에 대한 정보</dt>
				<dd>
					<dl class="nopm">
						<dt>재화 등의 공급방법 및 공급시기</dt>
						<dd><c:out value="${prod_trade_info_1_str}" escapeXml="false"/></dd>
					</dl>
					<dl class="nopm">
						<dt>청약철회 등에 관한 사항</dt>
						<dd><c:out value="${prod_trade_info_2_str}" escapeXml="false"/></dd>
					</dl>
					<dl class="nopm">
						<dt>재화 등의 교환∙반품∙보증과 그 대금 환불 및 환불의 지연에 따른 배상금 지급의 조건∙절차</dt>
						<dd><c:out value="${prod_trade_info_3_str}" escapeXml="false"/></dd>
					</dl>
					<dl class="nopm">
						<dt>소비자피해보상의 처리, 재화 등에 대한 불만 처리 및 소비자와 사업자 사이의 분쟁처리에 관한 사항</dt>
						<dd>
							<c:out value="${prod_trade_info_4_str}" escapeXml="false"/>
						</dd>
					</dl>
					<dl class="nopm">
						<dt>거래에 관한 약관의 내용 또는 확인할 수 있는 방법</dt>
						<dd><c:out value="${prod_trade_info_5_str}" escapeXml="false"/></dd>
					</dl>
				</dd>
			</dl>