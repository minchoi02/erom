package egovframework.admgrMain.service.lmpl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.admgrMain.service.AdmgrMainService;
import egovframework.admgrMain.service.AdmgrMainVO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;


@Service("AdmgrMainService")
public class AdmgrMainServiceImpl extends EgovAbstractServiceImpl implements AdmgrMainService {

	@Resource(name="AdmgrMainDAO")
	private AdmgrMainDAO admgrMainDAO;

	/** ID Generation */
	@Resource(name = "egovIdGnrService")
	private EgovIdGnrService egovIdGnrService;
	
	
	@Override
	public List<AdmgrMainVO> get_main_member_list(AdmgrMainVO admgrMainVO) {
		return admgrMainDAO.get_main_member_list(admgrMainVO);
	}
	
	@Override
	public List<AdmgrMainVO> get_main_order_list(AdmgrMainVO admgrMainVO) {
		return admgrMainDAO.get_main_order_list(admgrMainVO);
	}
	
	@Override
	public List<AdmgrMainVO> get_main_bbs_list(AdmgrMainVO admgrMainVO) {
		return admgrMainDAO.get_main_bbs_list(admgrMainVO);
	}
	
	@Override
	public List<AdmgrMainVO> get_main_product_list(AdmgrMainVO admgrMainVO) {
		return admgrMainDAO.get_main_product_list(admgrMainVO);
	}
	
	@Override
	public List<AdmgrMainVO> get_main_store_list(AdmgrMainVO admgrMainVO) {
		return admgrMainDAO.get_main_store_list(admgrMainVO);
	}
	
}
