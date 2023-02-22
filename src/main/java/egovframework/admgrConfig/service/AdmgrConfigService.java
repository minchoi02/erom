package egovframework.admgrConfig.service;

import java.util.List;

public interface AdmgrConfigService {

	/* 기본환경 호출 */
	public AdmgrConfigVO get_base_config(AdmgrConfigVO admgrConfigVO) throws Exception;
	
	/* 기본환경 저장 */
	public void base_config_update(AdmgrConfigVO admgrConfigVO) throws Exception;
	
	/* 팝업목록 */
	public List<AdmgrConfigVO> get_popup_list(AdmgrConfigVO admgrConfigVO) throws Exception;
	
	/* 팝업목록 갯수 */
	public int get_popup_list_cnt(AdmgrConfigVO admgrConfigVO) throws Exception;

	/* 팝업상세  */
	public AdmgrConfigVO get_popup_info(AdmgrConfigVO admgrConfigVO) throws Exception;
	
	/* 팝업등록  */
	public void insert_popup(AdmgrConfigVO admgrConfigVO) throws Exception;
	
	/* 팝업수정  */
	public void update_popup(AdmgrConfigVO admgrConfigVO) throws Exception;
	
	/* 팝업삭제  */
	public void delete_popup(AdmgrConfigVO admgrConfigVO) throws Exception;
	
	
}