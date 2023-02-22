package egovframework.admgrStore.service.Impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.admgrStore.service.AdmgrStoreService;
import egovframework.admgrStore.service.AdmgrStoreVO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;

@Service("AdmgrStoreService")
public class AdmgrStoreServiceImpl extends EgovAbstractServiceImpl implements AdmgrStoreService {

	@Resource(name="AdmgrStoreDAO")
	private AdmgrStoreDAO admgrStoreDAO;
	
	/* ID Generation */
	@Resource(name="egovIdGnrService")
	private EgovIdGnrService egovIdGnrService;

	@Override
	public List<AdmgrStoreVO> get_store_list(AdmgrStoreVO admgrStoreVO) {
		return admgrStoreDAO.get_store_list(admgrStoreVO);
	}
	
	@Override
	public int get_store_list_cnt(AdmgrStoreVO admgrStoreVO) {
		return admgrStoreDAO.get_store_list_cnt(admgrStoreVO);
	}
	
	@Override
	public AdmgrStoreVO get_store_info(AdmgrStoreVO admgrStoreVO) {
		return admgrStoreDAO.get_store_info(admgrStoreVO);
	}	

	@Override
	public AdmgrStoreVO get_store_simple_id_info(AdmgrStoreVO admgrStoreVO) {
		return admgrStoreDAO.get_store_simple_id_info(admgrStoreVO);
	}	
	
	@Override
	public void insert_store(AdmgrStoreVO admgrStoreVO) {
		admgrStoreDAO.insert_store(admgrStoreVO);
	}	
	
	@Override
	public void update_store(AdmgrStoreVO admgrStoreVO) {
		admgrStoreDAO.update_store(admgrStoreVO);
	}	

	@Override
	public List<AdmgrStoreVO> get_modal_store_list(AdmgrStoreVO admgrStoreVO) {
		return admgrStoreDAO.get_modal_store_list(admgrStoreVO);
	}
	
	@Override
	public int get_modal_store_list_cnt(AdmgrStoreVO admgrStoreVO) {
		return admgrStoreDAO.get_modal_store_list_cnt(admgrStoreVO);
	}

	@Override
	public void insert_deny_date(AdmgrStoreVO admgrStoreVO) {
		admgrStoreDAO.insert_deny_date(admgrStoreVO);
	}	
	
	@Override
	public void delete_deny_date(AdmgrStoreVO admgrStoreVO) {
		admgrStoreDAO.delete_deny_date(admgrStoreVO);
	}	
	
	@Override
	public List<AdmgrStoreVO> get_deny_date_list(AdmgrStoreVO admgrStoreVO) {
		return admgrStoreDAO.get_deny_date_list(admgrStoreVO);
	}
	
	@Override
	public int get_deny_date_list_cnt(AdmgrStoreVO admgrStoreVO) {
		return admgrStoreDAO.get_deny_date_list_cnt(admgrStoreVO);
	}
	
	@Override
	public List<AdmgrStoreVO> get_calc_list(AdmgrStoreVO admgrStoreVO) {
		return admgrStoreDAO.get_calc_list(admgrStoreVO);
	}
	
	@Override
	public int get_calc_list_cnt(AdmgrStoreVO admgrStoreVO) {
		return admgrStoreDAO.get_calc_list_cnt(admgrStoreVO);
	}
	
	@Override
	public List<AdmgrStoreVO> get_calc_master_list(AdmgrStoreVO admgrStoreVO) {
		return admgrStoreDAO.get_calc_master_list(admgrStoreVO);
	}
	
	@Override
	public List<AdmgrStoreVO> get_calc_detail_list(AdmgrStoreVO admgrStoreVO) {
		return admgrStoreDAO.get_calc_detail_list(admgrStoreVO);
	}
	
	@Override
	public void update_calc_content(AdmgrStoreVO admgrStoreVO) {
		admgrStoreDAO.update_calc_content(admgrStoreVO);
	}
	
	@Override
	public void update_calc_status(AdmgrStoreVO admgrStoreVO) {
		admgrStoreDAO.update_calc_status(admgrStoreVO);
	}
	

	
	
}