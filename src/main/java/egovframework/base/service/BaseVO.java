package egovframework.base.service;

import egovframework.base.service.BaseVO;

public class BaseVO extends BasePagingVO {
	
	private String sess_id;
	
	private String base_gp_cd;
	private String base_cd;
	private String base_cd_nm;
	private String base_api_cd;
	private String base_use_st;
	private String base_nm_st;
	private String base_mod_st;
	private int base_orderby;
	private String store_category;

	private String uploadfile;

	private String atch_file_id;
	private String file_sn;
	private String file_stre_cours;
	private String stre_file_nm;
	private String orignl_file_nm;
	private String file_extsn;
	private String file_cn;
	private String file_size;
	private String fild_id;
	
	private String time_limit;
	
	private String android;
	private String ios;
	private String fcm_key;
	
	private String order_user_id;
	private String user_device_token;
	private String user_device_os;
	private String user_id;
	private String user_ip;
	private String time_now;
	private String prod_id;
	private String bbs_id;
	private String bbs_seq;
	
	private String mailfrom;
	private String mailto;
	private String mailsubject;
	private String mailcontent;
	
	private String remote_ip;
	private String reg_dt;
	private String user_agent;
	
	/* 주문디테일 */
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
	private String od_calc_st;
	private String od_calc_res;
	
	/* 정산 */
	private String cal_seq;
	private String cal_id;
	private String cal_order_id;
	private String cal_order_detail_seq;
	private String cal_store_id;
	private String cal_store_user_id;
	private String cal_store_category;
	private String cal_order_pay_st;
	private String cal_prod_id;
	private String cal_prod_category;
	private String cal_card_adjustment;
	private String cal_category_adjustment;
	private String cal_order_price;
	private String cal_delivery_price;
	private String cal_coupon_id;
	private String cal_coupon_price;
	private String cal_use_mileage;
	private String cal_st;
	private String cal_order_dt;
	private String cal_reg_dt;
	private String cal_res_dt;
	
	private String order_total_delivery_price;
	private String order_use_coupon_id;
	private String order_coupon_price;
	private String order_use_mileage;
	private String chkdt;
	private String cancel_dt;
	private String order_pay_st;
	
	private String store_travel_calc_percent;
	private String store_house_calc_percent;
	private String store_food_calc_percent;
	private String store_market_calc_percent;
	
	private String cal_room_seq;
	private String cal_room_nm;
	private String cal_calc_price;
	
	private String sms_send;
	private String sms_no1;
	private String sms_no2;
	
	private String order_id;
	private String prod_nm;
	private String sms_to_group;
	private String sms_to_user;
	private String sms_content;
	private String sms_reserve_dt;
	private String tr_senddate;
	private String tr_num;
	private String tr_id;
	private String tr_sendstat;
	private String tr_rsltstat;
	private String tr_msgtype;
	private String tr_phone;
	private String tr_callback;
	private String tr_rsltdate;
	private String tr_modified;
	private String tr_msg;
	private String tr_net;
	private String tr_etc1;
	private String tr_etc2;
	private String tr_etc3;
	private String tr_etc4;
	private String tr_etc5;
	private String tr_etc6;
	private String tr_routeid;
	private String tr_realsenddate;
	private String tr_subject;
	
	private String sms_seq;
	private String sms_cd;
	private String sms_use_user;
	private String sms_use_store;
	private String sms_use_center;
	private String sms_content_user;
	private String sms_content_store;
	private String sms_content_center;
	private String push_seq;
	private String push_cd;
	private String push_use_user;
	private String push_use_store;
	private String push_use_center;
	private String push_content_user;
	private String push_content_store;
	private String push_content_center;
	private String push_content;
	
	private String user_hp;
	private String store_nm;
	private String store_hp_1;
	private String store_hp_2;
	
	private String searchkey;
	
	private String order_hp;
	private String delivery_company;
	private String delivery_number;
	private String store_id;
	private String reserve_st_dt;
	private String reserve_ed_dt;
	private String user_level;
	
	private String sms_target;
	private String sms_type;
	
	private String order_pay_time;
	private String od_delivery_company_nm;
	private String od_delivery_number;
	
	private String order_tid;
	private String order_price;
	private String order_pay_cd;
	private String order_total_price;
	
	private String tracking_key;
	
	//==================================================================================
	
	public String getsess_id() { return sess_id; }
	public void setsess_id(String sess_id) { this.sess_id = sess_id; }
	
	public String getbase_gp_cd() { return base_gp_cd; }
	public void setbase_gp_cd(String base_gp_cd) { this.base_gp_cd = base_gp_cd; }
	
	public String getbase_cd() { return base_cd; }
	public void setbase_cd(String base_cd) { this.base_cd = base_cd; }
	
	public String getbase_cd_nm() { return base_cd_nm; }
	public void setbase_cd_nm(String base_cd_nm) { this.base_cd_nm = base_cd_nm; }
	
	public String getbase_api_cd() { return base_api_cd; }
	public void setbase_api_cd(String base_api_cd) { this.base_api_cd = base_api_cd; }
	
	public String getbase_use_st() { return base_use_st; }
	public void setbase_use_st(String base_use_st) { this.base_use_st = base_use_st; }
	
	public String getbase_nm_st() { return base_nm_st; }
	public void setbase_nm_st(String base_nm_st) { this.base_nm_st = base_nm_st; }
	
	public String getbase_mod_st() { return base_mod_st; }
	public void setbase_mod_st(String base_mod_st) { this.base_mod_st = base_mod_st; }
	
	public int getbase_orderby() { return base_orderby; }
	public void setbase_orderby(int base_orderby) { this.base_orderby = base_orderby; }
	
	public String getuploadfile() { return uploadfile; }
	public void setuploadfile(String uploadfile) { this.uploadfile = uploadfile; }
	
	public String getatch_file_id() { return atch_file_id; }
	public void setatch_file_id(String atch_file_id) { this.atch_file_id = atch_file_id; }

	public String getfile_sn() { return file_sn; }
	public void setfile_sn(String file_sn) { this.file_sn = file_sn; }

	public String getfile_stre_cours() { return file_stre_cours; }
	public void setfile_stre_cours(String file_stre_cours) { this.file_stre_cours = file_stre_cours; }

	public String getstre_file_nm() { return stre_file_nm; }
	public void setstre_file_nm(String stre_file_nm) { this.stre_file_nm = stre_file_nm; }

	public String getorignl_file_nm() { return orignl_file_nm; }
	public void setorignl_file_nm(String orignl_file_nm) { this.orignl_file_nm = orignl_file_nm; }

	public String getfile_extsn() { return file_extsn; }
	public void setfile_extsn(String file_extsn) { this.file_extsn = file_extsn; }

	public String getfile_cn() { return file_cn; }
	public void setfile_cn(String file_cn) { this.file_cn = file_cn; }

	public String getfile_size() { return file_size; }
	public void setfile_size(String file_size) { this.file_size = file_size; }
	
	public String getfild_id() { return fild_id; }
	public void setfild_id(String fild_id) { this.fild_id = fild_id; }
	
	public String gettime_limit() { return time_limit; }
	public void settime_limit(String time_limit) { this.time_limit = time_limit; }
	
	public String getandroid() { return android; }
	public void setandroid(String android) { this.android = android; }

	public String getios() { return ios; }
	public void setios(String ios) { this.ios = ios; }

	public String getfcm_key() { return fcm_key; }
	public void setfcm_key(String fcm_key) { this.fcm_key = fcm_key; }
	
	public String getorder_user_id() { return order_user_id; }
	public void setorder_user_id(String order_user_id) { this.order_user_id = order_user_id; }
	
	public String getuser_device_token() { return user_device_token; }
	public void setuser_device_token(String user_device_token) { this.user_device_token = user_device_token; }

	public String getuser_device_os() { return user_device_os; }
	public void setuser_device_os(String user_device_os) { this.user_device_os = user_device_os; }

	public String getuser_id() { return user_id; }
	public void setuser_id(String user_id) { this.user_id = user_id; }
	
	public String getuser_ip() { return user_ip; }
	public void setuser_ip(String user_ip) { this.user_ip = user_ip; }
	
	public String gettime_now() { return time_now; }
	public void settime_now(String time_now) { this.time_now = time_now; }

	public String getprod_id() { return prod_id; }
	public void setprod_id(String prod_id) { this.prod_id = prod_id; }

	public String getbbs_id() { return bbs_id; }
	public void setbbs_id(String bbs_id) { this.bbs_id = bbs_id; }
	
	public String getbbs_seq() { return bbs_seq; }
	public void setbbs_seq(String bbs_seq) { this.bbs_seq = bbs_seq; }

	public String getmailfrom() { return mailfrom; }
	public void setmailfrom(String mailfrom) { this.mailfrom = mailfrom; }

	public String getmailto() { return mailto; }
	public void setmailto(String mailto) { this.mailto = mailto; }

	public String getmailsubject() { return mailsubject; }
	public void setmailsubject(String mailsubject) { this.mailsubject = mailsubject; }

	public String getmailcontent() { return mailcontent; }
	public void setmailcontent(String mailcontent) { this.mailcontent = mailcontent; }
	
	public String getremote_ip() { return remote_ip; }
	public void setremote_ip(String remote_ip) { this.remote_ip = remote_ip; }

	public String getreg_dt() { return reg_dt; }
	public void setreg_dt(String reg_dt) { this.reg_dt = reg_dt; }

	public String getuser_agent() { return user_agent; }
	public void setuser_agent(String user_agent) { this.user_agent = user_agent; }
	
	public String getstore_category() { return store_category; }
	public void setstore_category(String store_category) { this.store_category = store_category; }
	
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
	
	public String getod_stat() { return od_stat; }
	public void setod_stat(String od_stat) { this.od_stat = od_stat; }
	
	public String getod_order_stat() { return od_order_stat; }
	public void setod_order_stat(String od_order_stat) { this.od_order_stat = od_order_stat; }
	
	public String getod_end_date() { return od_end_date; }
	public void setod_end_date(String od_end_date) { this.od_end_date = od_end_date; }
	
	public String getod_calc_st() { return od_calc_st; }
	public void setod_calc_st(String od_calc_st) { this.od_calc_st = od_calc_st; }

	public String getod_calc_res() { return od_calc_res; }
	public void setod_calc_res(String od_calc_res) { this.od_calc_res = od_calc_res; }
	
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

	public String getcal_order_pay_st() { return cal_order_pay_st; }
	public void setcal_order_pay_st(String cal_order_pay_st) { this.cal_order_pay_st = cal_order_pay_st; }
	
	public String getcal_prod_id() { return cal_prod_id; }
	public void setcal_prod_id(String cal_prod_id) { this.cal_prod_id = cal_prod_id; }

	public String getcal_prod_category() { return cal_prod_category; }
	public void setcal_prod_category(String cal_prod_category) { this.cal_prod_category = cal_prod_category; }

	public String getcal_card_adjustment() { return cal_card_adjustment; }
	public void setcal_card_adjustment(String cal_card_adjustment) { this.cal_card_adjustment = cal_card_adjustment; }

	public String getcal_category_adjustment() { return cal_category_adjustment; }
	public void setcal_category_adjustment(String cal_category_adjustment) { this.cal_category_adjustment = cal_category_adjustment; }

	public String getcal_order_price() { return cal_order_price; }
	public void setcal_order_price(String cal_order_price) { this.cal_order_price = cal_order_price; }

	public String getcal_delivery_price() { return cal_delivery_price; }
	public void setcal_delivery_price(String cal_delivery_price) { this.cal_delivery_price = cal_delivery_price; }

	public String getcal_coupon_id() { return cal_coupon_id; }
	public void setcal_coupon_id(String cal_coupon_id) { this.cal_coupon_id = cal_coupon_id; }

	public String getcal_coupon_price() { return cal_coupon_price; }
	public void setcal_coupon_price(String cal_coupon_price) { this.cal_coupon_price = cal_coupon_price; }

	public String getcal_use_mileage() { return cal_use_mileage; }
	public void setcal_use_mileage(String cal_use_mileage) { this.cal_use_mileage = cal_use_mileage; }

	public String getcal_st() { return cal_st; }
	public void setcal_st(String cal_st) { this.cal_st = cal_st; }

	public String getcal_order_dt() { return cal_order_dt; }
	public void setcal_order_dt(String cal_order_dt) { this.cal_order_dt = cal_order_dt; }

	public String getcal_reg_dt() { return cal_reg_dt; }
	public void setcal_reg_dt(String cal_reg_dt) { this.cal_reg_dt = cal_reg_dt; }

	public String getcal_res_dt() { return cal_res_dt; }
	public void setcal_res_dt(String cal_res_dt) { this.cal_res_dt = cal_res_dt; }
	
	public String getorder_total_delivery_price() { return order_total_delivery_price; }
	public void setorder_total_delivery_price(String order_total_delivery_price) { this.order_total_delivery_price = order_total_delivery_price; }

	public String getorder_use_coupon_id() { return order_use_coupon_id; }
	public void setorder_use_coupon_id(String order_use_coupon_id) { this.order_use_coupon_id = order_use_coupon_id; }

	public String getorder_coupon_price() { return order_coupon_price; }
	public void setorder_coupon_price(String order_coupon_price) { this.order_coupon_price = order_coupon_price; }

	public String getorder_use_mileage() { return order_use_mileage; }
	public void setorder_use_mileage(String order_use_mileage) { this.order_use_mileage = order_use_mileage; }
	
	public String getchkdt() { return chkdt; }
	public void setchkdt(String chkdt) { this.chkdt = chkdt; }
	
	public String getcancel_dt() { return cancel_dt; }
	public void setcancel_dt(String cancel_dt) { this.cancel_dt = cancel_dt; }
	
	public String getorder_pay_st() { return order_pay_st; }
	public void setorder_pay_st(String order_pay_st) { this.order_pay_st = order_pay_st; }
	
	public String getstore_travel_calc_percent() { return store_travel_calc_percent; }
	public void setstore_travel_calc_percent(String store_travel_calc_percent) { this.store_travel_calc_percent = store_travel_calc_percent; }

	public String getstore_house_calc_percent() { return store_house_calc_percent; }
	public void setstore_house_calc_percent(String store_house_calc_percent) { this.store_house_calc_percent = store_house_calc_percent; }

	public String getstore_food_calc_percent() { return store_food_calc_percent; }
	public void setstore_food_calc_percent(String store_food_calc_percent) { this.store_food_calc_percent = store_food_calc_percent; }

	public String getstore_market_calc_percent() { return store_market_calc_percent; }
	public void setstore_market_calc_percent(String store_market_calc_percent) { this.store_market_calc_percent = store_market_calc_percent; }

	public String getcal_room_seq() { return cal_room_seq; }
	public void setcal_room_seq(String cal_room_seq) { this.cal_room_seq = cal_room_seq; }

	public String getcal_room_nm() { return cal_room_nm; }
	public void setcal_room_nm(String cal_room_nm) { this.cal_room_nm = cal_room_nm; }
	
	public String getcal_calc_price() { return cal_calc_price; }
	public void setcal_calc_price(String cal_calc_price) { this.cal_calc_price = cal_calc_price; }
	
	public String getsms_send() { return sms_send; }
	public void setsms_send(String sms_send) { this.sms_send = sms_send; }

	public String getsms_no1() { return sms_no1; }
	public void setsms_no1(String sms_no1) { this.sms_no1 = sms_no1; }

	public String getsms_no2() { return sms_no2; }
	public void setsms_no2(String sms_no2) { this.sms_no2 = sms_no2; }
	
	public String getorder_id() { return order_id; }
	public void setorder_id(String order_id) { this.order_id = order_id; }

	public String getprod_nm() { return prod_nm; }
	public void setprod_nm(String prod_nm) { this.prod_nm = prod_nm; }

	public String getsms_to_group() { return sms_to_group; }
	public void setsms_to_group(String sms_to_group) { this.sms_to_group = sms_to_group; }

	public String getsms_to_user() { return sms_to_user; }
	public void setsms_to_user(String sms_to_user) { this.sms_to_user = sms_to_user; }

	public String getsms_content() { return sms_content; }
	public void setsms_content(String sms_content) { this.sms_content = sms_content; }

	public String getsms_reserve_dt() { return sms_reserve_dt; }
	public void setsms_reserve_dt(String sms_reserve_dt) { this.sms_reserve_dt = sms_reserve_dt; }

	public String gettr_senddate() { return tr_senddate; }
	public void settr_senddate(String tr_senddate) { this.tr_senddate = tr_senddate; }

	public String gettr_num() { return tr_num; }
	public void settr_num(String tr_num) { this.tr_num = tr_num; }

	public String gettr_id() { return tr_id; }
	public void settr_id(String tr_id) { this.tr_id = tr_id; }

	public String gettr_sendstat() { return tr_sendstat; }
	public void settr_sendstat(String tr_sendstat) { this.tr_sendstat = tr_sendstat; }

	public String gettr_rsltstat() { return tr_rsltstat; }
	public void settr_rsltstat(String tr_rsltstat) { this.tr_rsltstat = tr_rsltstat; }

	public String gettr_msgtype() { return tr_msgtype; }
	public void settr_msgtype(String tr_msgtype) { this.tr_msgtype = tr_msgtype; }

	public String gettr_phone() { return tr_phone; }
	public void settr_phone(String tr_phone) { this.tr_phone = tr_phone; }

	public String gettr_callback() { return tr_callback; }
	public void settr_callback(String tr_callback) { this.tr_callback = tr_callback; }

	public String gettr_rsltdate() { return tr_rsltdate; }
	public void settr_rsltdate(String tr_rsltdate) { this.tr_rsltdate = tr_rsltdate; }

	public String gettr_modified() { return tr_modified; }
	public void settr_modified(String tr_modified) { this.tr_modified = tr_modified; }

	public String gettr_msg() { return tr_msg; }
	public void settr_msg(String tr_msg) { this.tr_msg = tr_msg; }

	public String gettr_net() { return tr_net; }
	public void settr_net(String tr_net) { this.tr_net = tr_net; }

	public String gettr_etc1() { return tr_etc1; }
	public void settr_etc1(String tr_etc1) { this.tr_etc1 = tr_etc1; }

	public String gettr_etc2() { return tr_etc2; }
	public void settr_etc2(String tr_etc2) { this.tr_etc2 = tr_etc2; }

	public String gettr_etc3() { return tr_etc3; }
	public void settr_etc3(String tr_etc3) { this.tr_etc3 = tr_etc3; }

	public String gettr_etc4() { return tr_etc4; }
	public void settr_etc4(String tr_etc4) { this.tr_etc4 = tr_etc4; }

	public String gettr_etc5() { return tr_etc5; }
	public void settr_etc5(String tr_etc5) { this.tr_etc5 = tr_etc5; }

	public String gettr_etc6() { return tr_etc6; }
	public void settr_etc6(String tr_etc6) { this.tr_etc6 = tr_etc6; }

	public String gettr_routeid() { return tr_routeid; }
	public void settr_routeid(String tr_routeid) { this.tr_routeid = tr_routeid; }

	public String gettr_realsenddate() { return tr_realsenddate; }
	public void settr_realsenddate(String tr_realsenddate) { this.tr_realsenddate = tr_realsenddate; }
	
	public String gettr_subject() { return tr_subject; }
	public void settr_subject(String tr_subject) { this.tr_subject = tr_subject; }
	
	public String getsms_seq() { return sms_seq; }
	public void setsms_seq(String sms_seq) { this.sms_seq = sms_seq; }

	public String getsms_cd() { return sms_cd; }
	public void setsms_cd(String sms_cd) { this.sms_cd = sms_cd; }

	public String getsms_use_user() { return sms_use_user; }
	public void setsms_use_user(String sms_use_user) { this.sms_use_user = sms_use_user; }

	public String getsms_use_store() { return sms_use_store; }
	public void setsms_use_store(String sms_use_store) { this.sms_use_store = sms_use_store; }

	public String getsms_use_center() { return sms_use_center; }
	public void setsms_use_center(String sms_use_center) { this.sms_use_center = sms_use_center; }

	public String getsms_content_user() { return sms_content_user; }
	public void setsms_content_user(String sms_content_user) { this.sms_content_user = sms_content_user; }

	public String getsms_content_store() { return sms_content_store; }
	public void setsms_content_store(String sms_content_store) { this.sms_content_store = sms_content_store; }

	public String getsms_content_center() { return sms_content_center; }
	public void setsms_content_center(String sms_content_center) { this.sms_content_center = sms_content_center; }

	public String getpush_seq() { return push_seq; }
	public void setpush_seq(String push_seq) { this.push_seq = push_seq; }

	public String getpush_cd() { return push_cd; }
	public void setpush_cd(String push_cd) { this.push_cd = push_cd; }

	public String getpush_use_user() { return push_use_user; }
	public void setpush_use_user(String push_use_user) { this.push_use_user = push_use_user; }

	public String getpush_use_store() { return push_use_store; }
	public void setpush_use_store(String push_use_store) { this.push_use_store = push_use_store; }

	public String getpush_use_center() { return push_use_center; }
	public void setpush_use_center(String push_use_center) { this.push_use_center = push_use_center; }

	public String getpush_content_user() { return push_content_user; }
	public void setpush_content_user(String push_content_user) { this.push_content_user = push_content_user; }

	public String getpush_content_store() { return push_content_store; }
	public void setpush_content_store(String push_content_store) { this.push_content_store = push_content_store; }

	public String getpush_content_center() { return push_content_center; }
	public void setpush_content_center(String push_content_center) { this.push_content_center = push_content_center; }
	
	public String getpush_content() { return push_content; }
	public void setpush_content(String push_content) { this.push_content = push_content; }
	
	public String getuser_hp() { return user_hp; }
	public void setuser_hp(String user_hp) { this.user_hp = user_hp; }

	public String getstore_nm() { return store_nm; }
	public void setstore_nm(String store_nm) { this.store_nm = store_nm; }

	public String getstore_hp_1() { return store_hp_1; }
	public void setstore_hp_1(String store_hp_1) { this.store_hp_1 = store_hp_1; }

	public String getstore_hp_2() { return store_hp_2; }
	public void setstore_hp_2(String store_hp_2) { this.store_hp_2 = store_hp_2; }
	
	public String getsearchkey() { return searchkey; }
	public void setsearchkey(String searchkey) { this.searchkey = searchkey; }
	
	public String getorder_hp() { return order_hp; }
	public void setorder_hp(String order_hp) { this.order_hp = order_hp; }

	public String getdelivery_company() { return delivery_company; }
	public void setdelivery_company(String delivery_company) { this.delivery_company = delivery_company; }

	public String getdelivery_number() { return delivery_number; }
	public void setdelivery_number(String delivery_number) { this.delivery_number = delivery_number; }
	
	public String getstore_id() { return store_id; }
	public void setstore_id(String store_id) { this.store_id = store_id; }
	
	public String getreserve_st_dt() { return reserve_st_dt; }
	public void setreserve_st_dt(String reserve_st_dt) { this.reserve_st_dt = reserve_st_dt; }

	public String getreserve_ed_dt() { return reserve_ed_dt; }
	public void setreserve_ed_dt(String reserve_ed_dt) { this.reserve_ed_dt = reserve_ed_dt; }
	
	public String getuser_level() { return user_level; }
	public void setuser_level(String user_level) { this.user_level = user_level; }	
	
	public String getsms_target() { return sms_target; }
	public void setsms_target(String sms_target) { this.sms_target = sms_target; }

	public String getsms_type() { return sms_type; }
	public void setsms_type(String sms_type) { this.sms_type = sms_type; }
	
	public String getorder_pay_time() { return order_pay_time; }
	public void setorder_pay_time(String order_pay_time) { this.order_pay_time = order_pay_time; }
	
	public String getod_delivery_company_nm() { return od_delivery_company_nm; }
	public void setod_delivery_company_nm(String od_delivery_company_nm) { this.od_delivery_company_nm = od_delivery_company_nm; }

	public String getod_delivery_number() { return od_delivery_number; }
	public void setod_delivery_number(String od_delivery_number) { this.od_delivery_number = od_delivery_number; }
	
	public String getorder_tid() { return order_tid; }
	public void setorder_tid(String order_tid) { this.order_tid = order_tid; }

	public String getorder_price() { return order_price; }
	public void setorder_price(String order_price) { this.order_price = order_price; }
	
	public String getorder_pay_cd() { return order_pay_cd; }
	public void setorder_pay_cd(String order_pay_cd) { this.order_pay_cd = order_pay_cd; }

	public String getorder_total_price() { return order_total_price; }
	public void setorder_total_price(String order_total_price) { this.order_total_price = order_total_price; }
	
	public String gettracking_key() { return tracking_key; }
	public void settracking_key(String tracking_key) { this.tracking_key = tracking_key; }
	
}