package egovframework.base.search.service;

import egovframework.base.service.BasePagingVO;

public class BaseSearchVO extends BasePagingVO {
	
	private String search_seq;
	private String user_id;
	private String sess_id;
	private String remote_addr;
	private String keywords;
	private String reg_dt;
	
	private String searchKeyword;
	private String store_category;
	private int hitcnt;
	
	private int sql_start;
	private int sql_limit;
	private String search_sql;
	
	/* 상품관련 */
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
	
	private int pagenum;
	private int pagepercnt;
	
	private String store_nm;
	private String store_addr_1;
	private String store_addr_2;
	
	//==================================================================================
	
	public String getsearch_seq() { return search_seq; }
	public void setsearch_seq(String search_seq) { this.search_seq = search_seq; }

	public String getuser_id() { return user_id; }
	public void setuser_id(String user_id) { this.user_id = user_id; }

	public String getsess_id() { return sess_id; }
	public void setsess_id(String sess_id) { this.sess_id = sess_id; }

	public String getremote_addr() { return remote_addr; }
	public void setremote_addr(String remote_addr) { this.remote_addr = remote_addr; }

	public String getkeywords() { return keywords; }
	public void setkeywords(String keywords) { this.keywords = keywords; }

	public String getreg_dt() { return reg_dt; }
	public void setreg_dt(String reg_dt) { this.reg_dt = reg_dt; }
	
	public String getsearchKeyword() { return searchKeyword; }
	public void setsearchKeyword(String searchKeyword) { this.searchKeyword = searchKeyword; }

	public String getstore_category() { return store_category; }
	public void setstore_category(String store_category) { this.store_category = store_category; }

	public int gethitcnt() { return hitcnt; }
	public void sethitcnt(int hitcnt) { this.hitcnt= hitcnt; }
	
	public int getsql_start() { return sql_start; }
	public void setsql_start(int sql_start) { this.sql_start = sql_start; }
	
	public int getsql_limit() { return sql_limit; }
	public void setsql_limit(int sql_limit) { this.sql_limit = sql_limit; }
	
	public String getsearch_sql() { return search_sql; }
	public void setsearch_sql(String search_sql) { this.search_sql = search_sql; }
	
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
	
	public int getpagenum() { return pagenum; }
	public void setpagenum(int pagenum) { this.pagenum = pagenum; }

	public int getpagepercnt() { return pagepercnt; }
	public void setpagepercnt(int pagepercnt) { this.pagepercnt = pagepercnt; }

	public String getstore_nm() { return store_nm; }
	public void setstore_nm(String store_nm) { this.store_nm = store_nm; }
	
	public String getstore_addr_1() { return store_addr_1; }
	public void setstore_addr_1(String store_addr_1) { this.store_addr_1 = store_addr_1; }
	
	public String getstore_addr_2() { return store_addr_2; }
	public void setstore_addr_2(String store_addr_2) { this.store_addr_2 = store_addr_2; }
	
}