package egovframework.admgrStore.service;

import egovframework.base.service.BasePagingVO;

public class AdmgrStoreVO extends BasePagingVO {

	private String search_sql;
	
	/* 스토어 정보*/
	private String store_seq;
	private String user_id;
	private String user_seq;
	private String store_id;
	private String store_nm;
	private String store_company_nm;
	private String store_ceo_nm;
	private String store_number;
	private String store_auth_number;
	private String store_to_number;
	private String store_email;
	private String store_tel;
	private String store_fax;
	private String store_hp_1;
	private String store_hp_2;
	private String store_zip;
	private String store_addr_1;
	private String store_addr_2;
	private String store_url;
	private String store_url_naver_blog;
	private String store_url_naver_cafe;
	private String store_url_facebook;
	private String store_url_twitter;
	private String store_url_instagram;
	private String store_url_youtube;
	private String store_lat;
	private String store_lng;
	private String store_introduction;
	private String store_admin_memo;
	private String store_use_st;
	private String store_bank_nm_cd;
	private String store_bank_nm;
	private String store_bank_number;
	private String store_bank_user_nm;
	private String store_img_1;
	private String store_img_2;
	private String store_img_3;
	private String store_img_4;
	private String store_img_5;
	private String store_img_6;
	private String store_img_7;
	private String store_img_8;
	private String store_img_9;
	private String store_img_10;
	private String store_movie;
	private String reg_dt;
	private String mod_dt;
	private String withdraw_dt;
	private String store_use_travel;
	private String store_use_house;
	private String store_use_food;
	private String store_use_market;
	
	private String store_house_ready_date_st_dt;
	private String store_house_ready_date_ed_dt;
	private String store_house_busy_date_st_dt;
	private String store_house_busy_date_ed_dt;
	private String store_house_ready2_date_st_dt;
	private String store_house_ready2_date_ed_dt;
	private String store_food_reserve_time;
	private String store_travel_min_order_price;
	private String store_house_min_order_price;
	private String store_food_min_order_price;
	
	private String store_travel_calc_percent;
	private String store_travel_return_day_7;
	private String store_travel_return_day_5;
	private String store_travel_return_day_3;
	private String store_travel_return_day_2;
	private String store_travel_return_day_1;
	private String store_travel_return_day_0;
	
	private String store_travel_reserve_note;
	private String store_house_calc_percent;
	private String store_house_return_day_7;
	private String store_house_return_day_5;
	private String store_house_return_day_3;
	private String store_house_return_day_2;
	private String store_house_return_day_1;
	private String store_house_return_day_0;
	
	private String store_house_reserve_note;
	private String store_food_calc_percent;
	private String store_food_return_day_7;
	private String store_food_return_day_5;
	private String store_food_return_day_3;
	private String store_food_return_day_2;
	private String store_food_return_day_1;
	private String store_food_return_day_0;
	private String store_food_reserve_note;
	
	private String store_market_calc_percent;
	private String store_market_delivery_company_cd_1;
	private String store_market_delivery_company_cd_2;
	private String store_market_delivery_company_cd_3;
	private String store_market_default_delivery_price;
	private String store_market_free_delivery_price;
	private String store_market_jeju_delivery_price;
	private String store_market_delivery;
	private String store_market_returnchange;
	private String store_market_order_note;
	private String store_info_1;
	private String store_info_2;
	private String store_info_3;
	private String store_info_4;
	private String store_info_5;
	
	private String store_info1_1;
	private String store_info1_2;
	private String store_info1_3;
	private String store_info1_4;
	private String store_info1_5;
	
	private String store_info2_1;
	private String store_info2_2;
	private String store_info2_3;
	private String store_info2_4;
	private String store_info2_5;
	private String store_info2_6;
	private String store_info2_7;

	private String store_info3_1;
	private String store_info3_2;
	private String store_info3_3;
	private String store_info3_4;
	private String store_info3_5;
	private String store_info3_6;
	private String store_info3_7;
	private String store_info3_8;
	private String store_info3_9;
	private String store_info3_10;
	
	private String store_info4_1;
	private String store_info4_2;
	private String store_info4_3;
	private String store_info4_4;
	private String store_info4_5;
	private String store_info4_6;
	private String store_info4_7;
	private String store_info4_8;
	private String store_info4_9;
	private String store_info4_10;
	private String store_info4_11;
	
	private String store_info5_1;
	private String store_info5_2;
	private String store_info5_3;
	private String store_info5_4;
	private String store_info5_5;
	private String store_info5_6;
	private String store_info5_7;
	private String store_info5_8;
	private String store_info5_9;
	private String store_info5_10;
	
	private String store_info6_1;
	private String store_info6_2;
	private String store_info6_3;
	private String store_info6_4;
	private String store_info6_5;
	private String store_info6_6;
	private String store_info6_7;
	private String store_info6_8;
	private String store_info6_9;
	private String store_info6_10;
	private String store_info6_11;
	private String store_info6_12;
	private String store_info6_13;
	
	private String store_info7_1;
	private String store_info7_2;
	private String store_info7_3;
	private String store_info7_4;
	private String store_info7_5;
	private String store_info7_6;
	private String store_info7_7;
	private String store_info7_8;
	private String store_info7_9;
	private String store_info7_10;
	private String store_info7_11;
	
	private String store_info8_1;
	private String store_info8_2;
	private String store_info8_3;
	private String store_info8_4;
	private String store_info8_5;
	
	private String travel_prod_cnt;
	private String house_prod_cnt;
	private String food_prod_cnt;
	private String market_prod_cnt;
	
	
	/* 검색용 */
	private String searchKey;
	private String searchKeyword;
	private String store_category;

	private String modalsearchKey;
	private String modalsearchKeyword;
	
	private String store_deny_date;
	private String user_level;

	
	private String cal_seq;
	private String cal_id;
	private String cal_order_id;
	private String cal_order_detail_seq;
	private String cal_store_id;
	private String cal_store_user_id;
	private String cal_store_category;
	private String cal_prod_category;
	private String cal_prod_id;
	private String cal_order_dt;
	private String cal_reg_dt;
	private String cal_res_dt;
	private String order_user_id;
	private String order_user_nm;
	private String cal_card_adjustment;
	private String cal_category_adjustment;
	private String cal_pay_st;
	private String cal_order_price;
	private String cal_delivery_price;
	private String cal_coupon_price;
	private String cal_use_mileage;
	private String cal_st;
	private String cal_total_order_price;
	private String cal_total_delivery_price;
	private String cal_total_coupon_price;
	private String cal_total_mileage;
	private String calc_no_cnt;
	private String calc_total_cnt;
	private String cal_room_seq;
	private String cal_room_nm;
	
	private String prod_nm;
	private String prod_img_1;
	
	private String od_seq;
	private String od_calc_st;
	private String od_calc_res;
	private String od_order_id;
	private String od_store_id;
	private String od_prod_id;
	private String od_prod_nm;
	private String od_prod_opt_seq;
	private String od_prod_opt_nm;
	private String od_prod_opt_price;
	private String od_prod_opt_cnt;
	
	private String od_store_category;
	private String od_prod_category;
	private String od_prod_price;
	private String od_prod_price_percent;
	private String od_prod_total_price;
	private String od_st_dt;
	private String od_ed_dt;
	private String od_user_nm;
	private String od_user_call;
	private String od_room_seq;
	private String od_room_nm;
	private String od_order_stat;
	private String od_stat;
	private String od_end_date;
	
	private String order_st_dt;
	private String order_ed_dt;
	private String order_detail_cnt;
	private String detail_total_price;
	private String cal_calc_price;
	private String calc_total_price;
	private String cal_content;
	
	//=========================================================
	
	public String getsearch_sql() { return search_sql; }
	public void setsearch_sql(String search_sql) { this.search_sql = search_sql; }

	public String getstore_seq() { return store_seq; }
	public void setstore_seq(String store_seq) { this.store_seq = store_seq; }
	
	public String getuser_id() { return user_id; }
	public void setuser_id(String user_id) { this.user_id = user_id; }
	
	public String getuser_seq() { return user_seq; }
	public void setuser_seq(String user_seq) { this.user_seq = user_seq; }
	
	public String getstore_id() { return store_id; }
	public void setstore_id(String store_id) { this.store_id = store_id; }
	
	public String getstore_nm() { return store_nm; }
	public void setstore_nm(String store_nm) { this.store_nm = store_nm; }
	
	public String getstore_company_nm() { return store_company_nm; }
	public void setstore_company_nm(String store_company_nm) { this.store_company_nm = store_company_nm; }
	
	public String getstore_ceo_nm() { return store_ceo_nm; }
	public void setstore_ceo_nm(String store_ceo_nm) { this.store_ceo_nm = store_ceo_nm; }
	
	public String getstore_number() { return store_number; }
	public void setstore_number(String store_number) { this.store_number = store_number; }
	
	public String getstore_auth_number() { return store_auth_number; }
	public void setstore_auth_number(String store_auth_number) { this.store_auth_number = store_auth_number; }
	
	public String getstore_to_number() { return store_to_number; }
	public void setstore_to_number(String store_to_number) { this.store_to_number = store_to_number; }
	
	public String getstore_email() { return store_email; }
	public void setstore_email(String store_email) { this.store_email = store_email; }
	
	public String getstore_tel() { return store_tel; }
	public void setstore_tel(String store_tel) { this.store_tel = store_tel; }
	
	public String getstore_fax() { return store_fax; }
	public void setstore_fax(String store_fax) { this.store_fax = store_fax; }
	
	public String getstore_hp_1() { return store_hp_1; }
	public void setstore_hp_1(String store_hp_1) { this.store_hp_1 = store_hp_1; }
	
	public String getstore_hp_2() { return store_hp_2; }
	public void setstore_hp_2(String store_hp_2) { this.store_hp_2 = store_hp_2; }
	
	public String getstore_zip() { return store_zip; }
	public void setstore_zip(String store_zip) { this.store_zip = store_zip; }
	
	public String getstore_addr_1() { return store_addr_1; }
	public void setstore_addr_1(String store_addr_1) { this.store_addr_1 = store_addr_1; }
	
	public String getstore_addr_2() { return store_addr_2; }
	public void setstore_addr_2(String store_addr_2) { this.store_addr_2 = store_addr_2; }
	
	public String getstore_url() { return store_url; }
	public void setstore_url(String store_url) { this.store_url = store_url; }
	
	public String getstore_url_naver_blog() { return store_url_naver_blog; }
	public void setstore_url_naver_blog(String store_url_naver_blog) { this.store_url_naver_blog = store_url_naver_blog; }
	
	public String getstore_url_naver_cafe() { return store_url_naver_cafe; }
	public void setstore_url_naver_cafe(String store_url_naver_cafe) { this.store_url_naver_cafe = store_url_naver_cafe; }
	
	public String getstore_url_facebook() { return store_url_facebook; }
	public void setstore_url_facebook(String store_url_facebook) { this.store_url_facebook = store_url_facebook; }
	
	public String getstore_url_twitter() { return store_url_twitter; }
	public void setstore_url_twitter(String store_url_twitter) { this.store_url_twitter = store_url_twitter; }
	
	public String getstore_url_instagram() { return store_url_instagram; }
	public void setstore_url_instagram(String store_url_instagram) { this.store_url_instagram = store_url_instagram; }
	
	public String getstore_url_youtube() { return store_url_youtube; }
	public void setstore_url_youtube(String store_url_youtube) { this.store_url_youtube = store_url_youtube; }
	
	public String getstore_lat() { return store_lat; }
	public void setstore_lat(String store_lat) { this.store_lat = store_lat; }
	
	public String getstore_lng() { return store_lng; }
	public void setstore_lng(String store_lng) { this.store_lng = store_lng; }
	
	public String getstore_introduction() { return store_introduction; }
	public void setstore_introduction(String store_introduction) { this.store_introduction = store_introduction; }
	
	public String getstore_admin_memo() { return store_admin_memo; }
	public void setstore_admin_memo(String store_admin_memo) { this.store_admin_memo = store_admin_memo; }
	
	public String getstore_use_st() { return store_use_st; }
	public void setstore_use_st(String store_use_st) { this.store_use_st = store_use_st; }
	
	public String getstore_bank_nm_cd() { return store_bank_nm_cd; }
	public void setstore_bank_nm_cd(String store_bank_nm_cd) { this.store_bank_nm_cd = store_bank_nm_cd; }
	
	public String getstore_bank_nm() { return store_bank_nm; }
	public void setstore_bank_nm(String store_bank_nm) { this.store_bank_nm = store_bank_nm; }
	
	public String getstore_bank_number() { return store_bank_number; }
	public void setstore_bank_number(String store_bank_number) { this.store_bank_number = store_bank_number; }
	
	public String getstore_bank_user_nm() { return store_bank_user_nm; }
	public void setstore_bank_user_nm(String store_bank_user_nm) { this.store_bank_user_nm = store_bank_user_nm; }
	
	public String getstore_img_1() { return store_img_1; }
	public void setstore_img_1(String store_img_1) { this.store_img_1 = store_img_1; }

	public String getstore_img_2() { return store_img_2; }
	public void setstore_img_2(String store_img_2) { this.store_img_2 = store_img_2; }

	public String getstore_img_3() { return store_img_3; }
	public void setstore_img_3(String store_img_3) { this.store_img_3 = store_img_3; }

	public String getstore_img_4() { return store_img_4; }
	public void setstore_img_4(String store_img_4) { this.store_img_4 = store_img_4; }

	public String getstore_img_5() { return store_img_5; }
	public void setstore_img_5(String store_img_5) { this.store_img_5 = store_img_5; }

	public String getstore_img_6() { return store_img_6; }
	public void setstore_img_6(String store_img_6) { this.store_img_6 = store_img_6; }

	public String getstore_img_7() { return store_img_7; }
	public void setstore_img_7(String store_img_7) { this.store_img_7 = store_img_7; }

	public String getstore_img_8() { return store_img_8; }
	public void setstore_img_8(String store_img_8) { this.store_img_8 = store_img_8; }

	public String getstore_img_9() { return store_img_9; }
	public void setstore_img_9(String store_img_9) { this.store_img_9 = store_img_9; }

	public String getstore_img_10() { return store_img_10; }
	public void setstore_img_10(String store_img_10) { this.store_img_10 = store_img_10; }
	
	public String getstore_movie() { return store_movie; }
	public void setstore_movie(String store_movie) { this.store_movie = store_movie; }
	
	public String getreg_dt() { return reg_dt; }
	public void setreg_dt(String reg_dt) { this.reg_dt = reg_dt; }
	
	public String getmod_dt() { return mod_dt; }
	public void setmod_dt(String mod_dt) { this.mod_dt = mod_dt; }
	
	public String getwithdraw_dt() { return withdraw_dt; }
	public void setwithdraw_dt(String withdraw_dt) { this.withdraw_dt = withdraw_dt; }
	
	public String getstore_use_travel() { return store_use_travel; }
	public void setstore_use_travel(String store_use_travel) { this.store_use_travel = store_use_travel; }
	
	public String getstore_use_house() { return store_use_house; }
	public void setstore_use_house(String store_use_house) { this.store_use_house = store_use_house; }
	
	public String getstore_use_food() { return store_use_food; }
	public void setstore_use_food(String store_use_food) { this.store_use_food = store_use_food; }
	
	public String getstore_use_market() { return store_use_market; }
	public void setstore_use_market(String store_use_market) { this.store_use_market = store_use_market; }
	
	public String getstore_house_ready_date_st_dt() { return store_house_ready_date_st_dt; }
	public void setstore_house_ready_date_st_dt(String store_house_ready_date_st_dt) { this.store_house_ready_date_st_dt = store_house_ready_date_st_dt; }

	public String getstore_house_ready_date_ed_dt() { return store_house_ready_date_ed_dt; }
	public void setstore_house_ready_date_ed_dt(String store_house_ready_date_ed_dt) { this.store_house_ready_date_ed_dt = store_house_ready_date_ed_dt; }
	
	public String getstore_house_ready2_date_st_dt() { return store_house_ready2_date_st_dt; }
	public void setstore_house_ready2_date_st_dt(String store_house_ready2_date_st_dt) { this.store_house_ready2_date_st_dt = store_house_ready2_date_st_dt; }

	public String getstore_house_ready2_date_ed_dt() { return store_house_ready2_date_ed_dt; }
	public void setstore_house_ready2_date_ed_dt(String store_house_ready2_date_ed_dt) { this.store_house_ready2_date_ed_dt = store_house_ready2_date_ed_dt; }


	public String getstore_house_busy_date_st_dt() { return store_house_busy_date_st_dt; }
	public void setstore_house_busy_date_st_dt(String store_house_busy_date_st_dt) { this.store_house_busy_date_st_dt = store_house_busy_date_st_dt; }

	public String getstore_house_busy_date_ed_dt() { return store_house_busy_date_ed_dt; }
	public void setstore_house_busy_date_ed_dt(String store_house_busy_date_ed_dt) { this.store_house_busy_date_ed_dt = store_house_busy_date_ed_dt; }

	public String getstore_food_reserve_time() { return store_food_reserve_time; }
	public void setstore_food_reserve_time(String store_food_reserve_time) { this.store_food_reserve_time = store_food_reserve_time; }
	
	public String getstore_travel_min_order_price() { return store_travel_min_order_price; }
	public void setstore_travel_min_order_price(String store_travel_min_order_price) { this.store_travel_min_order_price = store_travel_min_order_price; }

	public String getstore_house_min_order_price() { return store_house_min_order_price; }
	public void setstore_house_min_order_price(String store_house_min_order_price) { this.store_house_min_order_price = store_house_min_order_price; }

	public String getstore_food_min_order_price() { return store_food_min_order_price; }
	public void setstore_food_min_order_price(String store_food_min_order_price) { this.store_food_min_order_price = store_food_min_order_price; }
	
	public String getstore_travel_calc_percent() { return store_travel_calc_percent; }
	public void setstore_travel_calc_percent(String store_travel_calc_percent) { this.store_travel_calc_percent = store_travel_calc_percent; }

	public String getstore_travel_return_day_7() { return store_travel_return_day_7; }
	public void setstore_travel_return_day_7(String store_travel_return_day_7) { this.store_travel_return_day_7 = store_travel_return_day_7; }

	public String getstore_travel_return_day_5() { return store_travel_return_day_5; }
	public void setstore_travel_return_day_5(String store_travel_return_day_5) { this.store_travel_return_day_5 = store_travel_return_day_5; }

	public String getstore_travel_return_day_3() { return store_travel_return_day_3; }
	public void setstore_travel_return_day_3(String store_travel_return_day_3) { this.store_travel_return_day_3 = store_travel_return_day_3; }

	public String getstore_travel_return_day_2() { return store_travel_return_day_2; }
	public void setstore_travel_return_day_2(String store_travel_return_day_2) { this.store_travel_return_day_2 = store_travel_return_day_2; }

	public String getstore_travel_return_day_1() { return store_travel_return_day_1; }
	public void setstore_travel_return_day_1(String store_travel_return_day_1) { this.store_travel_return_day_1 = store_travel_return_day_1; }

	public String getstore_travel_return_day_0() { return store_travel_return_day_0; }
	public void setstore_travel_return_day_0(String store_travel_return_day_0) { this.store_travel_return_day_0 = store_travel_return_day_0; }

	public String getstore_travel_reserve_note() { return store_travel_reserve_note; }
	public void setstore_travel_reserve_note(String store_travel_reserve_note) { this.store_travel_reserve_note = store_travel_reserve_note; }

	public String getstore_house_calc_percent() { return store_house_calc_percent; }
	public void setstore_house_calc_percent(String store_house_calc_percent) { this.store_house_calc_percent = store_house_calc_percent; }

	public String getstore_house_return_day_7() { return store_house_return_day_7; }
	public void setstore_house_return_day_7(String store_house_return_day_7) { this.store_house_return_day_7 = store_house_return_day_7; }

	public String getstore_house_return_day_5() { return store_house_return_day_5; }
	public void setstore_house_return_day_5(String store_house_return_day_5) { this.store_house_return_day_5 = store_house_return_day_5; }

	public String getstore_house_return_day_3() { return store_house_return_day_3; }
	public void setstore_house_return_day_3(String store_house_return_day_3) { this.store_house_return_day_3 = store_house_return_day_3; }

	public String getstore_house_return_day_2() { return store_house_return_day_2; }
	public void setstore_house_return_day_2(String store_house_return_day_2) { this.store_house_return_day_2 = store_house_return_day_2; }

	public String getstore_house_return_day_1() { return store_house_return_day_1; }
	public void setstore_house_return_day_1(String store_house_return_day_1) { this.store_house_return_day_1 = store_house_return_day_1; }

	public String getstore_house_return_day_0() { return store_house_return_day_0; }
	public void setstore_house_return_day_0(String store_house_return_day_0) { this.store_house_return_day_0 = store_house_return_day_0; }

	public String getstore_house_reserve_note() { return store_house_reserve_note; }
	public void setstore_house_reserve_note(String store_house_reserve_note) { this.store_house_reserve_note = store_house_reserve_note; }

	public String getstore_food_calc_percent() { return store_food_calc_percent; }
	public void setstore_food_calc_percent(String store_food_calc_percent) { this.store_food_calc_percent = store_food_calc_percent; }

	public String getstore_food_return_day_7() { return store_food_return_day_7; }
	public void setstore_food_return_day_7(String store_food_return_day_7) { this.store_food_return_day_7 = store_food_return_day_7; }

	public String getstore_food_return_day_5() { return store_food_return_day_5; }
	public void setstore_food_return_day_5(String store_food_return_day_5) { this.store_food_return_day_5 = store_food_return_day_5; }

	public String getstore_food_return_day_3() { return store_food_return_day_3; }
	public void setstore_food_return_day_3(String store_food_return_day_3) { this.store_food_return_day_3 = store_food_return_day_3; }

	public String getstore_food_return_day_2() { return store_food_return_day_2; }
	public void setstore_food_return_day_2(String store_food_return_day_2) { this.store_food_return_day_2 = store_food_return_day_2; }

	public String getstore_food_return_day_1() { return store_food_return_day_1; }
	public void setstore_food_return_day_1(String store_food_return_day_1) { this.store_food_return_day_1 = store_food_return_day_1; }

	public String getstore_food_return_day_0() { return store_food_return_day_0; }
	public void setstore_food_return_day_0(String store_food_return_day_0) { this.store_food_return_day_0 = store_food_return_day_0; }

	public String getstore_food_reserve_note() { return store_food_reserve_note; }
	public void setstore_food_reserve_note(String store_food_reserve_note) { this.store_food_reserve_note = store_food_reserve_note; }

	public String getstore_market_calc_percent() { return store_market_calc_percent; }
	public void setstore_market_calc_percent(String store_market_calc_percent) { this.store_market_calc_percent = store_market_calc_percent; }

	public String getstore_market_delivery_company_cd_1() { return store_market_delivery_company_cd_1; }
	public void setstore_market_delivery_company_cd_1(String store_market_delivery_company_cd_1) { this.store_market_delivery_company_cd_1 = store_market_delivery_company_cd_1; }

	public String getstore_market_delivery_company_cd_2() { return store_market_delivery_company_cd_2; }
	public void setstore_market_delivery_company_cd_2(String store_market_delivery_company_cd_2) { this.store_market_delivery_company_cd_2 = store_market_delivery_company_cd_2; }

	public String getstore_market_delivery_company_cd_3() { return store_market_delivery_company_cd_3; }
	public void setstore_market_delivery_company_cd_3(String store_market_delivery_company_cd_3) { this.store_market_delivery_company_cd_3 = store_market_delivery_company_cd_3; }

	public String getstore_market_default_delivery_price() { return store_market_default_delivery_price; }
	public void setstore_market_default_delivery_price(String store_market_default_delivery_price) { this.store_market_default_delivery_price = store_market_default_delivery_price; }

	public String getstore_market_free_delivery_price() { return store_market_free_delivery_price; }
	public void setstore_market_free_delivery_price(String store_market_free_delivery_price) { this.store_market_free_delivery_price = store_market_free_delivery_price; }

	public String getstore_market_jeju_delivery_price() { return store_market_jeju_delivery_price; }
	public void setstore_market_jeju_delivery_price(String store_market_jeju_delivery_price) { this.store_market_jeju_delivery_price = store_market_jeju_delivery_price; }

	public String getstore_market_delivery() { return store_market_delivery; }
	public void setstore_market_delivery(String store_market_delivery) { this.store_market_delivery = store_market_delivery; }

	public String getstore_market_returnchange() { return store_market_returnchange; }
	public void setstore_market_returnchange(String store_market_returnchange) { this.store_market_returnchange = store_market_returnchange; }

	public String getstore_market_order_note() { return store_market_order_note; }
	public void setstore_market_order_note(String store_market_order_note) { this.store_market_order_note = store_market_order_note; }
	
	
	public String getstore_info_1() { return store_info_1; }
	public void setstore_info_1(String store_info_1) { this.store_info_1 = store_info_1; }

	public String getstore_info_2() { return store_info_2; }
	public void setstore_info_2(String store_info_2) { this.store_info_2 = store_info_2; }

	public String getstore_info_3() { return store_info_3; }
	public void setstore_info_3(String store_info_3) { this.store_info_3 = store_info_3; }

	public String getstore_info_4() { return store_info_4; }
	public void setstore_info_4(String store_info_4) { this.store_info_4 = store_info_4; }

	public String getstore_info_5() { return store_info_5; }
	public void setstore_info_5(String store_info_5) { this.store_info_5 = store_info_5; }
	
	
	public String getstore_info1_1() { return store_info1_1; }
	public void setstore_info1_1(String store_info1_1) { this.store_info1_1 = store_info1_1; }

	public String getstore_info1_2() { return store_info1_2; }
	public void setstore_info1_2(String store_info1_2) { this.store_info1_2 = store_info1_2; }

	public String getstore_info1_3() { return store_info1_3; }
	public void setstore_info1_3(String store_info1_3) { this.store_info1_3 = store_info1_3; }

	public String getstore_info1_4() { return store_info1_4; }
	public void setstore_info1_4(String store_info1_4) { this.store_info1_4 = store_info1_4; }

	public String getstore_info1_5() { return store_info1_5; }
	public void setstore_info1_5(String store_info1_5) { this.store_info1_5 = store_info1_5; }

	
	public String getstore_info2_1() { return store_info2_1; }
	public void setstore_info2_1(String store_info2_1) { this.store_info2_1 = store_info2_1; }

	public String getstore_info2_2() { return store_info2_2; }
	public void setstore_info2_2(String store_info2_2) { this.store_info2_2 = store_info2_2; }

	public String getstore_info2_3() { return store_info2_3; }
	public void setstore_info2_3(String store_info2_3) { this.store_info2_3 = store_info2_3; }

	public String getstore_info2_4() { return store_info2_4; }
	public void setstore_info2_4(String store_info2_4) { this.store_info2_4 = store_info2_4; }

	public String getstore_info2_5() { return store_info2_5; }
	public void setstore_info2_5(String store_info2_5) { this.store_info2_5 = store_info2_5; }

	public String getstore_info2_6() { return store_info2_6; }
	public void setstore_info2_6(String store_info2_6) { this.store_info2_6 = store_info2_6; }

	public String getstore_info2_7() { return store_info2_7; }
	public void setstore_info2_7(String store_info2_7) { this.store_info2_7 = store_info2_7; }


	public String getstore_info3_1() { return store_info3_1; }
	public void setstore_info3_1(String store_info3_1) { this.store_info3_1 = store_info3_1; }

	public String getstore_info3_2() { return store_info3_2; }
	public void setstore_info3_2(String store_info3_2) { this.store_info3_2 = store_info3_2; }

	public String getstore_info3_3() { return store_info3_3; }
	public void setstore_info3_3(String store_info3_3) { this.store_info3_3 = store_info3_3; }

	public String getstore_info3_4() { return store_info3_4; }
	public void setstore_info3_4(String store_info3_4) { this.store_info3_4 = store_info3_4; }

	public String getstore_info3_5() { return store_info3_5; }
	public void setstore_info3_5(String store_info3_5) { this.store_info3_5 = store_info3_5; }

	public String getstore_info3_6() { return store_info3_6; }
	public void setstore_info3_6(String store_info3_6) { this.store_info3_6 = store_info3_6; }

	public String getstore_info3_7() { return store_info3_7; }
	public void setstore_info3_7(String store_info3_7) { this.store_info3_7 = store_info3_7; }

	public String getstore_info3_8() { return store_info3_8; }
	public void setstore_info3_8(String store_info3_8) { this.store_info3_8 = store_info3_8; }

	public String getstore_info3_9() { return store_info3_9; }
	public void setstore_info3_9(String store_info3_9) { this.store_info3_9 = store_info3_9; }

	public String getstore_info3_10() { return store_info3_10; }
	public void setstore_info3_10(String store_info3_10) { this.store_info3_10 = store_info3_10; }


	public String getstore_info4_1() { return store_info4_1; }
	public void setstore_info4_1(String store_info4_1) { this.store_info4_1 = store_info4_1; }

	public String getstore_info4_2() { return store_info4_2; }
	public void setstore_info4_2(String store_info4_2) { this.store_info4_2 = store_info4_2; }

	public String getstore_info4_3() { return store_info4_3; }
	public void setstore_info4_3(String store_info4_3) { this.store_info4_3 = store_info4_3; }

	public String getstore_info4_4() { return store_info4_4; }
	public void setstore_info4_4(String store_info4_4) { this.store_info4_4 = store_info4_4; }

	public String getstore_info4_5() { return store_info4_5; }
	public void setstore_info4_5(String store_info4_5) { this.store_info4_5 = store_info4_5; }

	public String getstore_info4_6() { return store_info4_6; }
	public void setstore_info4_6(String store_info4_6) { this.store_info4_6 = store_info4_6; }

	public String getstore_info4_7() { return store_info4_7; }
	public void setstore_info4_7(String store_info4_7) { this.store_info4_7 = store_info4_7; }

	public String getstore_info4_8() { return store_info4_8; }
	public void setstore_info4_8(String store_info4_8) { this.store_info4_8 = store_info4_8; }

	public String getstore_info4_9() { return store_info4_9; }
	public void setstore_info4_9(String store_info4_9) { this.store_info4_9 = store_info4_9; }

	public String getstore_info4_10() { return store_info4_10; }
	public void setstore_info4_10(String store_info4_10) { this.store_info4_10 = store_info4_10; }

	public String getstore_info4_11() { return store_info4_11; }
	public void setstore_info4_11(String store_info4_11) { this.store_info4_11 = store_info4_11; }


	public String getstore_info5_1() { return store_info5_1; }
	public void setstore_info5_1(String store_info5_1) { this.store_info5_1 = store_info5_1; }

	public String getstore_info5_2() { return store_info5_2; }
	public void setstore_info5_2(String store_info5_2) { this.store_info5_2 = store_info5_2; }

	public String getstore_info5_3() { return store_info5_3; }
	public void setstore_info5_3(String store_info5_3) { this.store_info5_3 = store_info5_3; }

	public String getstore_info5_4() { return store_info5_4; }
	public void setstore_info5_4(String store_info5_4) { this.store_info5_4 = store_info5_4; }

	public String getstore_info5_5() { return store_info5_5; }
	public void setstore_info5_5(String store_info5_5) { this.store_info5_5 = store_info5_5; }

	public String getstore_info5_6() { return store_info5_6; }
	public void setstore_info5_6(String store_info5_6) { this.store_info5_6 = store_info5_6; }

	public String getstore_info5_7() { return store_info5_7; }
	public void setstore_info5_7(String store_info5_7) { this.store_info5_7 = store_info5_7; }

	public String getstore_info5_8() { return store_info5_8; }
	public void setstore_info5_8(String store_info5_8) { this.store_info5_8 = store_info5_8; }

	public String getstore_info5_9() { return store_info5_9; }
	public void setstore_info5_9(String store_info5_9) { this.store_info5_9 = store_info5_9; }

	public String getstore_info5_10() { return store_info5_10; }
	public void setstore_info5_10(String store_info5_10) { this.store_info5_10 = store_info5_10; }


	public String getstore_info6_1() { return store_info6_1; }
	public void setstore_info6_1(String store_info6_1) { this.store_info6_1 = store_info6_1; }

	public String getstore_info6_2() { return store_info6_2; }
	public void setstore_info6_2(String store_info6_2) { this.store_info6_2 = store_info6_2; }

	public String getstore_info6_3() { return store_info6_3; }
	public void setstore_info6_3(String store_info6_3) { this.store_info6_3 = store_info6_3; }

	public String getstore_info6_4() { return store_info6_4; }
	public void setstore_info6_4(String store_info6_4) { this.store_info6_4 = store_info6_4; }

	public String getstore_info6_5() { return store_info6_5; }
	public void setstore_info6_5(String store_info6_5) { this.store_info6_5 = store_info6_5; }

	public String getstore_info6_6() { return store_info6_6; }
	public void setstore_info6_6(String store_info6_6) { this.store_info6_6 = store_info6_6; }

	public String getstore_info6_7() { return store_info6_7; }
	public void setstore_info6_7(String store_info6_7) { this.store_info6_7 = store_info6_7; }

	public String getstore_info6_8() { return store_info6_8; }
	public void setstore_info6_8(String store_info6_8) { this.store_info6_8 = store_info6_8; }

	public String getstore_info6_9() { return store_info6_9; }
	public void setstore_info6_9(String store_info6_9) { this.store_info6_9 = store_info6_9; }

	public String getstore_info6_10() { return store_info6_10; }
	public void setstore_info6_10(String store_info6_10) { this.store_info6_10 = store_info6_10; }

	public String getstore_info6_11() { return store_info6_11; }
	public void setstore_info6_11(String store_info6_11) { this.store_info6_11 = store_info6_11; }

	public String getstore_info6_12() { return store_info6_12; }
	public void setstore_info6_12(String store_info6_12) { this.store_info6_12 = store_info6_12; }

	public String getstore_info6_13() { return store_info6_13; }
	public void setstore_info6_13(String store_info6_13) { this.store_info6_13 = store_info6_13; }


	public String getstore_info7_1() { return store_info7_1; }
	public void setstore_info7_1(String store_info7_1) { this.store_info7_1 = store_info7_1; }

	public String getstore_info7_2() { return store_info7_2; }
	public void setstore_info7_2(String store_info7_2) { this.store_info7_2 = store_info7_2; }

	public String getstore_info7_3() { return store_info7_3; }
	public void setstore_info7_3(String store_info7_3) { this.store_info7_3 = store_info7_3; }

	public String getstore_info7_4() { return store_info7_4; }
	public void setstore_info7_4(String store_info7_4) { this.store_info7_4 = store_info7_4; }

	public String getstore_info7_5() { return store_info7_5; }
	public void setstore_info7_5(String store_info7_5) { this.store_info7_5 = store_info7_5; }

	public String getstore_info7_6() { return store_info7_6; }
	public void setstore_info7_6(String store_info7_6) { this.store_info7_6 = store_info7_6; }

	public String getstore_info7_7() { return store_info7_7; }
	public void setstore_info7_7(String store_info7_7) { this.store_info7_7 = store_info7_7; }

	public String getstore_info7_8() { return store_info7_8; }
	public void setstore_info7_8(String store_info7_8) { this.store_info7_8 = store_info7_8; }

	public String getstore_info7_9() { return store_info7_9; }
	public void setstore_info7_9(String store_info7_9) { this.store_info7_9 = store_info7_9; }

	public String getstore_info7_10() { return store_info7_10; }
	public void setstore_info7_10(String store_info7_10) { this.store_info7_10 = store_info7_10; }

	public String getstore_info7_11() { return store_info7_11; }
	public void setstore_info7_11(String store_info7_11) { this.store_info7_11 = store_info7_11; }


	public String getstore_info8_1() { return store_info8_1; }
	public void setstore_info8_1(String store_info8_1) { this.store_info8_1 = store_info8_1; }

	public String getstore_info8_2() { return store_info8_2; }
	public void setstore_info8_2(String store_info8_2) { this.store_info8_2 = store_info8_2; }

	public String getstore_info8_3() { return store_info8_3; }
	public void setstore_info8_3(String store_info8_3) { this.store_info8_3 = store_info8_3; }

	public String getstore_info8_4() { return store_info8_4; }
	public void setstore_info8_4(String store_info8_4) { this.store_info8_4 = store_info8_4; }

	public String getstore_info8_5() { return store_info8_5; }
	public void setstore_info8_5(String store_info8_5) { this.store_info8_5 = store_info8_5; }


	public String gettravel_prod_cnt() { return travel_prod_cnt; }
	public void settravel_prod_cnt(String travel_prod_cnt) { this.travel_prod_cnt = travel_prod_cnt; }

	public String gethouse_prod_cnt() { return house_prod_cnt; }
	public void sethouse_prod_cnt(String house_prod_cnt) { this.house_prod_cnt = house_prod_cnt; }

	public String getfood_prod_cnt() { return food_prod_cnt; }
	public void setfood_prod_cnt(String food_prod_cnt) { this.food_prod_cnt = food_prod_cnt; }

	public String getmarket_prod_cnt() { return market_prod_cnt; }
	public void setmarket_prod_cnt(String market_prod_cnt) { this.market_prod_cnt = market_prod_cnt; }	
	

	/* 검색용 */
	public String getsearchKey() { return searchKey; }
	public void setsearchKey(String searchKey) { this.searchKey = searchKey; }

	public String getsearchKeyword() { return searchKeyword; }
	public void setsearchKeyword(String searchKeyword) { this.searchKeyword = searchKeyword; }

	public String getstore_category() { return store_category; }
	public void setstore_category(String store_category) { this.store_category = store_category; }	

	public String getmodalsearchKey() { return modalsearchKey; }
	public void setmodalsearchKey(String modalsearchKey) { this.modalsearchKey = modalsearchKey; }
	
	public String getmodalsearchKeyword() { return modalsearchKeyword; }
	public void setmodalsearchKeyword(String modalsearchKeyword) { this.modalsearchKeyword = modalsearchKeyword; }

	
	public String getstore_deny_date() { return store_deny_date; }
	public void setstore_deny_date(String store_deny_date) { this.store_deny_date = store_deny_date; }
	
	public String getuser_level() { return user_level; }
	public void setuser_level(String user_level) { this.user_level = user_level; }
	
	public String getcal_seq() { return cal_seq; }
	public void setcal_seq(String cal_seq) { this.cal_seq = cal_seq; }
	
	public String getcal_id() { return cal_id; }
	public void setcal_id(String cal_id) { this.cal_id = cal_id; }

	public String getcal_order_id() { return cal_order_id; }
	public void setcal_order_id(String cal_order_id) { this.cal_order_id = cal_order_id; }

	public String getcal_order_detail_seq() { return cal_order_detail_seq; }
	public void setcal_order_detail_seq(String cal_order_detail_seq) { this.cal_order_detail_seq = cal_order_detail_seq; }

	public String getcal_store_id() { return cal_store_id; }
	public void setcal_store_id(String cal_store_id) { this.cal_store_id = cal_store_id; }

	public String getcal_store_user_id() { return cal_store_user_id; }
	public void setcal_store_user_id(String cal_store_user_id) { this.cal_store_user_id = cal_store_user_id; }

	public String getcal_store_category() { return cal_store_category; }
	public void setcal_store_category(String cal_store_category) { this.cal_store_category = cal_store_category; }

	public String getcal_prod_category() { return cal_prod_category; }
	public void setcal_prod_category(String cal_prod_category) { this.cal_prod_category = cal_prod_category; }
	
	public String getcal_prod_id() { return cal_prod_id; }
	public void setcal_prod_id(String cal_prod_id) { this.cal_prod_id = cal_prod_id; }

	public String getcal_order_dt() { return cal_order_dt; }
	public void setcal_order_dt(String cal_order_dt) { this.cal_order_dt = cal_order_dt; }

	public String getcal_reg_dt() { return cal_reg_dt; }
	public void setcal_reg_dt(String cal_reg_dt) { this.cal_reg_dt = cal_reg_dt; }
	
	public String getcal_res_dt() { return cal_res_dt; }
	public void setcal_res_dt(String cal_res_dt) { this.cal_res_dt = cal_res_dt; }
	
	public String getorder_user_id() { return order_user_id; }
	public void setorder_user_id(String order_user_id) { this.order_user_id = order_user_id; }

	public String getorder_user_nm() { return order_user_nm; }
	public void setorder_user_nm(String order_user_nm) { this.order_user_nm = order_user_nm; }

	public String getcal_card_adjustment() { return cal_card_adjustment; }
	public void setcal_card_adjustment(String cal_card_adjustment) { this.cal_card_adjustment = cal_card_adjustment; }

	public String getcal_category_adjustment() { return cal_category_adjustment; }
	public void setcal_category_adjustment(String cal_category_adjustment) { this.cal_category_adjustment = cal_category_adjustment; }

	public String getcal_pay_st() { return cal_pay_st; }
	public void setcal_pay_st(String cal_pay_st) { this.cal_pay_st = cal_pay_st; }

	public String getcal_order_price() { return cal_order_price; }
	public void setcal_order_price(String cal_order_price) { this.cal_order_price = cal_order_price; }

	public String getcal_delivery_price() { return cal_delivery_price; }
	public void setcal_delivery_price(String cal_delivery_price) { this.cal_delivery_price = cal_delivery_price; }

	public String getcal_coupon_price() { return cal_coupon_price; }
	public void setcal_coupon_price(String cal_coupon_price) { this.cal_coupon_price = cal_coupon_price; }

	public String getcal_use_mileage() { return cal_use_mileage; }
	public void setcal_use_mileage(String cal_use_mileage) { this.cal_use_mileage = cal_use_mileage; }

	public String getcal_st() { return cal_st; }
	public void setcal_st(String cal_st) { this.cal_st = cal_st; }
	
	public String getcal_total_order_price() { return cal_total_order_price; }
	public void setcal_total_order_price(String cal_total_order_price) { this.cal_total_order_price = cal_total_order_price; }

	public String getcal_total_delivery_price() { return cal_total_delivery_price; }
	public void setcal_total_delivery_price(String cal_total_delivery_price) { this.cal_total_delivery_price = cal_total_delivery_price; }

	public String getcal_total_coupon_price() { return cal_total_coupon_price; }
	public void setcal_total_coupon_price(String cal_total_coupon_price) { this.cal_total_coupon_price = cal_total_coupon_price; }

	public String getcal_total_mileage() { return cal_total_mileage; }
	public void setcal_total_mileage(String cal_total_mileage) { this.cal_total_mileage = cal_total_mileage; }

	public String getcalc_no_cnt() { return calc_no_cnt; }
	public void setcalc_no_cnt(String calc_no_cnt) { this.calc_no_cnt = calc_no_cnt; }
	
	public String getcalc_total_cnt() { return calc_total_cnt; }
	public void setcalc_total_cnt(String calc_total_cnt) { this.calc_total_cnt = calc_total_cnt; }
	
	public String getcal_room_seq() { return cal_room_seq; }
	public void setcal_room_seq(String cal_room_seq) { this.cal_room_seq = cal_room_seq; }

	public String getcal_room_nm() { return cal_room_nm; }
	public void setcal_room_nm(String cal_room_nm) { this.cal_room_nm = cal_room_nm; }
	
	public String getprod_nm() { return prod_nm; }
	public void setprod_nm(String prod_nm) { this.prod_nm = prod_nm; }

	public String getprod_img_1() { return prod_img_1; }
	public void setprod_img_1(String prod_img_1) { this.prod_img_1 = prod_img_1; }
	
	public String getod_seq() { return od_seq; }
	public void setod_seq(String od_seq) { this.od_seq = od_seq; }
	
	public String getod_calc_st() { return od_calc_st; }
	public void setod_calc_st(String od_calc_st) { this.od_calc_st = od_calc_st; }

	public String getod_calc_res() { return od_calc_res; }
	public void setod_calc_res(String od_calc_res) { this.od_calc_res = od_calc_res; }
	
	public String getod_order_id() { return od_order_id; }
	public void setod_order_id(String od_order_id) { this.od_order_id = od_order_id; }

	public String getod_store_id() { return od_store_id; }
	public void setod_store_id(String od_store_id) { this.od_store_id = od_store_id; }

	public String getod_prod_id() { return od_prod_id; }
	public void setod_prod_id(String od_prod_id) { this.od_prod_id = od_prod_id; }

	public String getod_prod_nm() { return od_prod_nm; }
	public void setod_prod_nm(String od_prod_nm) { this.od_prod_nm = od_prod_nm; }

	public String getod_prod_opt_seq() { return od_prod_opt_seq; }
	public void setod_prod_opt_seq(String od_prod_opt_seq) { this.od_prod_opt_seq = od_prod_opt_seq; }

	public String getod_prod_opt_nm() { return od_prod_opt_nm; }
	public void setod_prod_opt_nm(String od_prod_opt_nm) { this.od_prod_opt_nm = od_prod_opt_nm; }

	public String getod_prod_opt_price() { return od_prod_opt_price; }
	public void setod_prod_opt_price(String od_prod_opt_price) { this.od_prod_opt_price = od_prod_opt_price; }

	public String getod_prod_opt_cnt() { return od_prod_opt_cnt; }
	public void setod_prod_opt_cnt(String od_prod_opt_cnt) { this.od_prod_opt_cnt = od_prod_opt_cnt; }

	public String getod_store_category() { return od_store_category; }
	public void setod_store_category(String od_store_category) { this.od_store_category = od_store_category; }

	public String getod_prod_category() { return od_prod_category; }
	public void setod_prod_category(String od_prod_category) { this.od_prod_category = od_prod_category; }

	public String getod_prod_price() { return od_prod_price; }
	public void setod_prod_price(String od_prod_price) { this.od_prod_price = od_prod_price; }

	public String getod_prod_price_percent() { return od_prod_price_percent; }
	public void setod_prod_price_percent(String od_prod_price_percent) { this.od_prod_price_percent = od_prod_price_percent; }
	
	public String getod_prod_total_price() { return od_prod_total_price; }
	public void setod_prod_total_price(String od_prod_total_price) { this.od_prod_total_price = od_prod_total_price; }

	public String getod_st_dt() { return od_st_dt; }
	public void setod_st_dt(String od_st_dt) { this.od_st_dt = od_st_dt; }

	public String getod_ed_dt() { return od_ed_dt; }
	public void setod_ed_dt(String od_ed_dt) { this.od_ed_dt = od_ed_dt; }

	public String getod_user_nm() { return od_user_nm; }
	public void setod_user_nm(String od_user_nm) { this.od_user_nm = od_user_nm; }

	public String getod_user_call() { return od_user_call; }
	public void setod_user_call(String od_user_call) { this.od_user_call = od_user_call; }

	public String getod_room_seq() { return od_room_seq; }
	public void setod_room_seq(String od_room_seq) { this.od_room_seq = od_room_seq; }
	
	public String getod_room_nm() { return od_room_nm; }
	public void setod_room_nm(String od_room_nm) { this.od_room_nm = od_room_nm; }

	public String getod_order_stat() { return od_order_stat; }
	public void setod_order_stat(String od_order_stat) { this.od_order_stat = od_order_stat; }

	public String getod_stat() { return od_stat; }
	public void setod_stat(String od_stat) { this.od_stat = od_stat; }

	public String getod_end_date() { return od_end_date; }
	public void setod_end_date(String od_end_date) { this.od_end_date = od_end_date; }

	public String getorder_st_dt() { return order_st_dt; }
	public void setorder_st_dt(String order_st_dt) { this.order_st_dt = order_st_dt; }

	public String getorder_ed_dt() { return order_ed_dt; }
	public void setorder_ed_dt(String order_ed_dt) { this.order_ed_dt = order_ed_dt; }
	
	public String getorder_detail_cnt() { return order_detail_cnt; }
	public void setorder_detail_cnt(String order_detail_cnt) { this.order_detail_cnt = order_detail_cnt; }
	
	public String getdetail_total_price() { return detail_total_price; }
	public void setdetail_total_price(String detail_total_price) { this.detail_total_price = detail_total_price; }
	
	public String getcal_calc_price() { return cal_calc_price; }
	public void setcal_calc_price(String cal_calc_price) { this.cal_calc_price = cal_calc_price; }
	
	public String getcalc_total_price() { return calc_total_price; }
	public void setcalc_total_price(String calc_total_price) { this.calc_total_price = calc_total_price; }
	
	public String getcal_content() { return cal_content; }
	public void setcal_content(String cal_content) { this.cal_content = cal_content; }
	
}