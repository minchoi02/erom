package egovframework.base.service;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.security.MessageDigest;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import com.google.gson.JsonObject;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.codec.binary.Base64;
import org.springframework.web.bind.annotation.ModelAttribute;


public interface BaseService {
	
	/* 코드목록 가져오기 */
	public void basedbrealupdate(BaseVO baseVO) throws Exception;

	/* 코드목록 가져오기 */
	public void basedbdevupdate(BaseVO baseVO) throws Exception;
	
	/* 코드목록 가져오기 */
	public List<BaseVO> get_base_cd_list(BaseVO baseVO) throws Exception;
	
	/* 코드정보 가져오기 */
	public BaseVO get_base_cd_info(BaseVO baseVO) throws Exception;
		
	/* 앱정보 가져오기 */
	public BaseVO app_info(BaseVO baseVO) throws Exception;
	
	/* 앱버젼 가져오기 */
	public BaseVO app_version_info(BaseVO baseVO) throws Exception;
	
	/* 토큰정보 업데이트 */
	public void update_member_token(BaseVO baseVO) throws Exception;
	
	/* 파일정보 가져오기 */
	public BaseVO getFileInfo(BaseVO baseVO) throws Exception;
	
	/* 로그 가져오기. */
	public int get_log_prod_view(BaseVO baseVO) throws Exception;
	public int get_log_bbs_view(BaseVO baseVO) throws Exception;
	public int get_log_agent(BaseVO baseVO) throws Exception;
	
	/* 로그기록. */
	public void set_prod_view_log(BaseVO baseVO) throws Exception;
	public void set_prod_view_cnt(BaseVO baseVO) throws Exception;
	public void set_log_agent(BaseVO baseVO) throws Exception;
	
	/* 카운트 업데이트 */
	public void set_bbs_view_log(BaseVO baseVO) throws Exception;
	public void set_bbs_view_cnt(BaseVO baseVO) throws Exception;
	
	/* 정산관련 */
	public List<BaseVO> get_calc_target_list(BaseVO baseVO) throws Exception;
	public void insert_calc(BaseVO baseVO) throws Exception;
	public void update_order_calc_st(BaseVO baseVO) throws Exception;
	
	public void update_auto_order_end(BaseVO baseVO) throws Exception;
	public void update_auto_cancel_master(BaseVO baseVO) throws Exception;
	public void update_auto_cancel_detail(BaseVO baseVO) throws Exception;
	
	public int is_calc(BaseVO baseVO) throws Exception;
	public BaseVO get_fcm_info(BaseVO baseVO) throws Exception;
	
	public List<BaseVO> get_auto_cancel_reserve_list(BaseVO baseVO) throws Exception;
	public void insert_cancel_recerve(BaseVO baseVO) throws Exception;
	public List<BaseVO> cancel_reserve_list(BaseVO baseVO) throws Exception;
	

	/* 비밀번호 암호화 */
	public static String encPasswd(String id, String password) throws Exception {
		if (id == null) { return ""; }
		if (password  == null) { return ""; }
		
		byte[] hashVAlue = null;

		MessageDigest md = MessageDigest.getInstance("SHA-256");
		
		md.reset();
		md.update(id.getBytes());
		
		hashVAlue = md.digest(password.getBytes());
		return new String(Base64.encodeBase64(hashVAlue));	
	}
	
	/* nl2br */
	public static String nl2br(String str) {
		if(str != null && str != "") {
			str = str.replaceAll("\r\n", "<br>");
			str = str.replaceAll("\r", "<br>");
			str = str.replaceAll("\n", "<br>");
			return str;
		} else {
			return null;
		}
	 }

	/* 접속자의 아이피 가져오기 */
	public static String getRemoteIP(HttpServletRequest request){
         String ip = request.getHeader("X-FORWARDED-FOR"); 
         if (ip == null) {
             ip = request.getHeader("Proxy-Client-IP");
         }
         if (ip == null) {
             ip = request.getHeader("WL-Proxy-Client-IP");
         }
         if (ip == null) {
             ip = request.getHeader("HTTP_CLIENT_IP");
         }
         if (ip == null) {
             ip = request.getHeader("HTTP_X_FORWARDED_FOR");
         }
         if (ip == null) {
             ip = request.getRemoteAddr();
         }
         return ip;
    }
	
	/* 요일구하기 */
	public static String getWeekStr(String day, String rtype) throws ParseException {
		Calendar cal = Calendar.getInstance() ;
		SimpleDateFormat rdate = new SimpleDateFormat("yyyy-MM-dd");
		Date date = rdate.parse(day);
		cal.setTime(date);
		 
		int dayNum = cal.get(Calendar.DAY_OF_WEEK); 
		String convertedSimpleString = "";
		String convertedString = "";
		String returnData = "";
		 
		switch (dayNum) {
			case 1: convertedSimpleString = "일"; convertedString = "일요일"; break;
			case 2: convertedSimpleString = "월"; convertedString = "일요일"; break;
			case 3: convertedSimpleString = "화"; convertedString = "일요일"; break;
			case 4: convertedSimpleString = "수"; convertedString = "일요일"; break;
		    case 5: convertedSimpleString = "목"; convertedString = "일요일"; break;
		    case 6: convertedSimpleString = "금"; convertedString = "일요일"; break;
		    case 7: convertedSimpleString = "토"; convertedString = "일요일"; break;
		}
		switch(rtype) {
			case "N" : 
					returnData = Integer.toString(dayNum);
					break;
			case "L" :
				returnData = convertedString;
				break;
			default : 
				returnData = convertedSimpleString;
				break;
		}
		return returnData;

	}
	
	/* 날짜차이 구하기 */
	public static String getDateDiff(String st_dt, String ed_dt) throws ParseException {
		SimpleDateFormat rdate = new SimpleDateFormat("yyyy-MM-dd");
		Date start_date = rdate.parse(st_dt);
		Date end_date = rdate.parse(ed_dt);
		long diff = end_date.getTime() - start_date.getTime();
		long diffDay = diff / (24*60*60*1000);
		String res = String.valueOf(diffDay);
		return res;
	}

	/* 문자전송  */
	public default void sendSms(
		@ModelAttribute("BaseVO") BaseVO baseVO
		) throws Exception {
		
		//센터번호 호출
		String base_header = "[이롬 스토어] ";
		BaseVO site_config = get_base_sms_info(baseVO);
		String sendnum = site_config.getsms_send();
		String sms1 = site_config.getsms_no1();
		String sms2 = site_config.getsms_no2();

		//템플릿 호출 - baseVO에 sms_cd 값 받아야 함.
		BaseVO sms_data = get_sms_data(baseVO);
		String sms_cd = sms_data.getsms_cd();
		String sms_use_user = sms_data.getsms_use_user();
		String sms_use_store = sms_data.getsms_use_store();
		String sms_use_center = sms_data.getsms_use_center();
		String sms_content_user = sms_data.getsms_content_user();
		String sms_content_store = sms_data.getsms_content_store();
		String sms_content_center = sms_data.getsms_content_center();
		
		//필요데이터 호출하기
		String sms_user_id = "";
		String sms_store_user_id = "";
		String prod_id = "";
		String store_id = "";
		String res_store_category = ""; 
		String res_user_phone = ""; 
		String res_order_id = ""; 
		String res_reserve_dt = ""; 
		String res_prod_nm = ""; 
		String res_de_comp = ""; 
		String res_de_num = ""; 
		String res_store_phone1 = ""; 
		String res_store_phone2 = ""; 
		String res_order_time = ""; 
		String send_true = "N";
		String res_order_pay_time = "";
		String set_sms_content = "";
		String push_user_os = "";
		String push_user_toekn = "";

		//유저전용
		if(("ORDER").equals(sms_cd) || 
			("CANCEL").equals(sms_cd) || 
			("PAYMENT").equals(sms_cd) || 
			("PAYMENTNEED").equals(sms_cd)) 
		{ 
			
			if(baseVO != null) {
				
				String order_id = baseVO.getorder_id();
				if(order_id != null && order_id != "") {
	
					res_order_time = "";
					
					//주문정보 가져옴
					baseVO.setorder_id(order_id);
					BaseVO getOrder = get_sms_order_info(baseVO);
					if(getOrder != null) {
						sms_user_id = getOrder.getorder_user_id();
						store_id = "";
						res_store_category = ""; 
						res_user_phone = getOrder.getorder_hp(); 
						res_order_id = order_id;
						res_reserve_dt = ""; 
						res_order_time = getOrder.getorder_pay_time();
						res_prod_nm = ""; 
						res_de_comp = ""; 
						res_de_num = ""; 
						res_order_pay_time = "";
					}
					if(res_user_phone != null && res_user_phone != "") {
						send_true = "Y";
					}

				}
				
				//발송영역
				baseVO.setsms_type("S");
				if(("Y").equals(send_true)) {
					if(("Y").equals(sms_use_user)) {
						set_sms_content = sms_content_user;
						if(res_order_id != null && res_order_id != "") {
							set_sms_content = set_sms_content.replace("{주문번호}", res_order_id);
						}
						if(res_reserve_dt != null && res_reserve_dt != "") {
							set_sms_content = set_sms_content.replace("{예약일}", res_reserve_dt);
						}
						if(res_prod_nm != null && res_prod_nm != "") {
						set_sms_content = set_sms_content.replace("{상품명}", res_prod_nm);
						}
						if(res_order_time != null && res_order_time != "") {
							set_sms_content = set_sms_content.replace("{결제대기시간}", res_order_time);
						}
						if(res_de_comp != null && res_de_comp != "") {
							set_sms_content = set_sms_content.replace("{배송사}", res_de_comp);
						}
						if(res_de_num != null && res_de_num != "") {
							set_sms_content = set_sms_content.replace("{송장번호}", res_de_num);
						}
	
						baseVO.settr_phone(res_user_phone);
						baseVO.settr_callback(sendnum);
						if(set_sms_content.length() > 40) {
							baseVO.settr_subject(base_header);
							baseVO.settr_msg(set_sms_content);
							insert_auto_mms(baseVO);
						} else {
							baseVO.settr_msg(base_header+set_sms_content);
							insert_auto_sms(baseVO);
						}
						baseVO.setsms_target("U");
						insert_sms_list(baseVO);
	
					}
					
					if(("Y").equals(sms_use_center)) {
						set_sms_content = sms_content_center;
						if(res_order_id != null && res_order_id != "") {
							set_sms_content = set_sms_content.replace("{주문번호}", res_order_id);
						}
						if(res_reserve_dt != null && res_reserve_dt != "") {
							set_sms_content = set_sms_content.replace("{예약일}", res_reserve_dt);
						}
						if(res_prod_nm != null && res_prod_nm != "") {
						set_sms_content = set_sms_content.replace("{상품명}", res_prod_nm);
						}
						if(res_order_time != null && res_order_time != "") {
							set_sms_content = set_sms_content.replace("{결제대기시간}", res_order_time);
						}
						if(res_de_comp != null && res_de_comp != "") {
							set_sms_content = set_sms_content.replace("{배송사}", res_de_comp);
						}
						if(res_de_num != null && res_de_num != "") {
							set_sms_content = set_sms_content.replace("{송장번호}", res_de_num);
						}	
						
						baseVO.settr_callback(sendnum);
						baseVO.setsms_target("C");
						
						baseVO.settr_phone(sms1);
						if(set_sms_content.length() > 40) {
							baseVO.settr_subject(base_header);
							baseVO.settr_msg(set_sms_content);
							insert_auto_mms(baseVO);
						} else {
							baseVO.settr_msg(base_header+set_sms_content);
							insert_auto_sms(baseVO);
						}
						insert_sms_list(baseVO);
						baseVO.settr_phone(sms2);
						if(set_sms_content.length() > 40) {
							baseVO.settr_subject(base_header);
							baseVO.settr_msg(set_sms_content);
							insert_auto_mms(baseVO);
						} else {
							baseVO.settr_msg(base_header+set_sms_content);
							insert_auto_sms(baseVO);
						}
						insert_sms_list(baseVO);
					}
				}
			}
		
		}
		
		//상점 전용
		if(("PAYMENT001").equals(sms_cd) || 
			("PAYMENT002").equals(sms_cd) || 
			("PAYMENT003").equals(sms_cd) || 
			("PAYMENT004").equals(sms_cd) ||
			("CANCEL001").equals(sms_cd) || 
			("CANCEL002").equals(sms_cd) || 
			("CANCEL003").equals(sms_cd) || 
			("CANCEL004").equals(sms_cd) ||
			("RESERVEINFO").equals(sms_cd) ||
			("DELIVERY_START").equals(sms_cd))
			{ 
				
			if(baseVO != null) {
				
				String order_id = baseVO.getorder_id();
				if(order_id != null && order_id != "") {
	
					baseVO.setorder_id(order_id);
					List<BaseVO> detail_list = get_sms_order_detail_list(baseVO);
					for(int i=0; i<detail_list.size(); i++) {
					//주문정보 가져옴
						String od_user_hp = detail_list.get(i).getorder_hp();
						String od_order_id = detail_list.get(i).getod_order_id();
						String od_prod_nm = detail_list.get(i).getod_prod_nm();
						String od_store_id = detail_list.get(i).getod_store_id();
						String od_store_category = detail_list.get(i).getod_store_category();
						String od_prod_category = detail_list.get(i).getod_prod_category();
						String od_st_dt = detail_list.get(i).getod_st_dt();
						String od_ed_dt = detail_list.get(i).getod_ed_dt();
						String order_pay_time = detail_list.get(i).getorder_pay_time();
						String de_comp = detail_list.get(i).getod_delivery_company_nm();
						String de_num = detail_list.get(i).getod_delivery_number();
						
						if(("CD002002").equals(od_store_category)) {
							res_reserve_dt = od_st_dt+"~"+od_ed_dt; 
						} 
						else if(("CD002004").equals(res_store_category)) {
							res_reserve_dt = "";
						} else {
							res_reserve_dt = od_st_dt;
						}

						// 상점아이디를 가져와서 번호를 추출한더.
						baseVO.setstore_id(od_store_id);
						BaseVO getStore = get_sms_store_info(baseVO);
						
						res_user_phone = od_user_hp;
						res_order_id = od_order_id;
						res_prod_nm = od_prod_nm;
						res_order_time = "";
						res_de_comp = "";
						if(de_comp != null && de_comp != "") {
							res_de_num = de_num;
						}
						res_order_pay_time = "";
						if(order_pay_time != null && order_pay_time != "") {
							res_order_pay_time = order_pay_time;
						}
						res_store_phone1 = getStore.getstore_hp_1();
						res_store_phone2 = getStore.getstore_hp_2(); 
						
						//발송영역
						baseVO.setsms_type("S");
						if(("Y").equals(sms_use_user)) {
							set_sms_content = sms_content_user;
							if(res_order_id != null && res_order_id != "") {
								set_sms_content = set_sms_content.replace("{주문번호}", res_order_id);
							}
							if(res_reserve_dt != null && res_reserve_dt != "") {
								set_sms_content = set_sms_content.replace("{예약일}", res_reserve_dt);
							}
							if(res_prod_nm != null && res_prod_nm != "") {
							set_sms_content = set_sms_content.replace("{상품명}", res_prod_nm);
							}
							if(res_order_time != null && res_order_time != "") {
								set_sms_content = set_sms_content.replace("{결제대기시간}", res_order_time);
							}
							if(res_de_comp != null && res_de_comp != "") {
								set_sms_content = set_sms_content.replace("{배송사}", res_de_comp);
							}
							if(res_de_num != null && res_de_num != "") {
								set_sms_content = set_sms_content.replace("{송장번호}", res_de_num);
							}

							baseVO.settr_phone(res_user_phone);
							baseVO.settr_callback(sendnum);
							if(set_sms_content.length() > 40) {
								baseVO.settr_subject(base_header);
								baseVO.settr_msg(set_sms_content);
								insert_auto_mms(baseVO);
							} else {
								baseVO.settr_msg(base_header+set_sms_content);
								insert_auto_sms(baseVO);
							}
							baseVO.setsms_target("U");
							insert_sms_list(baseVO);
		
						}
						
						if(("Y").equals(sms_use_store)) {
							set_sms_content = sms_content_store;
							if(res_order_id != null && res_order_id != "") {
								set_sms_content = set_sms_content.replace("{주문번호}", res_order_id);
							}
							if(res_reserve_dt != null && res_reserve_dt != "") {
								set_sms_content = set_sms_content.replace("{예약일}", res_reserve_dt);
							}
							if(res_prod_nm != null && res_prod_nm != "") {
							set_sms_content = set_sms_content.replace("{상품명}", res_prod_nm);
							}
							if(res_order_time != null && res_order_time != "") {
								set_sms_content = set_sms_content.replace("{결제대기시간}", res_order_time);
							}
							if(res_de_comp != null && res_de_comp != "") {
								set_sms_content = set_sms_content.replace("{배송사}", res_de_comp);
							}
							if(res_de_num != null && res_de_num != "") {
								set_sms_content = set_sms_content.replace("{송장번호}", res_de_num);
							}
							
							baseVO.settr_callback(sendnum);
							baseVO.setsms_target("S");
							if(res_store_phone1 != null && res_store_phone1 != "") {
								baseVO.settr_phone(res_store_phone1);
								if(set_sms_content.length() > 40) {
									baseVO.settr_subject(base_header);
									baseVO.settr_msg(set_sms_content);
									insert_auto_mms(baseVO);
								} else {
									baseVO.settr_msg(base_header+set_sms_content);
									insert_auto_sms(baseVO);
								}
								insert_sms_list(baseVO);
							}
							if(res_store_phone2 != null && res_store_phone2 != "") {
								baseVO.settr_phone(res_store_phone2);
								if(set_sms_content.length() > 40) {
									baseVO.settr_subject(base_header);
									baseVO.settr_msg(set_sms_content);
									insert_auto_mms(baseVO);
								} else {
									baseVO.settr_msg(base_header+set_sms_content);
									insert_auto_sms(baseVO);
								}
								insert_sms_list(baseVO);
							}
							
						}
						if(("Y").equals(sms_use_center)) {
							set_sms_content = sms_content_center;
							if(res_order_id != null && res_order_id != "") {
								set_sms_content = set_sms_content.replace("{주문번호}", res_order_id);
							}
							if(res_reserve_dt != null && res_reserve_dt != "") {
								set_sms_content = set_sms_content.replace("{예약일}", res_reserve_dt);
							}
							if(res_prod_nm != null && res_prod_nm != "") {
							set_sms_content = set_sms_content.replace("{상품명}", res_prod_nm);
							}
							if(res_order_time != null && res_order_time != "") {
								set_sms_content = set_sms_content.replace("{결제대기시간}", res_order_time);
							}
							if(res_de_comp != null && res_de_comp != "") {
								set_sms_content = set_sms_content.replace("{배송사}", res_de_comp);
							}
							if(res_de_num != null && res_de_num != "") {
								set_sms_content = set_sms_content.replace("{송장번호}", res_de_num);
							}	
							
							baseVO.settr_callback(sendnum);
							baseVO.setsms_target("C");
							
							baseVO.settr_phone(sms1);
							if(set_sms_content.length() > 40) {
								baseVO.settr_subject(base_header);
								baseVO.settr_msg(set_sms_content);
								insert_auto_mms(baseVO);
							} else {
								baseVO.settr_msg(base_header+set_sms_content);
								insert_auto_sms(baseVO);
							}
							insert_sms_list(baseVO);
							baseVO.settr_phone(sms2);
							if(set_sms_content.length() > 40) {
								baseVO.settr_subject(base_header);
								baseVO.settr_msg(set_sms_content);
								insert_auto_mms(baseVO);
							} else {
								baseVO.settr_msg(base_header+set_sms_content);
								insert_auto_sms(baseVO);
							}
							insert_sms_list(baseVO);
						}
					}
				}
			}
		}
		
		

		if("QNA".equals(sms_cd.substring(0,3)) || 
			"MTM".equals(sms_cd.substring(0,3))) 
		{
			
			if(baseVO != null) {
			
				String user_hp = baseVO.getuser_hp();
				String bbs_id = baseVO.getbbs_id();
				prod_id = baseVO.getprod_id();
				store_id = baseVO.getstore_id();
				
				if(bbs_id != null && bbs_id != "") {
				
					String prod_nm = "";
					String store_phone1 = "";
					String store_phone2 = "";
					
					if(prod_id != null && prod_id != "") {
						baseVO.setprod_id(prod_id);
						BaseVO getProd = get_sms_prod_info(baseVO);
						prod_nm = getProd.getprod_nm();
						store_id = getProd.getstore_id();
						
						baseVO.setstore_id(store_id);
						BaseVO getStore = get_sms_store_info(baseVO);
						res_store_phone1 = getStore.getstore_hp_1();
						res_store_phone2 = getStore.getstore_hp_2();
					}

					if(user_hp != null && user_hp != "") {
						send_true = "Y";
						res_store_category = ""; 
						res_user_phone = user_hp; 
						res_order_id = ""; 
						res_reserve_dt = ""; 
						res_prod_nm = prod_nm; 
						res_de_comp = ""; 
						res_de_num = ""; 
						res_order_time = "";
						
					}
	
				}
		
				//발송영역
				baseVO.setsms_type("S");
				if(("Y").equals(send_true)) {
					if(("Y").equals(sms_use_user)) {
						set_sms_content = sms_content_user;
						if(res_order_id != null && res_order_id != "") {
							set_sms_content = set_sms_content.replace("{주문번호}", res_order_id);
						}
						if(res_reserve_dt != null && res_reserve_dt != "") {
							set_sms_content = set_sms_content.replace("{예약일}", res_reserve_dt);
						}
						if(res_prod_nm != null && res_prod_nm != "") {
						set_sms_content = set_sms_content.replace("{상품명}", res_prod_nm);
						}
						if(res_order_time != null && res_order_time != "") {
							set_sms_content = set_sms_content.replace("{배송사}", res_order_time);
						}
						if(res_order_time != null && res_order_time != "") {
							set_sms_content = set_sms_content.replace("{결제대기시간}", res_order_time);
						}
						if(res_de_comp != null && res_de_comp != "") {
							set_sms_content = set_sms_content.replace("{배송사}", res_de_comp);
						}
						if(res_de_num != null && res_de_num != "") {
							set_sms_content = set_sms_content.replace("{송장번호}", res_de_num);
						}
	
						baseVO.settr_phone(res_user_phone);
						baseVO.settr_callback(sendnum);
						if(set_sms_content.length() > 40) {
							baseVO.settr_subject(base_header);
							baseVO.settr_msg(set_sms_content);
							insert_auto_mms(baseVO);
						} else {
							baseVO.settr_msg(base_header+set_sms_content);
							insert_auto_sms(baseVO);
						}
						baseVO.setsms_target("U");
						insert_sms_list(baseVO);
	
					}
					
					
					if(("Y").equals(sms_use_store)) {
						set_sms_content = sms_content_store;
						if(res_order_id != null && res_order_id != "") {
							set_sms_content = set_sms_content.replace("{주문번호}", res_order_id);
						}
						if(res_reserve_dt != null && res_reserve_dt != "") {
							set_sms_content = set_sms_content.replace("{예약일}", res_reserve_dt);
						}
						if(res_prod_nm != null && res_prod_nm != "") {
						set_sms_content = set_sms_content.replace("{상품명}", res_prod_nm);
						}
						if(res_order_time != null && res_order_time != "") {
							set_sms_content = set_sms_content.replace("{결제대기시간}", res_order_time);
						}
						if(res_de_comp != null && res_de_comp != "") {
							set_sms_content = set_sms_content.replace("{배송사}", res_de_comp);
						}
						if(res_de_num != null && res_de_num != "") {
							set_sms_content = set_sms_content.replace("{송장번호}", res_de_num);
						}
						
						baseVO.settr_callback(sendnum);
						baseVO.setsms_target("S");
						if(res_store_phone1 != null && res_store_phone1 != "") {
							baseVO.settr_phone(res_store_phone1);
							if(set_sms_content.length() > 40) {
								baseVO.settr_subject(base_header);
								baseVO.settr_msg(set_sms_content);
								insert_auto_mms(baseVO);
							} else {
								baseVO.settr_msg(base_header+set_sms_content);
								insert_auto_sms(baseVO);
							}
							insert_sms_list(baseVO);
						}
						if(res_store_phone2 != null && res_store_phone2 != "") {
							baseVO.settr_phone(res_store_phone2);
							if(set_sms_content.length() > 40) {
								baseVO.settr_subject(base_header);
								baseVO.settr_msg(set_sms_content);
								insert_auto_mms(baseVO);
							} else {
								baseVO.settr_msg(base_header+set_sms_content);
								insert_auto_sms(baseVO);
							}
							insert_sms_list(baseVO);
						}
						
					}
					if(("Y").equals(sms_use_center)) {
						set_sms_content = sms_content_center;
						if(res_order_id != null && res_order_id != "") {
							set_sms_content = set_sms_content.replace("{주문번호}", res_order_id);
						}
						if(res_reserve_dt != null && res_reserve_dt != "") {
							set_sms_content = set_sms_content.replace("{예약일}", res_reserve_dt);
						}
						if(res_prod_nm != null && res_prod_nm != "") {
						set_sms_content = set_sms_content.replace("{상품명}", res_prod_nm);
						}
						if(res_order_time != null && res_order_time != "") {
							set_sms_content = set_sms_content.replace("{결제대기시간}", res_order_time);
						}
						if(res_de_comp != null && res_de_comp != "") {
							set_sms_content = set_sms_content.replace("{배송사}", res_de_comp);
						}
						if(res_de_num != null && res_de_num != "") {
							set_sms_content = set_sms_content.replace("{송장번호}", res_de_num);
						}	
						
						baseVO.settr_callback(sendnum);
						baseVO.setsms_target("C");
						
						baseVO.settr_phone(sms1);
						if(set_sms_content.length() > 40) {
							baseVO.settr_subject(base_header);
							baseVO.settr_msg(set_sms_content);
							insert_auto_mms(baseVO);
						} else {
							baseVO.settr_msg(base_header+set_sms_content);
							insert_auto_sms(baseVO);
						}
						insert_sms_list(baseVO);
						baseVO.settr_phone(sms2);
						if(set_sms_content.length() > 40) {
							baseVO.settr_subject(base_header);
							baseVO.settr_msg(set_sms_content);
							insert_auto_mms(baseVO);
						} else {
							baseVO.settr_msg(base_header+set_sms_content);
							insert_auto_sms(baseVO);
						}
						insert_sms_list(baseVO);
					}
				}
			}
		}
		
		

	}

	/* 푸쉬전송  */
	public default void sendPush(
		@ModelAttribute("BaseVO") BaseVO baseVO
		) throws Exception {

		HttpURLConnection conn;
	    OutputStreamWriter wr;
	    BufferedReader br;
	    URL url;
	    
		//fcm키 호출
		String api_url_fcm = "https://fcm.googleapis.com/fcm/send";
		BaseVO fcm_config = get_fcm_info(baseVO);
		String fcm_key = fcm_config.getfcm_key();
		
		String push_cd = baseVO.getpush_cd();
		
		if("CUSTOM".equals(push_cd)) {	// 관리자직접발송
			String order_id = baseVO.getorder_id();
			String prod_nm = baseVO.getprod_nm();
			String sms_to_group = baseVO.getsms_to_group();
			String sms_content = baseVO.getsms_content();
			String sms_reserve_dt = baseVO.getsms_reserve_dt();
			String searchKey = baseVO.getsearchkey();
	
			List<BaseVO> group = get_sms_group_list(baseVO);
			
			
		} else {
			
			push_cd = baseVO.getpush_cd();
			BaseVO push_data = get_push_data(baseVO);
			String push_use_user = push_data.getpush_use_user();
			String push_use_store = push_data.getpush_use_store();
			String push_use_center = push_data.getpush_use_center();
			String push_content_user = push_data.getpush_content_user();
			String push_content_store = push_data.getpush_content_store();
			String push_content_center = push_data.getpush_content_center();
			
			//sms발송조건을 확인한다. 번호가 있어야 하고 앞번호가 010 인 경우..
		}

		//String user_token = baseVO.getuser_device_token();
		//fcm_key = "AAAAOKXz1jg:APA91bFW8renysV3rTB6rLIyklo-08zuh_ZR4TuWmsCO2SsEr5pAwTNFPRIwqhkf07T24lcSUKuHQhuR_zGwSBhx7sU1Itb_yHPF-77mrWye51_dp3UASQqCnkneh5jvagEott1ci1Im";
		
		BaseVO user_info = get_sms_member_info(baseVO);
		String user_os = user_info.getuser_device_os();
		String user_token = user_info.getuser_device_token();
		//String user_token = "dhALuhjFF1E:APA91bH7H7VvGwxIIsELaCW-86aU1mCbzox0N-xJp5g-wAFK5kgpuQXyXGWF4Hc3f4Zq-N8-linoqeSO2TiKGMdflV144cX1xGyJj3fs8NhxYiP-0Kww8LLwiAUjJOp2uJ3dY5mvlLXB";
		String msgBody = baseVO.getpush_content();

	    
		url = new URL(api_url_fcm);
		conn = (HttpURLConnection) url.openConnection();
		conn.setUseCaches(false);
		conn.setDoInput(true);
		conn.setDoOutput(true);
		conn.setRequestMethod("POST");
		conn.setRequestProperty("Authorization", "key=" + fcm_key);
		conn.setRequestProperty("Content-Type", "application/json");
		
		JsonObject json = new JsonObject();
		JsonObject data = new JsonObject();

		data.addProperty("title", "[이롬 스토어] 안내");
		data.addProperty("body", msgBody); // Notification body
		data.addProperty("priority", "high");
		data.addProperty("sound", "default");
        //data.addProperty("linkurl", "https://www.scmtour.com/shop/itemList.do?store_category=CD002003"); // Notification body
        
        json.addProperty("to", user_token);
        json.add("data", data);
        
        try{
            wr = new OutputStreamWriter(conn.getOutputStream(), "UTF-8");
            wr.write(json.toString());
            wr.flush();
            
        }catch(Exception e){
            //connFinish();
            throw new Exception("OutputStreamException : " + e);
        }

        if (conn.getResponseCode() != HttpURLConnection.HTTP_OK) {
            //400, 401, 500 등
            //connFinish();
            throw new RuntimeException("Failed : HTTP error code : " + conn.getResponseCode());
        }else{
            br = new BufferedReader(new InputStreamReader((conn.getInputStream())));

            String output;
            System.out.println("Output from Server .... \n");
            while ((output = br.readLine()) != null) {
                System.out.println(output);
            }
            //200 + error 는 재전송 등등의 로직
        }

   	
	}

	public default BaseVO get_base_sms_info(BaseVO baseVO) throws Exception{
		return baseVO;
	}
	public default BaseVO get_sms_member_info(BaseVO baseVO) throws Exception{
		return baseVO;
	}
	public default BaseVO get_sms_store_info(BaseVO baseVO) throws Exception{
		return baseVO;
	}
	public default BaseVO get_sms_prod_info(BaseVO baseVO) throws Exception{
		return baseVO;
	}
	public default BaseVO get_sms_order_info(BaseVO baseVO) throws Exception{
		return baseVO;
	}
	public default BaseVO get_sms_bbs_info(BaseVO baseVO) throws Exception{
		return baseVO;
	}
	public default List<BaseVO> get_sms_group_list(BaseVO baseVO) throws Exception{
		return (List<BaseVO>) baseVO;
	}
	public default List<BaseVO> get_sms_order_detail_list(BaseVO baseVO) throws Exception{
		return (List<BaseVO>) baseVO;
	}
	public default BaseVO get_sms_data(BaseVO baseVO) throws Exception{
		return baseVO;
	}
	public default BaseVO get_push_data(BaseVO baseVO) throws Exception{
		return baseVO;
	}
	public void insert_sms(BaseVO baseVO) throws Exception;
	public void insert_mms(BaseVO baseVO) throws Exception;
	public void insert_auto_sms(BaseVO baseVO) throws Exception;
	public void insert_auto_mms(BaseVO baseVO) throws Exception;
	public void insert_sms_list(BaseVO baseVO) throws Exception;

}