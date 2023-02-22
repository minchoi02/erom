package egovframework.admgrSystem.service;

import egovframework.admgrSystem.service.AdmgrSystemVO;
import egovframework.base.service.BasePagingVO;

public class AdmgrSystemVO extends BasePagingVO {
	
	private String base_gp_cd;
	private String base_cd;
	private String base_cd_nm;
	private String base_api_cd;
	private String base_use_st;
	private String base_nm_st;
	private String base_mod_st;
	private String base_orderby;
	
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
	
	//-------------------------------------------------
	
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

	public String getbase_orderby() { return base_orderby; }
	public void setbase_orderby(String base_orderby) { this.base_orderby = base_orderby; }
	
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
	
}