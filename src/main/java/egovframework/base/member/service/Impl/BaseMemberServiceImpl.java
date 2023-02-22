package egovframework.base.member.service.Impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.base.member.service.BaseMemberService;
import egovframework.base.member.service.BaseMemberVO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;


@Service("BaseMemberService")
public class BaseMemberServiceImpl extends EgovAbstractServiceImpl implements BaseMemberService {

	@Resource(name = "BaseMemberDAO")
	private BaseMemberDAO baseMemberDAO;

	/** ID Generation */
	@Resource(name = "egovIdGnrService")
	private EgovIdGnrService egovIdGnrService;
	
	//=========================================================

	@Override
	public void insert_login_member(BaseMemberVO baseMemberVO) throws Exception {
		baseMemberDAO.insert_login_member(baseMemberVO);
	}
	
	@Override
	public BaseMemberVO normal_login_check(BaseMemberVO baseMemberVO) throws Exception {
		return baseMemberDAO.normal_login_check(baseMemberVO);
	}
	
	@Override
	public BaseMemberVO get_site_user_info(BaseMemberVO baseMemberVO) throws Exception {
		return baseMemberDAO.get_site_user_info(baseMemberVO);
	}
	@Override
	public void site_insert_member(BaseMemberVO baseMemberVO) throws Exception {
		baseMemberDAO.site_insert_member(baseMemberVO);
	}
	
	@Override
	public void set_member_update(BaseMemberVO baseMemberVO) throws Exception {
		baseMemberDAO.set_member_update(baseMemberVO);
	}
	
	@Override
	public void set_member_out(BaseMemberVO baseMemberVO) throws Exception {
		baseMemberDAO.set_member_out(baseMemberVO);
	}
	
	@Override
	public int is_member_id(BaseMemberVO baseMemberVO) throws Exception {
		return baseMemberDAO.is_member_id(baseMemberVO);
	}
	
	@Override
	public List<BaseMemberVO> get_order_addr_list(BaseMemberVO baseMemberVO) throws Exception {
		return baseMemberDAO.get_order_addr_list(baseMemberVO);
	}
	@Override
	public BaseMemberVO get_addr_info(BaseMemberVO baseMemberVO) throws Exception {
		return baseMemberDAO.get_addr_info(baseMemberVO);
	}
	@Override
	public void set_addr_insert(BaseMemberVO baseMemberVO) throws Exception {
		baseMemberDAO.set_addr_insert(baseMemberVO);
	}
	@Override
	public void set_addr_update(BaseMemberVO baseMemberVO) throws Exception {
		baseMemberDAO.set_addr_update(baseMemberVO);
	}
	@Override
	public void set_addr_delete(BaseMemberVO baseMemberVO) throws Exception {
		baseMemberDAO.set_addr_delete(baseMemberVO);
	}
	
	@Override
	public BaseMemberVO find_user_id(BaseMemberVO baseMemberVO) throws Exception {
		return baseMemberDAO.find_user_id(baseMemberVO);
	}
	@Override
	public BaseMemberVO find_user_hp(BaseMemberVO baseMemberVO) throws Exception {
		return baseMemberDAO.find_user_hp(baseMemberVO);
	}
	@Override
	public void passwd_update(BaseMemberVO baseMemberVO) throws Exception {
		baseMemberDAO.passwd_update(baseMemberVO);
	}
	
	
}