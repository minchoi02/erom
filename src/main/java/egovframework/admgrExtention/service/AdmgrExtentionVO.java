package egovframework.admgrExtention.service;

import egovframework.base.service.BasePagingVO;

public class AdmgrExtentionVO extends BasePagingVO {

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
	private String reg_dt;
	private String mod_dt;
	private String del_st;
	private String del_dt;
	
	private String reg_dt_ymd;
	private String reg_dt_his;
	private String store_category_nm;
	private String coupon_use_status;
	
	/* 검색용 */
	private String searchKey;
	private String searchKeyword;
	
	private String tr_num;
	private String tr_senddate;
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
	private String sms_target;
	private String sms_type;
	private String tr_senddate_ymd;
	private String tr_senddate_his;
	
	private String user_level;
	private String user_id;
	private String user_nm;
	private String user_hp;
	private String store_nm;

	//=========================================================
	
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
	
	public String getreg_dt() { return reg_dt; }
	public void setreg_dt(String reg_dt) { this.reg_dt = reg_dt; }
	
	public String getmod_dt() { return mod_dt; }
	public void setmod_dt(String mod_dt) { this.mod_dt = mod_dt; }
	
	public String getdel_st() { return del_st; }
	public void setdel_st(String del_st) { this.del_st = del_st; }
	
	public String getdel_dt() { return del_dt; }
	public void setdel_dt(String del_dt) { this.del_dt = del_dt; }
	
	public String getreg_dt_ymd() { return reg_dt_ymd; }
	public void setreg_dt_ymd(String reg_dt_ymd) { this.reg_dt_ymd = reg_dt_ymd; }

	public String getreg_dt_his() { return reg_dt_his; }
	public void setreg_dt_his(String reg_dt_his) { this.reg_dt_his = reg_dt_his; }
	
	public String getstore_category_nm() { return store_category_nm; }
	public void setstore_category_nm(String store_category_nm) { this.store_category_nm = store_category_nm; }
	
	public String getcoupon_use_status() { return coupon_use_status; }
	public void setcoupon_use_status(String coupon_use_status) { this.coupon_use_status = coupon_use_status; }
	
	/* 검색용 */
	public String getsearchKey() { return searchKey; }
	public void setsearchKey(String searchKey) { this.searchKey = searchKey; }
	
	public String getsearchKeyword() { return searchKeyword; }
	public void setsearchKeyword(String searchKeyword) { this.searchKeyword = searchKeyword; }
	
	public String gettr_num() { return tr_num; }
	public void settr_num(String tr_num) { this.tr_num = tr_num; }

	public String gettr_senddate() { return tr_senddate; }
	public void settr_senddate(String tr_senddate) { this.tr_senddate = tr_senddate; }

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

	public String getsms_target() { return sms_target; }
	public void setsms_target(String sms_target) { this.sms_target = sms_target; }

	public String getsms_type() { return sms_type; }
	public void setsms_type(String sms_type) { this.sms_type = sms_type; }

	public String getuser_level() { return user_level; }
	public void setuser_level(String user_level) { this.user_level = user_level; }
	
	public String getuser_id() { return user_id; }
	public void setuser_id(String user_id) { this.user_id = user_id; }

	public String getuser_nm() { return user_nm; }
	public void setuser_nm(String user_nm) { this.user_nm = user_nm; }

	public String getuser_hp() { return user_hp; }
	public void setuser_hp(String user_hp) { this.user_hp = user_hp; }

	public String getstore_nm() { return store_nm; }
	public void setstore_nm(String store_nm) { this.store_nm = store_nm; }
	
	public String gettr_senddate_ymd() { return tr_senddate_ymd; }
	public void settr_senddate_ymd(String tr_senddate_ymd) { this.tr_senddate_ymd = tr_senddate_ymd; }

	public String gettr_senddate_his() { return tr_senddate_his; }
	public void settr_senddate_his(String tr_senddate_his) { this.tr_senddate_his = tr_senddate_his; }
	
}