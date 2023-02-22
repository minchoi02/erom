package egovframework.admgrSystem.service;

import java.util.List;

public interface AdmgrSystemService {

	public List<AdmgrSystemVO> get_cd_list(AdmgrSystemVO admgrSystemVO) throws Exception;
	public void update_cd(AdmgrSystemVO admgrSystemVO) throws Exception;
	
	public AdmgrSystemVO get_sms_templete(AdmgrSystemVO admgrSystemVO) throws Exception;
	public void set_sms_templete(AdmgrSystemVO admgrSystemVO) throws Exception;
	
	public AdmgrSystemVO get_push_templete(AdmgrSystemVO admgrSystemVO) throws Exception;
	public void set_push_templete(AdmgrSystemVO admgrSystemVO) throws Exception;
	
}