package egovframework.base.member.service;

import java.util.List;

public interface BaseMemberService {

	// 회원로그인 로그기록
	public void insert_login_member(BaseMemberVO baseMemberVO) throws Exception;
	
	public BaseMemberVO normal_login_check(BaseMemberVO baseMemberVO) throws Exception;
	public BaseMemberVO get_site_user_info(BaseMemberVO baseMemberVO) throws Exception;
	public void site_insert_member(BaseMemberVO baseMemberVO) throws Exception;
	public void set_member_update(BaseMemberVO baseMemberVO) throws Exception;
	public void set_member_out(BaseMemberVO baseMemberVO) throws Exception;
	
	public int  is_member_id(BaseMemberVO baseMemberVO) throws Exception;
	
	public List<BaseMemberVO> get_order_addr_list(BaseMemberVO baseMemberVO) throws Exception;
	public BaseMemberVO get_addr_info(BaseMemberVO baseMemberVO) throws Exception;
	public void set_addr_insert(BaseMemberVO baseMemberVO) throws Exception;
	public void set_addr_update(BaseMemberVO baseMemberVO) throws Exception;
	public void set_addr_delete(BaseMemberVO baseMemberVO) throws Exception;
	
	public BaseMemberVO find_user_id(BaseMemberVO baseMemberVO) throws Exception;
	public BaseMemberVO find_user_hp(BaseMemberVO baseMemberVO) throws Exception;
	public void passwd_update(BaseMemberVO baseMemberVO) throws Exception;
}