package egovframework.admgrMarketing.service;

import egovframework.base.service.BasePagingVO;

public class AdmgrMarketingVO extends BasePagingVO {

	private String searchKey;
	private String searchKeyword;

	private String modalsearchKey;
	private String modalsearchKeyword;
	
	private String store_category_nm;
	private String reg_dt;	
	private String reg_dt_ymd;	
	private String reg_dt_his;	
	
	private String zone;
	private String update_mode;

	private String slide_seq;
	private String slide_subject;
	private String slide_link;
	private String slide_target;
	private String slide_st_dt;
	private String slide_st_dt_ymd;
	private String slide_st_dt_hour;
	private String slide_st_dt_minute;
	private String slide_ed_dt;
	private String slide_ed_dt_ymd;
	private String slide_ed_dt_hour;
	private String slide_ed_dt_minute;
	private String slide_img;
	private String slide_use_st;
	
	private String week_seq;
	private String store_category;
	private String prod_seq;
	private String week_st_dt;
	private String week_st_dt_ymd;
	private String week_st_dt_hour;
	private String week_st_dt_minute;
	private String week_ed_dt;
	private String week_ed_dt_ymd;
	private String week_ed_dt_hour;
	private String week_ed_dt_minute;
	private String week_use_st;
	
	private String banner_seq;
	private String banner_zone_1;
	private String banner_zone_2;
	private String banner_zone_3;
	private String banner_subject;
	private String banner_link;
	private String banner_target;
	private String banner_st_dt;
	private String banner_st_dt_ymd;
	private String banner_st_dt_hour;
	private String banner_st_dt_minute;
	private String banner_ed_dt;
	private String banner_ed_dt_ymd;
	private String banner_ed_dt_hour;
	private String banner_ed_dt_minute;
	private String banner_img;
	private String banner_use_st;

	private String main_seq;
	private String main_st_dt;
	private String main_st_dt_ymd;
	private String main_st_dt_hour;
	private String main_st_dt_minute;
	private String main_ed_dt;
	private String main_ed_dt_ymd;
	private String main_ed_dt_hour;
	private String main_ed_dt_minute;
	private String main_use_st;
	
	/* 상품정보용 */
	private String prod_use_st;
	private String store_nm;
	private String prod_id;
	private String prod_nm;
	private String prod_img_1;
	
	//=========================================================

	/* 검색용 */
	public String getsearchKey() { return searchKey; }
	public void setsearchKey(String searchKey) { this.searchKey = searchKey; }
	
	public String getsearchKeyword() { return searchKeyword; }
	public void setsearchKeyword(String searchKeyword) { this.searchKeyword = searchKeyword; }
	
	public String getmodalsearchKey() { return modalsearchKey; }
	public void setmodalsearchKey(String modalsearchKey) { this.modalsearchKey = modalsearchKey; }
	
	public String getmodalsearchKeyword() { return modalsearchKeyword; }
	public void setmodalsearchKeyword(String modalsearchKeyword) { this.modalsearchKeyword = modalsearchKeyword; }
	
	public String getstore_category_nm() { return store_category_nm; }
	public void setstore_category_nm(String store_category_nm) { this.store_category_nm = store_category_nm; }
	
	public String getreg_dt() { return reg_dt; }
	public void setreg_dt(String reg_dt) { this.reg_dt = reg_dt; }
	
	public String getreg_dt_ymd() { return reg_dt_ymd; }
	public void setreg_dt_ymd(String reg_dt_ymd) { this.reg_dt_ymd = reg_dt_ymd; }
	
	public String getreg_dt_his() { return reg_dt_his; }
	public void setreg_dt_his(String reg_dt_his) { this.reg_dt_his = reg_dt_his; }
	
	public String getzone() { return zone; }
	public void setzone(String zone) { this.zone = zone; }
	
	public String getaction_mode() { return update_mode; }
	public void setaction_mode(String update_mode) { this.update_mode = update_mode; }
	
	/* 슬라이늗 */
	public String getslide_seq() { return slide_seq; }
	public void setslide_seq(String slide_seq) { this.slide_seq = slide_seq; }

	public String getslide_subject() { return slide_subject; }
	public void setslide_subject(String slide_subject) { this.slide_subject = slide_subject; }

	public String getslide_link() { return slide_link; }
	public void setslide_link(String slide_link) { this.slide_link = slide_link; }

	public String getslide_target() { return slide_target; }
	public void setslide_target(String slide_target) { this.slide_target = slide_target; }
	
	public String getslide_st_dt() { return slide_st_dt; }
	public void setslide_st_dt(String slide_st_dt) { this.slide_st_dt = slide_st_dt; }

	public String getslide_st_dt_ymd() { return slide_st_dt_ymd; }
	public void setslide_st_dt_ymd(String slide_st_dt_ymd) { this.slide_st_dt_ymd = slide_st_dt_ymd; }

	public String getslide_st_dt_hour() { return slide_st_dt_hour; }
	public void setslide_st_dt_hour(String slide_st_dt_hour) { this.slide_st_dt_hour = slide_st_dt_hour; }

	public String getslide_st_dt_minute() { return slide_st_dt_minute; }
	public void setslide_st_dt_minute(String slide_st_dt_minute) { this.slide_st_dt_minute = slide_st_dt_minute; }

	public String getslide_ed_dt() { return slide_ed_dt; }
	public void setslide_ed_dt(String slide_ed_dt) { this.slide_ed_dt = slide_ed_dt; }

	public String getslide_ed_dt_ymd() { return slide_ed_dt_ymd; }
	public void setslide_ed_dt_ymd(String slide_ed_dt_ymd) { this.slide_ed_dt_ymd = slide_ed_dt_ymd; }

	public String getslide_ed_dt_hour() { return slide_ed_dt_hour; }
	public void setslide_ed_dt_hour(String slide_ed_dt_hour) { this.slide_ed_dt_hour = slide_ed_dt_hour; }

	public String getslide_ed_dt_minute() { return slide_ed_dt_minute; }
	public void setslide_ed_dt_minute(String slide_ed_dt_minute) { this.slide_ed_dt_minute = slide_ed_dt_minute; }

	public String getslide_img() { return slide_img; }
	public void setslide_img(String slide_img) { this.slide_img = slide_img; }

	public String getslide_use_st() { return slide_use_st; }
	public void setslide_use_st(String slide_use_st) { this.slide_use_st = slide_use_st; }
	
	
	/* 금주 */
	public String getweek_seq() { return week_seq; }
	public void setweek_seq(String week_seq) { this.week_seq = week_seq; }

	public String getstore_category() { return store_category; }
	public void setstore_category(String store_category) { this.store_category = store_category; }

	public String getprod_seq() { return prod_seq; }
	public void setprod_seq(String prod_seq) { this.prod_seq = prod_seq; }

	public String getweek_st_dt() { return week_st_dt; }
	public void setweek_st_dt(String week_st_dt) { this.week_st_dt = week_st_dt; }

	public String getweek_st_dt_ymd() { return week_st_dt_ymd; }
	public void setweek_st_dt_ymd(String week_st_dt_ymd) { this.week_st_dt_ymd = week_st_dt_ymd; }

	public String getweek_st_dt_hour() { return week_st_dt_hour; }
	public void setweek_st_dt_hour(String week_st_dt_hour) { this.week_st_dt_hour = week_st_dt_hour; }

	public String getweek_st_dt_minute() { return week_st_dt_minute; }
	public void setweek_st_dt_minute(String week_st_dt_minute) { this.week_st_dt_minute = week_st_dt_minute; }

	public String getweek_ed_dt() { return week_ed_dt; }
	public void setweek_ed_dt(String week_ed_dt) { this.week_ed_dt = week_ed_dt; }

	public String getweek_ed_dt_ymd() { return week_ed_dt_ymd; }
	public void setweek_ed_dt_ymd(String week_ed_dt_ymd) { this.week_ed_dt_ymd = week_ed_dt_ymd; }

	public String getweek_ed_dt_hour() { return week_ed_dt_hour; }
	public void setweek_ed_dt_hour(String week_ed_dt_hour) { this.week_ed_dt_hour = week_ed_dt_hour; }

	public String getweek_ed_dt_minute() { return week_ed_dt_minute; }
	public void setweek_ed_dt_minute(String week_ed_dt_minute) { this.week_ed_dt_minute = week_ed_dt_minute; }

	public String getweek_use_st() { return week_use_st; }
	public void setweek_use_st(String week_use_st) { this.week_use_st = week_use_st; }
	
	/*  배너 */
	public String getbanner_seq() { return banner_seq; }
	public void setbanner_seq(String banner_seq) { this.banner_seq = banner_seq; }

	public String getbanner_zone_1() { return banner_zone_1; }
	public void setbanner_zone_1(String banner_zone_1) { this.banner_zone_1 = banner_zone_1; }

	public String getbanner_zone_2() { return banner_zone_2; }
	public void setbanner_zone_2(String banner_zone_2) { this.banner_zone_2 = banner_zone_2; }
	
	public String getbanner_zone_3() { return banner_zone_3; }
	public void setbanner_zone_3(String banner_zone_3) { this.banner_zone_3 = banner_zone_3; }
	
	public String getbanner_subject() { return banner_subject; }
	public void setbanner_subject(String banner_subject) { this.banner_subject = banner_subject; }

	public String getbanner_link() { return banner_link; }
	public void setbanner_link(String banner_link) { this.banner_link = banner_link; }
	
	public String getbanner_target() { return banner_target; }
	public void setbanner_target(String banner_target) { this.banner_target = banner_target; }

	public String getbanner_st_dt() { return banner_st_dt; }
	public void setbanner_st_dt(String banner_st_dt) { this.banner_st_dt = banner_st_dt; }

	public String getbanner_st_dt_ymd() { return banner_st_dt_ymd; }
	public void setbanner_st_dt_ymd(String banner_st_dt_ymd) { this.banner_st_dt_ymd = banner_st_dt_ymd; }

	public String getbanner_st_dt_hour() { return banner_st_dt_hour; }
	public void setbanner_st_dt_hour(String banner_st_dt_hour) { this.banner_st_dt_hour = banner_st_dt_hour; }

	public String getbanner_st_dt_minute() { return banner_st_dt_minute; }
	public void setbanner_st_dt_minute(String banner_st_dt_minute) { this.banner_st_dt_minute = banner_st_dt_minute; }

	public String getbanner_ed_dt() { return banner_ed_dt; }
	public void setbanner_ed_dt(String banner_ed_dt) { this.banner_ed_dt = banner_ed_dt; }

	public String getbanner_ed_dt_ymd() { return banner_ed_dt_ymd; }
	public void setbanner_ed_dt_ymd(String banner_ed_dt_ymd) { this.banner_ed_dt_ymd = banner_ed_dt_ymd; }

	public String getbanner_ed_dt_hour() { return banner_ed_dt_hour; }
	public void setbanner_ed_dt_hour(String banner_ed_dt_hour) { this.banner_ed_dt_hour = banner_ed_dt_hour; }

	public String getbanner_ed_dt_minute() { return banner_ed_dt_minute; }
	public void setbanner_ed_dt_minute(String banner_ed_dt_minute) { this.banner_ed_dt_minute = banner_ed_dt_minute; }

	public String getbanner_img() { return banner_img; }
	public void setbanner_img(String banner_img) { this.banner_img = banner_img; }
	
	public String getbanner_use_st() { return banner_use_st; }
	public void setbanner_use_st(String banner_use_st) { this.banner_use_st = banner_use_st; }
	
	/* 메인 */
	public String getmain_seq() { return main_seq; }
	public void setmain_seq(String main_seq) { this.main_seq = main_seq; }

	public String getmain_st_dt() { return main_st_dt; }
	public void setmain_st_dt(String main_st_dt) { this.main_st_dt = main_st_dt; }

	public String getmain_st_dt_ymd() { return main_st_dt_ymd; }
	public void setmain_st_dt_ymd(String main_st_dt_ymd) { this.main_st_dt_ymd = main_st_dt_ymd; }

	public String getmain_st_dt_hour() { return main_st_dt_hour; }
	public void setmain_st_dt_hour(String main_st_dt_hour) { this.main_st_dt_hour = main_st_dt_hour; }

	public String getmain_st_dt_minute() { return main_st_dt_minute; }
	public void setmain_st_dt_minute(String main_st_dt_minute) { this.main_st_dt_minute = main_st_dt_minute; }

	public String getmain_ed_dt() { return main_ed_dt; }
	public void setmain_ed_dt(String main_ed_dt) { this.main_ed_dt = main_ed_dt; }

	public String getmain_ed_dt_ymd() { return main_ed_dt_ymd; }
	public void setmain_ed_dt_ymd(String main_ed_dt_ymd) { this.main_ed_dt_ymd = main_ed_dt_ymd; }

	public String getmain_ed_dt_hour() { return main_ed_dt_hour; }
	public void setmain_ed_dt_hour(String main_ed_dt_hour) { this.main_ed_dt_hour = main_ed_dt_hour; }

	public String getmain_ed_dt_minute() { return main_ed_dt_minute; }
	public void setmain_ed_dt_minute(String main_ed_dt_minute) { this.main_ed_dt_minute = main_ed_dt_minute; }
	
	public String getmain_use_st() { return main_use_st; }
	public void setmain_use_st(String main_use_st) { this.main_use_st = main_use_st; }

	/* 상품용 */
	public String getprod_use_st() { return prod_use_st; }
	public void setprod_use_st(String prod_use_st) { this.prod_use_st = prod_use_st; }

	public String getstore_nm() { return store_nm; }
	public void setstore_nm(String store_nm) { this.store_nm = store_nm; }

	public String getprod_id() { return prod_id; }
	public void setprod_id(String prod_id) { this.prod_id = prod_id; }

	public String getprod_nm() { return prod_nm; }
	public void setprod_nm(String prod_nm) { this.prod_nm = prod_nm; }
	
	public String getprod_img_1() { return prod_img_1; }
	public void setprod_img_1(String prod_img_1) { this.prod_img_1 = prod_img_1; }
	
}