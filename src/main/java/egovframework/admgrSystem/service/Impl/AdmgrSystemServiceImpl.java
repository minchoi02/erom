package egovframework.admgrSystem.service.Impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.admgrSystem.service.AdmgrSystemService;
import egovframework.admgrSystem.service.AdmgrSystemVO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;


@Service("AdmgrSystemService")
public class AdmgrSystemServiceImpl extends EgovAbstractServiceImpl implements AdmgrSystemService {

	@Resource(name="AdmgrSystemDAO")
	private AdmgrSystemDAO admgrSystemDAO;

	/** ID Generation */
	@Resource(name = "egovIdGnrService")
	private EgovIdGnrService egovIdGnrService;
	
	@Override
	public List<AdmgrSystemVO> get_cd_list(AdmgrSystemVO admgrSystemVO) {
    	return admgrSystemDAO.get_cd_list(admgrSystemVO);
    }
	@Override
	public void update_cd(AdmgrSystemVO admgrSystemVO) {
		admgrSystemDAO.update_cd(admgrSystemVO);
	}
	
	@Override
	public AdmgrSystemVO get_sms_templete(AdmgrSystemVO admgrSystemVO) {
		return admgrSystemDAO.get_sms_templete(admgrSystemVO);
	}
	@Override
	public void set_sms_templete(AdmgrSystemVO admgrSystemVO) {
		admgrSystemDAO.set_sms_templete(admgrSystemVO);
	}
	@Override
	public AdmgrSystemVO get_push_templete(AdmgrSystemVO admgrSystemVO) {
		return admgrSystemDAO.get_push_templete(admgrSystemVO);
	}
	@Override
	public void set_push_templete(AdmgrSystemVO admgrSystemVO) {
		admgrSystemDAO.set_push_templete(admgrSystemVO);
	}
	
}
