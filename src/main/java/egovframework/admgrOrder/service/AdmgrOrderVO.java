package egovframework.admgrOrder.service;

import egovframework.base.service.BasePagingVO;

public class AdmgrOrderVO extends BasePagingVO {
	
	private int insert_id;
	private String sess_id;
	private String user_level;
	
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
	private String store_deny_date;

	
	
	/* 상품정보*/
	private String prod_seq;
	private String prod_use_st;
	private String store_category_nm;
	private String prod_id;
	private String prod_nm;
	private String prod_category;
	private String prod_category_cd;
	private String prod_category_nm;
	private String prod_comment;
	private String prod_content;
	private String prod_content_2;
	private String prod_opt_st;
	private String prod_market_price;
	private String prod_price;
	private String prod_price_percent;
	private String prod_min_price;
	private String prod_delivery_price;
	private String prod_orderby;
	private String prod_stock_set;
	private String prod_stock_cnt;
	private String prod_st_dt;
	private String prod_st_dt_ymd;
	private String prod_st_dt_hour;
	private String prod_st_dt_minute;
	private String prod_ed_dt;
	private String prod_ed_dt_ymd;
	private String prod_ed_dt_hour;
	private String prod_ed_dt_minute;
	private String prod_hit_cnt;
	private String prod_pick_cnt;
	private String prod_star;
	private String prod_order_cnt;
	private String prod_use_coupon_st;
	private String prod_use_mileage_st;
	private String prod_use_pay_st;
	private String prod_reserve_limit;
	private String prod_max_buy_cnt;
	private String prod_bundle_delivery;
	private String prod_content_time;
	private String prod_content_pay;
	private String prod_content_precautions;
	private String prod_content_course;
	private String prod_img_1;
	private String prod_img_2;
	private String prod_img_3;
	private String prod_img_4;
	private String prod_img_5;
	private String prod_img_6;
	private String prod_img_7;
	private String prod_img_8;
	private String prod_img_9;
	private String prod_img_10;
	private String prod_movie;
	private String prod_maker;
	private String prod_country;
	private String prod_info_1;
	private String prod_info_2;
	private String prod_info_3;
	private String prod_info_4;
	private String prod_info_5;
	private String prod_info_6;
	private String prod_info_7;
	private String prod_info_8;
	private String prod_info_9;
	private String prod_info_10;
	private String prod_info_11;
	private String prod_info_12;
	private String prod_info_13;
	private String prod_info_14;
	private String prod_info_15;
	private String prod_trade_info_1;
	private String prod_trade_info_2;
	private String prod_trade_info_3;
	private String prod_trade_info_4;
	private String prod_trade_info_5;
	private String del_st;
	private String del_dt;
	private String prod_recom_1;
	private String prod_recom_2;
	private String prod_recom_3;
	private String prod_recom_4;
	private String prod_recom_5;
	private String prod_recom_6;
	private String prod_recom_7;
	private String prod_recom_8;
	private String prod_recom_9;
	private String prod_recom_10;

	private String prod_qna_cnt;
	private String prod_review_cnt;
	private String set_date;
	private String room_day_check;
	
	private String prod_age;
	private String prod_season;
	private String prod_travel_type;
	private String recom_1_prod_nm;
	private String recom_1_use_st;
	private String recom_2_prod_nm;
	private String recom_2_use_st;
	private String recom_3_prod_nm;
	private String recom_3_use_st;
	private String recom_4_prod_nm;
	private String recom_4_use_st;
	private String recom_5_prod_nm;
	private String recom_5_use_st;
	private String recom_6_prod_nm;
	private String recom_6_use_st;
	private String recom_7_prod_nm;
	private String recom_7_use_st;
	private String recom_8_prod_nm;
	private String recom_8_use_st;
	private String recom_9_prod_nm;
	private String recom_9_use_st;
	private String recom_10_prod_nm;
	private String recom_10_use_st;
	private String recom_1_img;
	private String recom_2_img;
	private String recom_3_img;
	private String recom_4_img;
	private String recom_5_img;
	private String recom_6_img;
	private String recom_7_img;
	private String recom_8_img;
	private String recom_9_img;
	private String recom_10_img;
	
	/* 옵션용 */
	private String opt_nm;
	private String opt_price;

	private String opt_seq;
	private String opt_orderby;
	private String opt_use_st;
	private String opt_del_st;
	
	/* 검색용 */
	private String searchKey;
	private String searchKeyword;

	private String modalsearchKey;
	private String modalsearchKeyword;
	private String modalstore_category;

	private String orderby;
	
	private int sql_start;
	private int sql_limit;
	private int pagenum;
	private int pagepercnt;
	
	/* 쿠폰 */
	private String coupon_seq;
	private String coupon_id;
	private String coupon_nm;
	private String store_category;
	private String coupon_set_st;
	private String coupon_set_price;
	private String coupon_st_dt;
	private String coupon_st_dt_ymd;
	private String coupon_st_dt_hour;
	private String coupon_st_dt_minute;
	private String coupon_ed_dt;
	private String coupon_ed_dt_ymd;
	private String coupon_ed_dt_hour;
	private String coupon_ed_dt_minute;
	private String coupon_use_st;
	private String cm_seq;
	private String coupon_use_dt;
	
	private String reg_dt_ymd;
	private String reg_dt_his;
	private String coupon_use_status;
	private String coupon_have_status;
	
	private String recom_1_prod_comment;
	private String recom_1_2_img;
	private String recom_1_3_img;
	private String recom_1_4_img;
	private String recom_1_5_img;
	private String recom_1_6_img;
	private String recom_1_7_img;
	private String recom_1_8_img;
	private String recom_1_9_img;
	private String recom_1_10_img;
	private String recom_2_prod_comment;
	private String recom_2_2_img;
	private String recom_2_3_img;
	private String recom_2_4_img;
	private String recom_2_5_img;
	private String recom_2_6_img;
	private String recom_2_7_img;
	private String recom_2_8_img;
	private String recom_2_9_img;
	private String recom_2_10_img;
	private String recom_3_prod_comment;
	private String recom_3_2_img;
	private String recom_3_3_img;
	private String recom_3_4_img;
	private String recom_3_5_img;
	private String recom_3_6_img;
	private String recom_3_7_img;
	private String recom_3_8_img;
	private String recom_3_9_img;
	private String recom_3_10_img;
	private String recom_4_prod_comment;
	private String recom_4_2_img;
	private String recom_4_3_img;
	private String recom_4_4_img;
	private String recom_4_5_img;
	private String recom_4_6_img;
	private String recom_4_7_img;
	private String recom_4_8_img;
	private String recom_4_9_img;
	private String recom_4_10_img;
	private String recom_5_prod_comment;
	private String recom_5_2_img;
	private String recom_5_3_img;
	private String recom_5_4_img;
	private String recom_5_5_img;
	private String recom_5_6_img;
	private String recom_5_7_img;
	private String recom_5_8_img;
	private String recom_5_9_img;
	private String recom_5_10_img;
	private String recom_6_prod_comment;
	private String recom_6_2_img;
	private String recom_6_3_img;
	private String recom_6_4_img;
	private String recom_6_5_img;
	private String recom_6_6_img;
	private String recom_6_7_img;
	private String recom_6_8_img;
	private String recom_6_9_img;
	private String recom_6_10_img;
	private String recom_7_prod_comment;
	private String recom_7_2_img;
	private String recom_7_3_img;
	private String recom_7_4_img;
	private String recom_7_5_img;
	private String recom_7_6_img;
	private String recom_7_7_img;
	private String recom_7_8_img;
	private String recom_7_9_img;
	private String recom_7_10_img;
	private String recom_8_prod_comment;
	private String recom_8_2_img;
	private String recom_8_3_img;
	private String recom_8_4_img;
	private String recom_8_5_img;
	private String recom_8_6_img;
	private String recom_8_7_img;
	private String recom_8_8_img;
	private String recom_8_9_img;
	private String recom_8_10_img;
	private String recom_9_prod_comment;
	private String recom_9_2_img;
	private String recom_9_3_img;
	private String recom_9_4_img;
	private String recom_9_5_img;
	private String recom_9_6_img;
	private String recom_9_7_img;
	private String recom_9_8_img;
	private String recom_9_9_img;
	private String recom_9_10_img;
	private String recom_10_prod_comment;
	private String recom_10_2_img;
	private String recom_10_3_img;
	private String recom_10_4_img;
	private String recom_10_5_img;
	private String recom_10_6_img;
	private String recom_10_7_img;
	private String recom_10_8_img;
	private String recom_10_9_img;
	private String recom_10_10_img;

	private String recom_1_store_category;
	private String recom_1_prod_category;
	private String recom_2_store_category;
	private String recom_2_prod_category;
	private String recom_3_store_category;
	private String recom_3_prod_category;
	private String recom_4_store_category;
	private String recom_4_prod_category;
	private String recom_5_store_category;
	private String recom_5_prod_category;
	private String recom_6_store_category;
	private String recom_6_prod_category;
	private String recom_7_store_category;
	private String recom_7_prod_category;
	private String recom_8_store_category;
	private String recom_8_prod_category;
	private String recom_9_store_category;
	private String recom_9_prod_category;
	private String recom_10_store_category;
	private String recom_10_prod_category;
	
	private String recom_1_pick_cnt;
	private String recom_2_pick_cnt;
	private String recom_3_pick_cnt;
	private String recom_4_pick_cnt;
	private String recom_5_pick_cnt;
	private String recom_6_pick_cnt;
	private String recom_7_pick_cnt;
	private String recom_8_pick_cnt;
	private String recom_9_pick_cnt;
	private String recom_10_pick_cnt;
	
	private String recom_1_store_nm;
	private String recom_2_store_nm;
	private String recom_3_store_nm;
	private String recom_4_store_nm;
	private String recom_5_store_nm;
	private String recom_6_store_nm;
	private String recom_7_store_nm;
	private String recom_8_store_nm;
	private String recom_9_store_nm;
	private String recom_10_store_nm;
	
	/* 방정보 */
	private String reserve_st_dt;
	private String reserve_ed_dt;
	private String prod_room_seq;
	private String prod_room_use_st;
	private String prod_room_nm;
	private String prod_room_orderby;
	private String prod_room_content_1;
	private String prod_room_content_2;
	private String prod_room_img_1;
	private String prod_room_img_2;
	private String prod_room_img_3;
	private String prod_room_img_4;
	private String prod_room_img_5;
	private String prod_room_img_6;
	private String prod_room_img_7;
	private String prod_room_img_8;
	private String prod_room_img_9;
	private String prod_room_img_10;
	private String prod_room_movie;
	private String prod_room_default_cnt;
	private String prod_room_max_cnt;
	private String prod_room_adult_price;
	private String prod_room_young_price;
	private String prod_room_normal_normal_price;
	private String prod_room_normal_normal_sale_price;
	private String prod_room_normal_holiday_price;
	private String prod_room_normal_holiday_sale_price;
	private String prod_room_ready_normal_price;
	private String prod_room_ready_normal_sale_price;
	private String prod_room_ready_holiday_price;
	private String prod_room_ready_holiday_sale_price;
	private String prod_room_ready2_normal_price;
	private String prod_room_ready2_normal_sale_price;
	private String prod_room_ready2_holiday_price;
	private String prod_room_ready2_holiday_sale_price;
	private String prod_room_busy_normal_price;
	private String prod_room_busy_normal_sale_price;
	private String prod_room_busy_holiday_price;
	private String prod_room_busy_holiday_sale_price;
	
	private String cart_seq;
	private String opt_seqs;
	private String opt_nms;
	private String opt_prices;
	private String opt_cnts;
	private String reserve_user_nm;
	private String reserve_user_call;
	private String reserve_time;
	private String total_price;
	
	private String reserve_st_dt_year;
	private String reserve_st_dt_month;
	private String reserve_st_dt_date;
	private String reserve_ed_dt_year;
	private String reserve_ed_dt_month;
	private String reserve_ed_dt_date;
	private String reserve_time_hour;
	private String reserve_time_minute;
	
	private String order_seq;
	private String order_id;
	private String order_user_id;
	private String order_user_nm;
	private String order_hp;
	private String order_tel;
	private String order_email;
	private String order_addr_id;
	private String order_zip;
	private String order_addr1;
	private String order_addr2;
	private String order_total_price;
	private String order_use_coupon_id;
	private String order_coupon_price;
	private String order_use_mileage;
	private String order_save_mileage;
	private String order_total_delivery_price;
	private String order_delivery_price_st;
	private String order_pay_st;
	private String order_pay_cd;
	private String order_pay_vbank_nm;
	private String order_pay_vbank_number;
	private String order_pay_vbank_user;
	private String order_st;
	private String order_memo;
	private String order_pay_stat;
	private String order_time;
	private String order_pay_vbank_cd;
	private String order_pay_time;
	
	
	private String od_seq;
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
	private String od_order_stat;
	private String od_stat;
	private String od_end_date;
	
	private String sql_or;
	private String order_st_dt;
	private String order_ed_dt;
	
	private String delivery_company_cd1;
	private String delivery_company_nm1;
	private String delivery_company_cd2;
	private String delivery_company_nm2;
	private String delivery_company_cd3;
	private String delivery_company_nm3;
	
	private String od_delivery_company_id;
	private String od_delivery_number;
	private String od_delivery_dt;
	private String delivery_company_nm;
	
	private String order_pay_date;
	private String order_cancel_date;
	private String od_canceling_dt;
	
	//=========================================================
	
	public int getinsert_id() { return insert_id; }
	public void setinsert_id(int insert_id) { this.insert_id = insert_id; }
	
	public String getsess_id() { return sess_id; }
	public void setsess_id(String sess_id) { this.sess_id = sess_id; }
	
	public String getuser_level() { return user_level; }
	public void setuser_level(String user_level) { this.user_level = user_level; }
	
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
	
	public String getstore_deny_date() { return store_deny_date; }
	public void setstore_deny_date(String store_deny_date) { this.store_deny_date = store_deny_date; }

	
	/* 상품정보 */
	public String getprod_seq() { return prod_seq; }
	public void setprod_seq(String prod_seq) { this.prod_seq = prod_seq; }

	public String getprod_use_st() { return prod_use_st; }
	public void setprod_use_st(String prod_use_st) { this.prod_use_st = prod_use_st; }

	public String getstore_category_nm() { return store_category_nm; }
	public void setstore_category_nm(String store_category_nm) { this.store_category_nm = store_category_nm; }
	
	public String getprod_id() { return prod_id; }
	public void setprod_id(String prod_id) { this.prod_id = prod_id; }

	public String getprod_nm() { return prod_nm; }
	public void setprod_nm(String prod_nm) { this.prod_nm = prod_nm; }
	
	public String getprod_category() { return prod_category; }
	public void setprod_category(String prod_category) { this.prod_category = prod_category; }
	
	public String getprod_category_cd() { return prod_category_cd; }
	public void setprod_category_cd(String prod_category_cd) { this.prod_category_cd = prod_category_cd; }
	
	public String getprod_category_nm() { return prod_category_nm; }
	public void setprod_category_nm(String prod_category_nm) { this.prod_category_nm = prod_category_nm; }

	public String getprod_comment() { return prod_comment; }
	public void setprod_comment(String prod_comment) { this.prod_comment = prod_comment; }

	public String getprod_content() { return prod_content; }
	public void setprod_content(String prod_content) { this.prod_content = prod_content; }

	public String getprod_content_2() { return prod_content_2; }
	public void setprod_content_2(String prod_content_2) { this.prod_content_2 = prod_content_2; }
	
	public String getprod_opt_st() { return prod_opt_st; }
	public void setprod_opt_st(String prod_opt_st) { this.prod_opt_st = prod_opt_st; }

	public String getprod_market_price() { return prod_market_price; }
	public void setprod_market_price(String prod_market_price) { this.prod_market_price = prod_market_price; }

	public String getprod_price() { return prod_price; }
	public void setprod_price(String prod_price) { this.prod_price = prod_price; }
	
	public String getprod_price_percent() { return prod_price_percent; }
	public void setprod_price_percent(String prod_price_percent) { this.prod_price_percent = prod_price_percent; }
	
	public String getprod_min_price() { return prod_min_price; }
	public void setprod_min_price(String prod_min_price) { this.prod_min_price = prod_min_price; }

	public String getprod_delivery_price() { return prod_delivery_price; }
	public void setprod_delivery_price(String prod_delivery_price) { this.prod_delivery_price = prod_delivery_price; }

	public String getprod_orderby() { return prod_orderby; }
	public void setprod_orderby(String prod_orderby) { this.prod_orderby = prod_orderby; }
	
	public String getprod_stock_set() { return prod_stock_set; }
	public void setprod_stock_set(String prod_stock_set) { this.prod_stock_set = prod_stock_set; }

	public String getprod_stock_cnt() { return prod_stock_cnt; }
	public void setprod_stock_cnt(String prod_stock_cnt) { this.prod_stock_cnt = prod_stock_cnt; }

	public String getprod_st_dt() { return prod_st_dt; }
	public void setprod_st_dt(String prod_st_dt) { this.prod_st_dt = prod_st_dt; }
	
	public String getprod_st_dt_ymd() { return prod_st_dt_ymd; }
	public void setprod_st_dt_ymd(String prod_st_dt_ymd) { this.prod_st_dt_ymd = prod_st_dt_ymd; }

	public String getprod_st_dt_hour() { return prod_st_dt_hour; }
	public void setprod_st_dt_hour(String prod_st_dt_hour) { this.prod_st_dt_hour = prod_st_dt_hour; }

	public String getprod_st_dt_minute() { return prod_st_dt_minute; }
	public void setprod_st_dt_minute(String prod_st_dt_minute) { this.prod_st_dt_minute = prod_st_dt_minute; }

	public String getprod_ed_dt() { return prod_ed_dt; }
	public void setprod_ed_dt(String prod_ed_dt) { this.prod_ed_dt = prod_ed_dt; }
	
	public String getprod_ed_dt_ymd() { return prod_ed_dt_ymd; }
	public void setprod_ed_dt_ymd(String prod_ed_dt_ymd) { this.prod_ed_dt_ymd = prod_ed_dt_ymd; }
	
	public String getprod_ed_dt_hour() { return prod_ed_dt_hour; }
	public void setprod_ed_dt_hour(String prod_ed_dt_hour) { this.prod_ed_dt_hour = prod_ed_dt_hour; }
	
	public String getprod_ed_dt_minute() { return prod_ed_dt_minute; }
	public void setprod_ed_dt_minute(String prod_ed_dt_minute) { this.prod_ed_dt_minute = prod_ed_dt_minute; }

	public String getprod_hit_cnt() { return prod_hit_cnt; }
	public void setprod_hit_cnt(String prod_hit_cnt) { this.prod_hit_cnt = prod_hit_cnt; }

	public String getprod_pick_cnt() { return prod_pick_cnt; }
	public void setprod_pick_cnt(String prod_pick_cnt) { this.prod_pick_cnt = prod_pick_cnt; }

	public String getprod_star() { return prod_star; }
	public void setprod_star(String prod_star) { this.prod_star = prod_star; }
	
	public String getprod_order_cnt() { return prod_order_cnt; }
	public void setprod_order_cnt(String prod_order_cnt) { this.prod_order_cnt = prod_order_cnt; }
	
	public String getprod_use_pay_st() { return prod_use_pay_st; }
	public void setprod_use_pay_st(String prod_use_pay_st) { this.prod_use_pay_st = prod_use_pay_st; }
	
	public String getprod_reserve_limit() { return prod_reserve_limit; }
	public void setprod_reserve_limit(String prod_reserve_limit) { this.prod_reserve_limit = prod_reserve_limit; }

	public String getprod_use_coupon_st() { return prod_use_coupon_st; }
	public void setprod_use_coupon_st(String prod_use_coupon_st) { this.prod_use_coupon_st = prod_use_coupon_st; }
	
	public String getprod_use_mileage_st() { return prod_use_mileage_st; }
	public void setprod_use_mileage_st(String prod_use_mileage_st) { this.prod_use_mileage_st = prod_use_mileage_st; }

	public String getprod_max_buy_cnt() { return prod_max_buy_cnt; }
	public void setprod_max_buy_cnt(String prod_max_buy_cnt) { this.prod_max_buy_cnt = prod_max_buy_cnt; }

	public String getprod_bundle_delivery() { return prod_bundle_delivery; }
	public void setprod_bundle_delivery(String prod_bundle_delivery) { this.prod_bundle_delivery = prod_bundle_delivery; }
	
	public String getprod_content_time() { return prod_content_time; }
	public void setprod_content_time(String prod_content_time) { this.prod_content_time = prod_content_time; }

	public String getprod_content_pay() { return prod_content_pay; }
	public void setprod_content_pay(String prod_content_pay) { this.prod_content_pay = prod_content_pay; }

	public String getprod_content_precautions() { return prod_content_precautions; }
	public void setprod_content_precautions(String prod_content_precautions) { this.prod_content_precautions = prod_content_precautions; }

	public String getprod_content_course() { return prod_content_course; }
	public void setprod_content_course(String prod_content_course) { this.prod_content_course = prod_content_course; }

	public String getprod_img_1() { return prod_img_1; }
	public void setprod_img_1(String prod_img_1) { this.prod_img_1 = prod_img_1; }

	public String getprod_img_2() { return prod_img_2; }
	public void setprod_img_2(String prod_img_2) { this.prod_img_2 = prod_img_2; }

	public String getprod_img_3() { return prod_img_3; }
	public void setprod_img_3(String prod_img_3) { this.prod_img_3 = prod_img_3; }

	public String getprod_img_4() { return prod_img_4; }
	public void setprod_img_4(String prod_img_4) { this.prod_img_4 = prod_img_4; }

	public String getprod_img_5() { return prod_img_5; }
	public void setprod_img_5(String prod_img_5) { this.prod_img_5 = prod_img_5; }

	public String getprod_img_6() { return prod_img_6; }
	public void setprod_img_6(String prod_img_6) { this.prod_img_6 = prod_img_6; }

	public String getprod_img_7() { return prod_img_7; }
	public void setprod_img_7(String prod_img_7) { this.prod_img_7 = prod_img_7; }

	public String getprod_img_8() { return prod_img_8; }
	public void setprod_img_8(String prod_img_8) { this.prod_img_8 = prod_img_8; }

	public String getprod_img_9() { return prod_img_9; }
	public void setprod_img_9(String prod_img_9) { this.prod_img_9 = prod_img_9; }

	public String getprod_img_10() { return prod_img_10; }
	public void setprod_img_10(String prod_img_10) { this.prod_img_10 = prod_img_10; }

	public String getprod_movie() { return prod_movie; }
	public void setprod_movie(String prod_movie) { this.prod_movie = prod_movie; }

	public String getprod_maker() { return prod_maker; }
	public void setprod_maker(String prod_maker) { this.prod_maker = prod_maker; }

	public String getprod_country() { return prod_country; }
	public void setprod_country(String prod_country) { this.prod_country = prod_country; }
	
	public String getprod_info_1() { return prod_info_1; }
	public void setprod_info_1(String prod_info_1) { this.prod_info_1 = prod_info_1; }

	public String getprod_info_2() { return prod_info_2; }
	public void setprod_info_2(String prod_info_2) { this.prod_info_2 = prod_info_2; }

	public String getprod_info_3() { return prod_info_3; }
	public void setprod_info_3(String prod_info_3) { this.prod_info_3 = prod_info_3; }

	public String getprod_info_4() { return prod_info_4; }
	public void setprod_info_4(String prod_info_4) { this.prod_info_4 = prod_info_4; }

	public String getprod_info_5() { return prod_info_5; }
	public void setprod_info_5(String prod_info_5) { this.prod_info_5 = prod_info_5; }

	public String getprod_info_6() { return prod_info_6; }
	public void setprod_info_6(String prod_info_6) { this.prod_info_6 = prod_info_6; }

	public String getprod_info_7() { return prod_info_7; }
	public void setprod_info_7(String prod_info_7) { this.prod_info_7 = prod_info_7; }

	public String getprod_info_8() { return prod_info_8; }
	public void setprod_info_8(String prod_info_8) { this.prod_info_8 = prod_info_8; }

	public String getprod_info_9() { return prod_info_9; }
	public void setprod_info_9(String prod_info_9) { this.prod_info_9 = prod_info_9; }

	public String getprod_info_10() { return prod_info_10; }
	public void setprod_info_10(String prod_info_10) { this.prod_info_10 = prod_info_10; }

	public String getprod_info_11() { return prod_info_11; }
	public void setprod_info_11(String prod_info_11) { this.prod_info_11 = prod_info_11; }

	public String getprod_info_12() { return prod_info_12; }
	public void setprod_info_12(String prod_info_12) { this.prod_info_12 = prod_info_12; }

	public String getprod_info_13() { return prod_info_13; }
	public void setprod_info_13(String prod_info_13) { this.prod_info_13 = prod_info_13; }

	public String getprod_info_14() { return prod_info_14; }
	public void setprod_info_14(String prod_info_14) { this.prod_info_14 = prod_info_14; }

	public String getprod_info_15() { return prod_info_15; }
	public void setprod_info_15(String prod_info_15) { this.prod_info_15 = prod_info_15; }

	public String getprod_trade_info_1() { return prod_trade_info_1; }
	public void setprod_trade_info_1(String prod_trade_info_1) { this.prod_trade_info_1 = prod_trade_info_1; }

	public String getprod_trade_info_2() { return prod_trade_info_2; }
	public void setprod_trade_info_2(String prod_trade_info_2) { this.prod_trade_info_2 = prod_trade_info_2; }

	public String getprod_trade_info_3() { return prod_trade_info_3; }
	public void setprod_trade_info_3(String prod_trade_info_3) { this.prod_trade_info_3 = prod_trade_info_3; }

	public String getprod_trade_info_4() { return prod_trade_info_4; }
	public void setprod_trade_info_4(String prod_trade_info_4) { this.prod_trade_info_4 = prod_trade_info_4; }

	public String getprod_trade_info_5() { return prod_trade_info_5; }
	public void setprod_trade_info_5(String prod_trade_info_5) { this.prod_trade_info_5 = prod_trade_info_5; }

	public String getdel_st() { return del_st; }
	public void setdel_st(String del_st) { this.del_st = del_st; }

	public String getdel_dt() { return del_dt; }
	public void setdel_dt(String del_dt) { this.del_dt = del_dt; }
	
	public String getprod_recom_1() { return prod_recom_1; }
	public void setprod_recom_1(String prod_recom_1) { this.prod_recom_1 = prod_recom_1; }

	public String getprod_recom_2() { return prod_recom_2; }
	public void setprod_recom_2(String prod_recom_2) { this.prod_recom_2 = prod_recom_2; }

	public String getprod_recom_3() { return prod_recom_3; }
	public void setprod_recom_3(String prod_recom_3) { this.prod_recom_3 = prod_recom_3; }

	public String getprod_recom_4() { return prod_recom_4; }
	public void setprod_recom_4(String prod_recom_4) { this.prod_recom_4 = prod_recom_4; }

	public String getprod_recom_5() { return prod_recom_5; }
	public void setprod_recom_5(String prod_recom_5) { this.prod_recom_5 = prod_recom_5; }

	public String getprod_recom_6() { return prod_recom_6; }
	public void setprod_recom_6(String prod_recom_6) { this.prod_recom_6 = prod_recom_6; }

	public String getprod_recom_7() { return prod_recom_7; }
	public void setprod_recom_7(String prod_recom_7) { this.prod_recom_7 = prod_recom_7; }

	public String getprod_recom_8() { return prod_recom_8; }
	public void setprod_recom_8(String prod_recom_8) { this.prod_recom_8 = prod_recom_8; }

	public String getprod_recom_9() { return prod_recom_9; }
	public void setprod_recom_9(String prod_recom_9) { this.prod_recom_9 = prod_recom_9; }

	public String getprod_recom_10() { return prod_recom_10; }
	public void setprod_recom_10(String prod_recom_10) { this.prod_recom_10 = prod_recom_10; }

	public String getprod_qna_cnt() { return prod_qna_cnt; }
	public void setprod_qna_cnt(String prod_qna_cnt) { this.prod_qna_cnt = prod_qna_cnt; }
	
	public String getprod_review_cnt() { return prod_review_cnt; }
	public void setprod_review_cnt(String prod_review_cnt) { this.prod_review_cnt = prod_review_cnt; }
	
	public String getset_date() { return set_date; }
	public void setset_date(String set_date) { this.set_date = set_date; }
	
	public String getroom_day_check() { return room_day_check; }
	public void setroom_day_check(String room_day_check) { this.room_day_check = room_day_check; }
	
	public String getprod_age() { return prod_age; }
	public void setprod_age(String prod_age) { this.prod_age = prod_age; }
	
	public String getprod_season() { return prod_season; }
	public void setprod_season(String prod_season) { this.prod_season = prod_season; }
	
	public String getprod_travel_type() { return prod_travel_type; }
	public void setprod_travel_type(String prod_travel_type) { this.prod_travel_type = prod_travel_type; }
	
	public String getrecom_1_prod_nm() { return recom_1_prod_nm; }
	public void setrecom_1_prod_nm(String recom_1_prod_nm) { this.recom_1_prod_nm = recom_1_prod_nm; }

	public String getrecom_1_use_st() { return recom_1_use_st; }
	public void setrecom_1_use_st(String recom_1_use_st) { this.recom_1_use_st = recom_1_use_st; }

	public String getrecom_2_prod_nm() { return recom_2_prod_nm; }
	public void setrecom_2_prod_nm(String recom_2_prod_nm) { this.recom_2_prod_nm = recom_2_prod_nm; }

	public String getrecom_2_use_st() { return recom_2_use_st; }
	public void setrecom_2_use_st(String recom_2_use_st) { this.recom_2_use_st = recom_2_use_st; }

	public String getrecom_3_prod_nm() { return recom_3_prod_nm; }
	public void setrecom_3_prod_nm(String recom_3_prod_nm) { this.recom_3_prod_nm = recom_3_prod_nm; }

	public String getrecom_3_use_st() { return recom_3_use_st; }
	public void setrecom_3_use_st(String recom_3_use_st) { this.recom_3_use_st = recom_3_use_st; }

	public String getrecom_4_prod_nm() { return recom_4_prod_nm; }
	public void setrecom_4_prod_nm(String recom_4_prod_nm) { this.recom_4_prod_nm = recom_4_prod_nm; }

	public String getrecom_4_use_st() { return recom_4_use_st; }
	public void setrecom_4_use_st(String recom_4_use_st) { this.recom_4_use_st = recom_4_use_st; }

	public String getrecom_5_prod_nm() { return recom_5_prod_nm; }
	public void setrecom_5_prod_nm(String recom_5_prod_nm) { this.recom_5_prod_nm = recom_5_prod_nm; }

	public String getrecom_5_use_st() { return recom_5_use_st; }
	public void setrecom_5_use_st(String recom_5_use_st) { this.recom_5_use_st = recom_5_use_st; }

	public String getrecom_6_prod_nm() { return recom_6_prod_nm; }
	public void setrecom_6_prod_nm(String recom_6_prod_nm) { this.recom_6_prod_nm = recom_6_prod_nm; }

	public String getrecom_6_use_st() { return recom_6_use_st; }
	public void setrecom_6_use_st(String recom_6_use_st) { this.recom_6_use_st = recom_6_use_st; }

	public String getrecom_7_prod_nm() { return recom_7_prod_nm; }
	public void setrecom_7_prod_nm(String recom_7_prod_nm) { this.recom_7_prod_nm = recom_7_prod_nm; }

	public String getrecom_7_use_st() { return recom_7_use_st; }
	public void setrecom_7_use_st(String recom_7_use_st) { this.recom_7_use_st = recom_7_use_st; }

	public String getrecom_8_prod_nm() { return recom_8_prod_nm; }
	public void setrecom_8_prod_nm(String recom_8_prod_nm) { this.recom_8_prod_nm = recom_8_prod_nm; }

	public String getrecom_8_use_st() { return recom_8_use_st; }
	public void setrecom_8_use_st(String recom_8_use_st) { this.recom_8_use_st = recom_8_use_st; }

	public String getrecom_9_prod_nm() { return recom_9_prod_nm; }
	public void setrecom_9_prod_nm(String recom_9_prod_nm) { this.recom_9_prod_nm = recom_9_prod_nm; }

	public String getrecom_9_use_st() { return recom_9_use_st; }
	public void setrecom_9_use_st(String recom_9_use_st) { this.recom_9_use_st = recom_9_use_st; }

	public String getrecom_10_prod_nm() { return recom_10_prod_nm; }
	public void setrecom_10_prod_nm(String recom_10_prod_nm) { this.recom_10_prod_nm = recom_10_prod_nm; }

	public String getrecom_10_use_st() { return recom_10_use_st; }
	public void setrecom_10_use_st(String recom_10_use_st) { this.recom_10_use_st = recom_10_use_st; }
	
	public String getrecom_1_img() { return recom_1_img; }
	public void setrecom_1_img(String recom_1_img) { this.recom_1_img = recom_1_img; }

	public String getrecom_2_img() { return recom_2_img; }
	public void setrecom_2_img(String recom_2_img) { this.recom_2_img = recom_2_img; }

	public String getrecom_3_img() { return recom_3_img; }
	public void setrecom_3_img(String recom_3_img) { this.recom_3_img = recom_3_img; }

	public String getrecom_4_img() { return recom_4_img; }
	public void setrecom_4_img(String recom_4_img) { this.recom_4_img = recom_4_img; }

	public String getrecom_5_img() { return recom_5_img; }
	public void setrecom_5_img(String recom_5_img) { this.recom_5_img = recom_5_img; }

	public String getrecom_6_img() { return recom_6_img; }
	public void setrecom_6_img(String recom_6_img) { this.recom_6_img = recom_6_img; }

	public String getrecom_7_img() { return recom_7_img; }
	public void setrecom_7_img(String recom_7_img) { this.recom_7_img = recom_7_img; }

	public String getrecom_8_img() { return recom_8_img; }
	public void setrecom_8_img(String recom_8_img) { this.recom_8_img = recom_8_img; }

	public String getrecom_9_img() { return recom_9_img; }
	public void setrecom_9_img(String recom_9_img) { this.recom_9_img = recom_9_img; }

	public String getrecom_10_img() { return recom_10_img; }
	public void setrecom_10_img(String recom_10_img) { this.recom_10_img = recom_10_img; }


	
	/* 옵션정보 */
	public String getopt_price() { return opt_price; }
	public void setopt_price(String opt_price) { this.opt_price = opt_price; }

	public String getopt_nm() { return opt_nm; }
	public void setopt_nm(String opt_nm) { this.opt_nm = opt_nm; }

	public String getopt_seq() { return opt_seq; }
	public void setopt_seq(String opt_seq) { this.opt_seq = opt_seq; }

	public String getopt_orderby() { return opt_orderby; }
	public void setopt_orderby(String opt_orderby) { this.opt_orderby = opt_orderby; }

	public String getopt_use_st() { return opt_use_st; }
	public void setopt_use_st(String opt_use_st) { this.opt_use_st = opt_use_st; }

	public String getopt_del_st() { return opt_del_st; }
	public void setopt_del_st(String opt_del_st) { this.opt_del_st = opt_del_st; }
	
	/* 검색용 */
	public String getsearchKey() { return searchKey; }
	public void setsearchKey(String searchKey) { this.searchKey = searchKey; }
	
	public String getsearchKeyword() { return searchKeyword; }
	public void setsearchKeyword(String searchKeyword) { this.searchKeyword = searchKeyword; }
	
	public String getmodalsearchKey() { return modalsearchKey; }
	public void setmodalsearchKey(String modalsearchKey) { this.modalsearchKey = modalsearchKey; }
	
	public String getmodalsearchKeyword() { return modalsearchKeyword; }
	public void setmodalsearchKeyword(String modalsearchKeyword) { this.modalsearchKeyword = modalsearchKeyword; }	
	
	public String getmodalstore_category() { return modalstore_category; }
	public void setmodalstore_category(String modalstore_category) { this.modalstore_category = modalstore_category; }
	
	public String getorderby() { return orderby; }
	public void setorderby(String orderby) { this.orderby = orderby; }
	
	public int getsql_start() { return sql_start; }
	public void setsql_start(int sql_start) { this.sql_start = sql_start; }
	
	public int getsql_limit() { return sql_limit; }
	public void setsql_limit(int sql_limit) { this.sql_limit = sql_limit; }

	public int getpagenum() { return pagenum; }
	public void setpagenum(int pagenum) { this.pagenum = pagenum; }

	public int getpagepercnt() { return pagepercnt; }
	public void setpagepercnt(int pagepercnt) { this.pagepercnt = pagepercnt; }
	
	/* 쿠폰용 */
	public String getcoupon_seq() { return coupon_seq; }
	public void setcoupon_seq(String coupon_seq) { this.coupon_seq = coupon_seq; }
	
	public String getcoupon_id() { return coupon_id; }
	public void setcoupon_id(String coupon_id) { this.coupon_id = coupon_id; }
	
	public String getcoupon_nm() { return coupon_nm; }
	public void setcoupon_nm(String coupon_nm) { this.coupon_nm = coupon_nm; }
	
	public String getstore_category() { return store_category; }
	public void setstore_category(String store_category) { this.store_category = store_category; }
	
	public String getcoupon_set_st() { return coupon_set_st; }
	public void setcoupon_set_st(String coupon_set_st) { this.coupon_set_st = coupon_set_st; }
	
	public String getcoupon_set_price() { return coupon_set_price; }
	public void setcoupon_set_price(String coupon_set_price) { this.coupon_set_price = coupon_set_price; }
	
	public String getcoupon_st_dt() { return coupon_st_dt; }
	public void setcoupon_st_dt(String coupon_st_dt) { this.coupon_st_dt = coupon_st_dt; }
	
	public String getcoupon_st_dt_ymd() { return coupon_st_dt_ymd; }
	public void setcoupon_st_dt_ymd(String coupon_st_dt_ymd) { this.coupon_st_dt_ymd = coupon_st_dt_ymd; }

	public String getcoupon_st_dt_hour() { return coupon_st_dt_hour; }
	public void setcoupon_st_dt_hour(String coupon_st_dt_hour) { this.coupon_st_dt_hour = coupon_st_dt_hour; }

	public String getcoupon_st_dt_minute() { return coupon_st_dt_minute; }
	public void setcoupon_st_dt_minute(String coupon_st_dt_minute) { this.coupon_st_dt_minute = coupon_st_dt_minute; }
	
	public String getcoupon_ed_dt() { return coupon_ed_dt; }
	public void setcoupon_ed_dt(String coupon_ed_dt) { this.coupon_ed_dt = coupon_ed_dt; }
	
	public String getcoupon_ed_dt_ymd() { return coupon_ed_dt_ymd; }
	public void setcoupon_ed_dt_ymd(String coupon_ed_dt_ymd) { this.coupon_ed_dt_ymd = coupon_ed_dt_ymd; }

	public String getcoupon_ed_dt_hour() { return coupon_ed_dt_hour; }
	public void setcoupon_ed_dt_hour(String coupon_ed_dt_hour) { this.coupon_ed_dt_hour = coupon_ed_dt_hour; }

	public String getcoupon_ed_dt_minute() { return coupon_ed_dt_minute; }
	public void setcoupon_ed_dt_minute(String coupon_ed_dt_minute) { this.coupon_ed_dt_minute = coupon_ed_dt_minute; }
	
	public String getcoupon_use_st() { return coupon_use_st; }
	public void setcoupon_use_st(String coupon_use_st) { this.coupon_use_st = coupon_use_st; }
	
	public String getreg_dt_ymd() { return reg_dt_ymd; }
	public void setreg_dt_ymd(String reg_dt_ymd) { this.reg_dt_ymd = reg_dt_ymd; }

	public String getreg_dt_his() { return reg_dt_his; }
	public void setreg_dt_his(String reg_dt_his) { this.reg_dt_his = reg_dt_his; }
	
	public String getcoupon_use_status() { return coupon_use_status; }
	public void setcoupon_use_status(String coupon_use_status) { this.coupon_use_status = coupon_use_status; }
	
	public String getcoupon_have_status() { return coupon_have_status; }
	public void setcoupon_have_status(String coupon_have_status) { this.coupon_have_status = coupon_have_status; }

	public String getcm_seq() { return cm_seq; }
	public void setcm_seq(String cm_seq) { this.cm_seq = cm_seq; }

	public String getcoupon_use_dt() { return coupon_use_dt; }
	public void setcoupon_use_dt(String coupon_use_dt) { this.coupon_use_dt = coupon_use_dt; }
	
	
	/* 추천여행 관련 */
	public String getrecom_1_prod_comment() { return recom_1_prod_comment; }
	public void setrecom_1_prod_comment(String recom_1_prod_comment) { this.recom_1_prod_comment = recom_1_prod_comment; }

	public String getrecom_1_2_img() { return recom_1_2_img; }
	public void setrecom_1_2_img(String recom_1_2_img) { this.recom_1_2_img = recom_1_2_img; }

	public String getrecom_1_3_img() { return recom_1_3_img; }
	public void setrecom_1_3_img(String recom_1_3_img) { this.recom_1_3_img = recom_1_3_img; }

	public String getrecom_1_4_img() { return recom_1_4_img; }
	public void setrecom_1_4_img(String recom_1_4_img) { this.recom_1_4_img = recom_1_4_img; }

	public String getrecom_1_5_img() { return recom_1_5_img; }
	public void setrecom_1_5_img(String recom_1_5_img) { this.recom_1_5_img = recom_1_5_img; }

	public String getrecom_1_6_img() { return recom_1_6_img; }
	public void setrecom_1_6_img(String recom_1_6_img) { this.recom_1_6_img = recom_1_6_img; }

	public String getrecom_1_7_img() { return recom_1_7_img; }
	public void setrecom_1_7_img(String recom_1_7_img) { this.recom_1_7_img = recom_1_7_img; }

	public String getrecom_1_8_img() { return recom_1_8_img; }
	public void setrecom_1_8_img(String recom_1_8_img) { this.recom_1_8_img = recom_1_8_img; }

	public String getrecom_1_9_img() { return recom_1_9_img; }
	public void setrecom_1_9_img(String recom_1_9_img) { this.recom_1_9_img = recom_1_9_img; }

	public String getrecom_1_10_img() { return recom_1_10_img; }
	public void setrecom_1_10_img(String recom_1_10_img) { this.recom_1_10_img = recom_1_10_img; }

	public String getrecom_2_prod_comment() { return recom_2_prod_comment; }
	public void setrecom_2_prod_comment(String recom_2_prod_comment) { this.recom_2_prod_comment = recom_2_prod_comment; }

	public String getrecom_2_2_img() { return recom_2_2_img; }
	public void setrecom_2_2_img(String recom_2_2_img) { this.recom_2_2_img = recom_2_2_img; }

	public String getrecom_2_3_img() { return recom_2_3_img; }
	public void setrecom_2_3_img(String recom_2_3_img) { this.recom_2_3_img = recom_2_3_img; }

	public String getrecom_2_4_img() { return recom_2_4_img; }
	public void setrecom_2_4_img(String recom_2_4_img) { this.recom_2_4_img = recom_2_4_img; }

	public String getrecom_2_5_img() { return recom_2_5_img; }
	public void setrecom_2_5_img(String recom_2_5_img) { this.recom_2_5_img = recom_2_5_img; }

	public String getrecom_2_6_img() { return recom_2_6_img; }
	public void setrecom_2_6_img(String recom_2_6_img) { this.recom_2_6_img = recom_2_6_img; }

	public String getrecom_2_7_img() { return recom_2_7_img; }
	public void setrecom_2_7_img(String recom_2_7_img) { this.recom_2_7_img = recom_2_7_img; }

	public String getrecom_2_8_img() { return recom_2_8_img; }
	public void setrecom_2_8_img(String recom_2_8_img) { this.recom_2_8_img = recom_2_8_img; }

	public String getrecom_2_9_img() { return recom_2_9_img; }
	public void setrecom_2_9_img(String recom_2_9_img) { this.recom_2_9_img = recom_2_9_img; }

	public String getrecom_2_10_img() { return recom_2_10_img; }
	public void setrecom_2_10_img(String recom_2_10_img) { this.recom_2_10_img = recom_2_10_img; }

	public String getrecom_3_prod_comment() { return recom_3_prod_comment; }
	public void setrecom_3_prod_comment(String recom_3_prod_comment) { this.recom_3_prod_comment = recom_3_prod_comment; }

	public String getrecom_3_2_img() { return recom_3_2_img; }
	public void setrecom_3_2_img(String recom_3_2_img) { this.recom_3_2_img = recom_3_2_img; }

	public String getrecom_3_3_img() { return recom_3_3_img; }
	public void setrecom_3_3_img(String recom_3_3_img) { this.recom_3_3_img = recom_3_3_img; }

	public String getrecom_3_4_img() { return recom_3_4_img; }
	public void setrecom_3_4_img(String recom_3_4_img) { this.recom_3_4_img = recom_3_4_img; }

	public String getrecom_3_5_img() { return recom_3_5_img; }
	public void setrecom_3_5_img(String recom_3_5_img) { this.recom_3_5_img = recom_3_5_img; }

	public String getrecom_3_6_img() { return recom_3_6_img; }
	public void setrecom_3_6_img(String recom_3_6_img) { this.recom_3_6_img = recom_3_6_img; }

	public String getrecom_3_7_img() { return recom_3_7_img; }
	public void setrecom_3_7_img(String recom_3_7_img) { this.recom_3_7_img = recom_3_7_img; }

	public String getrecom_3_8_img() { return recom_3_8_img; }
	public void setrecom_3_8_img(String recom_3_8_img) { this.recom_3_8_img = recom_3_8_img; }

	public String getrecom_3_9_img() { return recom_3_9_img; }
	public void setrecom_3_9_img(String recom_3_9_img) { this.recom_3_9_img = recom_3_9_img; }

	public String getrecom_3_10_img() { return recom_3_10_img; }
	public void setrecom_3_10_img(String recom_3_10_img) { this.recom_3_10_img = recom_3_10_img; }

	public String getrecom_4_prod_comment() { return recom_4_prod_comment; }
	public void setrecom_4_prod_comment(String recom_4_prod_comment) { this.recom_4_prod_comment = recom_4_prod_comment; }

	public String getrecom_4_2_img() { return recom_4_2_img; }
	public void setrecom_4_2_img(String recom_4_2_img) { this.recom_4_2_img = recom_4_2_img; }

	public String getrecom_4_3_img() { return recom_4_3_img; }
	public void setrecom_4_3_img(String recom_4_3_img) { this.recom_4_3_img = recom_4_3_img; }

	public String getrecom_4_4_img() { return recom_4_4_img; }
	public void setrecom_4_4_img(String recom_4_4_img) { this.recom_4_4_img = recom_4_4_img; }

	public String getrecom_4_5_img() { return recom_4_5_img; }
	public void setrecom_4_5_img(String recom_4_5_img) { this.recom_4_5_img = recom_4_5_img; }

	public String getrecom_4_6_img() { return recom_4_6_img; }
	public void setrecom_4_6_img(String recom_4_6_img) { this.recom_4_6_img = recom_4_6_img; }

	public String getrecom_4_7_img() { return recom_4_7_img; }
	public void setrecom_4_7_img(String recom_4_7_img) { this.recom_4_7_img = recom_4_7_img; }

	public String getrecom_4_8_img() { return recom_4_8_img; }
	public void setrecom_4_8_img(String recom_4_8_img) { this.recom_4_8_img = recom_4_8_img; }

	public String getrecom_4_9_img() { return recom_4_9_img; }
	public void setrecom_4_9_img(String recom_4_9_img) { this.recom_4_9_img = recom_4_9_img; }

	public String getrecom_4_10_img() { return recom_4_10_img; }
	public void setrecom_4_10_img(String recom_4_10_img) { this.recom_4_10_img = recom_4_10_img; }

	public String getrecom_5_prod_comment() { return recom_5_prod_comment; }
	public void setrecom_5_prod_comment(String recom_5_prod_comment) { this.recom_5_prod_comment = recom_5_prod_comment; }

	public String getrecom_5_2_img() { return recom_5_2_img; }
	public void setrecom_5_2_img(String recom_5_2_img) { this.recom_5_2_img = recom_5_2_img; }

	public String getrecom_5_3_img() { return recom_5_3_img; }
	public void setrecom_5_3_img(String recom_5_3_img) { this.recom_5_3_img = recom_5_3_img; }

	public String getrecom_5_4_img() { return recom_5_4_img; }
	public void setrecom_5_4_img(String recom_5_4_img) { this.recom_5_4_img = recom_5_4_img; }

	public String getrecom_5_5_img() { return recom_5_5_img; }
	public void setrecom_5_5_img(String recom_5_5_img) { this.recom_5_5_img = recom_5_5_img; }

	public String getrecom_5_6_img() { return recom_5_6_img; }
	public void setrecom_5_6_img(String recom_5_6_img) { this.recom_5_6_img = recom_5_6_img; }

	public String getrecom_5_7_img() { return recom_5_7_img; }
	public void setrecom_5_7_img(String recom_5_7_img) { this.recom_5_7_img = recom_5_7_img; }

	public String getrecom_5_8_img() { return recom_5_8_img; }
	public void setrecom_5_8_img(String recom_5_8_img) { this.recom_5_8_img = recom_5_8_img; }

	public String getrecom_5_9_img() { return recom_5_9_img; }
	public void setrecom_5_9_img(String recom_5_9_img) { this.recom_5_9_img = recom_5_9_img; }

	public String getrecom_5_10_img() { return recom_5_10_img; }
	public void setrecom_5_10_img(String recom_5_10_img) { this.recom_5_10_img = recom_5_10_img; }

	public String getrecom_6_prod_comment() { return recom_6_prod_comment; }
	public void setrecom_6_prod_comment(String recom_6_prod_comment) { this.recom_6_prod_comment = recom_6_prod_comment; }

	public String getrecom_6_2_img() { return recom_6_2_img; }
	public void setrecom_6_2_img(String recom_6_2_img) { this.recom_6_2_img = recom_6_2_img; }

	public String getrecom_6_3_img() { return recom_6_3_img; }
	public void setrecom_6_3_img(String recom_6_3_img) { this.recom_6_3_img = recom_6_3_img; }

	public String getrecom_6_4_img() { return recom_6_4_img; }
	public void setrecom_6_4_img(String recom_6_4_img) { this.recom_6_4_img = recom_6_4_img; }

	public String getrecom_6_5_img() { return recom_6_5_img; }
	public void setrecom_6_5_img(String recom_6_5_img) { this.recom_6_5_img = recom_6_5_img; }

	public String getrecom_6_6_img() { return recom_6_6_img; }
	public void setrecom_6_6_img(String recom_6_6_img) { this.recom_6_6_img = recom_6_6_img; }

	public String getrecom_6_7_img() { return recom_6_7_img; }
	public void setrecom_6_7_img(String recom_6_7_img) { this.recom_6_7_img = recom_6_7_img; }

	public String getrecom_6_8_img() { return recom_6_8_img; }
	public void setrecom_6_8_img(String recom_6_8_img) { this.recom_6_8_img = recom_6_8_img; }

	public String getrecom_6_9_img() { return recom_6_9_img; }
	public void setrecom_6_9_img(String recom_6_9_img) { this.recom_6_9_img = recom_6_9_img; }

	public String getrecom_6_10_img() { return recom_6_10_img; }
	public void setrecom_6_10_img(String recom_6_10_img) { this.recom_6_10_img = recom_6_10_img; }

	public String getrecom_7_prod_comment() { return recom_7_prod_comment; }
	public void setrecom_7_prod_comment(String recom_7_prod_comment) { this.recom_7_prod_comment = recom_7_prod_comment; }

	public String getrecom_7_2_img() { return recom_7_2_img; }
	public void setrecom_7_2_img(String recom_7_2_img) { this.recom_7_2_img = recom_7_2_img; }

	public String getrecom_7_3_img() { return recom_7_3_img; }
	public void setrecom_7_3_img(String recom_7_3_img) { this.recom_7_3_img = recom_7_3_img; }

	public String getrecom_7_4_img() { return recom_7_4_img; }
	public void setrecom_7_4_img(String recom_7_4_img) { this.recom_7_4_img = recom_7_4_img; }

	public String getrecom_7_5_img() { return recom_7_5_img; }
	public void setrecom_7_5_img(String recom_7_5_img) { this.recom_7_5_img = recom_7_5_img; }

	public String getrecom_7_6_img() { return recom_7_6_img; }
	public void setrecom_7_6_img(String recom_7_6_img) { this.recom_7_6_img = recom_7_6_img; }

	public String getrecom_7_7_img() { return recom_7_7_img; }
	public void setrecom_7_7_img(String recom_7_7_img) { this.recom_7_7_img = recom_7_7_img; }

	public String getrecom_7_8_img() { return recom_7_8_img; }
	public void setrecom_7_8_img(String recom_7_8_img) { this.recom_7_8_img = recom_7_8_img; }

	public String getrecom_7_9_img() { return recom_7_9_img; }
	public void setrecom_7_9_img(String recom_7_9_img) { this.recom_7_9_img = recom_7_9_img; }

	public String getrecom_7_10_img() { return recom_7_10_img; }
	public void setrecom_7_10_img(String recom_7_10_img) { this.recom_7_10_img = recom_7_10_img; }

	public String getrecom_8_prod_comment() { return recom_8_prod_comment; }
	public void setrecom_8_prod_comment(String recom_8_prod_comment) { this.recom_8_prod_comment = recom_8_prod_comment; }

	public String getrecom_8_2_img() { return recom_8_2_img; }
	public void setrecom_8_2_img(String recom_8_2_img) { this.recom_8_2_img = recom_8_2_img; }

	public String getrecom_8_3_img() { return recom_8_3_img; }
	public void setrecom_8_3_img(String recom_8_3_img) { this.recom_8_3_img = recom_8_3_img; }

	public String getrecom_8_4_img() { return recom_8_4_img; }
	public void setrecom_8_4_img(String recom_8_4_img) { this.recom_8_4_img = recom_8_4_img; }

	public String getrecom_8_5_img() { return recom_8_5_img; }
	public void setrecom_8_5_img(String recom_8_5_img) { this.recom_8_5_img = recom_8_5_img; }

	public String getrecom_8_6_img() { return recom_8_6_img; }
	public void setrecom_8_6_img(String recom_8_6_img) { this.recom_8_6_img = recom_8_6_img; }

	public String getrecom_8_7_img() { return recom_8_7_img; }
	public void setrecom_8_7_img(String recom_8_7_img) { this.recom_8_7_img = recom_8_7_img; }

	public String getrecom_8_8_img() { return recom_8_8_img; }
	public void setrecom_8_8_img(String recom_8_8_img) { this.recom_8_8_img = recom_8_8_img; }

	public String getrecom_8_9_img() { return recom_8_9_img; }
	public void setrecom_8_9_img(String recom_8_9_img) { this.recom_8_9_img = recom_8_9_img; }

	public String getrecom_8_10_img() { return recom_8_10_img; }
	public void setrecom_8_10_img(String recom_8_10_img) { this.recom_8_10_img = recom_8_10_img; }

	public String getrecom_9_prod_comment() { return recom_9_prod_comment; }
	public void setrecom_9_prod_comment(String recom_9_prod_comment) { this.recom_9_prod_comment = recom_9_prod_comment; }

	public String getrecom_9_2_img() { return recom_9_2_img; }
	public void setrecom_9_2_img(String recom_9_2_img) { this.recom_9_2_img = recom_9_2_img; }

	public String getrecom_9_3_img() { return recom_9_3_img; }
	public void setrecom_9_3_img(String recom_9_3_img) { this.recom_9_3_img = recom_9_3_img; }

	public String getrecom_9_4_img() { return recom_9_4_img; }
	public void setrecom_9_4_img(String recom_9_4_img) { this.recom_9_4_img = recom_9_4_img; }

	public String getrecom_9_5_img() { return recom_9_5_img; }
	public void setrecom_9_5_img(String recom_9_5_img) { this.recom_9_5_img = recom_9_5_img; }

	public String getrecom_9_6_img() { return recom_9_6_img; }
	public void setrecom_9_6_img(String recom_9_6_img) { this.recom_9_6_img = recom_9_6_img; }

	public String getrecom_9_7_img() { return recom_9_7_img; }
	public void setrecom_9_7_img(String recom_9_7_img) { this.recom_9_7_img = recom_9_7_img; }

	public String getrecom_9_8_img() { return recom_9_8_img; }
	public void setrecom_9_8_img(String recom_9_8_img) { this.recom_9_8_img = recom_9_8_img; }

	public String getrecom_9_9_img() { return recom_9_9_img; }
	public void setrecom_9_9_img(String recom_9_9_img) { this.recom_9_9_img = recom_9_9_img; }

	public String getrecom_9_10_img() { return recom_9_10_img; }
	public void setrecom_9_10_img(String recom_9_10_img) { this.recom_9_10_img = recom_9_10_img; }

	public String getrecom_10_prod_comment() { return recom_10_prod_comment; }
	public void setrecom_10_prod_comment(String recom_10_prod_comment) { this.recom_10_prod_comment = recom_10_prod_comment; }

	public String getrecom_10_2_img() { return recom_10_2_img; }
	public void setrecom_10_2_img(String recom_10_2_img) { this.recom_10_2_img = recom_10_2_img; }

	public String getrecom_10_3_img() { return recom_10_3_img; }
	public void setrecom_10_3_img(String recom_10_3_img) { this.recom_10_3_img = recom_10_3_img; }

	public String getrecom_10_4_img() { return recom_10_4_img; }
	public void setrecom_10_4_img(String recom_10_4_img) { this.recom_10_4_img = recom_10_4_img; }

	public String getrecom_10_5_img() { return recom_10_5_img; }
	public void setrecom_10_5_img(String recom_10_5_img) { this.recom_10_5_img = recom_10_5_img; }

	public String getrecom_10_6_img() { return recom_10_6_img; }
	public void setrecom_10_6_img(String recom_10_6_img) { this.recom_10_6_img = recom_10_6_img; }

	public String getrecom_10_7_img() { return recom_10_7_img; }
	public void setrecom_10_7_img(String recom_10_7_img) { this.recom_10_7_img = recom_10_7_img; }

	public String getrecom_10_8_img() { return recom_10_8_img; }
	public void setrecom_10_8_img(String recom_10_8_img) { this.recom_10_8_img = recom_10_8_img; }

	public String getrecom_10_9_img() { return recom_10_9_img; }
	public void setrecom_10_9_img(String recom_10_9_img) { this.recom_10_9_img = recom_10_9_img; }

	public String getrecom_10_10_img() { return recom_10_10_img; }
	public void setrecom_10_10_img(String recom_10_10_img) { this.recom_10_10_img = recom_10_10_img; }
	
	public String getrecom_1_store_category() { return recom_1_store_category; }
	public void setrecom_1_store_category(String recom_1_store_category) { this.recom_1_store_category = recom_1_store_category; }

	public String getrecom_1_prod_category() { return recom_1_prod_category; }
	public void setrecom_1_prod_category(String recom_1_prod_category) { this.recom_1_prod_category = recom_1_prod_category; }

	public String getrecom_2_store_category() { return recom_2_store_category; }
	public void setrecom_2_store_category(String recom_2_store_category) { this.recom_2_store_category = recom_2_store_category; }

	public String getrecom_2_prod_category() { return recom_2_prod_category; }
	public void setrecom_2_prod_category(String recom_2_prod_category) { this.recom_2_prod_category = recom_2_prod_category; }

	public String getrecom_3_store_category() { return recom_3_store_category; }
	public void setrecom_3_store_category(String recom_3_store_category) { this.recom_3_store_category = recom_3_store_category; }

	public String getrecom_3_prod_category() { return recom_3_prod_category; }
	public void setrecom_3_prod_category(String recom_3_prod_category) { this.recom_3_prod_category = recom_3_prod_category; }

	public String getrecom_4_store_category() { return recom_4_store_category; }
	public void setrecom_4_store_category(String recom_4_store_category) { this.recom_4_store_category = recom_4_store_category; }

	public String getrecom_4_prod_category() { return recom_4_prod_category; }
	public void setrecom_4_prod_category(String recom_4_prod_category) { this.recom_4_prod_category = recom_4_prod_category; }

	public String getrecom_5_store_category() { return recom_5_store_category; }
	public void setrecom_5_store_category(String recom_5_store_category) { this.recom_5_store_category = recom_5_store_category; }

	public String getrecom_5_prod_category() { return recom_5_prod_category; }
	public void setrecom_5_prod_category(String recom_5_prod_category) { this.recom_5_prod_category = recom_5_prod_category; }

	public String getrecom_6_store_category() { return recom_6_store_category; }
	public void setrecom_6_store_category(String recom_6_store_category) { this.recom_6_store_category = recom_6_store_category; }

	public String getrecom_6_prod_category() { return recom_6_prod_category; }
	public void setrecom_6_prod_category(String recom_6_prod_category) { this.recom_6_prod_category = recom_6_prod_category; }

	public String getrecom_7_store_category() { return recom_7_store_category; }
	public void setrecom_7_store_category(String recom_7_store_category) { this.recom_7_store_category = recom_7_store_category; }

	public String getrecom_7_prod_category() { return recom_7_prod_category; }
	public void setrecom_7_prod_category(String recom_7_prod_category) { this.recom_7_prod_category = recom_7_prod_category; }

	public String getrecom_8_store_category() { return recom_8_store_category; }
	public void setrecom_8_store_category(String recom_8_store_category) { this.recom_8_store_category = recom_8_store_category; }

	public String getrecom_8_prod_category() { return recom_8_prod_category; }
	public void setrecom_8_prod_category(String recom_8_prod_category) { this.recom_8_prod_category = recom_8_prod_category; }

	public String getrecom_9_store_category() { return recom_9_store_category; }
	public void setrecom_9_store_category(String recom_9_store_category) { this.recom_9_store_category = recom_9_store_category; }

	public String getrecom_9_prod_category() { return recom_9_prod_category; }
	public void setrecom_9_prod_category(String recom_9_prod_category) { this.recom_9_prod_category = recom_9_prod_category; }

	public String getrecom_10_store_category() { return recom_10_store_category; }
	public void setrecom_10_store_category(String recom_10_store_category) { this.recom_10_store_category = recom_10_store_category; }

	public String getrecom_10_prod_category() { return recom_10_prod_category; }
	public void setrecom_10_prod_category(String recom_10_prod_category) { this.recom_10_prod_category = recom_10_prod_category; }

	public String getrecom_1_pick_cnt() { return recom_1_pick_cnt; }
	public void setrecom_1_pick_cnt(String recom_1_pick_cnt) { this.recom_1_pick_cnt = recom_1_pick_cnt; }

	public String getrecom_2_pick_cnt() { return recom_2_pick_cnt; }
	public void setrecom_2_pick_cnt(String recom_2_pick_cnt) { this.recom_2_pick_cnt = recom_2_pick_cnt; }

	public String getrecom_3_pick_cnt() { return recom_3_pick_cnt; }
	public void setrecom_3_pick_cnt(String recom_3_pick_cnt) { this.recom_3_pick_cnt = recom_3_pick_cnt; }

	public String getrecom_4_pick_cnt() { return recom_4_pick_cnt; }
	public void setrecom_4_pick_cnt(String recom_4_pick_cnt) { this.recom_4_pick_cnt = recom_4_pick_cnt; }

	public String getrecom_5_pick_cnt() { return recom_5_pick_cnt; }
	public void setrecom_5_pick_cnt(String recom_5_pick_cnt) { this.recom_5_pick_cnt = recom_5_pick_cnt; }

	public String getrecom_6_pick_cnt() { return recom_6_pick_cnt; }
	public void setrecom_6_pick_cnt(String recom_6_pick_cnt) { this.recom_6_pick_cnt = recom_6_pick_cnt; }

	public String getrecom_7_pick_cnt() { return recom_7_pick_cnt; }
	public void setrecom_7_pick_cnt(String recom_7_pick_cnt) { this.recom_7_pick_cnt = recom_7_pick_cnt; }

	public String getrecom_8_pick_cnt() { return recom_8_pick_cnt; }
	public void setrecom_8_pick_cnt(String recom_8_pick_cnt) { this.recom_8_pick_cnt = recom_8_pick_cnt; }

	public String getrecom_9_pick_cnt() { return recom_9_pick_cnt; }
	public void setrecom_9_pick_cnt(String recom_9_pick_cnt) { this.recom_9_pick_cnt = recom_9_pick_cnt; }

	public String getrecom_10_pick_cnt() { return recom_10_pick_cnt; }
	public void setrecom_10_pick_cnt(String recom_10_pick_cnt) { this.recom_10_pick_cnt = recom_10_pick_cnt; }
	
	public String getrecom_1_store_nm() { return recom_1_store_nm; }
	public void setrecom_1_store_nm(String recom_1_store_nm) { this.recom_1_store_nm = recom_1_store_nm; }

	public String getrecom_2_store_nm() { return recom_2_store_nm; }
	public void setrecom_2_store_nm(String recom_2_store_nm) { this.recom_2_store_nm = recom_2_store_nm; }

	public String getrecom_3_store_nm() { return recom_3_store_nm; }
	public void setrecom_3_store_nm(String recom_3_store_nm) { this.recom_3_store_nm = recom_3_store_nm; }

	public String getrecom_4_store_nm() { return recom_4_store_nm; }
	public void setrecom_4_store_nm(String recom_4_store_nm) { this.recom_4_store_nm = recom_4_store_nm; }

	public String getrecom_5_store_nm() { return recom_5_store_nm; }
	public void setrecom_5_store_nm(String recom_5_store_nm) { this.recom_5_store_nm = recom_5_store_nm; }

	public String getrecom_6_store_nm() { return recom_6_store_nm; }
	public void setrecom_6_store_nm(String recom_6_store_nm) { this.recom_6_store_nm = recom_6_store_nm; }

	public String getrecom_7_store_nm() { return recom_7_store_nm; }
	public void setrecom_7_store_nm(String recom_7_store_nm) { this.recom_7_store_nm = recom_7_store_nm; }

	public String getrecom_8_store_nm() { return recom_8_store_nm; }
	public void setrecom_8_store_nm(String recom_8_store_nm) { this.recom_8_store_nm = recom_8_store_nm; }

	public String getrecom_9_store_nm() { return recom_9_store_nm; }
	public void setrecom_9_store_nm(String recom_9_store_nm) { this.recom_9_store_nm = recom_9_store_nm; }

	public String getrecom_10_store_nm() { return recom_10_store_nm; }
	public void setrecom_10_store_nm(String recom_10_store_nm) { this.recom_10_store_nm = recom_10_store_nm; }

	/* 방정보 */
	public String getreserve_st_dt() { return reserve_st_dt; }
	public void setreserve_st_dt(String reserve_st_dt) { this.reserve_st_dt = reserve_st_dt; }
	
	public String getreserve_ed_dt() { return reserve_ed_dt; }
	public void setreserve_ed_dt(String reserve_ed_dt) { this.reserve_ed_dt = reserve_ed_dt; }
	
	public String getprod_room_seq() { return prod_room_seq; }
	public void setprod_room_seq(String prod_room_seq) { this.prod_room_seq = prod_room_seq; }

	public String getprod_room_use_st() { return prod_room_use_st; }
	public void setprod_room_use_st(String prod_room_use_st) { this.prod_room_use_st = prod_room_use_st; }

	public String getprod_room_nm() { return prod_room_nm; }
	public void setprod_room_nm(String prod_room_nm) { this.prod_room_nm = prod_room_nm; }

	public String getprod_room_orderby() { return prod_room_orderby; }
	public void setprod_room_orderby(String prod_room_orderby) { this.prod_room_orderby = prod_room_orderby; }

	public String getprod_room_content_1() { return prod_room_content_1; }
	public void setprod_room_content_1(String prod_room_content_1) { this.prod_room_content_1 = prod_room_content_1; }

	public String getprod_room_content_2() { return prod_room_content_2; }
	public void setprod_room_content_2(String prod_room_content_2) { this.prod_room_content_2 = prod_room_content_2; }

	public String getprod_room_img_1() { return prod_room_img_1; }
	public void setprod_room_img_1(String prod_room_img_1) { this.prod_room_img_1 = prod_room_img_1; }

	public String getprod_room_img_2() { return prod_room_img_2; }
	public void setprod_room_img_2(String prod_room_img_2) { this.prod_room_img_2 = prod_room_img_2; }

	public String getprod_room_img_3() { return prod_room_img_3; }
	public void setprod_room_img_3(String prod_room_img_3) { this.prod_room_img_3 = prod_room_img_3; }

	public String getprod_room_img_4() { return prod_room_img_4; }
	public void setprod_room_img_4(String prod_room_img_4) { this.prod_room_img_4 = prod_room_img_4; }

	public String getprod_room_img_5() { return prod_room_img_5; }
	public void setprod_room_img_5(String prod_room_img_5) { this.prod_room_img_5 = prod_room_img_5; }

	public String getprod_room_img_6() { return prod_room_img_6; }
	public void setprod_room_img_6(String prod_room_img_6) { this.prod_room_img_6 = prod_room_img_6; }

	public String getprod_room_img_7() { return prod_room_img_7; }
	public void setprod_room_img_7(String prod_room_img_7) { this.prod_room_img_7 = prod_room_img_7; }

	public String getprod_room_img_8() { return prod_room_img_8; }
	public void setprod_room_img_8(String prod_room_img_8) { this.prod_room_img_8 = prod_room_img_8; }

	public String getprod_room_img_9() { return prod_room_img_9; }
	public void setprod_room_img_9(String prod_room_img_9) { this.prod_room_img_9 = prod_room_img_9; }

	public String getprod_room_img_10() { return prod_room_img_10; }
	public void setprod_room_img_10(String prod_room_img_10) { this.prod_room_img_10 = prod_room_img_10; }

	public String getprod_room_movie() { return prod_room_movie; }
	public void setprod_room_movie(String prod_room_movie) { this.prod_room_movie = prod_room_movie; }

	public String getprod_room_default_cnt() { return prod_room_default_cnt; }
	public void setprod_room_default_cnt(String prod_room_default_cnt) { this.prod_room_default_cnt = prod_room_default_cnt; }

	public String getprod_room_max_cnt() { return prod_room_max_cnt; }
	public void setprod_room_max_cnt(String prod_room_max_cnt) { this.prod_room_max_cnt = prod_room_max_cnt; }

	public String getprod_room_adult_price() { return prod_room_adult_price; }
	public void setprod_room_adult_price(String prod_room_adult_price) { this.prod_room_adult_price = prod_room_adult_price; }

	public String getprod_room_young_price() { return prod_room_young_price; }
	public void setprod_room_young_price(String prod_room_young_price) { this.prod_room_young_price = prod_room_young_price; }

	public String getprod_room_normal_normal_price() { return prod_room_normal_normal_price; }
	public void setprod_room_normal_normal_price(String prod_room_normal_normal_price) { this.prod_room_normal_normal_price = prod_room_normal_normal_price; }

	public String getprod_room_normal_normal_sale_price() { return prod_room_normal_normal_sale_price; }
	public void setprod_room_normal_normal_sale_price(String prod_room_normal_normal_sale_price) { this.prod_room_normal_normal_sale_price = prod_room_normal_normal_sale_price; }

	public String getprod_room_normal_holiday_price() { return prod_room_normal_holiday_price; }
	public void setprod_room_normal_holiday_price(String prod_room_normal_holiday_price) { this.prod_room_normal_holiday_price = prod_room_normal_holiday_price; }

	public String getprod_room_normal_holiday_sale_price() { return prod_room_normal_holiday_sale_price; }
	public void setprod_room_normal_holiday_sale_price(String prod_room_normal_holiday_sale_price) { this.prod_room_normal_holiday_sale_price = prod_room_normal_holiday_sale_price; }

	public String getprod_room_ready_normal_price() { return prod_room_ready_normal_price; }
	public void setprod_room_ready_normal_price(String prod_room_ready_normal_price) { this.prod_room_ready_normal_price = prod_room_ready_normal_price; }

	public String getprod_room_ready_normal_sale_price() { return prod_room_ready_normal_sale_price; }
	public void setprod_room_ready_normal_sale_price(String prod_room_ready_normal_sale_price) { this.prod_room_ready_normal_sale_price = prod_room_ready_normal_sale_price; }

	public String getprod_room_ready_holiday_price() { return prod_room_ready_holiday_price; }
	public void setprod_room_ready_holiday_price(String prod_room_ready_holiday_price) { this.prod_room_ready_holiday_price = prod_room_ready_holiday_price; }

	public String getprod_room_ready_holiday_sale_price() { return prod_room_ready_holiday_sale_price; }
	public void setprod_room_ready_holiday_sale_price(String prod_room_ready_holiday_sale_price) { this.prod_room_ready_holiday_sale_price = prod_room_ready_holiday_sale_price; }
	
	public String getprod_room_ready2_normal_price() { return prod_room_ready2_normal_price; }
	public void setprod_room_ready2_normal_price(String prod_room_ready2_normal_price) { this.prod_room_ready2_normal_price = prod_room_ready2_normal_price; }

	public String getprod_room_ready2_normal_sale_price() { return prod_room_ready2_normal_sale_price; }
	public void setprod_room_ready2_normal_sale_price(String prod_room_ready2_normal_sale_price) { this.prod_room_ready2_normal_sale_price = prod_room_ready2_normal_sale_price; }

	public String getprod_room_ready2_holiday_price() { return prod_room_ready2_holiday_price; }
	public void setprod_room_ready2_holiday_price(String prod_room_ready2_holiday_price) { this.prod_room_ready2_holiday_price = prod_room_ready2_holiday_price; }

	public String getprod_room_ready2_holiday_sale_price() { return prod_room_ready2_holiday_sale_price; }
	public void setprod_room_ready2_holiday_sale_price(String prod_room_ready2_holiday_sale_price) { this.prod_room_ready2_holiday_sale_price = prod_room_ready2_holiday_sale_price; }

	public String getprod_room_busy_normal_price() { return prod_room_busy_normal_price; }
	public void setprod_room_busy_normal_price(String prod_room_busy_normal_price) { this.prod_room_busy_normal_price = prod_room_busy_normal_price; }

	public String getprod_room_busy_normal_sale_price() { return prod_room_busy_normal_sale_price; }
	public void setprod_room_busy_normal_sale_price(String prod_room_busy_normal_sale_price) { this.prod_room_busy_normal_sale_price = prod_room_busy_normal_sale_price; }

	public String getprod_room_busy_holiday_price() { return prod_room_busy_holiday_price; }
	public void setprod_room_busy_holiday_price(String prod_room_busy_holiday_price) { this.prod_room_busy_holiday_price = prod_room_busy_holiday_price; }

	public String getprod_room_busy_holiday_sale_price() { return prod_room_busy_holiday_sale_price; }
	public void setprod_room_busy_holiday_sale_price(String prod_room_busy_holiday_sale_price) { this.prod_room_busy_holiday_sale_price = prod_room_busy_holiday_sale_price; }
	
	public String getcart_seq() { return cart_seq; }
	public void setcart_seq(String cart_seq) { this.cart_seq = cart_seq; }
	
	public String getopt_seqs() { return opt_seqs; }
	public void setopt_seqs(String opt_seqs) { this.opt_seqs = opt_seqs; }

	public String getopt_nms() { return opt_nms; }
	public void setopt_nms(String opt_nms) { this.opt_nms = opt_nms; }

	public String getopt_prices() { return opt_prices; }
	public void setopt_prices(String opt_prices) { this.opt_prices = opt_prices; }

	public String getopt_cnts() { return opt_cnts; }
	public void setopt_cnts(String opt_cnts) { this.opt_cnts = opt_cnts; }
	
	public String getreserve_user_nm() { return reserve_user_nm; }
	public void setreserve_user_nm(String reserve_user_nm) { this.reserve_user_nm = reserve_user_nm; }

	public String getreserve_user_call() { return reserve_user_call; }
	public void setreserve_user_call(String reserve_user_call) { this.reserve_user_call = reserve_user_call; }

	public String gettotal_price() { return total_price; }
	public void settotal_price(String total_price) { this.total_price = total_price; }

	public String getreserve_time() { return reserve_time; }
	public void setreserve_time(String reserve_time) { this.reserve_time = reserve_time; }
	
	public String getreserve_st_dt_year() { return reserve_st_dt_year; }
	public void setreserve_st_dt_year(String reserve_st_dt_year) { this.reserve_st_dt_year = reserve_st_dt_year; }

	public String getreserve_st_dt_month() { return reserve_st_dt_month; }
	public void setreserve_st_dt_month(String reserve_st_dt_month) { this.reserve_st_dt_month = reserve_st_dt_month; }

	public String getreserve_st_dt_date() { return reserve_st_dt_date; }
	public void setreserve_st_dt_date(String reserve_st_dt_date) { this.reserve_st_dt_date = reserve_st_dt_date; }

	public String getreserve_ed_dt_year() { return reserve_ed_dt_year; }
	public void setreserve_ed_dt_year(String reserve_ed_dt_year) { this.reserve_ed_dt_year = reserve_ed_dt_year; }

	public String getreserve_ed_dt_month() { return reserve_ed_dt_month; }
	public void setreserve_ed_dt_month(String reserve_ed_dt_month) { this.reserve_ed_dt_month = reserve_ed_dt_month; }

	public String getreserve_ed_dt_date() { return reserve_ed_dt_date; }
	public void setreserve_ed_dt_date(String reserve_ed_dt_date) { this.reserve_ed_dt_date = reserve_ed_dt_date; }

	public String getreserve_time_hour() { return reserve_time_hour; }
	public void setreserve_time_hour(String reserve_time_hour) { this.reserve_time_hour = reserve_time_hour; }

	public String getreserve_time_minute() { return reserve_time_minute; }
	public void setreserve_time_minute(String reserve_time_minute) { this.reserve_time_minute = reserve_time_minute; }
	
	public String getorder_seq() { return order_seq; }
	public void setorder_seq(String order_seq) { this.order_seq = order_seq; }
	
	public String getorder_id() { return order_id; }
	public void setorder_id(String order_id) { this.order_id = order_id; }
	
	public String getorder_user_id() { return order_user_id; }
	public void setorder_user_id(String order_user_id) { this.order_user_id = order_user_id; }
	
	public String getorder_user_nm() { return order_user_nm; }
	public void setorder_user_nm(String order_user_nm) { this.order_user_nm = order_user_nm; }
	
	public String getorder_hp() { return order_hp; }
	public void setorder_hp(String order_hp) { this.order_hp = order_hp; }
	
	public String getorder_tel() { return order_tel; }
	public void setorder_tel(String order_tel) { this.order_tel = order_tel; }
	
	public String getorder_email() { return order_email; }
	public void setorder_email(String order_email) { this.order_email = order_email; }
	
	public String getorder_addr_id() { return order_addr_id; }
	public void setorder_addr_id(String order_addr_id) { this.order_addr_id = order_addr_id; }
	
	public String getorder_zip() { return order_zip; }
	public void setorder_zip(String order_zip) { this.order_zip = order_zip; }
	
	public String getorder_addr1() { return order_addr1; }
	public void setorder_addr1(String order_addr1) { this.order_addr1 = order_addr1; }
	
	public String getorder_addr2() { return order_addr2; }
	public void setorder_addr2(String order_addr2) { this.order_addr2 = order_addr2; }
	
	public String getorder_total_price() { return order_total_price; }
	public void setorder_total_price(String order_total_price) { this.order_total_price = order_total_price; }
	
	public String getorder_use_coupon_id() { return order_use_coupon_id; }
	public void setorder_use_coupon_id(String order_use_coupon_id) { this.order_use_coupon_id = order_use_coupon_id; }
	
	public String getorder_coupon_price() { return order_coupon_price; }
	public void setorder_coupon_price(String order_coupon_price) { this.order_coupon_price = order_coupon_price; }
	
	public String getorder_use_mileage() { return order_use_mileage; }
	public void setorder_use_mileage(String order_use_mileage) { this.order_use_mileage = order_use_mileage; }
	
	public String getorder_save_mileage() { return order_save_mileage; }
	public void setorder_save_mileage(String order_save_mileage) { this.order_save_mileage = order_save_mileage; }
	
	public String getorder_total_delivery_price() { return order_total_delivery_price; }
	public void setorder_total_delivery_price(String order_total_delivery_price) { this.order_total_delivery_price = order_total_delivery_price; }
	
	public String getorder_delivery_price_st() { return order_delivery_price_st; }
	public void setorder_delivery_price_st(String order_delivery_price_st) { this.order_delivery_price_st = order_delivery_price_st; }
	
	public String getorder_pay_st() { return order_pay_st; }
	public void setorder_pay_st(String order_pay_st) { this.order_pay_st = order_pay_st; }
	
	public String getorder_pay_cd() { return order_pay_cd; }
	public void setorder_pay_cd(String order_pay_cd) { this.order_pay_cd = order_pay_cd; }
	
	public String getorder_pay_vbank_nm() { return order_pay_vbank_nm; }
	public void setorder_pay_vbank_nm(String order_pay_vbank_nm) { this.order_pay_vbank_nm = order_pay_vbank_nm; }
	
	public String getorder_pay_vbank_number() { return order_pay_vbank_number; }
	public void setorder_pay_vbank_number(String order_pay_vbank_number) { this.order_pay_vbank_number = order_pay_vbank_number; }
	
	public String getorder_pay_vbank_user() { return order_pay_vbank_user; }
	public void setorder_pay_vbank_user(String order_pay_vbank_user) { this.order_pay_vbank_user = order_pay_vbank_user; }
	
	public String getorder_st() { return order_st; }
	public void setorder_st(String order_st) { this.order_st = order_st; }
	
	public String getorder_memo() { return order_memo; }
	public void setorder_memo(String order_memo) { this.order_memo = order_memo; }
	
	public String getod_seq() { return od_seq; }
	public void setod_seq(String od_seq) { this.od_seq = od_seq; }
	
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
	
	public String getod_stat() { return od_stat; }
	public void setod_stat(String od_stat) { this.od_stat = od_stat; }
	
	public String getod_order_stat() { return od_order_stat; }
	public void setod_order_stat(String od_order_stat) { this.od_order_stat = od_order_stat; }
	
	public String getod_end_date() { return od_end_date; }
	public void setod_end_date(String od_end_date) { this.od_end_date = od_end_date; }
	
	public String getsql_or() { return sql_or; }
	public void setsql_or(String sql_or) { this.sql_or = sql_or; }
	
	public String getorder_st_dt() { return order_st_dt; }
	public void setorder_st_dt(String order_st_dt) { this.order_st_dt = order_st_dt; }

	public String getorder_ed_dt() { return order_ed_dt; }
	public void setorder_ed_dt(String order_ed_dt) { this.order_ed_dt = order_ed_dt; }
	
	public String getdelivery_company_cd1() { return delivery_company_cd1; }
	public void setdelivery_company_cd1(String delivery_company_cd1) { this.delivery_company_cd1 = delivery_company_cd1; }

	public String getdelivery_company_nm1() { return delivery_company_nm1; }
	public void setdelivery_company_nm1(String delivery_company_nm1) { this.delivery_company_nm1 = delivery_company_nm1; }

	public String getdelivery_company_cd2() { return delivery_company_cd2; }
	public void setdelivery_company_cd2(String delivery_company_cd2) { this.delivery_company_cd2 = delivery_company_cd2; }

	public String getdelivery_company_nm2() { return delivery_company_nm2; }
	public void setdelivery_company_nm2(String delivery_company_nm2) { this.delivery_company_nm2 = delivery_company_nm2; }

	public String getdelivery_company_cd3() { return delivery_company_cd3; }
	public void setdelivery_company_cd3(String delivery_company_cd3) { this.delivery_company_cd3 = delivery_company_cd3; }

	public String getdelivery_company_nm3() { return delivery_company_nm3; }
	public void setdelivery_company_nm3(String delivery_company_nm3) { this.delivery_company_nm3 = delivery_company_nm3; }
	
	public String getod_delivery_company_id() { return od_delivery_company_id; }
	public void setod_delivery_company_id(String od_delivery_company_id) { this.od_delivery_company_id = od_delivery_company_id; }

	public String getod_delivery_number() { return od_delivery_number; }
	public void setod_delivery_number(String od_delivery_number) { this.od_delivery_number = od_delivery_number; }
	
	public String getod_delivery_dt() { return od_delivery_dt; }
	public void setod_delivery_dt(String od_delivery_dt) { this.od_delivery_dt = od_delivery_dt; }
	
	public String getdelivery_company_nm() { return delivery_company_nm; }
	public void setdelivery_company_nm(String delivery_company_nm) { this.delivery_company_nm = delivery_company_nm; }
	
	public String getorder_pay_date() { return order_pay_date; }
	public void setorder_pay_date(String order_pay_date) { this.order_pay_date = order_pay_date; }
	
	public String getorder_cancel_date() { return order_cancel_date; }
	public void setorder_cancel_date(String order_cancel_date) { this.order_cancel_date = order_cancel_date; }

	public String getorder_pay_stat() { return order_pay_stat; }
	public void setorder_pay_stat(String order_pay_stat) { this.order_pay_stat = order_pay_stat; }

	public String getorder_time() { return order_time; }
	public void setorder_time(String order_time) { this.order_time = order_time; }

	public String getorder_pay_vbank_cd() { return order_pay_vbank_cd; }
	public void setorder_pay_vbank_cd(String order_pay_vbank_cd) { this.order_pay_vbank_cd = order_pay_vbank_cd; }

	public String getorder_pay_time() { return order_pay_time; }
	public void setorder_pay_time(String order_pay_time) { this.order_pay_time = order_pay_time; }
	
	public String getod_canceling_dt() { return od_canceling_dt; }
	public void setod_canceling_dt(String od_canceling_dt) { this.od_canceling_dt = od_canceling_dt; }
	
}