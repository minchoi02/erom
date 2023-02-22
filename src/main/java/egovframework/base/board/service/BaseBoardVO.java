package egovframework.base.board.service;

import egovframework.base.service.BasePagingVO;

public class BaseBoardVO extends BasePagingVO {
	
	private int insert_id;
	
	/* bbs  */
	private String bbs_seq;
	private String bbs_id;
	private String user_id;
	private String bbs_writer_nm;
	private String bbs_reply_user_nm;
	private String bbs_writer_pwd;
	private String bbs_writer_email;
	private String bbs_writer_hp;
	private String bbs_category;
	private String bbs_notice_st;
	private String bbs_secure_st;
	private String bbs_subject;
	private String bbs_content;
	private String bbs_reply_user_id;
	private String bbs_reply_subject;
	private String bbs_reply_content;
	private String bbs_hit_cnt;
	private String bbs_file1;
	private String bbs_file2;
	private String bbs_link;
	private String reg_dt;
	private String reg_dt_ymd;
	private String reg_dt_his;
	private String mod_dt;
	private String del_st;
	private String del_dt;
	private String reply_reg_dt;
	private String reply_mod_dt;
	private String reply_del_st;
	private String comm_cnt;
	private String bbs_store_id;
	private String bbs_prod_id;
	private String prod_img_1;
	private String bbs_store_category;
	private String bbs_cp1;
	private String bbs_cp2;
	private String bbs_cp3;
	private String bbs_cp4;
	private String bbs_cp5;
	private String bbs_cp6;
	private String bbs_cp7;
	private String bbs_cp8;
	private String bbs_cp9;
	private String bbs_cp10;
	private String bbs_st_dt;
	private String bbs_st_dt_ymd;
	private String bbs_st_dt_hour;
	private String bbs_st_dt_minute;
	private String bbs_ed_dt;
	private String bbs_ed_dt_ymd;
	private String bbs_ed_dt_hour;
	private String bbs_ed_dt_minute;
	private String bbs_star;
	
	private String user_nm;
	private String store_nm;
	private String prod_nm;
	private String prod_star;
	private String store_category_nm;
	private String reply_user_nm;
	private String store_category;
	private String prod_category;
	private String modify_style;
	private String bbs_date_status;
	private String bbs_use_date;
	
	/* 검색 */
	private String searchKey;
	private String searchKeyword;
	private String pageIndex;

	/* 댓글 */
	private String comm_seq;
	private String comm_pseq;
	private String comm_step;
	private String comm_subject;
	private String comm_content;
	private String reply_user_id;
	private String comm_reply_subject;
	private String comm_reply_content;
	
	/* 마케팅용 */
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
	private int seq_nm;
	private String banner_zone_1;
	private String banner_zone_2;
	private String banner_zone_3;
	private String banner_target;
	private String banner_subject;
	private String banner_link;
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
	private String prod_id;
	private String prod_comment;
	private String prod_price;
	private String prod_min_price;
	private String prod_hit_cnt;
	
	/* 리뷰용 */
	private int total_cnt;
	private int total_star;
	private int star5_cnt;
	private int star4_cnt;
	private int star3_cnt;
	private int star2_cnt;
	private int star1_cnt;
	
	private int sql_limit;
	private String is_fav;
	private String bbs_use;
	
	//=========================================================
	
	public int getinsert_id() { return insert_id; }
	public void setinsert_id(int insert_id) { this.insert_id = insert_id; }
	
	/* bbs  */
	public String getbbs_seq() { return bbs_seq; }
	public void setbbs_seq(String bbs_seq) { this.bbs_seq = bbs_seq; }

	public String getbbs_id() { return bbs_id; }
	public void setbbs_id(String bbs_id) { this.bbs_id = bbs_id; }

	public String getuser_id() { return user_id; }
	public void setuser_id(String user_id) { this.user_id = user_id; }

	public String getbbs_writer_nm() { return bbs_writer_nm; }
	public void setbbs_writer_nm(String bbs_writer_nm) { this.bbs_writer_nm = bbs_writer_nm; }
	
	public String getbbs_reply_user_nm() { return bbs_reply_user_nm; }
	public void setbbs_reply_user_nm(String bbs_reply_user_nm) { this.bbs_reply_user_nm = bbs_reply_user_nm; }

	public String getbbs_writer_pwd() { return bbs_writer_pwd; }
	public void setbbs_writer_pwd(String bbs_writer_pwd) { this.bbs_writer_pwd = bbs_writer_pwd; }

	public String getbbs_writer_email() { return bbs_writer_email; }
	public void setbbs_writer_email(String bbs_writer_email) { this.bbs_writer_email = bbs_writer_email; }

	public String getbbs_writer_hp() { return bbs_writer_hp; }
	public void setbbs_writer_hp(String bbs_writer_hp) { this.bbs_writer_hp = bbs_writer_hp; }

	public String getbbs_category() { return bbs_category; }
	public void setbbs_category(String bbs_category) { this.bbs_category = bbs_category; }

	public String getbbs_notice_st() { return bbs_notice_st; }
	public void setbbs_notice_st(String bbs_notice_st) { this.bbs_notice_st = bbs_notice_st; }

	public String getbbs_secure_st() { return bbs_secure_st; }
	public void setbbs_secure_st(String bbs_secure_st) { this.bbs_secure_st = bbs_secure_st; }

	public String getbbs_subject() { return bbs_subject; }
	public void setbbs_subject(String bbs_subject) { this.bbs_subject = bbs_subject; }

	public String getbbs_content() { return bbs_content; }
	public void setbbs_content(String bbs_content) { this.bbs_content = bbs_content; }
	
	public String getbbs_reply_user_id() { return bbs_reply_user_id; }
	public void setbbs_reply_user_id(String bbs_reply_user_id) { this.bbs_reply_user_id = bbs_reply_user_id; }
	
	public String getbbs_reply_subject() { return bbs_reply_subject; }
	public void setbbs_reply_subject(String bbs_reply_subject) { this.bbs_reply_subject = bbs_reply_subject; }

	public String getbbs_reply_content() { return bbs_reply_content; }
	public void setbbs_reply_content(String bbs_reply_content) { this.bbs_reply_content = bbs_reply_content; }

	public String getbbs_hit_cnt() { return bbs_hit_cnt; }
	public void setbbs_hit_cnt(String bbs_hit_cnt) { this.bbs_hit_cnt = bbs_hit_cnt; }

	public String getbbs_file1() { return bbs_file1; }
	public void setbbs_file1(String bbs_file1) { this.bbs_file1 = bbs_file1; }

	public String getbbs_file2() { return bbs_file2; }
	public void setbbs_file2(String bbs_file2) { this.bbs_file2 = bbs_file2; }

	public String getbbs_link() { return bbs_link; }
	public void setbbs_link(String bbs_link) { this.bbs_link = bbs_link; }

	public String getreg_dt() { return reg_dt; }
	public void setreg_dt(String reg_dt) { this.reg_dt = reg_dt; }
	
	public String getreg_dt_ymd() { return reg_dt_ymd; }
	public void setreg_dt_ymd(String reg_dt_ymd) { this.reg_dt_ymd = reg_dt_ymd; }

	public String getreg_dt_his() { return reg_dt_his; }
	public void setreg_dt_his(String reg_dt_his) { this.reg_dt_his = reg_dt_his; }

	public String getmod_dt() { return mod_dt; }
	public void setmod_dt(String mod_dt) { this.mod_dt = mod_dt; }

	public String getdel_st() { return del_st; }
	public void setdel_st(String del_st) { this.del_st = del_st; }

	public String getdel_dt() { return del_dt; }
	public void setdel_dt(String del_dt) { this.del_dt = del_dt; }

	public String getreply_reg_dt() { return reply_reg_dt; }
	public void setreply_reg_dt(String reply_reg_dt) { this.reply_reg_dt = reply_reg_dt; }

	public String getreply_mod_dt() { return reply_mod_dt; }
	public void setreply_mod_dt(String reply_mod_dt) { this.reply_mod_dt = reply_mod_dt; }

	public String getreply_del_st() { return reply_del_st; }
	public void setreply_del_st(String reply_del_st) { this.reply_del_st = reply_del_st; }

	public String getcomm_cnt() { return comm_cnt; }
	public void setcomm_cnt(String comm_cnt) { this.comm_cnt = comm_cnt; }
	
	public String getbbs_store_id() { return bbs_store_id; }
	public void setbbs_store_id(String bbs_store_id) { this.bbs_store_id = bbs_store_id; }
	
	public String getbbs_prod_id() { return bbs_prod_id; }
	public void setbbs_prod_id(String bbs_prod_id) { this.bbs_prod_id = bbs_prod_id; }

	public String getbbs_store_category() { return bbs_store_category; }
	public void setbbs_store_category(String bbs_store_category) { this.bbs_store_category = bbs_store_category; }

	public String getbbs_cp1() { return bbs_cp1; }
	public void setbbs_cp1(String bbs_cp1) { this.bbs_cp1 = bbs_cp1; }

	public String getbbs_cp2() { return bbs_cp2; }
	public void setbbs_cp2(String bbs_cp2) { this.bbs_cp2 = bbs_cp2; }

	public String getbbs_cp3() { return bbs_cp3; }
	public void setbbs_cp3(String bbs_cp3) { this.bbs_cp3 = bbs_cp3; }

	public String getbbs_cp4() { return bbs_cp4; }
	public void setbbs_cp4(String bbs_cp4) { this.bbs_cp4 = bbs_cp4; }

	public String getbbs_cp5() { return bbs_cp5; }
	public void setbbs_cp5(String bbs_cp5) { this.bbs_cp5 = bbs_cp5; }

	public String getbbs_cp6() { return bbs_cp6; }
	public void setbbs_cp6(String bbs_cp6) { this.bbs_cp6 = bbs_cp6; }

	public String getbbs_cp7() { return bbs_cp7; }
	public void setbbs_cp7(String bbs_cp7) { this.bbs_cp7 = bbs_cp7; }

	public String getbbs_cp8() { return bbs_cp8; }
	public void setbbs_cp8(String bbs_cp8) { this.bbs_cp8 = bbs_cp8; }

	public String getbbs_cp9() { return bbs_cp9; }
	public void setbbs_cp9(String bbs_cp9) { this.bbs_cp9 = bbs_cp9; }

	public String getbbs_cp10() { return bbs_cp10; }
	public void setbbs_cp10(String bbs_cp10) { this.bbs_cp10 = bbs_cp10; }
	
	public String getuser_nm() { return user_nm; }
	public void setuser_nm(String user_nm) { this.user_nm = user_nm; }
	
	public String getstore_nm() { return store_nm; }
	public void setstore_nm(String store_nm) { this.store_nm = store_nm; }

	public String getprod_nm() { return prod_nm; }
	public void setprod_nm(String prod_nm) { this.prod_nm = prod_nm; }
	
	public String getprod_star() { return prod_star; }
	public void setprod_star(String prod_star) { this.prod_star = prod_star; }
	
	public String getprod_img_1() { return prod_img_1; }
	public void setprod_img_1(String prod_img_1) { this.prod_img_1 = prod_img_1; }

	public String getreply_user_nm() { return reply_user_nm; }
	public void setreply_user_nm(String reply_user_nm) { this.reply_user_nm = reply_user_nm; }
	
	public String getstore_category() { return store_category; }
	public void setstore_category(String store_category) { this.store_category = store_category; }
	
	public String getprod_category() { return prod_category; }
	public void setprod_category(String prod_category) { this.prod_category = prod_category; }
	
	public String getstore_category_nm() { return store_category_nm; }
	public void setstore_category_nm(String store_category_nm) { this.store_category_nm = store_category_nm; }

	public String getmodify_style() { return modify_style; }
	public void setmodify_style(String modify_style) { this.modify_style = modify_style; }
	
	public String getbbs_st_dt() { return bbs_st_dt; }
	public void setbbs_st_dt(String bbs_st_dt) { this.bbs_st_dt = bbs_st_dt; }
	
	public String getbbs_st_dt_ymd() { return bbs_st_dt_ymd; }
	public void setbbs_st_dt_ymd(String bbs_st_dt_ymd) { this.bbs_st_dt_ymd = bbs_st_dt_ymd; }

	public String getbbs_st_dt_hour() { return bbs_st_dt_hour; }
	public void setbbs_st_dt_hour(String bbs_st_dt_hour) { this.bbs_st_dt_hour = bbs_st_dt_hour; }

	public String getbbs_st_dt_minute() { return bbs_st_dt_minute; }
	public void setbbs_st_dt_minute(String bbs_st_dt_minute) { this.bbs_st_dt_minute = bbs_st_dt_minute; }

	public String getbbs_ed_dt() { return bbs_ed_dt; }
	public void setbbs_ed_dt(String bbs_ed_dt) { this.bbs_ed_dt = bbs_ed_dt; }
	
	public String getbbs_ed_dt_ymd() { return bbs_ed_dt_ymd; }
	public void setbbs_ed_dt_ymd(String bbs_ed_dt_ymd) { this.bbs_ed_dt_ymd = bbs_ed_dt_ymd; }

	public String getbbs_ed_dt_hour() { return bbs_ed_dt_hour; }
	public void setbbs_ed_dt_hour(String bbs_ed_dt_hour) { this.bbs_ed_dt_hour = bbs_ed_dt_hour; }

	public String getbbs_ed_dt_minute() { return bbs_ed_dt_minute; }
	public void setbbs_ed_dt_minute(String bbs_ed_dt_minute) { this.bbs_ed_dt_minute = bbs_ed_dt_minute; }
	
	public String getbbs_star() { return bbs_star; }
	public void setbbs_star(String bbs_star) { this.bbs_star = bbs_star; }
	
	public String getbbs_date_status() { return bbs_date_status; }
	public void setbbs_date_status(String bbs_date_status) { this.bbs_date_status = bbs_date_status; }
	
	public String getbbs_use_date() { return bbs_use_date; }
	public void setbbs_use_date(String bbs_use_date) { this.bbs_use_date = bbs_use_date; }
	

	/* 검색 */
	public String getsearchKey() { return searchKey; }
	public void setsearchKey(String searchKey) { this.searchKey = searchKey; }
	
	public String getsearchKeyword() { return searchKeyword; }
	public void setsearchKeyword(String searchKeyword) { this.searchKeyword = searchKeyword; }
	
	public String getppageIndex() { return pageIndex; }
	public void setpageIndex(String pageIndex) { this.pageIndex = pageIndex; }
	
	/* 댓글 */
	public String getcomm_seq() { return comm_seq; }
	public void setcomm_seq(String comm_seq) { this.comm_seq = comm_seq; }

	public String getcomm_pseq() { return comm_pseq; }
	public void setcomm_pseq(String comm_pseq) { this.comm_pseq = comm_pseq; }

	public String getcomm_step() { return comm_step; }
	public void setcomm_step(String comm_step) { this.comm_step = comm_step; }
	
	public String getcomm_subject() { return comm_subject; }
	public void setcomm_subject(String comm_subject) { this.comm_subject = comm_subject; }

	public String getcomm_content() { return comm_content; }
	public void setcomm_content(String comm_content) { this.comm_content = comm_content; }

	public String getreply_user_id() { return reply_user_id; }
	public void setreply_user_id(String reply_user_id) { this.reply_user_id = reply_user_id; }

	public String getcomm_reply_subject() { return comm_reply_subject; }
	public void setcomm_reply_subject(String comm_reply_subject) { this.comm_reply_subject = comm_reply_subject; }

	public String getcomm_reply_content() { return comm_reply_content; }
	public void setcomm_reply_content(String comm_reply_content) { this.comm_reply_content = comm_reply_content; }

	/* 마케팅용 */
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
	
	public int getseq_nm() { return seq_nm; }
	public void setseq_nm(int seq_nm) { this.seq_nm = seq_nm; }
	
	public String getbanner_zone_1() { return banner_zone_1; }
	public void setbanner_zone_1(String banner_zone_1) { this.banner_zone_1 = banner_zone_1; }

	public String getbanner_zone_2() { return banner_zone_2; }
	public void setbanner_zone_2(String banner_zone_2) { this.banner_zone_2 = banner_zone_2; }
	
	public String getbanner_zone_3() { return banner_zone_3; }
	public void setbanner_zone_3(String banner_zone_3) { this.banner_zone_3 = banner_zone_3; }
	
	public String getbanner_target() { return banner_target; }
	public void setbanner_target(String banner_target) { this.banner_target = banner_target; }
	
	public String getbanner_subject() { return banner_subject; }
	public void setbanner_subject(String banner_subject) { this.banner_subject = banner_subject; }

	public String getbanner_link() { return banner_link; }
	public void setbanner_link(String banner_link) { this.banner_link = banner_link; }

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


	public String getprod_id() { return prod_id; }
	public void setprod_id(String prod_id) { this.prod_id = prod_id; }

	public int getsql_limit() { return sql_limit; }
	public void setsql_limit(int sql_limit) { this.sql_limit = sql_limit; }
	
	public String getis_fav() { return is_fav; }
	public void setis_fav(String is_fav) { this.is_fav = is_fav; }
	
	public String getbbs_use() { return bbs_use; }
	public void setbbs_use(String bbs_use) { this.bbs_use = bbs_use; }

	public String getprod_comment() { return prod_comment; }
	public void setprod_comment(String prod_comment) { this.prod_comment = prod_comment; }

	public String getprod_price() { return prod_price; }
	public void setprod_price(String prod_price) { this.prod_price = prod_price; }
	
	public String getprod_min_price() { return prod_min_price; }
	public void setprod_min_price(String prod_min_price) { this.prod_min_price = prod_min_price; }
	
	public String getprod_hit_cnt() { return prod_hit_cnt; }
	public void setprod_hit_cnt(String prod_hit_cnt) { this.prod_hit_cnt = prod_hit_cnt; }
	
	/* 리뷰용 */
	public int gettotal_cnt() { return total_cnt; }
	public void settotal_cnt(int total_cnt) { this.total_cnt = total_cnt; }

	public int gettotal_star() { return total_star; }
	public void settotal_star(int total_star) { this.total_star = total_star; }

	public int getstar5_cnt() { return star5_cnt; }
	public void setstar5_cnt(int star5_cnt) { this.star5_cnt = star5_cnt; }

	public int getstar4_cnt() { return star4_cnt; }
	public void setstar4_cnt(int star4_cnt) { this.star4_cnt = star4_cnt; }

	public int getstar3_cnt() { return star3_cnt; }
	public void setstar3_cnt(int star3_cnt) { this.star3_cnt = star3_cnt; }

	public int getstar2_cnt() { return star2_cnt; }
	public void setstar2_cnt(int star2_cnt) { this.star2_cnt = star2_cnt; }

	public int getstar1_cnt() { return star1_cnt; }
	public void setstar1_cnt(int star1_cnt) { this.star1_cnt = star1_cnt; }
	
}
