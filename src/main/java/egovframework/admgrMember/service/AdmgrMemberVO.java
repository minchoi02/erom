package egovframework.admgrMember.service;

import egovframework.base.service.BasePagingVO;

public class AdmgrMemberVO extends BasePagingVO {
	
	/* 회원정보*/
	private String user_seq;
	private String user_join_fl;
	private String user_id;
	private String user_nm;
	private String user_pwd;
	private String user_level;
	private String user_sex_fl;
	private String user_tel;
	private String user_hp;
	private String user_email;
	private String user_st;
	private String user_total_mileage;
	private String reg_dt;
	private String mod_dt;
	private String withdraw_dt;
	private String deny_dt;
	private String last_login_dt;
	private String next_change_pwd_dt;
	private String set_change_pwd_dt;
	private String user_admin_memo;
	private String withdraw_reason_text;
	private String withdraw_reason;
	private String user_passwd_temp;

	private String searchKey;
	private String searchKeyword;

	private String modalsearchKey;
	private String modalsearchKeyword;
	
	/* 회원주소록 */
	private String addr_seq;
	private String addr_default;
	private String addr_nm;
	private String addr_hp;
	private String addr_email;
	private String addr_zip;
	private String addr_1;
	private String addr_2;
	private String del_st;
	
	/* 회원마이리리지 */
	private String total_mileage;
	private String mileage_seq;
	private String user_mileage;
	private String user_mileage_set;
	private String user_mileage_content;
	private String user_mileage_step_sum;
	
	//=========================================================

	public String getuser_seq() { return user_seq; }
	public void setuser_seq(String user_seq) { this.user_seq= user_seq; }
	
	public String getuser_join_fl() { return user_join_fl; }
	public void setuser_join_fl(String user_join_fl) { this.user_join_fl = user_join_fl; }

	public String getuser_id() { return user_id; }
	public void setuser_id(String user_id) { this.user_id = user_id; }
	
	public String getuser_nm() { return user_nm; }
	public void setuser_nm(String user_nm) { this.user_nm = user_nm; }
	
	public String getuser_pwd() { return user_pwd; }
	public void setuser_pwd(String user_pwd) { this.user_pwd = user_pwd; }
	
	public String getuser_level() { return user_level; }
	public void setuser_level(String user_level) { this.user_level = user_level; }

	public String getuser_sex_fl() { return user_sex_fl; }
	public void setuser_sex_fl(String user_sex_fl) { this.user_sex_fl = user_sex_fl; }
	
	public String getuser_tel() { return user_tel; }
	public void setuser_tel(String user_tel) { this.user_tel = user_tel; }
	
	public String getuser_hp() { return user_hp; }
	public void setuser_hp(String user_hp) { this.user_hp = user_hp; }
	
	public String getuser_email() { return user_email; }
	public void setuser_email(String user_email) { this.user_email = user_email; }
	
	public String getuser_st() { return user_st; }
	public void setuser_st(String user_st) { this.user_st = user_st; }
	
	public String getuser_total_mileage() { return user_total_mileage; }
	public void setuser_total_mileage(String user_total_mileage) { this.user_total_mileage = user_total_mileage; }
	
	public String getreg_dt() { return reg_dt; }
	public void setreg_dt(String reg_dt) { this.reg_dt = reg_dt; }

	public String getmod_dt() { return mod_dt; }
	public void setmod_dt(String mod_dt) { this.mod_dt = mod_dt; }

	public String getwithdraw_dt() { return withdraw_dt; }
	public void setwithdraw_dt(String withdraw_dt) { this.withdraw_dt = withdraw_dt; }
	
	public String getdeny_dt() { return deny_dt; }
	public void setdeny_dt(String deny_dt) { this.deny_dt = deny_dt; }
	
	public String getlast_login_dt() { return last_login_dt; }
	public void setlast_login_dt(String last_login_dt) { this.last_login_dt = last_login_dt; }
	
	public String getnext_change_pwd_dt() { return next_change_pwd_dt; }
	public void setnext_change_pwd_dt(String next_change_pwd_dt) { this.next_change_pwd_dt = next_change_pwd_dt; }
	
	public String getset_change_pwd_dt() { return set_change_pwd_dt; }
	public void setset_change_pwd_dt(String set_change_pwd_dt) { this.set_change_pwd_dt = set_change_pwd_dt; }
	
	public String getuser_admin_memo() { return user_admin_memo; }
	public void setuser_admin_memo(String user_admin_memo) { this.user_admin_memo = user_admin_memo; }
	
	/* 검색용 */
	public String getsearchKey() { return searchKey; }
	public void setsearchKey(String searchKey) { this.searchKey = searchKey; }
	
	public String getsearchKeyword() { return searchKeyword; }
	public void setsearchKeyword(String searchKeyword) { this.searchKeyword = searchKeyword; }
	
	public String getmodalsearchKey() { return modalsearchKey; }
	public void setmodalsearchKey(String modalsearchKey) { this.modalsearchKey = modalsearchKey; }
	
	public String getmodalsearchKeyword() { return modalsearchKeyword; }
	public void setmodalsearchKeyword(String modalsearchKeyword) { this.modalsearchKeyword = modalsearchKeyword; }

	
	/* 회원주소록 */
	public String getaddr_seq() { return addr_seq; }
	public void setaddr_seq(String addr_seq) { this.addr_seq = addr_seq; }

	public String getaddr_default() { return addr_default; }
	public void setaddr_default(String addr_default) { this.addr_default = addr_default; }
	
	public String getaddr_nm() { return addr_nm; }
	public void setaddr_nm(String addr_nm) { this.addr_nm = addr_nm; }
	
	public String getaddr_hp() { return addr_hp; }
	public void setaddr_hp(String addr_hp) { this.addr_hp = addr_hp; }
	
	public String getaddr_email() { return addr_email; }
	public void setaddr_email(String addr_email) { this.addr_email = addr_email; }
	
	public String getaddr_zip() { return addr_zip; }
	public void setaddr_zip(String addr_zip) { this.addr_zip = addr_zip; }
	
	public String getaddr_1() { return addr_1; }
	public void setaddr_1(String addr_1) { this.addr_1 = addr_1; }
	
	public String getaddr_2() { return addr_2; }
	public void setaddr_2(String addr_2) { this.addr_2 = addr_2; }
	
	public String getdel_st() { return del_st; }
	public void setdel_st(String del_st) { this.del_st = del_st; }
	
	/* 회원마일리지 */
	public String gettotal_mileage() { return total_mileage; }
	public void settotal_mileage(String total_mileage) { this.total_mileage = total_mileage; }
	
	public String getmileage_seq() { return mileage_seq; }
	public void setmileage_seq(String mileage_seq) { this.mileage_seq = mileage_seq; }
	
	public String getuser_mileage_set() { return user_mileage_set; }
	public void setuser_mileage_set(String user_mileage_set) { this.user_mileage_set = user_mileage_set; }

	public String getuser_mileage() { return user_mileage; }
	public void setuser_mileage(String user_mileage) { this.user_mileage = user_mileage; }

	public String getuser_mileage_content() { return user_mileage_content; }
	public void setuser_mileage_content(String user_mileage_content) { this.user_mileage_content = user_mileage_content; }
	
	public String getuser_mileage_step_sum() { return user_mileage_step_sum; }
	public void setuser_mileage_step_sum(String user_mileage_step_sum) { this.user_mileage_step_sum = user_mileage_step_sum; }

	public String getwithdraw_reason_text() { return withdraw_reason_text; }
	public void setwithdraw_reason_text(String withdraw_reason_text) { this.withdraw_reason_text = withdraw_reason_text; }
	
	public String getuser_passwd_temp() { return user_passwd_temp; }
	public void setuser_passwd_temp(String user_passwd_temp) { this.user_passwd_temp = user_passwd_temp; }

	public String getwithdraw_reason() { return withdraw_reason; }
	public void setwithdraw_reason(String withdraw_reason) { this.withdraw_reason = withdraw_reason; }
}