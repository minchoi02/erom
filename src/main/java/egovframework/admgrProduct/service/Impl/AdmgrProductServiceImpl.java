package egovframework.admgrProduct.service.Impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.admgrProduct.service.Impl.AdmgrProductDAO;
import egovframework.admgrProduct.service.AdmgrProductService;
import egovframework.admgrProduct.service.AdmgrProductVO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;


@Service("AdmgrProductService")
public class AdmgrProductServiceImpl extends EgovAbstractServiceImpl implements AdmgrProductService {
	
	@Resource(name="AdmgrProductDAO")
	private AdmgrProductDAO admgrProductDAO;

	/** ID Generation */
	@Resource(name = "egovIdGnrService")
	private EgovIdGnrService egovIdGnrService;
	
	@Override
	public List<AdmgrProductVO> get_product_list(AdmgrProductVO admgrProductVO) {
    	return admgrProductDAO.get_product_list(admgrProductVO);
    }

	@Override
	public List<AdmgrProductVO> get_product_list_recom_travel(AdmgrProductVO admgrProductVO) {
		return admgrProductDAO.get_product_list_recom_travel(admgrProductVO);
	}
	
	@Override
	public List<AdmgrProductVO> get_product_modal_list(AdmgrProductVO admgrProductVO) {
		return admgrProductDAO.get_product_modal_list(admgrProductVO);
	}
	
	@Override
	public int get_product_list_cnt(AdmgrProductVO admgrProductVO) {
    	return admgrProductDAO.get_product_list_cnt(admgrProductVO);
    }
	
	@Override
	public int get_product_modal_list_cnt(AdmgrProductVO admgrProductVO) {
		return admgrProductDAO.get_product_modal_list_cnt(admgrProductVO);
	}
	
	@Override
	public void update_store_nm(AdmgrProductVO admgrProductVO) {
		admgrProductDAO.update_store_nm(admgrProductVO);
	}
	
	@Override
	public AdmgrProductVO get_prod_info(AdmgrProductVO admgrProductVO) {
		return admgrProductDAO.get_prod_info(admgrProductVO);
	}
	
	@Override
	public AdmgrProductVO get_prod_simple_id_info(AdmgrProductVO admgrProductVO) {
		return admgrProductDAO.get_prod_simple_id_info(admgrProductVO);
	}
	
	@Override
	public AdmgrProductVO get_recom_info(AdmgrProductVO admgrProductVO) {
		return admgrProductDAO.get_recom_info(admgrProductVO);
	}
	
	@Override
	public int insert_product(AdmgrProductVO admgrProductVO) {
		return admgrProductDAO.insert_product(admgrProductVO);
	}
	
	@Override
	public void update_product(AdmgrProductVO admgrProductVO) {
		admgrProductDAO.update_product(admgrProductVO);
	}
	
	@Override
	public void delete_product(AdmgrProductVO admgrProductVO) {
		admgrProductDAO.delete_product(admgrProductVO);
	}
	
	@Override
	public List<AdmgrProductVO> get_product_option(AdmgrProductVO admgrProductVO) {
		return admgrProductDAO.get_product_option(admgrProductVO);
	}
	
	@Override
	public void insert_product_option(AdmgrProductVO admgrProductVO) {
		admgrProductDAO.insert_product_option(admgrProductVO);
	}
	
	@Override
	public void delete_product_option(AdmgrProductVO admgrProductVO) {
		admgrProductDAO.delete_product_option(admgrProductVO);
	}
	
	@Override
	public List<AdmgrProductVO> get_room_list(AdmgrProductVO admgrProductVO) {
		return admgrProductDAO.get_room_list(admgrProductVO);
	}
	
	@Override
	public AdmgrProductVO get_room_info(AdmgrProductVO admgrProductVO) {
		return admgrProductDAO.get_room_info(admgrProductVO);
	}
	
	@Override
	public void insert_room(AdmgrProductVO admgrProductVO) {
		admgrProductDAO.insert_room(admgrProductVO);
	}
	
	@Override
	public void update_room(AdmgrProductVO admgrProductVO) {
		admgrProductDAO.update_room(admgrProductVO);
	}
	
	@Override
	public void delete_room(AdmgrProductVO admgrProductVO) {
		admgrProductDAO.delete_room(admgrProductVO);
	}
	
	@Override
	public void product_orderby_update(AdmgrProductVO admgrProductVO) {
		admgrProductDAO.product_orderby_update(admgrProductVO);
	}
	
	@Override
	public List<AdmgrProductVO> get_id_store_list(AdmgrProductVO admgrProductVO) {
		return admgrProductDAO.get_id_store_list(admgrProductVO);
	}
	
}
