package egovframework.admgrCustomer.service.Impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.admgrCustomer.service.AdmgrCustomerService;
import egovframework.admgrCustomer.service.AdmgrCustomerVO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;


@Service("AdmgrCustomerService")
public class AdmgrCustomerServiceImpl extends EgovAbstractServiceImpl implements AdmgrCustomerService {

	@Resource(name="AdmgrCustomerDAO")
	private AdmgrCustomerDAO admgrCustomerDAO;

	/** ID Generation */
	@Resource(name = "egovIdGnrService")
	private EgovIdGnrService egovIdGnrService;
	
	@Override
	public List<AdmgrCustomerVO> get_bbs_notice_list(AdmgrCustomerVO admgrCustomerVO) {
    	return admgrCustomerDAO.get_bbs_notice_list(admgrCustomerVO);
    }

	@Override
	public List<AdmgrCustomerVO> get_bbs_list(AdmgrCustomerVO admgrCustomerVO) {
		return admgrCustomerDAO.get_bbs_list(admgrCustomerVO);
	}
	
	@Override
	public int get_bbs_list_cnt(AdmgrCustomerVO admgrCustomerVO) {
    	return admgrCustomerDAO.get_bbs_list_cnt(admgrCustomerVO);
    }
	
	@Override
	public AdmgrCustomerVO get_bbs_info(AdmgrCustomerVO admgrCustomerVO) {
		return admgrCustomerDAO.get_bbs_info(admgrCustomerVO);
	}
	@Override
	public AdmgrCustomerVO get_bbs_info2(AdmgrCustomerVO admgrCustomerVO) {
		return admgrCustomerDAO.get_bbs_info2(admgrCustomerVO);
	}
	
	@Override
	public void insert_bbs(AdmgrCustomerVO admgrCustomerVO) {
		admgrCustomerDAO.insert_bbs(admgrCustomerVO);
	}
	
	@Override
	public void update_bbs(AdmgrCustomerVO admgrCustomerVO) {
		admgrCustomerDAO.update_bbs(admgrCustomerVO);
	}
	
	@Override
	public void get_bbs_increase_hit(AdmgrCustomerVO admgrCustomerVO) {
		admgrCustomerDAO.get_bbs_increase_hit(admgrCustomerVO);
	}	
	
	@Override
	public void delete_bbs(AdmgrCustomerVO admgrCustomerVO) {
		admgrCustomerDAO.delete_bbs(admgrCustomerVO);
	}
	
}