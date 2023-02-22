package egovframework.base.member.service.Impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.base.member.service.BaseMemberVO;
import egovframework.rte.psl.dataaccess.EgovAbstractDAO;

@Repository("BaseMemberDAO")
public class BaseMemberDAO extends EgovAbstractDAO {
		
	public void insert_login_member(BaseMemberVO baseMemberVO) {
		insert("insert_login_member", baseMemberVO);
	}

	public BaseMemberVO normal_login_check(BaseMemberVO baseMemberVO) {
		return (BaseMemberVO) select("normal_login_check", baseMemberVO);
	}
	
	public BaseMemberVO get_site_user_info(BaseMemberVO baseMemberVO) {
		return (BaseMemberVO) select("get_site_user_info", baseMemberVO);
	}
	
	public void site_insert_member(BaseMemberVO baseMemberVO) {
		insert("site_insert_member", baseMemberVO);
	}
	
	public void set_member_update(BaseMemberVO baseMemberVO) {
		update("set_member_update", baseMemberVO);
	}
	
	public void set_member_out(BaseMemberVO baseMemberVO) {
		update("set_member_out", baseMemberVO);
	}
	
	public int is_member_id(BaseMemberVO baseMemberVO) {
		return (Integer) select("is_member_id", baseMemberVO);
	}
	
	@SuppressWarnings("unchecked")
	public List<BaseMemberVO> get_order_addr_list(BaseMemberVO baseMemberVO) {
		return (List<BaseMemberVO>) list("get_order_addr_list", baseMemberVO);
	}
	
	public BaseMemberVO get_addr_info(BaseMemberVO baseMemberVO) {
		return (BaseMemberVO) select("get_addr_info", baseMemberVO);
	}

	public void set_addr_insert(BaseMemberVO baseMemberVO) {
		insert("set_addr_insert", baseMemberVO);
	}

	public void set_addr_update(BaseMemberVO baseMemberVO) {
		update("set_addr_update", baseMemberVO);
	}

	public void set_addr_delete(BaseMemberVO baseMemberVO) {
		update("set_addr_delete", baseMemberVO);
	}

	public BaseMemberVO find_user_id(BaseMemberVO baseMemberVO) {
		return (BaseMemberVO) select("find_user_id", baseMemberVO);
	}
	public BaseMemberVO find_user_hp(BaseMemberVO baseMemberVO) {
		return (BaseMemberVO) select("find_user_hp", baseMemberVO);
	}
	public void passwd_update(BaseMemberVO baseMemberVO) {
		update("passwd_update", baseMemberVO);
	}

	
}
