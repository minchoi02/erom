package egovframework.admgrMember.service;

import java.util.List;

import egovframework.admgrMember.service.AdmgrMemberVO;

public interface AdmgrMemberService {

	/* 회원목록 */
	public List<AdmgrMemberVO> get_member_list(AdmgrMemberVO admgrMemberVO) throws Exception;
	
	/* 회원목록 갯수 */
	public int get_member_list_cnt(AdmgrMemberVO admgrMemberVO) throws Exception;

	/* 회원목록 */
	public List<AdmgrMemberVO> get_modal_member_list(AdmgrMemberVO admgrMemberVO) throws Exception;
	
	/* 회원목록 갯수 */
	public int get_modal_member_list_cnt(AdmgrMemberVO admgrMemberVO) throws Exception;
	
	/*회원 중복금지아이디 체크용 */
	public int get_is_check_id_cnt(AdmgrMemberVO admgrMemberVO) throws Exception;
	
	/*회원 정보수정 */
	public void update_member(AdmgrMemberVO admgrMemberVO) throws Exception;
	
	/*회원 등록 */
	public void insert_member(AdmgrMemberVO admgrMemberVO) throws Exception;

	/* 회원정보 가져오기 : seq */
	public AdmgrMemberVO get_member_info(AdmgrMemberVO admgrMemberVO) throws Exception;

	/* 회원정보 가져오기 : id */
	public AdmgrMemberVO get_member_id_info(AdmgrMemberVO admgrMemberVO) throws Exception;

	/* 회원로그인 */
	public AdmgrMemberVO get_is_member_data(AdmgrMemberVO admgrMemberVO) throws Exception;
	
	/* 회원주소록 목록 */
	public List<AdmgrMemberVO> get_member_addr_list(AdmgrMemberVO admgrMemberVO) throws Exception;
	
	/* 마지막 로그인날짜 저장 */
	public void last_login_member(AdmgrMemberVO admgrMemberVO) throws Exception;
	
	/* 로그인 기록 저장 */
	public void log_login_member(AdmgrMemberVO admgrMemberVO) throws Exception;
	
	/* 회원마일리지 총합 */
	public int get_member_mileage_total(AdmgrMemberVO admgrMemberVO) throws Exception;

	/* 회원마일리지 목록 */
	public List<AdmgrMemberVO> get_member_mileage_list(AdmgrMemberVO admgrMemberVO) throws Exception;
	
	/* 회원마일리지 목록 갯수 */
	public int get_member_mileage_cnt(AdmgrMemberVO admgrMemberVO) throws Exception;
	
	/* 마일리지 등록 */
	public void insert_mileage(AdmgrMemberVO admgrMemberVO) throws Exception;

	/* 회원 마일리지 수정  */
	public void update_user_mileage(AdmgrMemberVO admgrMemberVO) throws Exception;


	
}