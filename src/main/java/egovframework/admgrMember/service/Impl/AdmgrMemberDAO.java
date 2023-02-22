package egovframework.admgrMember.service.Impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.admgrMember.service.AdmgrMemberVO;
import egovframework.rte.psl.dataaccess.EgovAbstractDAO;

@Repository("AdmgrMemberDAO")
public class AdmgrMemberDAO extends EgovAbstractDAO {
		
	@SuppressWarnings("unchecked")
	public List<AdmgrMemberVO> get_member_list(AdmgrMemberVO admgrMemberVO) {
		return (List<AdmgrMemberVO>) list("get_member_list",admgrMemberVO);
	}
	
	public int get_member_list_cnt(AdmgrMemberVO admgrMemberVO) {
		return (Integer) select("get_member_list_cnt",admgrMemberVO);
	}
	
	@SuppressWarnings("unchecked")
	public List<AdmgrMemberVO> get_modal_member_list(AdmgrMemberVO admgrMemberVO) {
		return (List<AdmgrMemberVO>) list("get_modal_member_list",admgrMemberVO);
	}
	
	public int get_modal_member_list_cnt(AdmgrMemberVO admgrMemberVO) {
		return (Integer) select("get_modal_member_list_cnt",admgrMemberVO);
	}
	
	public int get_is_check_id_cnt(AdmgrMemberVO admgrMemberVO) {
		return (Integer) select("get_is_check_id_cnt",admgrMemberVO);
	}
	
	public void update_member(AdmgrMemberVO admgrMemberVO) {
		update("update_member",admgrMemberVO);
	}
	
	public void last_login_member(AdmgrMemberVO admgrMemberVO) {
		update("last_login_member",admgrMemberVO);
	}
	
	public void log_login_member(AdmgrMemberVO admgrMemberVO) {
		insert("log_login_member",admgrMemberVO);
	}
	
	public void insert_member(AdmgrMemberVO admgrMemberVO) {
		insert("insert_member",admgrMemberVO);
	}
	
	public AdmgrMemberVO get_member_info(AdmgrMemberVO admgrMemberVO) {
		return (AdmgrMemberVO) select("get_member_info",admgrMemberVO);
	}

	public AdmgrMemberVO get_member_id_info(AdmgrMemberVO admgrMemberVO) {
		return (AdmgrMemberVO) select("get_member_id_info",admgrMemberVO);
	}
	
	public AdmgrMemberVO get_is_member_data(AdmgrMemberVO admgrMemberVO) {
		return (AdmgrMemberVO) select("get_is_member_data",admgrMemberVO);
	}
	
	@SuppressWarnings("unchecked")
	public List<AdmgrMemberVO> get_member_addr_list(AdmgrMemberVO admgrMemberVO) {
		return (List<AdmgrMemberVO>) list("get_member_addr_list",admgrMemberVO);
	}
	
	public int get_member_mileage_total(AdmgrMemberVO admgrMemberVO) {
		return (Integer) select("get_member_mileage_total", admgrMemberVO);
	}
	
	public int get_member_mileage_cnt(AdmgrMemberVO admgrMemberVO) {
		return (Integer) select("get_member_mileage_cnt", admgrMemberVO);
	}
	
	@SuppressWarnings("unchecked")
	public List<AdmgrMemberVO> get_member_mileage_list(AdmgrMemberVO admgrMemberVO) {
		return (List<AdmgrMemberVO>) list("get_member_mileage_list", admgrMemberVO);
	}

	public void insert_mileage(AdmgrMemberVO admgrMemberVO) {
		insert("insert_mileage",admgrMemberVO);
	}
	
	@SuppressWarnings("unchecked")
	public void update_user_mileage(AdmgrMemberVO admgrMemberVO) {
		update("update_user_mileage", admgrMemberVO);
	}
	


}
