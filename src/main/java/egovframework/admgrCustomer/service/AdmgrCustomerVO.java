package egovframework.admgrCustomer.service;

import egovframework.base.service.BasePagingVO;

public class AdmgrCustomerVO extends BasePagingVO {
	
	/* bbs  */
	private String bbs_seq;
	private String bbs_id;
	private String user_id;
	private String bbs_writer_nm;
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
	
	/*다음글, 이전글*/
	private String PRE_SEQ;
	private String NEXT_SEQ;
	private String PRE_SEQ2;
	private String NEXT_SEQ2;	
	
	private String user_nm;
	private String store_nm;
	private String prod_nm;
	private String prod_star;
	private String store_category_nm;
	private String reply_user_nm;
	private String store_category;
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
	
	private String store_id;
	private String user_level;

	
	//=========================================================
	
	/* bbs  */
	public String getbbs_seq() { return bbs_seq; }
	public void setbbs_seq(String bbs_seq) { this.bbs_seq = bbs_seq; }

	public String getbbs_id() { return bbs_id; }
	public void setbbs_id(String bbs_id) { this.bbs_id = bbs_id; }

	public String getuser_id() { return user_id; }
	public void setuser_id(String user_id) { this.user_id = user_id; }

	public String getbbs_writer_nm() { return bbs_writer_nm; }
	public void setbbs_writer_nm(String bbs_writer_nm) { this.bbs_writer_nm = bbs_writer_nm; }

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
	
	
	public String getPRE_SEQ() { return PRE_SEQ; }
	public void setPRE_SEQ(String PRE_SEQ) { this.PRE_SEQ = PRE_SEQ; }
	
	public String getNEXT_SEQ() { return NEXT_SEQ; }
	public void setNEXT_SEQ(String NEXT_SEQ) { this.NEXT_SEQ = NEXT_SEQ; }
	
	public String getPRE_SEQ2() { return PRE_SEQ2; }
	public void setPRE_SEQ2(String PRE_SEQ2) { this.PRE_SEQ2 = PRE_SEQ2; }
	
	public String getNEXT_SEQ2() { return NEXT_SEQ2; }
	public void setNEXT_SEQ2(String NEXT_SEQ2) { this.NEXT_SEQ2 = NEXT_SEQ2; }

	public String getprod_img_1() { return prod_img_1; }
	public void setprod_img_1(String prod_img_1) { this.prod_img_1 = prod_img_1; }

	public String getreply_user_nm() { return reply_user_nm; }
	public void setreply_user_nm(String reply_user_nm) { this.reply_user_nm = reply_user_nm; }
	
	public String getstore_category() { return store_category; }
	public void setstore_category(String store_category) { this.store_category = store_category; }
	
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

	public String getstore_id() { return store_id; }
	public void setstore_id(String store_id) { this.store_id = store_id; }

	public String getuser_level() { return user_level; }
	public void setuser_level(String user_level) { this.user_level = user_level; }
	
}