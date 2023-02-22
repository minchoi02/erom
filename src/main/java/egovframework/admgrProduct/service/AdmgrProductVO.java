package egovframework.admgrProduct.service;

import java.util.List;

import org.apache.logging.log4j.util.Strings;

import egovframework.base.service.BasePagingVO;


public class AdmgrProductVO extends BasePagingVO {

	private int insert_id;
	private String user_id;
	private String user_level;
	private String search_sql;
	
	/* 상품정보*/
	private String prod_seq;
	private String prod_use_st;
	private String store_id;
	private String store_nm;
	private String store_category;
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
	private String reg_dt;
	private String mod_dt;
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
	private String is_recom;
	
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
	
	/* 방전용 */
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

	//=========================================================
	

	public int getinsert_id() { return insert_id; }
	public void setinsert_id(int insert_id) { this.insert_id = insert_id; }
	
	public String getuser_id() { return user_id; }
	public void setuser_id(String user_id) { this.user_id = user_id; }
	
	public String getuser_level() { return user_level; }
	public void setuser_level(String user_level) { this.user_level = user_level; }
	
	public String getsearch_sql() { return search_sql; }
	public void setsearch_sql(String search_sql) { this.search_sql = search_sql; }
	
	/* 상품정보 */
	public String getprod_seq() { return prod_seq; }
	public void setprod_seq(String prod_seq) { this.prod_seq = prod_seq; }

	public String getprod_use_st() { return prod_use_st; }
	public void setprod_use_st(String prod_use_st) { this.prod_use_st = prod_use_st; }

	public String getstore_id() { return store_id; }
	public void setstore_id(String store_id) { this.store_id = store_id; }

	public String getstore_nm() { return store_nm; }
	public void setstore_nm(String store_nm) { this.store_nm = store_nm; }

	public String getstore_category() { return store_category; }
	public void setstore_category(String store_category) { this.store_category = store_category; }

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

	public String getreg_dt() { return reg_dt; }
	public void setreg_dt(String reg_dt) { this.reg_dt = reg_dt; }

	public String getmod_dt() { return mod_dt; }
	public void setmod_dt(String mod_dt) { this.mod_dt = mod_dt; }
	
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
	
	public String getis_recom() { return is_recom; }
	public void setis_recom(String is_recom) { this.is_recom = is_recom; }
	
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

	
	/* 방 전용정보 */
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
		
	
	
}