package egovframework.admgrExtention.service.Impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.admgrExtention.service.AdmgrExtentionVO;
import egovframework.rte.psl.dataaccess.EgovAbstractDAO;

@Repository("AdmgrExtentionDAO")
public class AdmgrExtentionDAO extends EgovAbstractDAO {
	
	@SuppressWarnings("unchecked")
	public List<AdmgrExtentionVO> get_coupon_list(AdmgrExtentionVO admgrExtentionVO) {
		return (List<AdmgrExtentionVO>) list("get_coupon_list",admgrExtentionVO);
	}

	public int get_coupon_list_cnt(AdmgrExtentionVO admgrExtentionVO) {
		return (Integer) select("get_coupon_list_cnt",admgrExtentionVO);
	}

	public AdmgrExtentionVO get_coupon_info(AdmgrExtentionVO admgrExtentionVO) {
		return (AdmgrExtentionVO) select("get_coupon_info",admgrExtentionVO);
	}

	public AdmgrExtentionVO get_coupon_id_info(AdmgrExtentionVO admgrExtentionVO) {
		return (AdmgrExtentionVO) select("get_coupon_id_info",admgrExtentionVO);
	}
	
	@SuppressWarnings("unchecked")
	public List<AdmgrExtentionVO> get_modal_coupon_list(AdmgrExtentionVO admgrExtentionVO) {
		return (List<AdmgrExtentionVO>) list("get_modal_coupon_list",admgrExtentionVO);
	}
	
	public int get_modal_coupon_list_cnt(AdmgrExtentionVO admgrExtentionVO) {
		return (Integer) select("get_modal_coupon_list_cnt",admgrExtentionVO);
	}

	public void insert_coupon(AdmgrExtentionVO admgrExtentionVO) {
		insert("insert_coupon",admgrExtentionVO);
	}

	public void update_coupon(AdmgrExtentionVO admgrExtentionVO) {
		update("update_coupon",admgrExtentionVO);
	}

	public void delete_coupon(AdmgrExtentionVO admgrExtentionVO) {
		update("delete_coupon",admgrExtentionVO);
	}

	@SuppressWarnings("unchecked")
	public List<AdmgrExtentionVO> get_sms_member_list(AdmgrExtentionVO admgrExtentionVO) {
		return (List<AdmgrExtentionVO>) list("get_sms_member_list",admgrExtentionVO);
	}
	@SuppressWarnings("unchecked")
	public List<AdmgrExtentionVO> get_sms_store_list(AdmgrExtentionVO admgrExtentionVO) {
		return (List<AdmgrExtentionVO>) list("get_sms_store_list",admgrExtentionVO);
	}
	@SuppressWarnings("unchecked")
	public List<AdmgrExtentionVO> get_sms_list(AdmgrExtentionVO admgrExtentionVO) {
		return (List<AdmgrExtentionVO>) list("get_sms_list",admgrExtentionVO);
	}
	public int get_sms_member_list_cnt(AdmgrExtentionVO admgrExtentionVO) {
		return (Integer) select("get_sms_member_list_cnt",admgrExtentionVO);
	}
	public int get_sms_store_list_cnt(AdmgrExtentionVO admgrExtentionVO) {
		return (Integer) select("get_sms_store_list_cnt",admgrExtentionVO);
	}
	public int get_sms_list_cnt(AdmgrExtentionVO admgrExtentionVO) {
		return (Integer) select("get_sms_list_cnt",admgrExtentionVO);
	}
	public void sms_add(AdmgrExtentionVO admgrExtentionVO) {
		insert("sms_add",admgrExtentionVO);
	}
	public void sms_add_log(AdmgrExtentionVO admgrExtentionVO) {
		insert("sms_add_log",admgrExtentionVO);
	}
	
	

}