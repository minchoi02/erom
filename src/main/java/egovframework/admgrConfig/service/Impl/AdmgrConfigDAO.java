package egovframework.admgrConfig.service.Impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.admgrConfig.service.AdmgrConfigVO;
import egovframework.rte.psl.dataaccess.EgovAbstractDAO;

@Repository("AdmgrConfigDAO")
public class AdmgrConfigDAO extends EgovAbstractDAO {
		
	public AdmgrConfigVO get_base_config(AdmgrConfigVO admgrConfigVO) {
		return (AdmgrConfigVO) select("get_base_config",admgrConfigVO);
	}
	
	public void base_config_update(AdmgrConfigVO admgrConfigVO) {
		update("base_config_update",admgrConfigVO);
	}

	@SuppressWarnings("unchecked")
	public List<AdmgrConfigVO> get_popup_list(AdmgrConfigVO admgrConfigVO) {
		return (List<AdmgrConfigVO>) list("get_popup_list",admgrConfigVO);
	}
	
	public int get_popup_list_cnt(AdmgrConfigVO admgrConfigVO) {
		return (Integer) select("get_popup_list_cnt",admgrConfigVO);
	}

	public AdmgrConfigVO get_popup_info(AdmgrConfigVO admgrConfigVO) {
		return (AdmgrConfigVO) select("get_popup_info",admgrConfigVO);
	}
	
	public void insert_popup(AdmgrConfigVO admgrConfigVO) {
		insert("insert_popup",admgrConfigVO);
	}

	public void update_popup(AdmgrConfigVO admgrConfigVO) {
		update("update_popup",admgrConfigVO);
	}

	public void delete_popup(AdmgrConfigVO admgrConfigVO) {
		delete("delete_popup",admgrConfigVO);
	}


}
