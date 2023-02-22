package egovframework.admgrStore.service.Impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.admgrStore.service.AdmgrStoreVO;
import egovframework.rte.psl.dataaccess.EgovAbstractDAO;

@Repository("AdmgrStoreDAO")
public class AdmgrStoreDAO extends EgovAbstractDAO {

	@SuppressWarnings("unchecked")
	public List<AdmgrStoreVO> get_store_list(AdmgrStoreVO admgrStoreVO) {
		return (List<AdmgrStoreVO>) list("get_store_list", admgrStoreVO);
	}
	
	public int get_store_list_cnt(AdmgrStoreVO admgrStoreVO) {
		return (Integer) select("get_store_list_cnt", admgrStoreVO);
	}

	public AdmgrStoreVO get_store_info(AdmgrStoreVO admgrStoreVO) {
		return (AdmgrStoreVO) select("get_store_info", admgrStoreVO);
	}

	public AdmgrStoreVO get_store_simple_id_info(AdmgrStoreVO admgrStoreVO) {
		return (AdmgrStoreVO) select("get_store_simple_id_info", admgrStoreVO);
	}
	
	public void insert_store(AdmgrStoreVO admgrStoreVO) {
		insert("insert_store", admgrStoreVO);
	}
	
	public void update_store(AdmgrStoreVO admgrStoreVO) {
		update("update_store", admgrStoreVO);
	}

	@SuppressWarnings("unchecked")
	public List<AdmgrStoreVO> get_modal_store_list(AdmgrStoreVO admgrStoreVO) {
		return (List<AdmgrStoreVO>) list("get_modal_store_list", admgrStoreVO);
	}
	
	public int get_modal_store_list_cnt(AdmgrStoreVO admgrStoreVO) {
		return (Integer) select("get_modal_store_list_cnt", admgrStoreVO);
	}

	public void insert_deny_date(AdmgrStoreVO admgrStoreVO) {
		insert("insert_deny_date", admgrStoreVO);
	}
	
	public void delete_deny_date(AdmgrStoreVO admgrStoreVO) {
		delete("delete_deny_date", admgrStoreVO);
	}
	
	@SuppressWarnings("unchecked")
	public List<AdmgrStoreVO> get_deny_date_list(AdmgrStoreVO admgrStoreVO) {
		return (List<AdmgrStoreVO>) list("get_deny_date_list", admgrStoreVO);
	}
	
	public int get_deny_date_list_cnt(AdmgrStoreVO admgrStoreVO) {
		return (Integer) select("get_deny_date_list_cnt", admgrStoreVO);
	}
	
	@SuppressWarnings("unchecked")
	public List<AdmgrStoreVO> get_calc_list(AdmgrStoreVO admgrStoreVO) {
		return (List<AdmgrStoreVO>) list("get_calc_list", admgrStoreVO);
	}
	public int get_calc_list_cnt(AdmgrStoreVO admgrStoreVO) {
		return (Integer) select("get_calc_list_cnt", admgrStoreVO);
	}
	
	@SuppressWarnings("unchecked")
	public List<AdmgrStoreVO> get_calc_master_list(AdmgrStoreVO admgrStoreVO) {
		return (List<AdmgrStoreVO>) list("get_calc_master_list", admgrStoreVO);
	}
	
	@SuppressWarnings("unchecked")
	public List<AdmgrStoreVO> get_calc_detail_list(AdmgrStoreVO admgrStoreVO) {
		return (List<AdmgrStoreVO>) list("get_calc_detail_list", admgrStoreVO);
	}
	
	public void update_calc_content(AdmgrStoreVO admgrStoreVO) {
		update("update_calc_content", admgrStoreVO);
	}
	
	public void update_calc_status(AdmgrStoreVO admgrStoreVO) {
		update("update_calc_status", admgrStoreVO);
	}
	
	
}