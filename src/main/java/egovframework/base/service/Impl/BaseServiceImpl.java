package egovframework.base.service.Impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.base.service.BaseService;
import egovframework.base.service.BaseVO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;


@Service("BaseService")
public class BaseServiceImpl extends EgovAbstractServiceImpl implements BaseService {

	@Resource(name="BaseDAO")
	private BaseDAO baseDAO;

	/** ID Generation */
	@Resource(name = "egovIdGnrService")
	private EgovIdGnrService egovIdGnrService;
	
	public BaseVO get_fcm_info(BaseVO baseVO) {
		return baseDAO.get_fcm_info(baseVO);
	}
	public BaseVO get_base_sms_info(BaseVO baseVO) {
		return baseDAO.get_base_sms_info(baseVO);
	}
	public BaseVO get_sms_store_info(BaseVO baseVO) {
		return baseDAO.get_sms_store_info(baseVO);
	}
	public BaseVO get_sms_member_info(BaseVO baseVO) {
		return baseDAO.get_sms_member_info(baseVO);
	}
	public BaseVO get_sms_order_info(BaseVO baseVO) {
		return baseDAO.get_sms_order_info(baseVO);
	}
	public BaseVO get_sms_prod_info(BaseVO baseVO) {
		return baseDAO.get_sms_prod_info(baseVO);
	}
	public BaseVO get_sms_bbs_info(BaseVO baseVO) {
		return baseDAO.get_sms_bbs_info(baseVO);
	}
	public List<BaseVO> get_sms_group_list(BaseVO baseVO) {
		return baseDAO.get_sms_group_list(baseVO);
	}
	public List<BaseVO> get_sms_order_detail_list(BaseVO baseVO) {
		return baseDAO.get_sms_order_detail_list(baseVO);
	}
	public BaseVO get_sms_data(BaseVO baseVO) {
		return baseDAO.get_sms_data(baseVO);
	}
	public BaseVO get_push_data(BaseVO baseVO) {
		return baseDAO.get_push_data(baseVO);
	}
	public void insert_sms(BaseVO baseVO) {
		baseDAO.insert_sms(baseVO);
	}
	public void insert_mms(BaseVO baseVO) {
		baseDAO.insert_mms(baseVO);
	}
	public void insert_auto_sms(BaseVO baseVO) {
		baseDAO.insert_auto_sms(baseVO);
	}
	public void insert_auto_mms(BaseVO baseVO) {
		baseDAO.insert_auto_mms(baseVO);
	}
	public void insert_sms_list(BaseVO baseVO) {
		baseDAO.insert_sms_list(baseVO);
	}
	
	@Override
	public void basedbrealupdate(BaseVO baseVO) {
    	baseDAO.basedbrealupdate(baseVO);
    }

	@Override
	public void basedbdevupdate(BaseVO baseVO) {
		baseDAO.basedbdevupdate(baseVO);
	}
	
	@Override
	public void update_member_token(BaseVO baseVO) {
		baseDAO.update_member_token(baseVO);
	}
	
	// 은행복록 가져오기
	@Override
	public List<BaseVO> get_base_cd_list(BaseVO baseVO) {
		return baseDAO.get_base_cd_list(baseVO);
	}
	
	// 코드정보 가져오기
	@Override
	public BaseVO get_base_cd_info(BaseVO baseVO) {
		return baseDAO.get_base_cd_info(baseVO);
	}
	
	// 앱 가져오기
	@Override
	public BaseVO app_version_info(BaseVO baseVO) {
		return baseDAO.app_version_info(baseVO);
	}
	
	// 앱 가져오기
	@Override
	public BaseVO app_info(BaseVO baseVO) {
		return baseDAO.app_info(baseVO);
	}
	
	// 파일정보 가져오기
	@Override
	public BaseVO getFileInfo(BaseVO baseVO) {
		return baseDAO.getFileInfo(baseVO);
	}
	
	@Override
	public int get_log_prod_view(BaseVO baseVO) {
		return baseDAO.get_log_prod_view(baseVO);
	}
	@Override
	public int get_log_bbs_view(BaseVO baseVO) {
		return baseDAO.get_log_bbs_view(baseVO);
	}
	@Override
	public int get_log_agent(BaseVO baseVO) {
		return baseDAO.get_log_agent(baseVO);
	}
	
	@Override
	public void set_prod_view_log(BaseVO baseVO) {
		baseDAO.set_prod_view_log(baseVO);
	}
	@Override
	public void set_bbs_view_log(BaseVO baseVO) {
		baseDAO.set_bbs_view_log(baseVO);
	}
	@Override
	public void set_log_agent(BaseVO baseVO) {
		baseDAO.set_log_agent(baseVO);
	}
	
	@Override
	public void set_prod_view_cnt(BaseVO baseVO) {
		baseDAO.set_prod_view_cnt(baseVO);
	}
	@Override
	public void set_bbs_view_cnt(BaseVO baseVO) {
		baseDAO.set_bbs_view_cnt(baseVO);
	}

	// 은행복록 가져오기
	@Override
	public List<BaseVO> get_calc_target_list(BaseVO baseVO) {
		return baseDAO.get_calc_target_list(baseVO);
	}
	@Override
	public void insert_calc(BaseVO baseVO) {
		baseDAO.insert_calc(baseVO);
	}
	@Override
	public void update_order_calc_st(BaseVO baseVO) {
		baseDAO.update_order_calc_st(baseVO);
	}

	@Override
	public void update_auto_order_end(BaseVO baseVO) {
		baseDAO.update_auto_order_end(baseVO);
	}
	@Override
	public void update_auto_cancel_master(BaseVO baseVO) {
		baseDAO.update_auto_cancel_master(baseVO);
	}
	@Override
	public void update_auto_cancel_detail(BaseVO baseVO) {
		baseDAO.update_auto_cancel_detail(baseVO);
	}

	@Override
	public int is_calc(BaseVO baseVO) {
		return baseDAO.is_calc(baseVO);
	}

	@Override
	public List<BaseVO> get_auto_cancel_reserve_list(BaseVO baseVO) {
		return baseDAO.get_auto_cancel_reserve_list(baseVO);
	}

	@Override
	public void insert_cancel_recerve(BaseVO baseVO) {
		baseDAO.insert_cancel_recerve(baseVO);
	}
	@Override
	public List<BaseVO> cancel_reserve_list(BaseVO baseVO) {
		return baseDAO.cancel_reserve_list(baseVO);
	}

}
