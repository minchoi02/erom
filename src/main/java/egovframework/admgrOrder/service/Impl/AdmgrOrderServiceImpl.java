package egovframework.admgrOrder.service.Impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.admgrOrder.service.AdmgrOrderService;
import egovframework.admgrOrder.service.AdmgrOrderVO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;

@Service("AdmgrOrderService")
public class AdmgrOrderServiceImpl extends EgovAbstractServiceImpl implements AdmgrOrderService {
	
	@Resource(name="AdmgrOrderDAO")
	private AdmgrOrderDAO admgrOrderDAO;

	/** ID Generation */
	@Resource(name = "egovIdGnrService")
	private EgovIdGnrService egovIdGnrService;
	
	@Override
	public List<AdmgrOrderVO> get_order_list(AdmgrOrderVO admgrOrderVO) {
    	return admgrOrderDAO.get_order_list(admgrOrderVO);
    }
	
	@Override
	public List<AdmgrOrderVO> get_order_detail_list(AdmgrOrderVO admgrOrderVO) {
    	return admgrOrderDAO.get_order_detail_list(admgrOrderVO);
    }
	
	@Override
	public List<AdmgrOrderVO> get_order_cancel_list(AdmgrOrderVO admgrOrderVO) {
		return admgrOrderDAO.get_order_cancel_list(admgrOrderVO);
	}
	
	@Override
	public int get_order_list_cnt(AdmgrOrderVO admgrOrderVO) {
		return admgrOrderDAO.get_order_list_cnt(admgrOrderVO);
	}
	
	@Override
	public int get_order_detail_list_cnt(AdmgrOrderVO admgrOrderVO) {
		return admgrOrderDAO.get_order_detail_list_cnt(admgrOrderVO);
	}
	
	@Override
	public AdmgrOrderVO get_order_master_info(AdmgrOrderVO admgrOrderVO) {
		return admgrOrderDAO.get_order_master_info(admgrOrderVO);
	}
	
	@Override
	public void update_order_master(AdmgrOrderVO admgrOrderVO) {
		admgrOrderDAO.update_order_master(admgrOrderVO);
	}
	
	@Override
	public void update_order_detail(AdmgrOrderVO admgrOrderVO) {
		admgrOrderDAO.update_order_detail(admgrOrderVO);
	}
	
	@Override
	public void update_master_payment(AdmgrOrderVO admgrOrderVO) {
		admgrOrderDAO.update_master_payment(admgrOrderVO);
	}
	

	
	
}