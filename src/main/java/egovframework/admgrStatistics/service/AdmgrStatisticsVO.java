package egovframework.admgrStatistics.service;

import egovframework.base.service.BasePagingVO;
public class AdmgrStatisticsVO extends BasePagingVO {

	private int cnt;
	private String keywords;
	private String reg_dt;
	private String od_store_category;
	private String od_prod_nm;
	
	//===============================================================================================================
	
	public int getcnt() { return cnt; }
	public void setcnt(int cnt) { this.cnt = cnt; }
	
	public String getkeywords() { return keywords; }
	public void setkeywords(String keywords) { this.keywords = keywords; }
	
	public String getreg_dt() { return reg_dt; }
	public void setreg_dt(String reg_dt) { this.reg_dt = reg_dt; }
	
	public String getod_store_category() { return od_store_category; }
	public void setod_store_category(String od_store_category) { this.od_store_category = od_store_category; }
	
	public String getod_prod_nm() { return od_prod_nm; }
	public void setod_prod_nm(String od_prod_nm) { this.od_prod_nm = od_prod_nm; }
	
}