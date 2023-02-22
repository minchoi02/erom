package egovframework.admgrProduct.service;

import java.util.List;

import egovframework.admgrProduct.service.AdmgrProductVO;

public interface AdmgrProductService {

	/* 상품목록 */
	public List<AdmgrProductVO> get_product_list(AdmgrProductVO admgrProductVO) throws Exception;
	
	/* 상품목록 추천상품 */
	public List<AdmgrProductVO> get_product_list_recom_travel(AdmgrProductVO admgrProductVO) throws Exception;
	
	 /* 상품목록 갯수 */
	public int get_product_list_cnt(AdmgrProductVO admgrProductVO) throws Exception;	

	 /* 모달 상품검색 */
	 public List<AdmgrProductVO> get_product_modal_list(AdmgrProductVO admgrProductVO) throws Exception;

	 /* 모달상품 갯수 */
	public int get_product_modal_list_cnt(AdmgrProductVO admgrProductVO) throws Exception;	

	/* 상점명 변경 ::: 상품검색편의를 위해 상품정보에 상점명을 넣는다. 상점정보에서 정보가 바뀌면 변경한다. */
	public void update_store_nm(AdmgrProductVO admgrProductVO) throws Exception;	
	
	/* 상품정보 호출 full - seq */
	 public AdmgrProductVO get_prod_info(AdmgrProductVO admgrProductVO) throws Exception;
	 
	 /* 상품정보 호출 simple - id */
	 public AdmgrProductVO get_prod_simple_id_info(AdmgrProductVO admgrProductVO) throws Exception;
	 
	 /* 상품정보 호출 추천상품정보 호춢 */
	 public AdmgrProductVO get_recom_info(AdmgrProductVO admgrProductVO) throws Exception;
	 
	 /* 상품등록 */
	 public int insert_product(AdmgrProductVO admgrProductVO) throws Exception;
	 
	 /* 상품수정 */
	 public void update_product(AdmgrProductVO admgrProductVO) throws Exception;
	 
	 /* 상품삭제 */
	 public void delete_product(AdmgrProductVO admgrProductVO) throws Exception;
	 
	 /* 옵션호출 */
	 public List<AdmgrProductVO> get_product_option(AdmgrProductVO admgrProductVO) throws Exception;
	 
	 /* 옵션등록 */
	 public void insert_product_option(AdmgrProductVO admgrProductVO) throws Exception;
	 
	 /* 옵션삭제 */
	 public void delete_product_option(AdmgrProductVO admgrProductVO) throws Exception;
	 
	 /* 옵션호출 */
	 public List<AdmgrProductVO> get_room_list(AdmgrProductVO admgrProductVO) throws Exception;

	 /* 숙박 - 방정보 */
	 public AdmgrProductVO get_room_info(AdmgrProductVO admgrProductVO) throws Exception;
	 
	 /* 옵션등록 */
	 public void insert_room(AdmgrProductVO admgrProductVO) throws Exception;

	 /* 옵션등록 */
	 public void update_room(AdmgrProductVO admgrProductVO) throws Exception;

	 /* 옵션등록 */
	 public void delete_room(AdmgrProductVO admgrProductVO) throws Exception;
	 
	 /* 순서조정 */
	 public void product_orderby_update(AdmgrProductVO admgrProductVO) throws Exception;

	 /* 상점관리자용 상점목록 */
	 public List<AdmgrProductVO> get_id_store_list(AdmgrProductVO admgrProductVO) throws Exception;
	
}
