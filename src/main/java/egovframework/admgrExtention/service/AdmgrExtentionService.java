package egovframework.admgrExtention.service;

import java.util.List;

public interface AdmgrExtentionService {

	/* 쿠폰목록 */
	public List<AdmgrExtentionVO> get_coupon_list(AdmgrExtentionVO admgrExtentionVO) throws Exception;
	
	 /* 쿠폰목록 갯수 */
	public int get_coupon_list_cnt(AdmgrExtentionVO admgrExtentionVO) throws Exception;	
	
	/* 쿠폰정보 호출 full - seq */
	 public AdmgrExtentionVO get_coupon_info(AdmgrExtentionVO admgrExtentionVO) throws Exception;
	 
	/* 쿠폰정보 호출 심플 - id */
	 public AdmgrExtentionVO get_coupon_id_info(AdmgrExtentionVO admgrExtentionVO) throws Exception;
	 
	 /* 모달 쿠폰정보 호출 */
	 public List<AdmgrExtentionVO> get_modal_coupon_list(AdmgrExtentionVO admgrExtentionVO) throws Exception;

	 /* 모달 쿠폰정보 호출 갯수 */
	 public int get_modal_coupon_list_cnt(AdmgrExtentionVO admgrExtentionVO) throws Exception;	
	 
	/* 쿠폰 등록 */
	 public void insert_coupon(AdmgrExtentionVO admgrExtentionVO) throws Exception;
	 
	/* 쿠폰 수정 */
	 public void update_coupon(AdmgrExtentionVO admgrExtentionVO) throws Exception;
	 
	/* 쿠폰 삭제 */
	 public void delete_coupon(AdmgrExtentionVO admgrExtentionVO) throws Exception;
	 
	 public List<AdmgrExtentionVO> get_sms_member_list(AdmgrExtentionVO admgrExtentionVO) throws Exception;
	 public List<AdmgrExtentionVO> get_sms_store_list(AdmgrExtentionVO admgrExtentionVO) throws Exception;
	 public List<AdmgrExtentionVO> get_sms_list(AdmgrExtentionVO admgrExtentionVO) throws Exception;
	 public int get_sms_member_list_cnt(AdmgrExtentionVO admgrExtentionVO) throws Exception;
	 public int get_sms_store_list_cnt(AdmgrExtentionVO admgrExtentionVO) throws Exception;
	 public int get_sms_list_cnt(AdmgrExtentionVO admgrExtentionVO) throws Exception;
	 
	 public void sms_add(AdmgrExtentionVO admgrExtentionVO) throws Exception;
	 public void sms_add_log(AdmgrExtentionVO admgrExtentionVO) throws Exception;
	 

}