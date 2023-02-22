package egovframework.base.service.Impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.base.service.BaseVO;
import egovframework.rte.psl.dataaccess.EgovAbstractDAO;

@Repository("BaseDAO")
public class BaseDAO extends EgovAbstractDAO {
		
	public BaseVO get_base_sms_info(BaseVO baseVO) {
		return (BaseVO) select("get_base_sms_info",baseVO);
	}
	public BaseVO get_base_push_info(BaseVO baseVO) {
		return (BaseVO) select("get_base_push_info",baseVO);
	}
	@SuppressWarnings("unchecked")
	public List<BaseVO> get_sms_group_list(BaseVO baseVO) {
		return (List<BaseVO>) list("get_sms_group_list",baseVO);
	}
	public BaseVO get_sms_member_info(BaseVO baseVO) {
		return (BaseVO) select("get_sms_member_info",baseVO);
	}
	public BaseVO get_sms_store_info(BaseVO baseVO) {
		return (BaseVO) select("get_sms_store_info",baseVO);
	}
	public BaseVO get_sms_prod_info(BaseVO baseVO) {
		return (BaseVO) select("get_sms_prod_info",baseVO);
	}
	public BaseVO get_sms_data(BaseVO baseVO) {
		return (BaseVO) select("get_sms_data",baseVO);
	}
	public BaseVO get_push_data(BaseVO baseVO) {
		return (BaseVO) select("get_push_data",baseVO);
	}
	public void insert_sms(BaseVO baseVO) {
		insert("insert_sms",baseVO);
	}
	public void insert_mms(BaseVO baseVO) {
		insert("insert_mms",baseVO);
	}
	public void insert_auto_sms(BaseVO baseVO) {
		insert("insert_auto_sms",baseVO);
	}
	public void insert_auto_mms(BaseVO baseVO) {
		insert("insert_auto_mms",baseVO);
	}
	public void insert_sms_list(BaseVO baseVO) {
		insert("insert_sms_list",baseVO);
	}
	public BaseVO get_sms_order_info(BaseVO baseVO) {
		return (BaseVO) select("get_sms_order_info",baseVO);
	}
	public BaseVO get_sms_bbs_info(BaseVO baseVO) {
		return (BaseVO) select("get_sms_bbs_info",baseVO);
	}
	public BaseVO get_fcm_info(BaseVO baseVO) {
		return (BaseVO) select("get_fcm_info",baseVO);
	}	
	
	public void basedbrealupdate(BaseVO baseVO) {
		update("basedbrealupdate",baseVO);
	}
	
	public void basedbdevupdate(BaseVO baseVO) {
		update("basedbdevupdate",baseVO);
	}
	
	public void update_member_token(BaseVO baseVO) {
		update("update_member_token",baseVO);
	}
	
	@SuppressWarnings("unchecked")
	public List<BaseVO> get_base_cd_list(BaseVO baseVO) {
		return (List<BaseVO>) list("get_base_cd_list",baseVO);
	}
	@SuppressWarnings("unchecked")
	public List<BaseVO> get_sms_order_detail_list(BaseVO baseVO) {
		return (List<BaseVO>) list("get_sms_order_detail_list",baseVO);
	}
	
	public BaseVO get_base_cd_info(BaseVO baseVO) {
		return (BaseVO) select("get_base_cd_info",baseVO);
	}
	
	public BaseVO app_info(BaseVO baseVO) {
		return (BaseVO) select("app_version_info",baseVO);
	}
	
	public BaseVO app_version_info(BaseVO baseVO) {
		return (BaseVO) select("app_version_info",baseVO);
	}
	
	public BaseVO getFileInfo(BaseVO baseVO) {
		return (BaseVO) select("getFileInfo",baseVO);
	}
	
	public int get_log_prod_view(BaseVO baseVO) {
		return (Integer) select("get_log_prod_view",baseVO);
	}
	public int get_log_bbs_view(BaseVO baseVO) {
		return (Integer) select("get_log_bbs_view",baseVO);
	}
	public int get_log_agent(BaseVO baseVO) {
		return (Integer) select("get_log_agent",baseVO);
	}
	
	public void set_prod_view_log(BaseVO baseVO) {
		insert("set_prod_view_log",baseVO);
	}
	public void set_bbs_view_log(BaseVO baseVO) {
		insert("set_bbs_view_log",baseVO);
	}
	public void set_log_agent(BaseVO baseVO) {
		insert("set_log_agent",baseVO);
	}
	
	public void set_prod_view_cnt(BaseVO baseVO) {
		update("set_prod_view_cnt",baseVO);
	}
	public void set_bbs_view_cnt(BaseVO baseVO) {
		update("set_bbs_view_cnt",baseVO);
	}

	@SuppressWarnings("unchecked")
	public List<BaseVO> get_calc_target_list(BaseVO baseVO) {
		return (List<BaseVO>) list("get_calc_target_list",baseVO);
	}
	public void insert_calc(BaseVO baseVO) {
		insert("insert_calc",baseVO);
	}
	public void update_order_calc_st(BaseVO baseVO) {
		update("update_order_calc_st",baseVO);
	}
		
	public void update_auto_order_end(BaseVO baseVO) {
		update("update_auto_order_end",baseVO);
	}
	public void update_auto_cancel_master(BaseVO baseVO) {
		update("update_auto_cancel_master",baseVO);
	}
	public void update_auto_cancel_detail(BaseVO baseVO) {
		update("update_auto_cancel_detail",baseVO);
	}
	
	public int is_calc(BaseVO baseVO) {
		return (Integer) select("is_calc",baseVO);
	}
	
	@SuppressWarnings("unchecked")
	public List<BaseVO> get_auto_cancel_reserve_list(BaseVO baseVO) {
		return (List<BaseVO>) list("get_auto_cancel_reserve_list",baseVO);
	}
	
	public void insert_cancel_recerve(BaseVO baseVO) {
		insert("insert_cancel_recerve",baseVO);
	}
	
	@SuppressWarnings("unchecked")
	public List<BaseVO> cancel_reserve_list(BaseVO baseVO) {
		return (List<BaseVO>) list("cancel_reserve_list",baseVO);
	}
	
}
