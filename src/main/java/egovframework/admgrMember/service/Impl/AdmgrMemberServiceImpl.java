package egovframework.admgrMember.service.Impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.admgrMember.service.AdmgrMemberService;
import egovframework.admgrMember.service.AdmgrMemberVO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;


@Service("AdmgrMemberService")
public class AdmgrMemberServiceImpl extends EgovAbstractServiceImpl implements AdmgrMemberService {

	@Resource(name="AdmgrMemberDAO")
	private AdmgrMemberDAO admgrMemberDAO;

	/** ID Generation */
	@Resource(name = "egovIdGnrService")
	private EgovIdGnrService egovIdGnrService;
	
	@Override
	public List<AdmgrMemberVO> get_member_list(AdmgrMemberVO admgrMemberVO) {
    	return admgrMemberDAO.get_member_list(admgrMemberVO);
    }

	@Override
	public int get_member_list_cnt(AdmgrMemberVO admgrMemberVO) {
    	return admgrMemberDAO.get_member_list_cnt(admgrMemberVO);
    }

	@Override
	public List<AdmgrMemberVO> get_modal_member_list(AdmgrMemberVO admgrMemberVO) {
		return admgrMemberDAO.get_modal_member_list(admgrMemberVO);
	}
	
	@Override
	public int get_modal_member_list_cnt(AdmgrMemberVO admgrMemberVO) {
		return admgrMemberDAO.get_modal_member_list_cnt(admgrMemberVO);
	}
	
	@Override
	public int get_is_check_id_cnt(AdmgrMemberVO admgrMemberVO) {
		return admgrMemberDAO.get_is_check_id_cnt(admgrMemberVO);
	}
	
	@Override
	public void update_member(AdmgrMemberVO admgrMemberVO) {
		admgrMemberDAO.update_member(admgrMemberVO);
	}
	
	@Override
	public void insert_member(AdmgrMemberVO admgrMemberVO) {
		admgrMemberDAO.insert_member(admgrMemberVO);
	}
	
	@Override
	public void last_login_member(AdmgrMemberVO admgrMemberVO) {
		admgrMemberDAO.last_login_member(admgrMemberVO);
	}
	
	@Override
	public void log_login_member(AdmgrMemberVO admgrMemberVO) {
		admgrMemberDAO.log_login_member(admgrMemberVO);
	}
	
	@Override
	public AdmgrMemberVO get_member_info(AdmgrMemberVO admgrMemberVO) {
		return admgrMemberDAO.get_member_info(admgrMemberVO);
	}

	@Override
	public AdmgrMemberVO get_member_id_info(AdmgrMemberVO admgrMemberVO) {
		return admgrMemberDAO.get_member_id_info(admgrMemberVO);
	}
	
	@Override
	public AdmgrMemberVO get_is_member_data(AdmgrMemberVO admgrMemberVO) {
		return admgrMemberDAO.get_is_member_data(admgrMemberVO);
	}
	
	@Override
	public List<AdmgrMemberVO> get_member_addr_list(AdmgrMemberVO admgrMemberVO) {
    	return admgrMemberDAO.get_member_addr_list(admgrMemberVO);
    }
	
	@Override
	public List<AdmgrMemberVO> get_member_mileage_list(AdmgrMemberVO admgrMemberVO) {
		return admgrMemberDAO.get_member_mileage_list(admgrMemberVO);
	}
	
	@Override
	public int get_member_mileage_total(AdmgrMemberVO admgrMemberVO) {
		return admgrMemberDAO.get_member_mileage_total(admgrMemberVO);
	}
	
	@Override
	public int get_member_mileage_cnt(AdmgrMemberVO admgrMemberVO) {
		return admgrMemberDAO.get_member_mileage_cnt(admgrMemberVO);
	}

	@Override
	public void insert_mileage(AdmgrMemberVO admgrMemberVO) {
		admgrMemberDAO.insert_mileage(admgrMemberVO);
	}
	
	@Override
	public void update_user_mileage(AdmgrMemberVO admgrMemberVO) {
		admgrMemberDAO.update_user_mileage(admgrMemberVO);
	}
	
	

}
