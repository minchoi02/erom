package egovframework.admgrExtention.service.Impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.admgrExtention.service.Impl.AdmgrExtentionDAO;
import egovframework.admgrExtention.service.AdmgrExtentionService;
import egovframework.admgrExtention.service.AdmgrExtentionVO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;

@Service("AdmgrExtentionService")
public class AdmgrExtentionServiceImpl extends EgovAbstractServiceImpl implements AdmgrExtentionService {

	@Resource(name="AdmgrExtentionDAO")
	private AdmgrExtentionDAO admgrExtentionDAO;

	/** ID Generation */
	@Resource(name = "egovIdGnrService")
	private EgovIdGnrService egovIdGnrService;
	

	@Override
	public List<AdmgrExtentionVO> get_coupon_list(AdmgrExtentionVO admgrExtentionVO) {
		return admgrExtentionDAO.get_coupon_list(admgrExtentionVO);
	}	

	@Override
	public int get_coupon_list_cnt(AdmgrExtentionVO admgrExtentionVO) {
		return admgrExtentionDAO.get_coupon_list_cnt(admgrExtentionVO);
	}

	@Override
	public AdmgrExtentionVO get_coupon_info(AdmgrExtentionVO admgrExtentionVO) {
		return admgrExtentionDAO.get_coupon_info(admgrExtentionVO);
	}

	@Override
	public AdmgrExtentionVO get_coupon_id_info(AdmgrExtentionVO admgrExtentionVO) {
		return admgrExtentionDAO.get_coupon_id_info(admgrExtentionVO);
	}
	
	@Override
	public List<AdmgrExtentionVO> get_modal_coupon_list(AdmgrExtentionVO admgrExtentionVO) {
		return admgrExtentionDAO.get_modal_coupon_list(admgrExtentionVO);
	}
	
	@Override
	public int get_modal_coupon_list_cnt(AdmgrExtentionVO admgrExtentionVO) {
		return admgrExtentionDAO.get_modal_coupon_list_cnt(admgrExtentionVO);
	}

	@Override
	public void insert_coupon(AdmgrExtentionVO admgrExtentionVO) {
		admgrExtentionDAO.insert_coupon(admgrExtentionVO);
	}

	@Override
	public void update_coupon(AdmgrExtentionVO admgrExtentionVO) {
		admgrExtentionDAO.update_coupon(admgrExtentionVO);
	}

	@Override
	public void delete_coupon(AdmgrExtentionVO admgrExtentionVO) {
		admgrExtentionDAO.delete_coupon(admgrExtentionVO);
	}
	
	@Override
	public List<AdmgrExtentionVO> get_sms_member_list(AdmgrExtentionVO admgrExtentionVO) {
		return admgrExtentionDAO.get_sms_member_list(admgrExtentionVO);
	}
	@Override
	public List<AdmgrExtentionVO> get_sms_store_list(AdmgrExtentionVO admgrExtentionVO) {
		return admgrExtentionDAO.get_sms_store_list(admgrExtentionVO);
	}
	@Override
	public List<AdmgrExtentionVO> get_sms_list(AdmgrExtentionVO admgrExtentionVO) {
		return admgrExtentionDAO.get_sms_list(admgrExtentionVO);
	}
	@Override
	public int get_sms_member_list_cnt(AdmgrExtentionVO admgrExtentionVO) {
		return admgrExtentionDAO.get_sms_member_list_cnt(admgrExtentionVO);
	}
	@Override
	public int get_sms_store_list_cnt(AdmgrExtentionVO admgrExtentionVO) {
		return admgrExtentionDAO.get_sms_store_list_cnt(admgrExtentionVO);
	}
	@Override
	public int get_sms_list_cnt(AdmgrExtentionVO admgrExtentionVO) {
		return admgrExtentionDAO.get_sms_list_cnt(admgrExtentionVO);
	}
	@Override
	public void sms_add(AdmgrExtentionVO admgrExtentionVO) {
		admgrExtentionDAO.sms_add(admgrExtentionVO);
	}
	@Override
	public void sms_add_log(AdmgrExtentionVO admgrExtentionVO) {
		admgrExtentionDAO.sms_add_log(admgrExtentionVO);
	}
	
}