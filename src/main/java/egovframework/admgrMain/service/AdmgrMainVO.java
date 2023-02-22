package egovframework.admgrMain.service;

import egovframework.admgrMain.service.AdmgrMainVO;
import egovframework.base.service.BasePagingVO;

public class AdmgrMainVO extends BasePagingVO {
	
	private int list_cnt;
	
	private String user_seq;
	private String user_id;
	private String user_nm;
	private String user_level;
	private String user_join_fl;
	
	private String order_seq;
	private String order_id;
	private String order_user_id;
	private String order_user_nm;
	private String order_st;
	private String order_total_price;
	
	private String bbs_seq;
	private String bbs_id;
	private String bbs_subject;
	private String bbs_writer_nm;
	private String bbs_content;
	private String bbs_reply_content;
	private String bbs_prod_id;
	private String prod_nm;
	private String store_category_nm;
	
	private String prod_seq;
	private String prod_use_st;
	private String store_nm;
	
	private String store_seq;
	private String store_company_nm;
	private String store_use_st;
	private String store_category;
	
	private String reg_dt;
	private String store_id;
	
	//=========================================================

	/* 공통 */
	public String getreg_dt() { return reg_dt; }
	public void setreg_dt(String reg_dt) { this.reg_dt = reg_dt; }

	public int getlist_cnt() { return list_cnt; }
	public void setlist_cnt(int list_cnt) { this.list_cnt = list_cnt; }
	
	/* 회원 */
	public String getuser_seq() { return user_seq; }
	public void setuser_seq(String user_seq) { this.user_seq = user_seq; }
	
	public String getuser_id() { return user_id; }
	public void setuser_id(String user_id) { this.user_id = user_id; }

	public String getuser_nm() { return user_nm; }
	public void setuser_nm(String user_nm) { this.user_nm = user_nm; }

	public String getuser_level() { return user_level; }
	public void setuser_level(String user_level) { this.user_level = user_level; }

	public String getuser_join_fl() { return user_join_fl; }
	public void setuser_join_fl(String user_join_fl) { this.user_join_fl = user_join_fl; }

	/* 주문 */
	public String getorder_seq() { return order_seq; }
	public void setorder_seq(String order_seq) { this.order_seq = order_seq; }
	
	public String getorder_id() { return order_id; }
	public void setorder_id(String order_id) { this.order_id = order_id; }
	
	public String getorder_user_id() { return order_user_id; }
	public void setorder_user_id(String order_user_id) { this.order_user_id = order_user_id; }

	public String getorder_user_nm() { return order_user_nm; }
	public void setorder_user_nm(String order_user_nm) { this.order_user_nm = order_user_nm; }

	public String getorder_st() { return order_st; }
	public void setorder_st(String order_st) { this.order_st = order_st; }

	public String getorder_total_price() { return order_total_price; }
	public void setorder_total_price(String order_total_price) { this.order_total_price = order_total_price; }
	
	/* 게시판 */
	public String getbbs_seq() { return bbs_seq; }
	public void setbbs_seq(String bbs_seq) { this.bbs_seq = bbs_seq; }
	
	public String getbbs_id() { return bbs_id; }
	public void setbbs_id(String bbs_id) { this.bbs_id = bbs_id; }

	public String getbbs_subject() { return bbs_subject; }
	public void setbbs_subject(String bbs_subject) { this.bbs_subject = bbs_subject; }
	
	public String getbbs_writer_nm() { return bbs_writer_nm; }
	public void setbbs_writer_nm(String bbs_writer_nm) { this.bbs_writer_nm = bbs_writer_nm; }
	
	public String getbbs_content() { return bbs_content; }
	public void setbbs_content(String bbs_content) { this.bbs_content = bbs_content; }

	public String getbbs_reply_content() { return bbs_reply_content; }
	public void setbbs_reply_content(String bbs_reply_content) { this.bbs_reply_content = bbs_reply_content; }

	public String getbbs_prod_id() { return bbs_prod_id; }
	public void setbbs_prod_id(String bbs_prod_id) { this.bbs_prod_id = bbs_prod_id; }
	
	public String getstore_category_nm() { return store_category_nm; }
	public void setstore_category_nm(String store_category_nm) { this.store_category_nm = store_category_nm; }

	
	/* 상품 */
	public String getprod_seq() { return prod_seq; }
	public void setprod_seq(String prod_seq) { this.prod_seq = prod_seq; }

	public String getprod_use_st() { return prod_use_st; }
	public void setprod_use_st(String prod_use_st) { this.prod_use_st = prod_use_st; }

	public String getstore_nm() { return store_nm; }
	public void setstore_nm(String store_nm) { this.store_nm = store_nm; }

	public String getprod_nm() { return prod_nm; }
	public void setprod_nm(String prod_nm) { this.prod_nm = prod_nm; }
	
	public String getstore_category() { return store_category; }
	public void setstore_category(String store_category) { this.store_category = store_category; }
	
	/* 상점 */
	public String getstore_seq() { return store_seq; }
	public void setstore_seq(String store_seq) { this.store_seq = store_seq; }

	public String getstore_company_nm() { return store_company_nm; }
	public void setstore_company_nm(String store_company_nm) { this.store_company_nm = store_company_nm; }

	public String getstore_use_st() { return store_use_st; }
	public void setstore_use_st(String store_use_st) { this.store_use_st = store_use_st; }

	public String getstore_id() { return store_id; }
	public void setstore_id(String store_id) { this.store_id = store_id; }
	
}