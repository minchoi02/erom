package egovframework.admgrConfig.service;

import egovframework.admgrConfig.service.AdmgrConfigVO;
import egovframework.base.service.BasePagingVO;

public class AdmgrConfigVO extends BasePagingVO {
	
	private String site_nm;
	private String site_use_rule;
	private String site_personal;
	private String site_agree_place;
	private String site_customer_script;
	private String site_email;
	private String site_tel;
	private String site_fax;
	private String site_zip;
	private String site_addr_1;
	private String site_addr_2;
	private String site_ceo_nm;
	private String site_company_nm;
	private String site_company_number;
	private String site_company_to_number;
	private String site_sail_auth_number;
	private String site_info_adm_nm;
	private String site_info_adm_email;
	private String pay_use_bank_st;
	private String pay_use_card_st;
	private String pay_bank_nm;
	private String pay_bank_number;
	private String pay_bank_user;
	private String pay_card_calc;	
	private String pay_real_calc;
	private String pay_virt_calc;
	private String pay_pg_adm_url;
	private String pay_pg_id;
	private String pay_pg_pwd;
	private String sns_use_login_st;
	private String sns_naver_cid;
	private String sns_naver_ckey;
	private String sns_daum_rakey;
	private String sns_daum_jskey;
	private String sns_daum_ckey;
	private String sns_facebook_cid;
	private String sns_facebook_ckey;
	private String sns_apple_cid;
	private String sns_apple_ckey;
	private String calc_travel;
	private String calc_house;
	private String calc_food;
	private String calc_market;
	private String mileage_join_use_st;
	private String mileage_join;
	private String mileage_order_use_st;
	private String mileage_order;
	private String info_1;
	private String info_2;
	private String info_3;
	private String info_4;
	private String info_5;
	private String time_limit;
	private String sms_send;
	private String sms_no1;
	private String sms_no2;
	private String tracking_key;
	
	/* APP 버전체크용 */
	private String android;
	private String ios;
	private String fcm_key;
	
	/* 검색용 */
	private String searchKeyword;
	
	/* 팝업용 */
	private String popup_seq;
	private String popup_nm;
	private String popup_top;
	private String popup_left;
	private String popup_width;
	private String popup_height;
	private String popup_content;
	private String popup_st_dt;
	private String popup_st_dt_ymd;
	private String popup_st_dt_hour;
	private String popup_st_dt_minute;
	private String popup_ed_dt;
	private String popup_ed_dt_ymd;
	private String popup_ed_dt_hour;
	private String popup_ed_dt_minute;
	private String popup_use_st;
	private String popup_hit_cnt;
	private String reg_dt;
	private String mod_dt;
	private String popup_status;
	
	public String getsite_nm() { return site_nm; }
	public void setsite_nm(String site_nm) { this.site_nm = site_nm; }

	public String getsite_use_rule() { return site_use_rule; }
	public void setsite_use_rule(String site_use_rule) { this.site_use_rule = site_use_rule; }
	
	public String getsite_personal() { return site_personal; }
	public void setsite_personal(String site_personal) { this.site_personal = site_personal; }
	
	public String getsite_agree_place() { return site_agree_place; }
	public void setsite_agree_place(String site_agree_place) { this.site_agree_place = site_agree_place; }
	
	public String getsite_customer_script() { return site_customer_script; }
	public void setsite_customer_script(String site_customer_script) { this.site_customer_script = site_customer_script; }
	
	public String getsite_email() { return site_email; }
	public void setsite_email(String site_email) { this.site_email = site_email; }
	
	public String getsite_tel() { return site_tel; }
	public void setsite_tel(String site_tel) { this.site_tel = site_tel; }
	
	public String getsite_fax() { return site_fax; }
	public void setsite_fax(String site_fax) { this.site_fax = site_fax; }
	
	public String getsite_zip() { return site_zip; }
	public void setsite_zip(String site_zip) { this.site_zip = site_zip; }
	
	public String getsite_addr_1() { return site_addr_1; }
	public void setsite_addr_1(String site_addr_1) { this.site_addr_1 = site_addr_1; }
	
	public String getsite_addr_2() { return site_addr_2; }
	public void setsite_addr_2(String site_addr_2) { this.site_addr_2 = site_addr_2; }
	
	public String getsite_ceo_nm() { return site_ceo_nm; }
	public void setsite_ceo_nm(String site_ceo_nm) { this.site_ceo_nm = site_ceo_nm; }
	
	public String getsite_company_nm() { return site_company_nm; }
	public void setsite_company_nm(String site_company_nm) { this.site_company_nm = site_company_nm; }
	
	public String getsite_company_number() { return site_company_number; }
	public void setsite_company_number(String site_company_number) { this.site_company_number = site_company_number; }
	
	public String getsite_company_to_number() { return site_company_to_number; }
	public void setsite_company_to_number(String site_company_to_number) { this.site_company_to_number = site_company_to_number; }
	
	public String getsite_sail_auth_number() { return site_sail_auth_number; }
	public void setsite_sail_auth_number(String site_sail_auth_number) { this.site_sail_auth_number = site_sail_auth_number; }
	
	public String getsite_info_adm_nm() { return site_info_adm_nm; }
	public void setsite_info_adm_nm(String site_info_adm_nm) { this.site_info_adm_nm = site_info_adm_nm; }
	
	public String getsite_info_adm_email() { return site_info_adm_email; }
	public void setsite_info_adm_email(String site_info_adm_email) { this.site_info_adm_email = site_info_adm_email; }
	
	public String getpay_use_bank_st() { return pay_use_bank_st; }
	public void setpay_use_bank_st(String pay_use_bank_st) { this.pay_use_bank_st = pay_use_bank_st; }
	
	public String getpay_use_card_st() { return pay_use_card_st; }
	public void setpay_use_card_st(String pay_use_card_st) { this.pay_use_card_st = pay_use_card_st; }
	
	public String getpay_bank_nm() { return pay_bank_nm; }
	public void setpay_bank_nm(String pay_bank_nm) { this.pay_bank_nm = pay_bank_nm; }
	
	public String getpay_bank_number() { return pay_bank_number; }
	public void setpay_bank_number(String pay_bank_number) { this.pay_bank_number = pay_bank_number; }
	
	public String getpay_bank_user() { return pay_bank_user; }
	public void setpay_bank_user(String pay_bank_user) { this.pay_bank_user = pay_bank_user; }
	
	public String getpay_card_calc() { return pay_card_calc; }
	public void setpay_card_calc(String pay_card_calc) { this.pay_card_calc = pay_card_calc; }
	
	public String getpay_real_calc() { return pay_real_calc; }
	public void setpay_real_calc(String pay_real_calc) { this.pay_real_calc = pay_real_calc; }

	public String getpay_virt_calc() { return pay_virt_calc; }
	public void setpay_virt_calc(String pay_virt_calc) { this.pay_virt_calc = pay_virt_calc; }
	
	public String getpay_pg_adm_url() { return pay_pg_adm_url; }
	public void setpay_pg_adm_url(String pay_pg_adm_url) { this.pay_pg_adm_url = pay_pg_adm_url; }
	
	public String getpay_pg_id() { return pay_pg_id; }
	public void setpay_pg_id(String pay_pg_id) { this.pay_pg_id = pay_pg_id; }
	
	public String getpay_pg_pwd() { return pay_pg_pwd; }
	public void setpay_pg_pwd(String pay_pg_pwd) { this.pay_pg_pwd = pay_pg_pwd; }
	
	public String getsns_use_login_st() { return sns_use_login_st; }
	public void setsns_use_login_st(String sns_use_login_st) { this.sns_use_login_st = sns_use_login_st; }
	
	public String getsns_naver_cid() { return sns_naver_cid; }
	public void setsns_naver_cid(String sns_naver_cid) { this.sns_naver_cid = sns_naver_cid; }
	
	public String getsns_naver_ckey() { return sns_naver_ckey; }
	public void setsns_naver_ckey(String sns_naver_ckey) { this.sns_naver_ckey = sns_naver_ckey; }
	
	public String getsns_daum_rakey() { return sns_daum_rakey; }
	public void setsns_daum_rakey(String sns_daum_rakey) { this.sns_daum_rakey = sns_daum_rakey; }
	
	public String getsns_daum_jskey() { return sns_daum_jskey; }
	public void setsns_daum_jskey(String sns_daum_jskey) { this.sns_daum_jskey = sns_daum_jskey; }
	
	public String getsns_daum_ckey() { return sns_daum_ckey; }
	public void setsns_daum_ckey(String sns_daum_ckey) { this.sns_daum_ckey = sns_daum_ckey; }
	
	public String getsns_facebook_cid() { return sns_facebook_cid; }
	public void setsns_facebook_cid(String sns_facebook_cid) { this.sns_facebook_cid = sns_facebook_cid; }
	
	public String getsns_facebook_ckey() { return sns_facebook_ckey; }
	public void setsns_facebook_ckey(String sns_facebook_ckey) { this.sns_facebook_ckey = sns_facebook_ckey; }
	
	public String getsns_apple_cid() { return sns_apple_cid; }
	public void setsns_apple_cid(String sns_apple_cid) { this.sns_apple_cid = sns_apple_cid; }
	
	public String getsns_apple_ckey() { return sns_apple_ckey; }
	public void setsns_apple_ckey(String sns_apple_ckey) { this.sns_apple_ckey = sns_apple_ckey; }

	public String getcalc_travel() { return calc_travel; }
	public void setcalc_travel(String calc_travel) { this.calc_travel = calc_travel; }

	public String getcalc_house() { return calc_house; }
	public void setcalc_house(String calc_house) { this.calc_house = calc_house; }

	public String getcalc_food() { return calc_food; }
	public void setcalc_food(String calc_food) { this.calc_food = calc_food; }

	public String getcalc_market() { return calc_market; }
	public void setcalc_market(String calc_market) { this.calc_market = calc_market; }
	
	public String getmileage_join_use_st() { return mileage_join_use_st; }
	public void setmileage_join_use_st(String mileage_join_use_st) { this.mileage_join_use_st = mileage_join_use_st; }
	
	public String getmileage_join() { return mileage_join; }
	public void setmileage_join(String mileage_join) { this.mileage_join = mileage_join; }

	public String getmileage_order_use_st() { return mileage_order_use_st; }
	public void setmileage_order_use_st(String mileage_order_use_st) { this.mileage_order_use_st = mileage_order_use_st; }
	
	public String getmileage_order() { return mileage_order; }
	public void setmileage_order(String mileage_order) { this.mileage_order = mileage_order; }

	/* 검색용 */
	public String getsearchKeyword() { return searchKeyword; }
	public void setsearchKeyword(String searchKeyword) { this.searchKeyword = searchKeyword; }

	/* 팝업 */
	public String getpopup_seq() { return popup_seq; }
	public void setpopup_seq(String popup_seq) { this.popup_seq = popup_seq; }

	public String getpopup_nm() { return popup_nm; }
	public void setpopup_nm(String popup_nm) { this.popup_nm = popup_nm; }

	public String getpopup_top() { return popup_top; }
	public void setpopup_top(String popup_top) { this.popup_top = popup_top; }

	public String getpopup_left() { return popup_left; }
	public void setpopup_left(String popup_left) { this.popup_left = popup_left; }

	public String getpopup_width() { return popup_width; }
	public void setpopup_width(String popup_width) { this.popup_width = popup_width; }

	public String getpopup_height() { return popup_height; }
	public void setpopup_height(String popup_height) { this.popup_height = popup_height; }

	public String getpopup_content() { return popup_content; }
	public void setpopup_content(String popup_content) { this.popup_content = popup_content; }

	public String getpopup_st_dt() { return popup_st_dt; }
	public void setpopup_st_dt(String popup_st_dt) { this.popup_st_dt = popup_st_dt; }
	
	public String getpopup_st_dt_ymd() { return popup_st_dt_ymd; }
	public void setpopup_st_dt_ymd(String popup_st_dt_ymd) { this.popup_st_dt_ymd = popup_st_dt_ymd; }

	public String getpopup_st_dt_hour() { return popup_st_dt_hour; }
	public void setpopup_st_dt_hour(String popup_st_dt_hour) { this.popup_st_dt_hour = popup_st_dt_hour; }
	
	public String getpopup_st_dt_minute() { return popup_st_dt_minute; }
	public void setpopup_st_dt_minute(String popup_st_dt_minute) { this.popup_st_dt_minute = popup_st_dt_minute; }
	
	public String getpopup_ed_dt() { return popup_ed_dt; }
	public void setpopup_ed_dt(String popup_ed_dt) { this.popup_ed_dt = popup_ed_dt; }

	public String getpopup_ed_dt_ymd() { return popup_ed_dt_ymd; }
	public void setpopup_ed_dt_ymd(String popup_ed_dt_ymd) { this.popup_ed_dt_ymd = popup_ed_dt_ymd; }
	
	public String getpopup_ed_dt_hour() { return popup_ed_dt_hour; }
	public void setpopup_ed_dt_hour(String popup_ed_dt_hour) { this.popup_ed_dt_hour = popup_ed_dt_hour; }
	
	public String getpopup_ed_dt_minute() { return popup_ed_dt_minute; }
	public void setpopup_ed_dt_minute(String popup_ed_dt_minute) { this.popup_ed_dt_minute = popup_ed_dt_minute; }
	
	public String getpopup_use_st() { return popup_use_st; }
	public void setpopup_use_st(String popup_use_st) { this.popup_use_st = popup_use_st; }

	public String getpopup_hit_cnt() { return popup_hit_cnt; }
	public void setpopup_hit_cnt(String popup_hit_cnt) { this.popup_hit_cnt = popup_hit_cnt; }

	public String getreg_dt() { return reg_dt; }
	public void setreg_dt(String reg_dt) { this.reg_dt = reg_dt; }

	public String getmod_dt() { return mod_dt; }
	public void setmod_dt(String mod_dt) { this.mod_dt = mod_dt; }

	public String getpopup_status() { return popup_status; }
	public void setpopup_status(String popup_status) { this.popup_status = popup_status; }
	
	public String getinfo_1() { return info_1; }
	public void setinfo_1(String info_1) { this.info_1 = info_1; }

	public String getinfo_2() { return info_2; }
	public void setinfo_2(String info_2) { this.info_2 = info_2; }

	public String getinfo_3() { return info_3; }
	public void setinfo_3(String info_3) { this.info_3 = info_3; }

	public String getinfo_4() { return info_4; }
	public void setinfo_4(String info_4) { this.info_4 = info_4; }

	public String getinfo_5() { return info_5; }
	public void setinfo_5(String info_5) { this.info_5 = info_5; }
	
	public String gettime_limit() { return time_limit; }
	public void settime_limit(String time_limit) { this.time_limit = time_limit; }
	
	public String getsms_send() { return sms_send; }
	public void setsms_send(String sms_send) { this.sms_send = sms_send; }

	public String getsms_no1() { return sms_no1; }
	public void setsms_no1(String sms_no1) { this.sms_no1 = sms_no1; }

	public String getsms_no2() { return sms_no2; }
	public void setsms_no2(String sms_no2) { this.sms_no2 = sms_no2; }
	
	public String gettracking_key() { return tracking_key; }
	public void settracking_key(String tracking_key) { this.tracking_key = tracking_key; }
	
	public String getandroid() { return android; }
	public void setandroid(String android) { this.android = android; }

	public String getios() { return ios; }
	public void setios(String ios) { this.ios = ios; }

	public String getfcm_key() { return fcm_key; }
	public void setfcm_key(String fcm_key) { this.fcm_key = fcm_key; }
	
}