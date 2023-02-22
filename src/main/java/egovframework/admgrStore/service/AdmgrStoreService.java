package egovframework.admgrStore.service;

import java.util.List;

public interface AdmgrStoreService {

	/* 스토어 목록 */	
	public List<AdmgrStoreVO> get_store_list(AdmgrStoreVO admgrStoreVO) throws Exception;
	
	/* 스토어 목록 갯수 */
	public int get_store_list_cnt(AdmgrStoreVO admgrStoreVO) throws Exception;
	
	/* 스토어 정보 full - seq*/
	public AdmgrStoreVO get_store_info(AdmgrStoreVO admgrStoreVO) throws Exception;

	/* 스토어 정보 simple - id*/
	public AdmgrStoreVO get_store_simple_id_info(AdmgrStoreVO admgrStoreVO) throws Exception;
	
	/* 스토어 등록 */
	public void insert_store(AdmgrStoreVO admgrStoreVO) throws Exception;
	
	/* 스토어 수정 */
	public void update_store(AdmgrStoreVO admgrStoreVO) throws Exception;
	
	/* 스토어 목록 */	
	public List<AdmgrStoreVO> get_modal_store_list(AdmgrStoreVO admgrStoreVO) throws Exception;
	
	/* 스토어 목록 갯수 */
	public int get_modal_store_list_cnt(AdmgrStoreVO admgrStoreVO) throws Exception;

	/* 스토어 예약불가일 등록 */
	public void insert_deny_date(AdmgrStoreVO admgrStoreVO) throws Exception;
	
	/* 스토어 예약불가일 삭제 */
	public void delete_deny_date(AdmgrStoreVO admgrStoreVO) throws Exception;
	
	/* 스토어 예약불가일 목록 */
	public List<AdmgrStoreVO> get_deny_date_list(AdmgrStoreVO admgrStoreVO) throws Exception;

	/* 스토어 예약불가일 갯수 */
	public int get_deny_date_list_cnt(AdmgrStoreVO admgrStoreVO) throws Exception;
	
	/* 정산리스트 */
	public List<AdmgrStoreVO> get_calc_list(AdmgrStoreVO admgrStoreVO) throws Exception;
	public int get_calc_list_cnt(AdmgrStoreVO admgrStoreVO) throws Exception;
	
	public List<AdmgrStoreVO> get_calc_master_list(AdmgrStoreVO admgrStoreVO) throws Exception;
	public List<AdmgrStoreVO> get_calc_detail_list(AdmgrStoreVO admgrStoreVO) throws Exception;

	public void update_calc_content(AdmgrStoreVO admgrStoreVO) throws Exception;
	public void update_calc_status(AdmgrStoreVO admgrStoreVO) throws Exception;
	
}
