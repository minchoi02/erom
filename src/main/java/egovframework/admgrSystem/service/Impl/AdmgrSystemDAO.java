package egovframework.admgrSystem.service.Impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.admgrSystem.service.AdmgrSystemVO;
import egovframework.rte.psl.dataaccess.EgovAbstractDAO;

@Repository("AdmgrSystemDAO")
public class AdmgrSystemDAO extends EgovAbstractDAO {
		
	@SuppressWarnings("unchecked")
	public List<AdmgrSystemVO> get_cd_list(AdmgrSystemVO admgrSystemVO) {
		return (List<AdmgrSystemVO>) list("get_cd_list",admgrSystemVO);
	}
	public void update_cd(AdmgrSystemVO admgrSystemVO) {
		update("update_cd",admgrSystemVO);
	}
	
	public AdmgrSystemVO get_sms_templete(AdmgrSystemVO admgrSystemVO) {
		return (AdmgrSystemVO) select("get_sms_templete",admgrSystemVO);
	}
	public void set_sms_templete(AdmgrSystemVO admgrSystemVO) {
		update("set_sms_templete",admgrSystemVO);
	}
	
	public AdmgrSystemVO get_push_templete(AdmgrSystemVO admgrSystemVO) {
		return (AdmgrSystemVO) select("get_push_templete",admgrSystemVO);
	}
	public void set_push_templete(AdmgrSystemVO admgrSystemVO) {
		update("set_push_templete",admgrSystemVO);
	}
	
}
