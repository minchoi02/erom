package egovframework.admgrProduct.service.Impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.admgrProduct.service.AdmgrProductVO;
import egovframework.rte.psl.dataaccess.EgovAbstractDAO;

@Repository("AdmgrProductDAO")
public class AdmgrProductDAO extends EgovAbstractDAO {
	
	@SuppressWarnings("unchecked")
	public List<AdmgrProductVO> get_product_list(AdmgrProductVO admgrProductVO) {
		return (List<AdmgrProductVO>) list("get_product_list",admgrProductVO);
	}
	
	@SuppressWarnings("unchecked")
	public List<AdmgrProductVO> get_product_list_recom_travel(AdmgrProductVO admgrProductVO) {
		return (List<AdmgrProductVO>) list("get_product_list_recom_travel",admgrProductVO);
	}
	
	@SuppressWarnings("unchecked")
	public List<AdmgrProductVO> get_product_modal_list(AdmgrProductVO admgrProductVO) {
		return (List<AdmgrProductVO>) list("get_product_modal_list",admgrProductVO);
	}
	
	public int get_product_list_cnt(AdmgrProductVO admgrProductVO) {
		return (Integer) select("get_product_list_cnt",admgrProductVO);
	}

	public int get_product_modal_list_cnt(AdmgrProductVO admgrProductVO) {
		return (Integer) select("get_product_modal_list_cnt",admgrProductVO);
	}
	
	public void update_store_nm(AdmgrProductVO admgrProductVO) {
		update("update_store_nm",admgrProductVO);
	}
	
	public AdmgrProductVO get_prod_info(AdmgrProductVO admgrProductVO) {
		return (AdmgrProductVO) select("get_prod_info",admgrProductVO);
	}
	
	public AdmgrProductVO get_prod_simple_id_info(AdmgrProductVO admgrProductVO) {
		return (AdmgrProductVO) select("get_prod_simple_id_info",admgrProductVO);
	}
	
	public AdmgrProductVO get_recom_info(AdmgrProductVO admgrProductVO) {
		return (AdmgrProductVO) select("get_recom_info",admgrProductVO);
	}
	
	public int insert_product(AdmgrProductVO admgrProductVO) {
		return (Integer) insert("insert_product",admgrProductVO);
	}
	
	public void update_product(AdmgrProductVO admgrProductVO) {
		update("update_product",admgrProductVO);
	}
	
	public void delete_product(AdmgrProductVO admgrProductVO) {
		update("delete_product",admgrProductVO);
	}

	@SuppressWarnings("unchecked")
	public List<AdmgrProductVO> get_product_option(AdmgrProductVO admgrProductVO) {
		return (List<AdmgrProductVO>) list("get_product_option",admgrProductVO);
	}
	
	public void insert_product_option(AdmgrProductVO admgrProductVO) {
		update("insert_product_option",admgrProductVO);
	}

	public void delete_product_option(AdmgrProductVO admgrProductVO) {
		update("delete_product_option",admgrProductVO);
	}

	@SuppressWarnings("unchecked")
	public List<AdmgrProductVO> get_room_list(AdmgrProductVO admgrProductVO) {
		return (List<AdmgrProductVO>) list("get_room_list",admgrProductVO);
	}
	
	public AdmgrProductVO get_room_info(AdmgrProductVO admgrProductVO) {
		return (AdmgrProductVO) select("get_room_info",admgrProductVO);
	}
	
	public void insert_room(AdmgrProductVO admgrProductVO) {
		insert("insert_room",admgrProductVO);
	}

	public void update_room(AdmgrProductVO admgrProductVO) {
		update("update_room",admgrProductVO);
	}

	public void delete_room(AdmgrProductVO admgrProductVO) {
		update("delete_room",admgrProductVO);
	}

	public void product_orderby_update(AdmgrProductVO admgrProductVO) {
		update("product_orderby_update",admgrProductVO);
	}
	
	@SuppressWarnings("unchecked")
	public List<AdmgrProductVO> get_id_store_list(AdmgrProductVO admgrProductVO) {
		return (List<AdmgrProductVO>) list("get_id_store_list",admgrProductVO);
	}

}
